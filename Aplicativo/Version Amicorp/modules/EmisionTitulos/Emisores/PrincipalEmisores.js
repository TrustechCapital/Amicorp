showWaitLayer();

var cmbStatusParam   = JSON.parse("{\"llaveClave\":31}");
var cmbTipoEmisorParam = JSON.parse("{\"NoIndice\":534,\"order\":\"s\"}");
var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmisor");
var fvCat = new FormValidator();
var strIdPK = "esorIdEmsisor";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
paramCmbIntitucion = JSON.parse("{\"order\":\"s\"}");

var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "esorIdEmsisor,120px";
arrTblDat[1] = "esorNombre,200px";
arrTblDat[2] = "esorTipoEmisor,200px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function clickTabla(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmisor");
  pkInfo = null;
  borraCombos("paramNoFiso,paramInstitucion,paramStatus");
}

function cargaMantenimientoActaAsamblea(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Emisores/MantenimientoEmisores.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoEmisores, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoEmisores(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
    
  deshabilitaPK("esorIdEmsisor".split(","));
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA ){
    asignaSecuencial(GI("esorIdEmsisor"));
    muestraObjs("cmdAceptar,cmdCancelar");
  }  
    hideWaitLayer();
}

function asignaValues2ObjHTML(){
  if(modo != OPER_ALTA){
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded() {
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_MODIFICAR ){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaIndice();
  }
}
function verificaIndice(){
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  
  if(modo == OPER_ALTA)
      cat.altaCatalogo();
  if(modo == OPER_MODIFICAR)
    cat.modificaCatalogo();
  if(modo == OPER_BAJA)
    cat.bajaCatalogo(false);
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.Emisores.PrincipalEmisores","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para asignar el Secuencial
function asignaSecuencial(objCmb) {
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"secEmisoresRepComun\"}";
 // alert(url)
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, null);
}

function validaAsignaSecuencial(obj, result) {
//alert(result)
  var resultado = JSON.parse(result);
  //alert(resultado[0].esorIdEmsisor)
  GI("esorIdEmsisor").value = resultado[0].esorIdEmsisor;
  hideWaitLayer();
}