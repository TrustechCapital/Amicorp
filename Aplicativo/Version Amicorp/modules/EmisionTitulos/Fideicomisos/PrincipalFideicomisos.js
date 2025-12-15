showWaitLayer();

var cmbLoadParam26y27 = JSON.parse("{\"Clave1\":26,\"Clave2\":27,\"orderDescripcion\":\"s\"}");
var cmbStatusParam   = JSON.parse("{\"llaveClave\":31}");
var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmifisos");
var fvCat = new FormValidator();
var strIdPK = "efsoIdFideicomiso";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
paramCmbFiso = JSON.parse("{\"Institucion\":\"XXXXX\",\"order\":\"s\"}");
function cargaCmbFideisomiso(cmbInst)
{
  paramCmbFiso.Institucion = cmbInst.value;
  loadElement(GI("paramNoFiso"));
}
paramCmbIntitucion = JSON.parse("{\"order\":\"s\"}");

var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "efsoIdFideicomiso,120px";
arrTblDat[1] = "efsoComentario,200px";
arrTblDat[2] = "efsoInstitucion,200px";
arrTblDat[3] = "efsoStFEmifisos,200px";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmifisos");
  pkInfo = null;
  borraCombos("paramNoFiso,paramInstitucion,paramStatus");
  initForms();
}

function cargaMantenimientoActaAsamblea(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Fideicomisos/MantenimientoFideicomisos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoFideicomisos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  
  //deshabilitaPK("efsoIdFideicomiso".split(","));

  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
    
  hideWaitLayer();    
}

function asignaValues2ObjHTML(){
  if( modo != OPER_ALTA){
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded() {
formsLoaded();
}

function ejecutaOperacionIndice(){
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
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  
  if(modo == OPER_ALTA)
    validaFideicomiso();
  if(modo == OPER_MODIFICAR)
    cat.modificaCatalogo();
  if(modo == OPER_BAJA)
    cat.bajaCatalogo(false);
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.Fideicomisos.PrincipalFideicomisos","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
function validaFideicomiso() {
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conFisoRepComun\",\"NoFiso\":" + GI("efsoIdFideicomiso").value + "}";
  //alert(url)
  makeAjaxRequest(url, "HTML", validaFisRepresComun, null);
}

function validaFisRepresComun(obj, result) {
//alert(result)
  var resultado = JSON.parse(result);
  //alert(resultado[0].cont)
  if(resultado[0].cont>0)
    alert("El Fideicomiso ya existe.");
  else
    cat.altaCatalogo();  
  hideWaitLayer();
}