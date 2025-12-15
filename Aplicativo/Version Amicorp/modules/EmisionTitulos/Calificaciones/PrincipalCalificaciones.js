showWaitLayer();

var cmbLoadParam523 = JSON.parse("{\"Indice\":523,\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmicalif");
var fvCat = new FormValidator();
var strIdPK = "ecalIdPrograma,ecalIdFideicomiso,ecalIdEmision,ecalIdCalificacion";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var objCmbOrigenGlobal = null;
var comboDestino = null;
var usarSetValuesFormObject = null;

var arrTblDat = new Array();
arrTblDat[0] = "eproNomPrograma,250px";
arrTblDat[1] = "ctoNomContrato,250px";
arrTblDat[2] = "pizarraSerie,250px";
arrTblDat[3] = "ecalCalificadora,200px";
arrTblDat[4] = "ecalCalificacion,100px";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmicalif");
  pkInfo = null;
  borraCombos("paramNumFiso,paramNumEmision,paramCalificacion");
}

function cargaMantenimientoCalificaciones(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Calificaciones/MantenimientoCalificaciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCalificaciones, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoCalificaciones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else
      muestraObjs("cmdAceptar,cmdCancelar");
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
  
  deshabilitaPK("ecalIdCalificacion".split(","));
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
  {
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded()
{
   catLoaded2();
    formsLoaded();
}

function catLoaded2() {
  for(var i=0; i<GI("cmbCalificadora").length; i++)
    if(GI("cmbCalificadora").options[i].text == GI("ecalCalificadora").value)
    {
      GI("cmbCalificadora").selectedIndex = i;
      break;
    }
  
  cargaComboCalificacion(GI("cmbCalificadora"), GI("ecalCalificacion"), true);
}

function ejecutaOperacionIndice(){
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.altaCatalogo();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    cat.bajaCatalogo(false);
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.Calificaciones.PrincipalCalificaciones","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo de Calificación
function cargaComboCalificacion(objCmbOrigen,objCmbDestino,booleano){
  usarSetValuesFormObject = booleano;
  
  if(objCmbOrigen.value == -1)
  {
    if(objCmbDestino.name == "paramCalificacion")
    {
      GI("paramCalificadora").value = "";
      borraCombos("paramCalificacion");
    }
    else if(objCmbDestino.name == "ecalCalificacion")
    {
      GI("ecalCalificadora").value = "";
      borraCombos("ecalCalificacion,ecalCalificacionMin");
    }
    hideWaitLayer();
    return;
  }
  
  if(objCmbDestino.name == "paramCalificacion")
  {
    borraCombos("paramCalificacion");
    GI("paramCalificadora").value = objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
  }
  else if(objCmbDestino.name == "ecalCalificacion" && booleano==false)
  {
    borraCombos("ecalCalificacion,ecalCalificacionMin");
    GI("ecalCalificadora").value = objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
  }
  
  comboDestino = objCmbDestino;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conETIdInd\",\"Indice\":523,\"SubIndice\":" + objCmbOrigen.value + "}";
  makeAjaxRequest(url, "HTML", obteniendoValorSubIndice, booleano);
}

function obteniendoValorSubIndice(obj, result){
  resultado = JSON.parse(result);
  
  if(isDefinedAndNotNull(resultado[0]))
  {
    paramCmb = JSON.parse("{\"Indice\": " + resultado[0].eindParam1 + ",\"orderDescripcion\":\"s\"}");
    SA(comboDestino,"next","mostrarValoresCmbCal");
    loadElement(comboDestino);
  }
  else
    hideWaitLayer();
}

function mostrarValoresCmbCal() {
  if(usarSetValuesFormObject)
    setValuesFormObject(cat.getCatalogo());
  
  if(comboDestino.name == "ecalCalificacion") {
    SA(comboDestino,"next","hideWaitLayer");
    comboDestino = GI("ecalCalificacionMin");
    SA(comboDestino,"next","mostrarValoresCmbCal");
    loadElement(comboDestino);
  }
  else {
    SA(comboDestino,"next","hideWaitLayer");
    hideWaitLayer();
  }
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos Fideicomiso y Emision
function cargaComboDependiente(objCmbOrigen,booleano) {
  if(objCmbOrigen.name == "numEmision") 
  {
    var objEmision = JSON.parse("{}");
    objEmision.id = "conETCmbEmiAsgPrgFid";
    objEmision.NumPrograma =  objCmbOrigen.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmision);
    makeAjaxRequest(url, "HTML", cargaComboDependienteRes, "paramNumPrograma,paramNumFiso");
  }
  else if(objCmbOrigen.name == "cmbCalificadora")
  {
    borraCombos("paramCalificacion");
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("paramNumPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNumEmision"));
  }
  else if(objCmbOrigen.name == "ecalIdEmision") 
  {
    var objEmision = JSON.parse("{}");
    objEmision.id = "conETCmbEmiAsgPrgFid";
    
    objEmision.NumEmision =objCmbOrigen.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmision);
    makeAjaxRequest(url, "HTML", cargaComboDependienteRes, "ecalIdPrograma,ecalIdFideicomiso");
  }
}


function cargaComboDependienteRes(obj,result)
{
  resultado = JSON.parse(result)[0];
  
  strPrograma = obj.split(",")[0];
  strFiso = obj.split(",")[1];
  
  GI(strPrograma).value = resultado.eemiIdPrograma;
  GI(strFiso).value = resultado.eemiIdFideicomiso;
  
}

function mostrarValoresCmb() {
  setValuesFormObject(cat.getCatalogo());
  
  if(objCmbOrigenGlobal.name == "ecalIdPrograma") {
    SA(GI("ecalIdFideicomiso"),"next","hideWaitLayer");
    //cargaComboDependiente(GI("ecalIdFideicomiso"),true);
  }
  else if(objCmbOrigenGlobal.name == "ecalIdFideicomiso") {
    SA(GI("ecalIdEmision"),"next","hideWaitLayer");
    catLoaded2();
    //hideWaitLayer();
  }
}

////////////////////////////////////////////////////////////////////
//Funciones para determinar el Id de Calificación (Secuencial - ECAL_ID_CALIFICACION) a partir del Id de Programa, Id de Fideicomiso e Id de Emisión
function determinaIdCalificacion(cmbIdPrograma,cmbIdFideicomiso,cmbIdEmision) {
  if(cmbIdEmision.value!=-1)
  {
    var IdCalificacion = JSON.parse("{\"id\":\"secETIdCal\",\"NumPrograma\":0,\"NumFideicomiso\":0,\"NumEmision\":0}");
    IdCalificacion.NumPrograma = cmbIdPrograma.value;
    IdCalificacion.NumFideicomiso = cmbIdFideicomiso.value;
    IdCalificacion.NumEmision = cmbIdEmision.value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(IdCalificacion);
    makeAjaxRequest(url, "HTML", insertaNumCalificacion, null);
  }
}


function insertaNumCalificacion(obj, result) {
  var objResult = JSON.parse(result);
  GI("ecalIdCalificacion").value=objResult[0].ecalIdCalificacion;
}
