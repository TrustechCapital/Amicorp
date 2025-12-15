showWaitLayer();
var cmbModuloParam = JSON.parse("{\"chido\":65}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbTransaccionesParam = JSON.parse("{\"chido\":17}");

initForms();

var arrTblTraDat = new Array();
arrTblTraDat[0] = "trsNumTransac,60";
arrTblTraDat[1] = "trsNomTransac,400";
arrTblTraDat[2] = "trsNumGuiaCont,60";
arrTblTraDat[3] = "trsCveAcumAdcta,100";
arrTblTraDat[4] = "trsCveStTransac,100";
  
var catTransacc = new Catalogo("mx.com.inscitech.fiducia.domain.Transacc");
var fvCatTransacc = new FormValidator();
var strIdPK = "trsNumModulo,trsNumTransac";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo= null;

fvCatTransacc.setup({
  formName      : "frmMantenimientoTransacciones",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk) {
  cloneObject(pk,catTransacc.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  catTransacc = new Catalogo("mx.com.inscitech.fiducia.domain.Transacc");
  pkInfo= null;
}
function cargaMantenimientoTransacciones(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Transacciones/MantenimientoTransacciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoTransacciones, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionTransaccion();
  }
}

function despliegaPantallaMantenimientoTransacciones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoTransacciones"));
      habilitaPK("cveTransacciones,cmbDatoTran".split(","));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdAgregar,cmdQuitar");
}

function asignaPK2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catTransacc.setOnUpdate(cargaComplemento);
    catTransacc.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
  eliminaSeleccione(GI("cveTransacciones"));
}
function cargaComplemento(){
  catTransacc.setOnUpdate(avisoOperacionCatalogo);
  GI("paramGuia").value = GI("trsNumGuiaCont").value;
  cargaComboDatoTran(GI("cmbDatoTran"));
  consultar(GI("cmdAceptar"), GI("frmMantenimientoTransacciones"), false);
  formsLoaded();
}

function eliminaSelDatoTran(){
  eliminaSeleccione(GI("cmbDatoTran"));
  formsLoaded();
}

function eliminaSelMinimoDatoGuia(){
  SA(GI("cmbMinimoDatoGuia"), "next", "validaMinimoDatosGuia");
  eliminaSeleccione(GI("cmbMinimoDatoGuia"));
  var nextElement = GA(GI("cmbMinimoDatoGuia"), "next");
  if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
}
function cargaComboDatoTran(objCombo){
  var modulo = GI("trsNumModulo").value;
  var transaccion = GI("trsNumTransac").value;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conDatTra\",\"modulo\":" + modulo + ",\"transaccion\":" + transaccion + "}";
  SA(objCombo, "next", "eliminaSelDatoTran");
  makeAjaxRequest(url, "HTML", loadComboElement, objCombo);
}

function cargaComboDatosContabilizar(){
  var guia = GI("trsNumGuiaCont").value;
  if(guia != ""){
    showWaitLayer();
    var objCombo = GI("cmbDatoTran");
    var url = ctxRoot + "/getRef.do?json={\"id\":\"conAuxs\",\"clave\":" + 22 + ",\"guia\":" + guia + "}";
    SA(objCombo, "next", "cargaComboDatosContabilizarDato");
    makeAjaxRequest(url, "HTML", loadComboElement, objCombo);
  }
}

function cargaComboDatosContabilizarDato(){
  var guia = GI("trsNumGuiaCont").value;
  var objCombo = GI("cmbDatoTran");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"dato\",\"guia\":" + guia + "}";
  SA(objCombo, "next", "eliminaSelDatoTran");
  makeAjaxRequest(url, "HTML", addComboElement, objCombo);
}
function agregarClave(objComboOrigen, objComboDestino){
  if(objComboOrigen.selectedIndex !=-1){
    var key = GA(objComboDestino, "keyValue");
    var value = GA(objComboDestino, "theValue");
    var llave = objComboOrigen.options[objComboOrigen.selectedIndex].value;
    var texto = objComboOrigen.options[objComboOrigen.selectedIndex].text;
    var result = "[{\"" + key + "\":\"" + llave + "\",\"" + value + "\":\"" + texto + "\"}]";
    var arrValues = JSON.parse(result);
    if(!validaExisteClave(texto,objComboDestino))
      addCombo(objComboDestino, arrValues, key, value);
  }
}

function quitarClave(objCombo){
  if(objCombo.selectedIndex !=-1){
    if(objCombo.selectedIndex == 0 && objCombo.options[objCombo.selectedIndex].value != "0")
      eliminaSeleccione(objCombo);
    else if(objCombo.selectedIndex == objCombo.options.length-1 && objCombo.options[objCombo.selectedIndex].value != "0"){
      objCombo.options.length = objCombo.options.length - 1;
      objCombo.selectedIndex = objCombo.options.length - 1;
    }else{
      if(objCombo.options[objCombo.selectedIndex].value != "0"){
        for(var i = objCombo.selectedIndex; i <= objCombo.options.length - 2; i++){
          objCombo.options[i].value = objCombo.options[i+1].value;
          objCombo.options[i].text = objCombo.options[i+1].text;
        }
        objCombo.options.length = objCombo.options.length - 1;
      }
    }
  }
}

function validaExisteClave(strValor,objCombo){
  for(var i = 0; i < objCombo.options.length; i++){
    if(objCombo.options[i].text == strValor)
      return true;
  }
  return false;
}

function ejecutaOperacionTransaccion(){
  if(modo == OPER_ALTA){
    if(fvCatTransacc.checkForm()){
      verificaTransaccion();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatTransacc.checkForm()){
      showWaitLayer();
      cargaComboMinimoDatosGuia();
    }
  }
  else if(modo == OPER_BAJA){
    verificaTransaccionEmpleadaOperacion();
  }
}

function validaMinimoDatosGuia(){
  var dato = 0;
  objComboBase = GI("cmbMinimoDatoGuia");
  objComboValidar = GI("cmbDatoTran");
  for(var base = 0; base < objComboBase.options.length; base++){
    for(var val = 0; val < objComboValidar.options.length; val++){
      if(objComboBase.options[base].text == objComboValidar.options[val].text){
        dato += 1;
      }
    }
  }
  if(dato == objComboBase.options.length){
    catTransacc.setOnUpdate(bajaInsertaDatoTran);
    catTransacc.modificaCatalogo();
  }else{
    alert("Los datos mínimos de Clave de Tipo de Transacciones asignados no son correctos!");
    GI("trsNumGuiaCont").focus();
    hideWaitLayer();
  }
}
function cargaComboMinimoDatosGuia(){
  var guia = GI("trsNumGuiaCont").value;
  var objCombo = GI("cmbMinimoDatoGuia");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conAuxs\",\"clave\":" + 22 + ",\"guia\":" + guia + "}";
  SA(objCombo, "next", "cargaComboMinimoDatosGuiaDato");
  makeAjaxRequest(url, "HTML", loadComboElement, objCombo);
}

function cargaComboMinimoDatosGuiaDato(){
  var guia = GI("trsNumGuiaCont").value;
  var objCombo = GI("cmbMinimoDatoGuia");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"dato\",\"guia\":" + guia + "}";
  SA(objCombo, "next", "eliminaSelMinimoDatoGuia");
  makeAjaxRequest(url, "HTML", addComboElement, objCombo);
}

function existeGuia(obj){
  var guia = obj.value;
  if(guia !=""){
    showWaitLayer();
    var url = ctxRoot + "/getRef.do?json={\"id\":\"exiGui\",\"guia\":" + guia + ",\"group\":\"S\"}";
    SA(obj, "next", "cargaComboDatosContabilizar");
    makeAjaxRequest(url, "HTML", validaExisteGuia, obj);
  }
}

function validaExisteGuia(obj, result){
  resultado = JSON.parse(result)[0];
  if(!isDefinedAndNotNull(resultado)){
    alert("No Existe la Guía Contable!");
    GI("trsNumGuiaCont").value = "";
    borraCombosSinSeleccione("cmbDatoTran");
  }else{
    if(resultado.existeRegistro != 0 && resultado.status != 'ACTIVO'){
      alert("La Guía Contable no esta Activa!");
      GI("trsNumGuiaCont").value = "";
      borraCombosSinSeleccione("cmbDatoTran");
    }else{
      var nextElement = GA(obj, "next");
      if(isDefinedAndNotNull(nextElement)) {
        var nextObj = GI(nextElement); 
        if(isDefinedAndNotNull(nextObj)) {
          loadElement(nextObj);
        } else {
          try { eval(nextElement+"()"); } catch(ex) {}
        }
      }
    }
  }
  hideWaitLayer();
}
function verificaTransaccion(){
  showWaitLayer();
  var transaccion = GI("trsNumTransac").value;
  var modulo = GI("trsNumModulo").value;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiTra\",\"transaccion\":" + transaccion + ",\"modulo\":" + modulo + "}";
  makeAjaxRequest(url, "HTML", validaAlta, null);
}
function validaAlta(obj, result){
  var objValida = JSON.parse(result)[0];
  if(objValida.existeTransaccion != 0){
    alert("La Transacción ya existe actualmente!");
    hideWaitLayer();
  }else{
    catTransacc.setOnUpdate(bajaInsertaDatoTran);
    catTransacc.altaCatalogo();
  }
}
function bajaInsertaDatoTran(){
  bajaDatoTran(insertaDatoTran);
}
function bajaDatoTran(funcionMantenimiento){
    var transaccion = 0;
    var modulo = 0;
    if(modo == OPER_BAJA){
      transaccion = pkInfo.trsNumTransac;
      modulo = pkInfo.trsNumModulo;
    }else{
      transaccion = GI("trsNumTransac").value;
      modulo = GI("trsNumModulo").value;
    }
    var url = ctxRoot + "/doRef.do?json={\"id\":\"delDatoTran\",\"transaccion\":" + transaccion + ",\"modulo\":" + modulo + "}";
    makeAjaxRequest(url, "HTML", funcionMantenimiento, null);
}
function insertaDatoTran(obj, result){  
  var objCombo = GI("cmbDatoTran");
  var modulo = GI("trsNumModulo").value;
  var transaccion = GI("trsNumTransac").value;
  for(var i = 0; i < objCombo.options.length; i++){
    var dato = objCombo.options[i].text ;
    var parametros = "\"modulo\":" + modulo + ",\"transaccion\":" + transaccion + ",\"dato\":\"" + dato + "\",\"anoAlta\":" + 0 + 
                     ",\"mesAlta\":" + 0 + ",\"diaAlta\":" + 0 + ",\"anoUlt\":" + 0 + ",\"mesUlt\":" + 0 +
                     ",\"diaUlt\":" + 0 + ",\"status\":\"ACTIVO\"";
    var url = ctxRoot + "/doRef.do?json={\"id\":\"insDatTran\","+ parametros + "}";
    makeAjaxRequest(url, "HTML", validaInsertaDatoTran, i + " == " + (objCombo.options.length-1));
  }
}
function validaInsertaDatoTran(obj, result){
  if(eval(obj)){
    alert("Operacion realizada exitosamente!");
    onButtonClickPestania('Contabilidad.Transacciones.PrincipalTransacciones','');
    hideWaitLayer();
  }
}
function verificaTransaccionEmpleadaOperacion(){
  showWaitLayer();
  var transaccion = pkInfo.trsNumTransac;
  var modulo = pkInfo.trsNumModulo;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verTraEmpOpe\",\"transaccion\":" + transaccion + ",\"modulo\":" + modulo + "}";
  makeAjaxRequest(url, "HTML", validaBaja, null);
}

function validaBaja(obj, result){
  var objValida = JSON.parse(result)[0];
  if(objValida.existenRegistros > 0){
    alert("No se puede dar de baja una Transacción si es empleada por una Operación!");
    hideWaitLayer();
  }else
    bajaDatoTran(bajaCatalogo);
}
function bajaCatalogo(obj, result){
  catTransacc.setOnUpdate(avisoOperacionCatalogo);
  catTransacc.bajaCatalogo(false);
  onButtonClickPestania('Contabilidad.Transacciones.PrincipalTransacciones','');
  hideWaitLayer();
}
var arrTblDatTra = new Array();
  arrTblDatTra[0] = "guiNumSecAsient,34px";
  arrTblDatTra[1] = "guiNomCta,121px";
  arrTblDatTra[2] = "guiNumCtam,54px";
  arrTblDatTra[3] = "guiNumScta,33px";
  arrTblDatTra[4] = "guiNumSscta,39px";
  arrTblDatTra[5] = "guiNumSsscta,47px";
  arrTblDatTra[6] = "guiNumSssscta,55px";
  arrTblDatTra[7] = "guiNumSsssscta,63px";
  arrTblDatTra[8] = "guiNumAux1,57px";
  arrTblDatTra[9] = "guiNumAux2,57px";
  arrTblDatTra[10] = "guiNumAux3,57px";
  arrTblDatTra[11] = "guiCveAplicaDat,91px";
  arrTblDatTra[12] = "guiCveCarAbo,28px";
  arrTblDatTra[13] = "guiDescAsiento,130px";
  arrTblDatTra[14] = "guiCveStGuiacon,100px";
  
function loadTableElementSpecial(objTabla, result) {
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTable(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), null, false);
  hideWaitLayer();
}