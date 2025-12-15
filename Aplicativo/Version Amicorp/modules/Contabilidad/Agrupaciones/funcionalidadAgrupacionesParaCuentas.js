//var cmbDatoParam = JSON.parse("{\"chido\":3}");
var catGuiacont = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");

initForms();

var arrTblCuenDat = new Array();
arrTblCuenDat[0] = "facoIdAgrupacion,35";
arrTblCuenDat[1] = "fcueMayor,116";
arrTblCuenDat[2] = "fcueSubCta,34";
arrTblCuenDat[3] = "fcueSsCta,39";
arrTblCuenDat[4] = "fcueSssCta,47";
arrTblCuenDat[5] = "fcueSsssCta,55";
arrTblCuenDat[6] = "fcueSssssCta,62";



var fvcatCueRub = new FormValidator();
var strIdPK2 = "facoIdAgrupacion,fcueMayor,fcueSubCta,fcueSsCta,fcueSssCta,fcueSsssCta,fcueSssssCta";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;
pkInfo2 = null;

fvcatCueRub.setup({
  formName      : "frmAgrupaCuentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla2(pk) {

  cloneObject(pk,catCueRub.getCatalogo());
  pkInfo2 = pk;
}

function cargaAgrupacionesCuentas(Modo) {
  modo2  = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    //showWaitLayer();
    var urlCliente = "modules/Contabilidad/Agrupaciones/AgrupaCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaAgrupaCuentas, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionEstructuraGuia();
  }
}

function despliegaPantallaAgrupaCuentas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  //deshabilitaPK(arrIdPK);
  //deshabilitaPK("gunNomGuia,gunCveStGuiano".split(","));
  //deshabilitaPK(arrIdPK2);   
  //initForms();
  if(modo2  == OPER_CONSULTAR || modo2  == OPER_MODIFICAR){ 
    if(modo2  == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmAgrupaCuentas"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
      //habilitaPK("paramNumCtam,paramNumScta,paramNumSscta,paramNumSsscta,paramNumSssscta,paramNumSsssscta,paramNomCta".split(","));
    }
  }
  if(modo2  == OPER_ALTA || modo2  == OPER_MODIFICAR){
      if(modo2  == OPER_ALTA){
      alert(catRub.getCatalogo().facoIdAgrupacion);
        //alert(pkInfo2.facoIdAgrupacion);
        GI("facoIdAgrupacion").value = catRub.getCatalogo().facoIdAgrupacion;//pkInfo2.facoIdAgrupacion
      }
    muestraObjs("cmdAceptar,cmdCancelar,cmdConsultar");
  }
    asignaValues2ObjHTML2()
}

function asignaValues2ObjHTML2(){
  //asignaValues2ObjHTML();
  if(isDefinedAndNotNull(pkInfo2) && modo2  != OPER_ALTA){
    catCueRub.setOnUpdate(cargaComplemento2);
    catCueRub.buscaCatalogoPK(false);
  }else{
    /*var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "asiValSec";
    objSecuencialParam.NumGuia = pkInfo.gunNumGuia;
    asignaSecuencial(GI("guiNumSecAsient"),objSecuencialParam);*/
   hideWaitLayer();
  }
}
function cargaComplemento2(){
  catCueRub.setOnUpdate(avisoOperacionCatalogo);
  //cargaRadiosConMaster("guiCveCarAbo","guiCveCarAbo2");
 formsLoaded();
}

function ejecutaOperacionEstructuraGuia(){
  //catCueRub.setOnUpdate(previoActualizaStatusGuia);
  if(modo2  == OPER_ALTA){
    if(fvcatCueRub.checkForm()){
      //showWaitLayer();
      verificaCuenta();
    }
  }else if(modo2  == OPER_MODIFICAR){
    if(fvcatCueRub.checkForm()){
      //showWaitLayer();
      verificaCuenta();
    }
  }else if(modo2  == OPER_BAJA){
    //showWaitLayer();
    alert("baja");
    catCueRub.bajaCatalogo(false);
  }
}
function verificaCuenta(){
  var parametros = "";
  parametros = generaParametrosValidacion("cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta","fcueMayor,fcueSubCta,fcueSsCta,fcueSssCta,fcueSsssCta,fcueSssssCta");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCue\"," + parametros + ",\"group\":\"s\"}";
  makeAjaxRequest(url, "HTML", validaOperacionEstructura,null);
}

function generaParametrosValidacion(camposReales,camposValidar){
  
  var paramAux = "";
  var arrCamposReales = camposReales.split(",");
  var arrCamposValidar = camposValidar.split(",");
  for(var i = 0;i < arrCamposReales.length; i++){
      paramAux += "\"" + arrCamposReales[i] + "\":" + GI(arrCamposValidar[i]).value + ",";
  }
  paramAux = paramAux.substring(0,paramAux.length-1);
  return paramAux;
}

function validaOperacionEstructura(obj, result){
  alert(result);
  resultado = JSON.parse(result);
  if(resultado == ""){
    alert("La Cuenta asignada no existe actualmente");
    hideWaitLayer();
  }else{
    /*GI("guiNumAux1").value = resultado[0].cueNumAux1;
    GI("guiNumAux2").value = resultado[0].cueNumAux2;
    GI("guiNumAux3").value = resultado[0].cueNumAux3;
    esCuentaDetalle();*/
    realizaOperacionGuia();
  }
}

function realizaOperacionGuia(){
  //catCueRub.setOnUpdate(previoActualizaStatusGuia);
  alert("hola");
  switch(modo2){
    case OPER_ALTA:
       alert("alta");
      catCueRub.altaCatalogo();
    break;
    case OPER_MODIFICAR:
      //alert("MODIFICAR");
      catCueRub.modificaCatalogo();
    break;
  }
}

/*function previoActualizaStatusGuia(){
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conNumCarNumAbo\",\"Guia\":" + pkInfo.gunNumGuia + ",\"group\":\"S\"}";
  makeAjaxRequest(url, "HTML", verificaCargosAbonos, null);
}

function verificaCargosAbonos(obj, result){
  var resultado = JSON.parse(result);
  if(resultado.length > 1)
    actualizaStatusGuia("ACTIVO");
  else
    actualizaStatusGuia("PENDIENTE");
}
function actualizaStatusGuia(status){
  var url = ctxRoot + "/doRef.do?json={\"id\":\"updStaGui\",\"Status\":\"" + status + "\",\"Guia\":" + pkInfo.gunNumGuia + "}";
  makeAjaxRequest(url, "HTML", actualizacionRealizada, null);
}

function actualizacionRealizada(obj, result){
  alert("Operacion realizada exitosamente!");
  cargaMantenimientoCatalogoGuias(modo);
  hideWaitLayer();
}*/

var arrTblCatCueDat = new Array();
arrTblCatCueDat[0] = "cueNumCtam,50px";
arrTblCatCueDat[1] = "cueNumScta,32px";
arrTblCatCueDat[2] = "cueNumSscta,38px";
arrTblCatCueDat[3] = "cueNumSsscta,46px";
arrTblCatCueDat[4] = "cueNumSssscta,52px";
arrTblCatCueDat[5] = "cueNumSsssscta,60px";


function clickTabla3(pk){
  for(var i = 1; i <= 6; i ++)
    eval("GI('" + arrTblCuenDat[i].split(",")[0] + "').value = pk." + arrTblCatCueDat[i-1].split(",")[0]);
}

/*function esCuentaDetalle(){
  var pk = JSON.parse("{}");
  pk.cueNumCtam = GI("guiNumCtam").value;
  pk.cueNumScta = GI("guiNumScta").value;
  pk.cueNumSscta = GI("guiNumSscta").value;
  pk.cueNumSsscta = GI("guiNumSsscta").value;
  pk.cueNumSssscta = GI("guiNumSssscta").value;
  pk.cueNumSsssscta = GI("guiNumSsssscta").value;
  pk.cueNumAux1 = GI("guiNumAux1").value;
  pk.cueNumAux2 = GI("guiNumAux2").value;
  pk.cueNumAux3 = GI("guiNumAux3").value;  
  var objCuentaDetalleParam = JSON.parse("{}");
  objCuentaDetalleParam.id = "verExiCueInf";
  objCuentaDetalleParam.NumCtam = pk.cueNumCtam;
  for(var i = 1; i <= 5; i ++){
    if(eval("pk." + arrTblCatCueDat[i].split(",")[0] + "!= 0")){
      eval("objCuentaDetalleParam." + arrTblCatCueDat[i].split(",")[0].substring(3) + " = pk." + arrTblCatCueDat[i].split(",")[0]);
      continue;
    }else
      break;
  }
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCuentaDetalleParam);
  makeAjaxRequest(url, "HTML", verificaCuentaDetalle, pk);
}

function verificaCuentaDetalle(obj, result){
  var resultado = JSON.parse(result)[0];
  if(resultado.cuentasInferiores > 1){
    alert("La Cuenta seleccionada no es una Cuenta de detalle. Verifique!");
    hideWaitLayer();
  }else
    realizaOperacionGuia();
}*/



