showWaitLayer();

var catCedrefis = new Catalogo("mx.com.inscitech.fiducia.domain.Cedrefis");
var catTratFid = new Catalogo("mx.com.inscitech.fiducia.domain.TratFid");
var catOblFid = new Catalogo("mx.com.inscitech.fiducia.domain.OblFid");
var cmbObligacionesFiscalesParam = JSON.parse("{\"chido\":140}");
var cmbParticipacionParam = JSON.parse("{\"chido\":141}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var divNombreFideicomisoParam;
var trfCveTratfisc;
initForms();

var arrTblCedFisDat = new Array();
arrTblCedFisDat[0] = "crfNumFideicom,106";
arrTblCedFisDat[1] = "crfObligadFisc,107";
arrTblCedFisDat[2] = "crfPartfisc,89";
arrTblCedFisDat[3] = "crfRfc,88";
arrTblCedFisDat[4] = "crfTitular,300";
arrTblCedFisDat[5] = "crfIsrRendim,160";

var fvCatCedrefis = new FormValidator();
var strIdPK = "crfNumFideicom,trfCveTratfisc";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

fvCatCedrefis.setup({
  formName      : "frmMantenimientoCedulaFiscal",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  trfCveTratfisc = pk.trfCveTratfisc;
  delete pk.trfCveTratfisc;
  pkInfo = pk;
  cloneObject(pk,catCedrefis.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catCedrefis = new Catalogo("mx.com.inscitech.fiducia.domain.Cedrefis");
  pkInfo = null;
}

function cargaMantenimientoCedulaFiscal(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/CedulaFiscal/MantenimientoCedulaFiscalRegimenFiscal.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCedulaFiscal, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionCedulaFiscal();
  }
}

function despliegaPantallaMantenimientoCedulaFiscal(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  ocultaObj("cmdObligaciones");
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoCedulaFiscal"));
      GI("cmdCancelar").value = "Regresar";
      muestraObjs("cmdCancelar,cmdObligaciones");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catCedrefis.setOnUpdate(cargaComplemento);
    catCedrefis.buscaCatalogoPK(false);
    GI("trfCveTratfisc").value = trfCveTratfisc;
  }else
    formsLoaded();
}
function cargaComplemento(){
  consultaNombreFideicomiso("nomFideicomiso",GI("crfNumFideicom"));
  formsLoaded();
}
function ejecutaOperacionCedulaFiscal(){
  if(modo == OPER_ALTA){
    if(fvCatCedrefis.checkForm()){
      showWaitLayer();
      verificaCedulaFiscal();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatCedrefis.checkForm()){
      showWaitLayer();
      catCedrefis.setOnUpdate(avisoOperacionCatalogo);
      catCedrefis.modificaCatalogo();
      onButtonClickPestania("Contabilidad.CedulaFiscal.PrincipalCedulaFiscalRegimenFiscal","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catTratFid.getCatalogo().crfNumFideicom = catCedrefis.getCatalogo().crfNumFideicom;
    catTratFid.getCatalogo().trfCveTratfisc = trfCveTratfisc;
    catTratFid.setOnUpdate(bajaObligaciones);
    catTratFid.bajaCatalogo(false);
  }
}
function altaComplemento(){
  catCedrefis.setOnUpdate(avisoOperacionCatalogo);
  catTratFid.setOnUpdate(avisoOperacionCatalogo);
  catTratFid.altaCatalogo();
  onButtonClickPestania("Contabilidad.CedulaFiscal.PrincipalCedulaFiscalRegimenFiscal","");
  hideWaitLayer();
}
function bajaObligaciones(){
  var fideicomiso = catCedrefis.getCatalogo().crfNumFideicom;
  var url = ctxRoot + "/doRef.do?json={\"id\":\"delOblFid\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", bajaCedulaFiscal, null);
}

function bajaCedulaFiscal(obj, result){
  catCedrefis.setOnUpdate(avisoOperacionCatalogo);
  catCedrefis.bajaCatalogo(false);
  onButtonClickPestania("Contabilidad.CedulaFiscal.PrincipalCedulaFiscalRegimenFiscal","");
  hideWaitLayer();
}
function cargaPrincipalCedulaFiscalRegimenFiscal(){
  showWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/Contabilidad/CedulaFiscal/PrincipalObligacionesCedulaFiscalRegimenFiscal.js");
  var urlCliente = "modules/Contabilidad/CedulaFiscal/PrincipalObligacionesCedulaFiscalRegimenFiscal.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalObligacionesCedulaFiscalRegimenFiscal, null);
}

function despliegaPantallaPrincipalObligacionesCedulaFiscalRegimenFiscal(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK("crfNumFideicom".split(","));
  catCedrefis.setOnUpdate(cargaComplemento2);
  catCedrefis.buscaCatalogoPK(false);
}
function cargaComplemento2(){
  GI("paramFideicomiso").value = GI("crfNumFideicom").value;
  consultaNombreFideicomiso("nomFideicomiso",GI("crfNumFideicom"));
  consultar(GI("paramorder"), frmDatosObligacionesFiscales, false);
  consultar(GI("crfNumFideicom"), frmDatosObligacionesFiscales, false);
  formsLoaded();
}
function verificaCedulaFiscal(){
  var fideicomiso = GI("crfNumFideicom").value;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiCedFis\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaCedulaFiscal, null);
}

function validaCedulaFiscal(obj, result){
  var objValida = JSON.parse(result)[0];
  if(objValida.existeRegistro != 0){
    alert("El Fideicomiso ya cuenta con Cédula Fiscal");
  }else{
    catCedrefis.setOnUpdate(altaComplemento);
    catCedrefis.altaCatalogo();
  }
  hideWaitLayer();
}