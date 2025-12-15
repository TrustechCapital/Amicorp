var cmbDatoParam = JSON.parse("{\"chido\":3}");

var arrTblEstGuiDat = new Array();
arrTblEstGuiDat[0] = "guiNumSecAsient,38";
arrTblEstGuiDat[1] = "guiNomCta,119";
arrTblEstGuiDat[2] = "guiNumCtam,57";
arrTblEstGuiDat[3] = "guiNumScta,37";
arrTblEstGuiDat[4] = "guiNumSscta,42";
arrTblEstGuiDat[5] = "guiNumSsscta,50";
arrTblEstGuiDat[6] = "guiNumSssscta,58";
arrTblEstGuiDat[7] = "guiNumSsssscta,65";
arrTblEstGuiDat[8] = "guiNumAux1,61";
arrTblEstGuiDat[9] = "guiNumAux2,69";
arrTblEstGuiDat[10] = "guiNumAux3,56";
arrTblEstGuiDat[11] = "guiCveAplicaDat,94";
arrTblEstGuiDat[12] = "guiCveCarAbo,33";
arrTblEstGuiDat[13] = "guiDescAsiento,128";
arrTblEstGuiDat[14] = "guiCveStGuiacon,100";

var fvCatGuiacont = new FormValidator();
var strIdPK2 = "guiNumGuia,guiNumSecAsient";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;
pkInfo2 = null;

fvCatGuiacont.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla2(pk) {
  cloneObject(pk,catGuiacont.getCatalogo());
  pkInfo2 = pk;
}

function cargaMantenimientoEstructuraGuias(Modo) {
  modo2 = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Guias/MantenimientoEstructuraCatalogoGuias.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalEstructuraGuias, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionEstructuraGuia();
  }
}

function despliegaPantallaPrincipalEstructuraGuias(obj, result) {
  
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;
  deshabilitaPK(arrIdPK);
  deshabilitaPK("gunNomGuia,gunCveStGuiano".split(","));
  deshabilitaPK(arrIdPK2);   
  initForms();
  if(modo2 == OPER_CONSULTAR || modo2 == OPER_MODIFICAR){ 
    if(modo2 == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
      habilitaPK("paramNumCtam,paramNumScta,paramNumSscta,paramNumSsscta,paramNumSssscta,paramNumSsssscta,paramNomCta".split(","));
    }
  }
  if(modo2 == OPER_ALTA || modo2 == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdConsultar");
}
function asignaValues2ObjHTML2(){
  asignaValues2ObjHTML();
  GI("guiNumGuia").value = pkInfo.gunNumGuia;
  if(isDefinedAndNotNull(pkInfo2) && modo2 != OPER_ALTA){
    catGuiacont.setOnUpdate(cargaComplemento2);
    catGuiacont.buscaCatalogoPK(false);
  }else{
    var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "asiValSec";
    objSecuencialParam.NumGuia = pkInfo.gunNumGuia;
    asignaSecuencial(GI("guiNumSecAsient"),objSecuencialParam);
    hideWaitLayer();
  }
}
function cargaComplemento2(){
  catGuiacont.setOnUpdate(avisoOperacionCatalogo);
  cargaRadiosConMaster("guiCveCarAbo","guiCveCarAbo2");
  formsLoaded();
}

function ejecutaOperacionEstructuraGuia(){
  catGuiacont.setOnUpdate(previoActualizaStatusGuia);
  if(modo2 == OPER_ALTA){
    if(fvCatGuiacont.checkForm()){
      showWaitLayer();
      verificaCuenta();
    }
  }else if(modo2 == OPER_MODIFICAR){
    if(fvCatGuiacont.checkForm()){
      showWaitLayer();
      verificaCuenta();
    }
  }else if(modo2 == OPER_BAJA){
    showWaitLayer();
    catGuiacont.bajaCatalogo(false);
  }
  tiempo("transaccDatotran(2,'"+((modo2 == OPER_ALTA)?GI("guiNumGuia").value:catGuiacont.getCatalogo().guiNumGuia)+"')");
}
function verificaCuenta(){
  var parametros = "";
  parametros = generaParametrosValidacion("cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta","guiNumCtam,guiNumScta,guiNumSscta,guiNumSsscta,guiNumSssscta,guiNumSsssscta");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCue\"," + parametros + ",\"group\":\"s\"}";
  makeAjaxRequest(url, "HTML", validaOperacionEstructura,null);
}

function generaParametrosValidacion(camposReales,camposValidar){
  var paramAux = "";
  var arrCamposReales = camposReales.split(",");
  var arrCamposValidar = camposValidar.split(",");
  for(var i = 0;i < arrCamposReales.length; i++)
      paramAux += "\"" + arrCamposReales[i] + "\":" + GI(arrCamposValidar[i]).value + ",";
  paramAux = paramAux.substring(0,paramAux.length-1);
  return paramAux;
}

function validaOperacionEstructura(obj, result){
  resultado = JSON.parse(result);
  if(resultado == ""){
    alert("La Cuenta asignada no existe actualmente");
    hideWaitLayer();
  }else{
    GI("guiNumAux1").value = resultado[0].cueNumAux1;
    GI("guiNumAux2").value = resultado[0].cueNumAux2;
    GI("guiNumAux3").value = resultado[0].cueNumAux3;
    esCuentaDetalle();
  }
}

function realizaOperacionGuia(){
  catGuiacont.setOnUpdate(previoActualizaStatusGuia);
  switch(modo2){
    case OPER_ALTA:
      catGuiacont.altaCatalogo();
    break;
    case OPER_MODIFICAR:
      catGuiacont.modificaCatalogo();
    break;
  }
}

function previoActualizaStatusGuia(){
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
}

var arrTblCatCueDat = new Array();
arrTblCatCueDat[0] = "cueNumCtam,50px";
arrTblCatCueDat[1] = "cueNumScta,32px";
arrTblCatCueDat[2] = "cueNumSscta,38px";
arrTblCatCueDat[3] = "cueNumSsscta,46px";
arrTblCatCueDat[4] = "cueNumSssscta,52px";
arrTblCatCueDat[5] = "cueNumSsssscta,60px";
arrTblCatCueDat[6] = "cueNumAux1,34px";
arrTblCatCueDat[7] = "cueNumAux2,34px";
arrTblCatCueDat[8] = "cueNumAux3,34px";
arrTblCatCueDat[9] = "cueNomCta,300px";
arrTblCatCueDat[10] = "cueCveAcreedora,26px";
arrTblCatCueDat[11] = "cueCveDeudora,26px";
arrTblCatCueDat[12] = "cueCveMovtoCta,52px";
arrTblCatCueDat[13] = "cueCveAcumRubro,52px";
arrTblCatCueDat[14] = "cueCveStCuenta,58px";

function clickTabla3(pk){
  for(var i = 2; i <= 10; i ++)
    eval("GI('" + arrTblEstGuiDat[i].split(",")[0] + "').value = pk." + arrTblCatCueDat[i-2].split(",")[0]);
}

function esCuentaDetalle(){
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
}

// TRANSACC_DATOTRAN

function transaccDatotran(tabla,numGuia)
{
// tabla  -1 transacc   -2 datotran

    var url = ctxRoot + "/executeRef.do?json={\"id\":\"funcionTransaccDatotran\",\"numGuia\":"+eval(numGuia)+",\"tabla\":"+eval(tabla)+"}";
    makeAjaxRequest(url,"HTML",resTransaccDatotran,null);
}

function resTransaccDatotran(obj,result)
{
  var resp = JSON.parse(result).resultado; 
}

function tiempo(cadena)
{

  setTimeout(cadena,1000);

}