var catCtaMatriz = new Catalogo("mx.com.inscitech.fiducia.domain.CtaMatriz");

var cmbTipoNegocioParam = JSON.parse("{\"chido\":36}");
var cmbClasProductoParam = JSON.parse("{\"chido\":37}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");

var arrTblMatCueDat = new Array();
arrTblMatCueDat[0] = "ctamCtaClien,53px";
arrTblMatCueDat[1] = "ctamSctaClien,39px";
arrTblMatCueDat[2] = "ctamSsctaClien,43px";
arrTblMatCueDat[3] = "ctamSssctaClien,49px";
arrTblMatCueDat[4] = "ctamSsssctaClien,58px";
arrTblMatCueDat[5] = "ctamSssssctaClien,68px";
arrTblMatCueDat[6] = "ctamNomCta,304px";
arrTblMatCueDat[7] = "ctamCtaOrden,53";
arrTblMatCueDat[8] = "ctamSctaOrden,39px";
arrTblMatCueDat[9] = "ctamSsctaOrden,43px";
arrTblMatCueDat[10] = "ctamSssctaOrden,49px";
arrTblMatCueDat[11] = "ctamSsssctaOrden,58px";
arrTblMatCueDat[12] = "ctamSssssctaOrden,68px";
arrTblMatCueDat[13] = "ctamCveStCtamat,100px";

var fvCatCtaMatriz = new FormValidator();
var strIdPK = "ctamTipoNegocio,ctamClasifProd,ctamCtaClien,ctamSctaClien,ctamSsctaClien,ctamSssctaClien,ctamSsssctaClien,ctamSssssctaClien";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

fvCatCtaMatriz.setup({
  formName      : "frmMantenimientoMatrizCuentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catCtaMatriz.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catTransacc = new Catalogo("mx.com.inscitech.fiducia.domain.CtaMatriz");
  pkInfo = null;
}

function cargaMantenimientoMatrizCuentas(Modo) {
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Matriz/MantenimientoMatrizCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoMatrizCuentas, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionMatrizCuentas();
  }
}

function despliegaPantallaMantenimientoMatrizCuentas(obj, result) {
  
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;
  
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoMatrizCuentas"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
      habilitaPK("paramNumCtam,paramNumScta,paramNumSscta,paramNumSsscta,paramNumSssscta,paramNumSsssscta,paramNomCta".split(","));
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValores2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catCtaMatriz.buscaCatalogoPK(false);
    formsLoaded();
  }else{
    muestraObjs("cmdConsultar");
    formsLoaded();
  }
}

function ejecutaOperacionMatrizCuentas(){
  if(modo == OPER_ALTA){
    if(fvCatCtaMatriz.checkForm()){
      showWaitLayer();
      verificaExisteCuenta("cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta","ctamCtaClien,ctamSctaClien,ctamSsctaClien,ctamSssctaClien,ctamSsssctaClien,ctamSssssctaClien");
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatCtaMatriz.checkForm()){
      showWaitLayer();
      catCtaMatriz.setOnUpdate(avisoOperacionCatalogo);
      catCtaMatriz.modificaCatalogo();
      onButtonClickPestania("Contabilidad.Matriz.PrincipalMatrizCuentas","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catCtaMatriz.setOnUpdate(avisoOperacionCatalogo);
    catCtaMatriz.bajaCatalogo(false);
    onButtonClickPestania("Contabilidad.Matriz.PrincipalMatrizCuentas","");
    hideWaitLayer();
  }
}
function verificaExisteCuenta(strCamposReales,strCamposValidar){
  var parametros = "";
  parametros = generaParametrosValidacion(strCamposReales,strCamposValidar);
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCue\"," + parametros + ",\"group\":\"s\"}";
  makeAjaxRequest(url, "HTML", verificaOperacionMatrizCuentas, null);
  hideWaitLayer();
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

function verificaOperacionMatrizCuentas(obj, result){
  resultado = JSON.parse(result);
  if(resultado == ""){
    alert("La Cuenta Traducir asignada no existe!");
    hideWaitLayer();
  }else
    esCuentaDetalle();
}

function realizaOperacionMatrizCuentas(){
  catCtaMatriz.setOnUpdate(avisoOperacionCatalogo);
  catCtaMatriz.altaCatalogo();
  onButtonClickPestania("Contabilidad.Matriz.PrincipalMatrizCuentas","");
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
  for(var i = 0; i <= 5; i ++)
    eval("GI('" + arrTblMatCueDat[i].split(",")[0] + "').value = pk." + arrTblCatCueDat[i].split(",")[0]);
}

function esCuentaDetalle(){
  var pk = JSON.parse("{}");
  pk.cueNumCtam = GI("ctamCtaClien").value;
  pk.cueNumScta = GI("ctamSctaClien").value;
  pk.cueNumSscta = GI("ctamSsctaClien").value;
  pk.cueNumSsscta = GI("ctamSssctaClien").value;
  pk.cueNumSssscta = GI("ctamSsssctaClien").value;
  pk.cueNumSsssscta = GI("ctamSssssctaClien").value;
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
    realizaOperacionMatrizCuentas();
}