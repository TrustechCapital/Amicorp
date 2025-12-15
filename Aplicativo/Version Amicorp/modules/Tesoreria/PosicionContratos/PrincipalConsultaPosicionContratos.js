var catPosicion = new Catalogo("mx.com.inscitech.fiducia.domain.Posicion");
var catConrepor = new Catalogo("mx.com.inscitech.fiducia.domain.Conrepor");
showWaitLayer();

var divNombreFideicomisoParam;
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");
var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var fvPosicionContratos= new FormValidator();
var strIdPK = "posNumContrato,posSubContrato,posNumEntidFin,posContratoInter,posCveTipoMerca,posNumInstrume,posNumSecEmis";
var arrIdPK = strIdPK.split(",");
var arrTblPosConDat =  new Array();
var arrTblRepConDat =  new Array();
var arrTblComPosDat = new Array();
var arrTblVenPosDat = new Array();
var objDatos = new Object();
pkInfo = null;

initForms();

fvPosicionContratos.setup({
  formName      : "frmDatosPosicionContratos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
arrTblPosConDat[0] = "posNumContrato,79";
arrTblPosConDat[1] = "posSubContrato,86";
arrTblPosConDat[2] = "posContratoInter,86";
arrTblPosConDat[3] = "posNomPizarra,76";
arrTblPosConDat[4] = "posNumSerEmis,57";
arrTblPosConDat[5] = "posNumCuponVig,50";
arrTblPosConDat[6] = "posPosicIniPer,100";
arrTblPosConDat[7] = "posVtasPosicPer,100";
arrTblPosConDat[8] = "posCpasPosicPer,100";
arrTblPosConDat[9] = "posPosicActual,100";
arrTblPosConDat[10] = "posPosicComprom,100";
arrTblPosConDat[11] = "posCostoHistoricEdit,100";

arrTblRepConDat[0] = "creFolioReporto,60";
arrTblRepConDat[1] = "creTipo,60";
arrTblRepConDat[2] = "creNumContrato,81";
arrTblRepConDat[3] = "creNumPlazo,40";
arrTblRepConDat[4] = "nomMercado,130";
arrTblRepConDat[5] = "nomInstrumento,200";
arrTblRepConDat[6] = "creImpReporto,150";
arrTblRepConDat[7] = "crePjeTasaPacta,50";
arrTblRepConDat[8] = "crePremioReporto,100";
arrTblRepConDat[9] = "creDiaVencim,60";
arrTblRepConDat[10] = "creMesVencim,60";
arrTblRepConDat[11] = "creAnoVencim,60";
arrTblRepConDat[12] = "creCveStConrepo,100";

arrTblComPosDat[0] = "cpeDiaCompra,100";
arrTblComPosDat[1] = "cpeNumTitCompra,100";
arrTblComPosDat[2] = "cpePrecioEmision,150";
arrTblComPosDat[3] = "cpeImpCompra,150";
arrTblComPosDat[4] = "cpeTitDispComp,125";
arrTblComPosDat[5] = "cpeCveStCompemi,100";
arrTblComPosDat[6] = "cpeSecDiaCompra,100";

arrTblVenPosDat[0] = "vteDiaVenta,100";
arrTblVenPosDat[1] = "vteSecDiaVta,100";
arrTblVenPosDat[2] = "vteFolioOperCpa,100";
arrTblVenPosDat[3] = "vteImpPrecEmis,150";
arrTblVenPosDat[4] = "vteImpPrecProA,150";
arrTblVenPosDat[5] = "vteNumTitVta,100";
arrTblVenPosDat[6] = "vteImpVenta,150";
arrTblVenPosDat[7] = "vteCveStVentem,100";


function cargaCmbContratoInversion(objTxtNumFideicomiso,objCmbContratoInversion){
  if(objTxtNumFideicomiso.value != ""){
    showWaitLayer();
    SA(objCmbContratoInversion,"next","consultaNomFid");
    objCmbContratoInversion.selectedIndex = 0;
    cmbContratoInversionParam.fideicomiso = objTxtNumFideicomiso.value;
    loadElement(objCmbContratoInversion);
  }
}
function agregaOpcionReportos(){
  var objComboDestino = GI("cmbMercado");
  var key = GA(objComboDestino, "keyValue");
  var value = GA(objComboDestino, "theValue");
  var llave = 1000;
  var texto = "REPORTOS";
  var result = "[{\"" + key + "\":\"" + llave + "\",\"" + value + "\":\"" + texto + "\"}]";
  var arrValues = JSON.parse(result);
  addCombo(objComboDestino, arrValues, key, value);
  formsLoaded();
}
function consultaNomFid(){
  consultaNombreFideicomiso("nomFideicomiso",GI("txtNumFideicomiso"));
  hideWaitLayer();
}

function limpiar(objForma){
  RF(objForma);
  GI("nomFideicomiso").innerHTML = "";
  objDatos = null;
}

function cargaConsultarPosicionContratos(generaObj){
  showWaitLayer();
  if(generaObj){
    pkInfo = null;
    objDatos.numContrato = GI("txtNumFideicomiso").value;
    objDatos.numContratoInversion = eval(((GI("cmbContratoInversion").selectedIndex==0)?"-1":GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1)));
    objDatos.numIntermediario = GI("cmbContratoInversion").value;
    objDatos.numMercado = GI("cmbMercado").value;
    objDatos.Proovedor = ((GI("cmbContratoInversion").selectedIndex==0)?"-1":GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[1].substring(1,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
  }
  var urlCliente = "modules/Tesoreria/PosicionContratos/PrincipalConsultarConsultaPosicionContratos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultarConsultaPosicionContratos, null);
}

function despliegaPantallaPrincipalConsultarConsultaPosicionContratos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  deshabilitaObjetos(GI("frmConsultarPosicionContratos"));
}

function asignaValues2ObjHTML(){
  GI("paramNumFideicomiso").value = objDatos.numContrato;
  GI("paramNumContratoInversion").value = objDatos.numContratoInversion;
  GI("paramNumIntermediario").value = objDatos.numIntermediario;
  GI("paramNumMercado").value = objDatos.numMercado;
  SA(GI("paramNumFideicomiso"),"ref","conPriPosCon");
  SA(GI("paramNumContratoInversion"),"ref","conPriRepCon");
  consultaNombreFideicomiso("nomFideicomiso",GI("paramNumFideicomiso"));
  if(eval(objDatos.numMercado) != 1000){
    if(eval(objDatos.numMercado) == 0){
      GI("paramNumMercado").value = -1;
    }
    consultar(GI("paramNumFideicomiso"),GI("frmConsultarPosicionContratos"),false);
  }
  if(eval(GI("paramNumMercado").value) == 1000 || eval(GI("paramNumMercado").value) == -1)
    consultar(GI("paramNumContratoInversion"),GI("frmConsultarPosicionContratos"),false);
  formsLoaded();
   if(GI("paramNumContratoInversion").value=="-1")
    GI("paramNumContratoInversion").value = "Todos";
}
function clickTablaPosCon(pk){
  objDatos.nomInstrumento = pk.nomInstrumento;
  objDatos.nomMercado = pk.nomMercado;
  objDatos.nomMoneda = pk.nomMoneda;
  delete pk.nomInstrumento;
  delete pk.nomMercado;
  delete pk.nomMoneda;
  pkInfo = pk;
  cloneObject(pk,catPosicion.getCatalogo());
  cargaPosicionConsultarPosicionContratos();
}
function clickTablaRepCon(pk){
  objDatos.nomInstrumento = pk.nomInstrumento;
  objDatos.nomMercado = pk.nomMercado;
  objDatos.creTipo = pk.creTipo;
  delete pk.nomInstrumento;
  delete pk.nomMercado;
  delete pk.creTipo;
  pkInfo = pk;
  cloneObject(pk,catConrepor.getCatalogo());
  cargaReportosConsultarPosicionContratos();
}

function cargaPosicionConsultarPosicionContratos(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/PosicionContratos/PrincipalPosicionConsultarConsultaPosicionContratos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPrincipalPosicionConsultarConsultaPosicionContratos, null);
  }
}

function despliegaPrincipalPosicionConsultarConsultaPosicionContratos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  catPosicion.setOnUpdate(cargaComplementoPosicion);
  catPosicion.buscaCatalogoPK(false);
  deshabilitaObjetos(GI("frmPosicionConsultarPosicionContratos"));
}
function cargaComplementoPosicion(){
  var objComprasVentasParam = new Object();
  objComprasVentasParam.NumFideicomiso = catPosicion.getCatalogo().posNumContrato;
  objComprasVentasParam.NumIntermediario = catPosicion.getCatalogo().posNumEntidFin;
  objComprasVentasParam.NumContratoInversion = catPosicion.getCatalogo().posContratoInter;
  objComprasVentasParam.NomEmisora = catPosicion.getCatalogo().posNomPizarra;
  objComprasVentasParam.NumSerie = catPosicion.getCatalogo().posNumSerEmis;
  objComprasVentasParam.NumCupon = catPosicion.getCatalogo().posNumCuponVig;
  objComprasVentasParam.order = "s";
  GI("posFechaUltMovto").value = catPosicion.getCatalogo().posDiaUltMovto + "/" + catPosicion.getCatalogo().posMesUltMovto + "/" + catPosicion.getCatalogo().posAnoUltMovto;
  GI("posPrecioProm").value = catPosicion.getCatalogo().posCostoHistoric / catPosicion.getCatalogo().posPosicActual;
  GI("posPosicDispon").value = catPosicion.getCatalogo().posPosicActual - catPosicion.getCatalogo().posPosicComprom;
  GI("posProveedor").value = objDatos.Proovedor;
  GI("posInstrumento").value = objDatos.nomInstrumento;
  GI("posMercado").value = objDatos.nomMercado;
  GI("posMoneda").value = objDatos.nomMoneda;
  consultaNombreFideicomiso("nomFideicomiso",GI("posNumContrato"));  
  consultarSpecial(GI("posNumContrato"),GI("frmPosicionConsultarPosicionContratos"),objComprasVentasParam);
  consultarSpecial(GI("posContratoInter"),GI("frmPosicionConsultarPosicionContratos"),objComprasVentasParam);
  hideWaitLayer();
}
function cargaReportosConsultarPosicionContratos(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/PosicionContratos/PrincipalReportosConsultarConsultaPosicionContratos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPrincipalReportosConsultarConsultaPosicionContratos, null);
  }
}

function despliegaPrincipalReportosConsultarConsultaPosicionContratos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  catConrepor.setOnUpdate(cargaComplementoReportos);
  catConrepor.buscaCatalogoPK(false);
  deshabilitaObjetos(GI("frmReportosConsultarPosicionContratos"));
}
function cargaComplementoReportos(){
  GI("creFechaVencim").value = (catConrepor.getCatalogo().creDiaVencim < 10?"0":"") + catConrepor.getCatalogo().creDiaVencim + "/" + (catConrepor.getCatalogo().creMesVencim < 10?"0":"") + catConrepor.getCatalogo().creMesVencim + "/" + catConrepor.getCatalogo().creAnoVencim;
  GI("creMercado").value = objDatos.nomMercado;
  GI("creInstrumento").value = objDatos.nomInstrumento;
  if(objDatos.creTipo == "PAGARE"){
    asignaEtiqueta("dvDetalle","Detalle Pagaré");
    asignaEtiqueta("dvFolio","Folio Pagaré");
    asignaEtiqueta("dvPremioInteres","Interes");
  }
  consultaNombreFideicomiso("nomFideicomiso",GI("creNumContrato"));
  hideWaitLayer();
}

/*
String.prototype.reverse=function() { return this.split("").reverse().join(""); }
String.prototype.format=function(sepMil,sepDec) { 
	var partes=this.split(".");			//dividimos parte entera de decimal
	return partes[0].reverse().replace( /(\d{3})(?=\d)/g ,"$1"+sepMil).reverse() + (partes[1]?(sepDec + partes[1]):""); 
}
String.prototype.desFormat=function(sepMil,sepDec) {
	var reMil=new RegExp("\\"+sepMil,"g");		//para localizar los sepMil
	var reDec=new RegExp("\\"+sepDec);			//para localizar los sepDec
	return this.replace(reMil,"").replace(reDec,".").replace(/\s/g,"");
}
*/