var catSaldos = new Catalogo("mx.com.inscitech.fiducia.domain.Saldos");
var catAsientos = new Catalogo("mx.com.inscitech.fiducia.domain.Asientos");
var divNombreFideicomisoParam;
var divNombreCuentaParam;

var arrTblSalFidDat = new Array();
arrTblSalFidDat[0] = "salNumCtam,40";
arrTblSalFidDat[1] = "salNumScta,40";
arrTblSalFidDat[2] = "salNumSscta,45";
arrTblSalFidDat[3] = "salNumSsscta,50";
arrTblSalFidDat[4] = "salNumSssscta,55";
arrTblSalFidDat[5] = "salNumSsssscta,70";
arrTblSalFidDat[6] = "salNomCta,300";
arrTblSalFidDat[7] = "salNumAux1,40";
arrTblSalFidDat[8] = "salNumAux2,40";
arrTblSalFidDat[9] = "salNumAux3,40";
arrTblSalFidDat[10] = "salSaldoIniPer,100";
arrTblSalFidDat[11] = "salCargosPer,100";
arrTblSalFidDat[12] = "salAbonosPer,100";
arrTblSalFidDat[13] = "salImpSaldoAct,100";

var arrTblMovSalFidDat = new Array();
arrTblMovSalFidDat[0] = "asiCveStMovim,70";
arrTblMovSalFidDat[1] = "asiFolioOpera,70";
arrTblMovSalFidDat[2] = "asiDiaAltaReg,40";
arrTblMovSalFidDat[3] = "asiNumOperacion,70";
arrTblMovSalFidDat[4] = "asiTransaccion,70";
arrTblMovSalFidDat[5] = "asiSecOpera,70";
arrTblMovSalFidDat[6] = "asiNumCtam,70";
arrTblMovSalFidDat[7] = "asiNumScta,60";
arrTblMovSalFidDat[8] = "asiNumSscta,60";
arrTblMovSalFidDat[9] = "asiNumSsscta,60";
arrTblMovSalFidDat[10] = "asiNumSssscta,60";
arrTblMovSalFidDat[11] = "asiNumSsssscta,60";
arrTblMovSalFidDat[12] = "asiNumAux1,50";
arrTblMovSalFidDat[13] = "asiNumAux2,50";
arrTblMovSalFidDat[14] = "asiNumAux3,50";
arrTblMovSalFidDat[15] = "asiCveCarAbo,50";
arrTblMovSalFidDat[16] = "asiImpMovimiento,100";
arrTblMovSalFidDat[17] = "asiDescAsiento,100";

var fvCat = new FormValidator();
var strIdPK = "salNumCtam,salNumScta,salNumSscta,salNumSsscta,salNumSssscta,salNumSsssscta,salNumAux1,salNumAux2,salNumAux3";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catSaldos.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catSaldos = new Catalogo("mx.com.inscitech.fiducia.domain.Saldos");
}
function cargaPrincipalConsultarConsultaSaldosCuenta(Modo){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/SaldosCuenta/PrincipalConsultarConsultaSaldosCuenta.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultarConsultaSaldosCuenta, null);
  }
}

function despliegaPantallaPrincipalConsultarConsultaSaldosCuenta(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  deshabilitaObjetos(GI("frmDatos"));
  catSaldos.setOnUpdate(cargaComplemento);
  catSaldos.buscaCatalogoPK(false);
}

function cargaComplemento(){
  asignaPK2ObjHTML();
  formateaCantidades("salSaldoIniPer,salCargosPer,salAbonosPer,salImpSaldoAct,salImpIniEje,salImpCarEjer,salImpAboEjer");
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","conPriMovSalFid");
  SA(botonTemp,"fun","loadTableElementSpecial");
  SA(botonTemp,"tabla","tblRegPriMovSalFid");
  consultar(botonTemp, GI("frmDatos"), false);
  consultaNombreFideicomiso("salNomContrato",GI("salNumAux1"));
  consultaNombreCuenta("salNomCta");
  catSaldos.setOnUpdate(avisoOperacionCatalogo);
  formsLoaded();
}

function formateaCantidades(strId){
  for(var i = 0; i < strId.split(",").length; i++)
    convertToMoneyById(strId.split(",")[i]);
}
function consultaNombreFideicomiso(strNomFideicomiso,objFideicomiso) {
  showWaitLayer();
  var objNomFideicomiso = GI(strNomFideicomiso);
  SA(objNomFideicomiso, "ref", "conNomFid");
  SA(objNomFideicomiso, "fun", "asignaValor2Label");
  SA(objNomFideicomiso, "param", "divNombreFideicomisoParam");
  if(objFideicomiso.value != ""){
    var numFideicomiso = objFideicomiso.value;
    divNombreFideicomisoParam = JSON.parse("{\"numFideicomiso\":" + numFideicomiso + "}");
    loadElement(objNomFideicomiso);
  }else
    hideWaitLayer();
}
function consultaNombreCuenta(strNomCuenta) {
  showWaitLayer();
  var objNomCuenta = GI(strNomCuenta);
  SA(objNomCuenta, "ref", "conNomCue");
  SA(objNomCuenta, "fun", "asignaValor2Label");
  SA(objNomCuenta, "param", "divNombreCuentaParam");
  divNombreCuentaParam = JSON.parse("{" + generaParametrosValidacion ("NumCtam,NumScta,NumSscta,NumSsscta,NumSssscta,NumSsssscta","salNumCtam,salNumScta,salNumSscta,salNumSsscta,salNumSssscta,salNumSsssscta") + "}");
  loadElement(objNomCuenta);
}
function asignaValor2Label(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(obj))
    obj.innerHTML = objeto.nombre;
  else{
    alert("El fideicomiso no existe");
    GI("paramFideicomiso").value = "";
    obj.innerHTML = "";
  }
  hideWaitLayer();
}

function asignaPK2ObjHTML(){
  for(var i = 0;i < arrIdPK.length; i++)
    eval("GI('param" + arrIdPK[i] + "').value = catSaldos.getCatalogo()." + arrIdPK[i]);
}

function loadTableElementSpecial(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTable(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), null, false);
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
function asignaTabla(objChk){
  if(objChk.checked)
    SA(GI("cmdAceptar"),"ref","conPriSalFidMSA");
  else
    SA(GI("cmdAceptar"),"ref","conPriSalFid");
  alert(GI("cmdAceptar").ref);
}

function cargaPrincipalConsultaSaldosCuenta(){
  showWaitLayer();
  var urlCliente = "modules/Contabilidad/SaldosCuenta/PrincipalConsultaSaldosCuenta.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultaSaldosCuenta, null);
}

function despliegaPantallaPrincipalConsultaSaldosCuenta(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  pkInfo = null;
  if(isDefinedAndNotNull(objParameters)){
    setParameters(objParameters);
    GI(objButtonConsultar).click();
  }
  formsLoaded();
}