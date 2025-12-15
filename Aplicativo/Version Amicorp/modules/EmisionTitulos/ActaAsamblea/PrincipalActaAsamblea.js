showWaitLayer();

var cmbLoadParam26y27 = JSON.parse("{\"Clave1\":26,\"Clave2\":27,\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAsisasam");
var fvCat = new FormValidator();
var strIdPK = "easiIdPrograma,easiIdFideicomiso,easiIdEmision,easiIdSecAsamblea,easiIdParticipante";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "eproNomPrograma,120px";
arrTblDat[1] = "ctoNomContrato,200px";
arrTblDat[2] = "pizarraSerie,120px";
arrTblDat[3] = "easiIdSecAsamblea,90px";
arrTblDat[4] = "easiNomParticipante,200px";
arrTblDat[5] = "easiNomInstitucion,200px";
arrTblDat[6] = "easiTitulosRepresenta,110px,right";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAsisasam");
  pkInfo = null;
  borraCombos("paramNoFiso,paramNoEmision,paramNoAsamblea");
}

function cargaMantenimientoActaAsamblea(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/ActaAsamblea/MantenimientoActaAsamblea.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoActaAsamblea, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoActaAsamblea(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  deshabilitaPK("easiIdParticipante".split(","));
  
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
  cargaComboDependiente(GI("easiIdPrograma"),true);
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA && fvCat.checkForm()){
    showWaitLayer();
    verificaIndice();
  }else if(modo == OPER_MODIFICAR && fvCat.checkForm()){
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
  onButtonClickPestania("EmisionTitulos.ActaAsamblea.PrincipalActaAsamblea","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos Fideicomiso, Emision y Asamblea
function cargaComboDependiente(objCmbOrigen,booleano) {
  if(objCmbOrigen.name == "paramNoPrograma") {
    borraCombos("paramNoFiso,paramNoEmision,paramNoAsamblea");
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNoFiso"));
  }
  else if(objCmbOrigen.name == "paramNoFiso") {
    borraCombos("paramNoEmision,paramNoAsamblea");
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("paramNoPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNoEmision"));
  }
  else if(objCmbOrigen.name == "paramNoEmision") {
    borraCombos("paramNoAsamblea");
    paramCmb = JSON.parse("{\"NoPrograma\": " + GI("paramNoPrograma").value + ",\"NoFideicomiso\": " + GI("paramNoFiso").value + ",\"NoEmision\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNoAsamblea"));
  }
  
  else if(objCmbOrigen.name == "easiIdPrograma")
  {
    borraCombos("easiIdFideicomiso,easiIdEmision,easiIdSecAsamblea");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("easiIdFideicomiso"),"next","mostrarValoresCmb");
    }
    else {
      GI("easiIdParticipante").value = "";
      GI("titulosReprEmision").value = "";
    }
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("easiIdFideicomiso"));
  }
  else if(objCmbOrigen.name == "easiIdFideicomiso")
  {
    borraCombos("easiIdEmision,easiIdSecAsamblea");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("easiIdEmision"),"next","mostrarValoresCmb");
    }
    else {
      GI("easiIdParticipante").value = "";
      GI("titulosReprEmision").value = "";
    }
    loadElement(GI("easiIdEmision"));
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("easiIdPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
  }
  else if(objCmbOrigen.name == "easiIdEmision")
  {
    borraCombos("easiIdSecAsamblea");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("easiIdSecAsamblea"),"next","mostrarValoresCmb");
    }
    else {
      SA(GI("easiIdSecAsamblea"),"next","titRepEmision");
      GI("easiIdParticipante").value = "";
      GI("titulosReprEmision").value = "";
    }
    paramCmb = JSON.parse("{\"NoPrograma\": " + GI("easiIdPrograma").value + ",\"NoFideicomiso\": " + GI("easiIdFideicomiso").value + ",\"NoEmision\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("easiIdSecAsamblea"));
  }
}

function mostrarValoresCmb(){
  setValuesFormObject(cat.getCatalogo());
  
  if(objCmbOrigenGlobal.name == "easiIdPrograma") {
    SA(GI("easiIdFideicomiso"),"next","hideWaitLayer");
    cargaComboDependiente(GI("easiIdFideicomiso"),true);
  }
  else if(objCmbOrigenGlobal.name == "easiIdFideicomiso") {
    SA(GI("easiIdEmision"),"next","hideWaitLayer");
    cargaComboDependiente(GI("easiIdEmision"),true);
  }
  else if(objCmbOrigenGlobal.name == "easiIdEmision")
    titRepEmision();
}

function titRepEmision() {
  SA(GI("easiIdSecAsamblea"),"next","hideWaitLayer");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"emision.conETTitRepEmi\",\"NoPrograma\":" + GI("easiIdPrograma").value + ",\"NoFiso\":" + GI("easiIdFideicomiso").value + 
                                       ",\"NoEmision\":" + GI("easiIdEmision").value + "}";
  makeAjaxRequest(url, "HTML", validaTitRepEmision, modo);
}

function validaTitRepEmision(obj, result) {
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado[0]))
    GI("titulosReprEmision").value = resultado[0].eemiNumTitulos;
  hideWaitLayer();
  
  if(GI("easiTitulosRepresenta").value!="" && GI("titulosReprEmision").value!="")
    verTitRepresenta();
}

////////////////////////////////////////////////////////////////////
//Funcion para verificar que los títulos que representa no supere los títulos de la emisión
function verTitRepresenta() {
  if(eval(GI("easiTitulosRepresenta").value) > eval(GI("titulosReprEmision").value))
  {
    showWaitLayer();
    alert("El Número de Títulos no debe superar los Títulos de la emisión (" + GI("titulosReprEmision").value + ")");
    GI("easiTitulosRepresenta").value = "";
    hideWaitLayer();
  }
}
////////////////////////////////////////////////////////////////////
//Funciones para asignar el Secuencial
function asignaSecuencial(objCmb) {
  if(objCmb.value == -1)
  {
    GI("easiIdParticipante").value = "";
    return;
  }
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"emision.secETParAsa\",\"NoPrograma\":" + GI("easiIdPrograma").value + ",\"NoFiso\":" + GI("easiIdFideicomiso").value + 
                                         ",\"NoEmision\":" + GI("easiIdEmision").value + ",\"NoSecAsamblea\":" + GI("easiIdSecAsamblea").value + "}";
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, modo);
}

function validaAsignaSecuencial(obj, result) {
  var resultado = JSON.parse(result);
  GI("easiIdParticipante").value = resultado[0].easiIdParticipante;
  hideWaitLayer();
}

