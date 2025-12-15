showWaitLayer();

var cmbLoadParam532 = JSON.parse("{\"Indice\":532,\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAsamblea");
var fvCat = new FormValidator();
var strIdPK = "easaIdPrograma,easaIdFideicomiso,easaIdEmision,easaIdSecAsamblea";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "eproNomPrograma,120px";
arrTblDat[1] = "ctoNomContrato,200px";
arrTblDat[2] = "pizarraSerie,120px";
arrTblDat[3] = "easaAsamblea,150px";
arrTblDat[4] = "easaFecAsamblea,80px";
arrTblDat[5] = "easaHoraAsamblea,80px";
arrTblDat[6] = "easaLugarAsamblea,200px";
arrTblDat[7] = "easaTitCirculacion,100px,right";
arrTblDat[8] = "easaTitRepresentados,100px,right";
arrTblDat[9] = "easaQuorum,80px,right";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAsamblea");
  pkInfo = null;
  borraCombos("paramNoFiso,paramNoEmision");
}

function cargaMantenimientoAsamblea(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Asamblea/MantenimientoAsamblea.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAsamblea, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoAsamblea(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  deshabilitaPK("easaIdSecAsamblea".split(","));
  Calendar.setup({
    inputField     :    "easaFecAsamblea",   // id of the input field
    button         :    "easaFecAsamblea",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
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
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded() {
  cargaRadiosConMaster("easaQuorum","easaQuorumNo");
  cargaComboDependiente(GI("easaIdPrograma"),true);
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA && fvCat.checkForm()){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_MODIFICAR && fvCat.checkForm()){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_BAJA){
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
  onButtonClickPestania("EmisionTitulos.Asamblea.PrincipalAsamblea","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos Fideicomiso y Emision
function cargaComboDependiente(objCmbOrigen,booleano){
  if(objCmbOrigen.name == "paramNoPrograma") {
    borraCombos("paramNoFiso,paramNoEmision");
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNoFiso"));
  }
  else if(objCmbOrigen.name == "paramNoFiso") {
    borraCombos("paramNoEmision");
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("paramNoPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNoEmision"));
  }
  
  else if(objCmbOrigen.name == "easaIdPrograma") {
    borraCombos("easaIdFideicomiso,easaIdEmision")
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("easaIdFideicomiso"),"next","mostrarValoresCmb");
    }
    else
      GI("easaIdSecAsamblea").value = "";
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("easaIdFideicomiso"));
  }
  else if(objCmbOrigen.name == "easaIdFideicomiso")
  {
    borraCombos("easaIdEmision")
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("easaIdEmision"),"next","mostrarValoresCmb");
    }
    else
      GI("easaIdSecAsamblea").value = "";
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("easaIdPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("easaIdEmision"));
  }
}

function mostrarValoresCmb(){
  setValuesFormObject(cat.getCatalogo());
  
  if(objCmbOrigenGlobal.name == "easaIdPrograma") {
    SA(GI("easaIdFideicomiso"),"next","hideWaitLayer");
    cargaComboDependiente(GI("easaIdFideicomiso"),true);
  }
  else if(objCmbOrigenGlobal.name == "easaIdFideicomiso") {
    SA(GI("easiIdEmision"),"next","hideWaitLayer");
    hideWaitLayer();
  }
}

////////////////////////////////////////////////////////////////////
//Funciones para asignar el Secuencial
function asignaSecuencial(objCmb) {
  if(objCmb.value == -1)
  {
    GI("easaIdSecAsamblea").value = "";
    return;
  }
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"secETAsa\",\"NoPrograma\":" + GI("easaIdPrograma").value + ",\"NoFiso\":" + GI("easaIdFideicomiso").value + 
                                         ",\"NoEmision\":" + GI("easaIdEmision").value + "}";
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, modo);
}

function validaAsignaSecuencial(obj, result) {
  var resultado = JSON.parse(result);
  GI("easaIdSecAsamblea").value = resultado[0].easaIdSecAsamblea;
  hideWaitLayer();
}

///////////////////////////////////////////////////////////////////////////
//Funciones para el uso de las Fechas
function setFechaCal()
{}

function isValidDate(date)
{
  return false;
}