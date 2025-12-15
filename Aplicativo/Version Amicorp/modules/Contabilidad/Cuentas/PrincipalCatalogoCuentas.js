//PrincipalCatalogoCuentas.js
//#01 2008-SEP-21: Se modifico "cueCveAcumRubro,58px" por "cueCveAcumRubro,100px" 
//#02 2008-SEP-22: Se modificaron los tamanos de las columnas

showWaitLayer();
formsLoaded();
var cmbAuxsParam = JSON.parse("{\"chido\":22}");
var cmbAcumRubroParam = JSON.parse("{\"chido\":21}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");

var arrTblCatCueDat = new Array();
//#02
arrTblCatCueDat[0] = "cueNumCtam,60px";
arrTblCatCueDat[1] = "cueNumScta,40px";
arrTblCatCueDat[2] = "cueNumSscta,40px";
arrTblCatCueDat[3] = "cueNumSsscta,40px";
arrTblCatCueDat[4] = "cueNumSssscta,40px";
arrTblCatCueDat[5] = "cueNumSsssscta,40px";
arrTblCatCueDat[6] = "cueNumAux1,40px";
arrTblCatCueDat[7] = "cueNumAux2,40px";
arrTblCatCueDat[8] = "cueNumAux3,40px";
arrTblCatCueDat[9] = "cueNomCta,150px";
arrTblCatCueDat[10] = "cueCveAcreedora,40px";
arrTblCatCueDat[11] = "cueCveDeudora,40px";
arrTblCatCueDat[12] = "cueCveMovtoCta,100px";
arrTblCatCueDat[13] = "cueCveAcumRubro,100px";//#01
arrTblCatCueDat[14] = "cueCveStCuenta,100px";

var catCuentaco = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");
var fvCatCuentaco = new FormValidator();
var cueNumCtam, cueNumScta,cueNumSscta, cueNumSsscta, cueNumSssscta, cueNumSsssscta, cueNumAux1, cueNumAux2, cueNumAux3;
var strIdPK = "cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta";
var arrIdPK = strIdPK.split(",");
var modo;
var fncActGuias = JSON.parse("{\"id\":\"ejefncActGuias\"}");  
pkInfo = null;

fvCatCuentaco.setup({
  formName      : "frmMantenimientoCatalogoCuentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  cloneObject(pk,catCuentaco.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  catTransacc = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");
  pkInfo = null;
}

function cargaMantenimientoCatalogoCuentas(Modo) {
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Cuentas/MantenimientoCatalogoCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoCuentas, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionCuentas();
  }
}


function enCeros()
{
  if(GI('paramCtasMayor').checked)
  {
    GI('paramNumScta').value=0;
    GI('paramNumSscta').value=0;
    GI('paramNumSsscta').value=0;
    GI('paramNumSssscta').value=0;
    GI('paramNumSsssscta').value=0;
  }
}


function despliegaPantallaMantenimientoCatalogoCuentas(obj, result) {
  
  GI("dvPantalla").innerHTML = result; // Pestaña  
  //GI("dvContenido").innerHTML = result;  
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoCatalogoCuentas"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function ejecutaOperacionCuentas(){
  if(modo == OPER_ALTA){
    if(verificaNiveles(generaArrValuesPK())){
      if(fvCatCuentaco.checkForm()){
        showWaitLayer();  
        verificaCuenta();
      }
    }
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    if(fvCatCuentaco.checkForm()){
        catCuentaco.modificaCatalogo();
        
        fncActGuias.Cuenta1 = pkInfo.cueNumCtam;
        //alert("cuenta1: "+pkInfo.cueNumCtam);
        fncActGuias.Cuenta2 = pkInfo.cueNumScta;
        //alert("cuenta2: "+pkInfo.cueNumScta);
        fncActGuias.Cuenta3 = pkInfo.cueNumSscta;
        //alert("cuenta3: "+pkInfo.cueNumSscta);
        fncActGuias.Cuenta4 = pkInfo.cueNumSsscta;
        //alert("cuenta4: "+pkInfo.cueNumSsscta);
        fncActGuias.Cuenta5 = pkInfo.cueNumSssscta;
        //alert("cuenta5: "+pkInfo.cueNumSssscta);
        fncActGuias.Cuenta6 = pkInfo.cueNumSsssscta;
        //alert("cuenta6: "+pkInfo.cueNumSsssscta);
        fncActGuias.CuentaAux1 = pkInfo.cueNumAux1;
        //alert("auxiliar1: "+pkInfo.cueNumAux1);
        fncActGuias.CuentaAux2 = pkInfo.cueNumAux2;
        //alert("auxiliar2: "+pkInfo.cueNumAux2);
        fncActGuias.CuentaAux3 = pkInfo.cueNumAux3;
        //alert("auxiliar3: "+pkInfo.cueNumAux3);
      
      var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncActGuias);
      makeAjaxRequest(url, "HTML", validaActualizaGuias, null);      
    }
    hideWaitLayer();
  }else if(modo == OPER_BAJA){
    verificaCuenta();
  }
}

function validaActualizaGuias(obj, result) {
  var resultado = JSON.parse(result)[0];
  onButtonClickPestania('Contabilidad.Cuentas.PrincipalCatalogoCuentas','');    
  formsLoaded();
}

function asignaPK2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catCuentaco.setOnUpdate(cargaComplementoCuentas);
    catCuentaco.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function cargaComplementoCuentas(){
  catCuentaco.setOnUpdate(avisoOperacionCatalogo);
  cargaChecks("cueSat");
  cargaRadios("cueCveAcreedora,cueCveDeudora");
  cargaRadiosConMaster("cueCveMovtoCta","cueCveMovtoCta2,cueCveMovtoCta3");
  cargaRadiosConMaster("cueTipoPersona","cueTipoPersona2");
  formsLoaded();
}

function generaArrValuesPK(){
  var arrAux = new Array();
  for(var i=0 ; i < arrIdPK.length ; i++)
    arrAux[i] = GI(arrIdPK[i]).value;
  return arrAux;
}
function validaAuxiliares(objCmbAuxiliar){
  var verificaAux1 = false;
  var verificaAux2 = false;
  var verificaAux3 = false;
  if(GI("cueNumAux1").value != -1)
    verificaAux1 = true;
  if(GI("cueNumAux2").value != -1)
    verificaAux2 = true;
  if(GI("cueNumAux3").value != -1)
    verificaAux3 = true;
    
  if(verificaAux1)
    if(GI("cueNumAux1").value == GI("cueNumAux2").value || GI("cueNumAux1").value == GI("cueNumAux3").value){
      alert("Los Auxiliares no pueden repetirse!");
      objCmbAuxiliar.value = -1;
      objCmbAuxiliar.focus();
    }
  else if(verificaAux2)
    if(GI("cueNumAux2").value == GI("cueNumAux1").value || GI("cueNumAux2").value == GI("cueNumAux3").value){
      alert("Los Auxiliares no pueden repetirse!");
      objCmbAuxiliar.value = -1;
      objCmbAuxiliar.focus();
    }
  else if(verificaAux3)
    if(GI("cueNumAux3").value == GI("cueNumAux1").value || GI("cueNumAux3").value == GI("cueNumAux2").value){
      alert("Los Auxiliares no pueden repetirse!");
      objCmbAuxiliar.value = -1;
      objCmbAuxiliar.focus();
    }
}
function convierteCuenta2Superior(arrValuesPK){
  var arrAux = arrValuesPK;
  var i;
  if(arrAux[0] != "0" && arrAux[1] == "0"){
    arrAux[0] = "NUEVA CUENTA";
  }else{
    for(i = 2 ; i < arrAux.length ; i++)
      if(arrAux[i] == "0")
        break;
    for(var j = 1 ; j < arrAux.length ; j++)
      if(j == (i-1))
        arrAux[j] = "0";
  }
  return arrAux;
}
function verificaNiveles(arrValuesPK){
  var nivelesCorrectos = true;
  for(var i=1 ; i < arrValuesPK.length ; i++){
    if(arrValuesPK[i] == "0" && arrValuesPK[i] != ""){
      nivelesCorrectos = false;
    }
    if(arrValuesPK[i] != "0" && arrValuesPK[i] != "" && nivelesCorrectos == false){
      alert("Verifica el Nivel " + i);
      GI(arrIdPK[i]).value = '';
      fvCatCuentaco.checkForm();
      return false;
    }
  }
  return true;
}
function generaParametros(arrValores){
  var paramAux = "";
  for(var i = 0;i < arrValores.length; i++){
        paramAux += "\"" + arrIdPK[i] + "\":" + arrValores[i] + ",";
  }
  paramAux=paramAux.substring(0,paramAux.length-1);
  return paramAux;
}

function verificaCuenta(){
  var parametros;
  parametros = "";
  if(modo == OPER_ALTA){
    for(var i = 0;i < arrIdPK.length; i++){
      parametros += "\"" + arrIdPK[i] + "\":" + GI(arrIdPK[i]).value + ",";
    }
    parametros = parametros.substring(0,parametros.length-1);
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCue\"," + parametros + ",\"group\":\"s\"}";
    makeAjaxRequest(url, "HTML", validaOperacionCuenta, 1);
  }
  if(modo == OPER_BAJA){
    for(var i = 0;i < arrIdPK.length; i++){
      parametros += "\"" + arrIdPK[i] + "\":" + eval("pkInfo." + arrIdPK[i]) + ",";
    }
    parametros = parametros.substring(0,parametros.length-1);
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verCueVSGui\"," + parametros + "}";
    makeAjaxRequest(url, "HTML", validaOperacionCuenta, 3);
  }
}
function validaOperacionCuenta(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case 1:
      if(resultado != ""){
        alert("El Registro ya existe actualmente!");
        hideWaitLayer();
      }else{
        var arrValuesPKSuperior = convierteCuenta2Superior(generaArrValuesPK());
        if(arrValuesPKSuperior[0] != "NUEVA CUENTA"){
          var parametros = generaParametros(arrValuesPKSuperior);
          var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCue\"," + parametros + ",\"group\":\"s\"}";
          makeAjaxRequest(url, "HTML", validaOperacionCuenta, 2);
        }else{
          validaOperacionCuenta(2,"[{\"operacion\":\"ALTA\"}]");
        }
      }
    break;
    case 2:
      if(resultado == ""){
        alert("No se puede dar de alta una Cuenta que no tenga nivel superior!");
        hideWaitLayer();
      }else{
        catCuentaco.setOnUpdate(avisoOperacionCatalogo);
        catCuentaco.altaCatalogo();
        onButtonClickPestania("Contabilidad.Cuentas.PrincipalCatalogoCuentas","");
        hideWaitLayer();
      }
    break;
    case 3:
      if(resultado[0].numGuias > 0){
        alert("No se puede dar de baja una Cuenta que mantenga Guías dependientes!");
        hideWaitLyer();
      }else{
        var parametros = "";
        for(var i = 0;i < arrIdPK.length - 1; i++){
          parametros += "\"" + arrIdPK[i] + "\":" + eval("pkInfo." + arrIdPK[i]);
          if(eval("pkInfo." + arrIdPK[i+1]) == 0){
            break;
          }else{
            parametros += ",";
          }
        }
        var url = ctxRoot + "/getRef.do?json={\"id\":\"verNivCue\"," + parametros + "}";
        makeAjaxRequest(url, "HTML", validaOperacionCuenta, 4);
      }
    break;
    case 4:
      if(resultado[0].numNiveles > 0){
        alert("No se puede dar de baja una Cuenta que mantenga un nivel inferior!3");
        hideWaitLayer();
      }else{
        catCuentaco.setOnUpdate(avisoOperacionCatalogo);
        catCuentaco.bajaCatalogo(false);
        onButtonClickPestania("Contabilidad.Cuentas.PrincipalCatalogoCuentas","");
        hideWaitLayer();
      }
    break;
  }
}