showWaitLayer();

var cmbLoadParam26y27 = JSON.parse("{\"Clave1\":26,\"Clave2\":27,\"orderDescripcion\":\"s\"}");
var cmbStatusParam   = JSON.parse("{\"llaveClave\":31}");


var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FRepcomun");
var fvCat = new FormValidator();
var strIdPK = "repcIdRepComun";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "repcIdRepComun,120px";
arrTblDat[1] = "repcInstitucion,200px";
arrTblDat[2] = "repcFecCreacion,200px";
arrTblDat[3] = "repcStFRepcomun,200px";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FRepcomun");
  pkInfo = null;
  borraCombos("paramRepComun,paramInstitucion,paramStatus");
}

function cargaMantenimientoRepresentacionComun(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/RepresentacionComun/MantenimientoRepComun.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoRepComun, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoRepComun(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
 // alert("antes de calendario")
    
  
  deshabilitaPK("repcIdRepComun".split(","));
  //alert("llego aki 2")
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
 // alert("llego aki")
    asignaSecuencial(GI("repcIdRepComun"));
    muestraObjs("cmdAceptar,cmdCancelar");
  }  
    hideWaitLayer();
}

function asignaValues2ObjHTML(){
  if( modo != OPER_ALTA){
   // alert("busca catalogo")
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded() {

}

function ejecutaOperacionIndice(){
//alert(modo)
//alert(OPER_ALTA)
  if(modo == OPER_ALTA){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaIndice();
  }
}
function verificaIndice(){
//alert("antes de alta")
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  //alert("alta")
  if(modo == OPER_ALTA)
    cat.altaCatalogo();
  if(modo == OPER_MODIFICAR)
    cat.modificaCatalogo();
  if(modo == OPER_BAJA)
    cat.bajaCatalogo(false);

}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.RepresentacionComun.PrincipalRepComun","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para asignar el Secuencial
function asignaSecuencial(objCmb) {
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"secRepresentacionComun\"}";
 // alert(url)
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, null);
}

function validaAsignaSecuencial(obj, result) {
//alert(result)
  var resultado = JSON.parse(result);
 // alert(resultado[0].repcIdRepComun)
  GI("repcIdRepComun").value = resultado[0].repcIdRepComun;
  hideWaitLayer();
}

