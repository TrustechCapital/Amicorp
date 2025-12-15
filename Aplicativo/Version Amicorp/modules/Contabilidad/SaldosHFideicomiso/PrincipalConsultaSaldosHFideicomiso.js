var catSaldosh = new Catalogo("mx.com.inscitech.fiducia.domain.Saldosh");

var divNombreFideicomisoParam;
var divNombreCuentaParam;

var arrTblSalFidDat = new Array();
arrTblSalFidDat[0] = "salNumCtam,37";
arrTblSalFidDat[1] = "salNumScta,37";
arrTblSalFidDat[2] = "salNumSscta,42";
arrTblSalFidDat[3] = "salNumSsscta,47";
arrTblSalFidDat[4] = "salNumSssscta,52";
arrTblSalFidDat[5] = "salNumSsssscta,60";
arrTblSalFidDat[6] = "salNomCta,260";
arrTblSalFidDat[7] = "salNumAux1,40";
arrTblSalFidDat[8] = "salNumAux2,40";
arrTblSalFidDat[9] = "salNumAux3,100";
arrTblSalFidDat[10] = "salSaldoIniPer,100";
arrTblSalFidDat[11] = "salCargosPer,100";
arrTblSalFidDat[12] = "salAbonosPer,100";
arrTblSalFidDat[13] = "salImpSaldoAct,100";

var arrTblMovSalFidDat = new Array();
arrTblMovSalFidDat[0] = "asiCveStMovim,70";
arrTblMovSalFidDat[1] = "asiFolioOpera,70";
arrTblMovSalFidDat[2] = "asiMesAltaReg,40";
arrTblMovSalFidDat[3] = "asiDiaAltaReg,40";
arrTblMovSalFidDat[4] = "asiNumOperacion,70";
arrTblMovSalFidDat[5] = "asiTransaccion,70";
arrTblMovSalFidDat[6] = "asiSecOpera,70";
arrTblMovSalFidDat[7] = "asiNumCtam,70";
arrTblMovSalFidDat[8] = "asiNumScta,60";
arrTblMovSalFidDat[9] = "asiNumSscta,60";
arrTblMovSalFidDat[10] = "asiNumSsscta,60";
arrTblMovSalFidDat[11] = "asiNumSssscta,60";
arrTblMovSalFidDat[12] = "asiNumSsssscta,60";
arrTblMovSalFidDat[13] = "asiNumAux1,50";
arrTblMovSalFidDat[14] = "asiNumAux2,50";
arrTblMovSalFidDat[15] = "asiNumAux3,50";
arrTblMovSalFidDat[16] = "asiCveCarAbo,50";
arrTblMovSalFidDat[17] = "asiImpMovimiento,100";
arrTblMovSalFidDat[18] = "asiDescAsiento,100";

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
  cloneObject(pk,catSaldosh.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  GI("nomFideicomiso").innerHTML = "";
  catSaldosh = new Catalogo("mx.com.inscitech.fiducia.domain.Saldosh");
}
function cargaPrincipalConsultarConsultaSaldosFideicomiso(Modo){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/SaldosHFideicomiso/PrincipalConsultarConsultaSaldosHFideicomiso.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultarConsultaSaldosFideicomiso, null);
  }
}

function despliegaPantallaPrincipalConsultarConsultaSaldosFideicomiso(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  deshabilitaObjetos(GI("frmDatos"));
  catSaldosh.setOnUpdate(cargaComplementoSaldosFideicomiso);
  catSaldosh.buscaCatalogoPK(false);
}

function cargaComplementoSaldosFideicomiso(){
  asignaPK2ObjHTML();
  //formateaCantidades("salSaldoIniPer,salCargosPer,salAbonosPer,salImpSaldoAct,salImpIniEje,salImpCarEjer,salImpAboEjer");
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","conPriMovSalFid");
  SA(botonTemp,"fun","loadTableElementSpecial");
  SA(botonTemp,"tabla","tblRegPriMovSalFid");
  consultar(botonTemp, GI("frmDatos"), false);
  consultaNombreFideicomiso("salNomContrato",GI("salNumAux1"));
  consultaNombreCuenta("salNomCta");
  catSaldosh.setOnUpdate(avisoOperacionCatalogo);
  formsLoaded();
}

function consultaNombreCuenta(strNomCuenta) {
  showWaitLayer();
  var objNomCuenta = GI(strNomCuenta);
  SA(objNomCuenta, "ref", "conNomCue");
  SA(objNomCuenta, "fun", "asignaValor2DivFideicomiso");
  SA(objNomCuenta, "param", "divNombreCuentaParam");
  divNombreCuentaParam = JSON.parse("{" + generaParametros("NumCtam,NumScta,NumSscta,NumSsscta,NumSssscta,NumSsssscta","salNumCtam,salNumScta,salNumSscta,salNumSsscta,salNumSssscta,salNumSsssscta") + "}");
  loadElement(objNomCuenta);
}

function asignaPK2ObjHTML(){
  for(var i = 0;i < arrIdPK.length; i++)
    eval("GI('param" + arrIdPK[i] + "').value = catSaldosh.getCatalogo()." + arrIdPK[i]);
}

/*function loadTableElementSpecial(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTable(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), null, false);
  hideWaitLayer();
}
*/

function cargaPrincipalConsultaSaldosFideicomiso(){
  showWaitLayer();
  var urlCliente = "modules/Contabilidad/SaldosHFideicomiso/PrincipalConsultaSaldosHFideicomiso.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultaSaldosFideicomiso, null);
}

function despliegaPantallaPrincipalConsultaSaldosFideicomiso(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  pkInfo = null;
  if(isDefinedAndNotNull(objParameters)){
    setParameters(objParameters);
    GI(objButtonConsultar).click();
  }
  formsLoaded();
}
