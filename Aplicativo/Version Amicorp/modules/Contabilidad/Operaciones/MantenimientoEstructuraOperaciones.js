var cmbModuloParam = JSON.parse("{\"chido\":43}");
var cmbTransaccionParam = JSON.parse("{}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var pkInfo2 = null;

var arrTblEstrucOpe = new Array();
arrTblEstrucOpe[0] = "eopNumOperacion,103";
arrTblEstrucOpe[1] = "eopNumSecOpera,91";
arrTblEstrucOpe[2] = "eopNumTransac,85";
arrTblEstrucOpe[3] = "eopCveStEstoper,100";

var fvCatEstopera = new FormValidator();
var strIdPK2 = "eopNumOperacion,eopNumSecOpera,eopNomTransac";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;

fvCatEstopera.setup({
  formName      : "frmMantenimientoEstructuraOperaciones",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla2(pk) {
  pkInfo2 = pk;
  cloneObject(pk,catEstopera.getCatalogo());
}
function cargaMantenimientoEstructuraOperaciones(Modo){
  modo2 = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Operaciones/MantenimientoEstructuraOperaciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoEstructuraOperaciones, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionEstructura();
  }
}

function despliegaPantallaMantenimientoEstructuraOperaciones(obj, result){
  
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;
  initForms();
  if(modo2 == OPER_CONSULTAR || modo2 == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK2);
    if(modo2 == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoEstructuraOperaciones"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }else if(modo2 == OPER_ALTA){
    GI("eopNumOperacion").value = catOperacio.getCatalogo().opeNumOperacion;
    deshabilitaPK("eopNumOperacion,eopNomTransac".split(","));
  }
  if(modo2 == OPER_ALTA || modo2 == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdConsultar");
}

function asignaValores2ObjHTMLEstructuraOperaciones(){
  if(isDefinedAndNotNull(pkInfo2) && modo2 != OPER_ALTA){
    catEstopera.setOnUpdate(cargaComplementoEstructuraOperaciones);
    catEstopera.buscaCatalogoPK(false);
  }else{
    var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "asiValSecEstOpe";
    objSecuencialParam.Operacion = pkInfo.opeNumOperacion;
    asignaSecuencial(GI("eopNumSecOpera"),objSecuencialParam);
    hideWaitLayer();
  }
}
function cargaComplementoEstructuraOperaciones(){
  GI("eopNomTransac").value = pkInfo2.eopNomTransac;
  formsLoaded();
}

function cargaComboEstructura(){
  showWaitLayer();
  cmbTransaccionParam.modulo = 2;
  cmbTransaccionParam.Transaccion = GI("txtTransaccion").value;
  cmbTransaccionParam.Nombre = GI("txtNomTransaccion").value;  
  cmbTransaccionParam.order = "S";
  if(cmbTransaccionParam.Transaccion == "")
    delete cmbTransaccionParam.Transaccion;
  if(cmbTransaccionParam.Nombre == "")
    delete cmbTransaccionParam.Nombre;
  limpiaTxts("eopNumTransac,eopNomTransac");
  limpiaCombos("cmbTransacciones");
  loadElement(GI("cmbTransacciones"));
}

function asignaValorTransaccion(objCmbTransacciones){
  if(objCmbTransacciones.value != -1){
    GI("eopNumTransac").value = objCmbTransacciones.value;
    GI("eopNomTransac").value = objCmbTransacciones.options[objCmbTransacciones.selectedIndex].text.split("-")[1].substring(1);
  }else
    limpiaTxts("eopNumTransac,eopNomTransac");
}

function ejecutaOperacionEstructura(){
  catEstopera.setOnUpdate(actualizaStatusOperacion);
  if(modo2 == OPER_ALTA){
    if(fvCatEstopera.checkForm()){
      showWaitLayer();
      verificaOperacionEstructura();
    }
  }else if(modo2 == OPER_MODIFICAR){
    if(fvCatEstopera.checkForm()){
      showWaitLayer();
      catEstopera.modificaCatalogo();
    }
  }else if(modo2 == OPER_BAJA){
    showWaitLayer();
    catEstopera.bajaCatalogo(false);
  }
}

function verificaOperacionEstructura(){
  if(modo2 == OPER_ALTA){
    var numOperacion = GI("eopNumOperacion").value
    var secuencial = GI("eopNumSecOpera").value;
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiEstOpe\",\"numOperacion\":" + numOperacion + ",\"secuencial\":" + secuencial + "}";
    makeAjaxRequest(url, "HTML", validaOperacionEstructura, null);
  }
}

function validaOperacionEstructura(obj, result){
  resultado = JSON.parse(result)[0];
  if(resultado.existeRegistro != 0){
    alert("El Registro ya existe!");
    hideWaitLayer();
  }else{
    catEstopera.altaCatalogo();
  }
}
function actualizaStatusOperacion(){
  var url = ctxRoot + "/doRef.do?json={\"id\":\"updStaOpe\",\"Operacion1\":" + pkInfo.opeNumOperacion + ",\"Operacion2\":" + pkInfo.opeNumOperacion + "}";
  makeAjaxRequest(url, "HTML", actualizacionRealizada, null);
}
function actualizacionRealizada(obj, result){
  alert("Operacion realizada exitosamente!");
  cargaMantenimientoOperaciones(modo);
  hideWaitLayer();
}