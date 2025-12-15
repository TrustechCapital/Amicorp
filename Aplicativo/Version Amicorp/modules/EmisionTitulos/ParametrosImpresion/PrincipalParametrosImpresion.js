showWaitLayer();

var cmbLoadParam527 = JSON.parse("{\"Indice\":527,\"orderDescripcion\":\"s\"}");
var cmbLoadParam533 = JSON.parse("{\"Indice\":533,\"orderDescripcion\":\"s\"}");
var paramAutoridad = JSON.parse("{\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAutenvp");
var fvCat = new FormValidator();
var strIdPK = "envpIdPrograma,envpIdFideicomiso,envpIdEmision,envpIdTipoAviso,envpIdNumPos,envpIdSecuencial";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");
var cmbEmision = JSON.parse("{\"NumEmisor\":\"-1\",\"order\":\"s\"}");


var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,50px";
arrTblDat[1] = "eproNomPrograma,150px";
arrTblDat[2] = "ctoNomContrato,150px";
arrTblDat[3] = "pizarraSerie,150px";
arrTblDat[4] = "envpNomAut,150px";
arrTblDat[5] = "envpNombre,150px";
arrTblDat[6] = "envpIdTipoAviso,100px";
arrTblDat[7] = "eindDescripcion,150px";
arrTblDat[8] = "envpIdSecuencial,70px";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAutenvp");
  pkInfo = null;
  borraCombos("paramNumFiso,paramNumEmision,paramNomResponsable");
}

function cargaMantenimientoParametrosImpresion(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/ParametrosImpresion/MantenimientoParametrosImpresion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoParametrosImpresion, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoParametrosImpresion(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
   
    // Id RC
    GI('idRC').value = pkInfo.idRc;
    consultaEmisor(GI('idRC'),GI('envpIdPrograma'),GI('envpIdFideicomiso'),GI('envpIdEmision'));
  
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
  
  deshabilitaPK("envpIdSecuencial".split(","));
}

var once=true;

function asignaValues2ObjHTML()
{
   if(once)
   {
      once=false;
     if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
       cat.setOnUpdate(catLoaded);
       cat.buscaCatalogoPK(false);
     }else
     {
       formsLoaded();
     }
     
   }
}

function catLoaded() 
{
   hideWaitLayer();
  //cargaComboDependiente(GI("envpIdPrograma"),true);
}

function catLoaded2() {
  for(var i=0; i<GI("cmbAutoridad").length; i++)
    if(GI("cmbAutoridad").options[i].text == GI("envpNomAut").value)
    {
      GI("cmbAutoridad").selectedIndex = i;
      break;
    }
  cargaComboDependiente(GI("cmbAutoridad"),true);
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaIndice();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaIndice();
  }
}
function verificaIndice(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETParImp\",\"NumPrograma\":" + GI("envpIdPrograma").value + ",\"NumFiso\":" + GI("envpIdFideicomiso").value + 
                                         ",\"NumEmision\":" + GI("envpIdEmision").value + ",\"TipoAviso\": \"" + GI("envpIdTipoAviso").value + "\",\"NumPosicion\":" + GI("envpIdNumPos").value +
                                         ",\"NumSecuencial\": " + GI("envpIdSecuencial").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
  }
  if(modo == OPER_BAJA){
    //var url = ctxRoot + "/getRef.do?json={\"id\":\"verETProgVSFiso\",\"NumPrograma\":" + pkInfo.eproIdPrograma + "}";
    //makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
    cat.setOnUpdate(validaAvisoOperacionCatalogo);
    cat.bajaCatalogo(false);
  }
}

function validaOperacionPrograma(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Resgistro ya existe!");
        hideWaitLayer();
      }else{
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.altaCatalogo();
      }
    break;
    /*case OPER_BAJA:
      if(resultado[0].existeRegistro!=0 && numVerificacionBaja==1){
        alert("No se puede dar de baja un Programa que mantenga Fideicomiso dependiente!");
      }
      else if (resultado[0].existeRegistro==0 && numVerificacionBaja==1){
        numVerificacionBaja = 2;
        var url = ctxRoot + "/getRef.do?json={\"id\":\"verETProgVSEmis\",\"NumPrograma\":" + pkInfo.eproIdPrograma + "}";
        makeAjaxRequest(url, "HTML", validaOperacionPrograma, obj);
      }
      else if(resultado[0].existeRegistro!=0 && numVerificacionBaja==2){
        alert("No se puede dar de baja un Programa que mantenga Emision dependiente!");
      }
      else if(resultado[0].existeRegistro==0 && numVerificacionBaja==2){
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.bajaCatalogo(false);
        onButtonClickPestania("EmisionTitulos.Programas.PrincipalProgramas","");
      }
    break;*/
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.ParametrosImpresion.PrincipalParametrosImpresion","");
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos Fideicomiso y Emision
function cargaComboDependiente(objCmbOrigen,booleano){
  if(objCmbOrigen.name == "numEmision") 
  {
   
    var objEmision = JSON.parse("{}");
    objEmision.id = "conETCmbEmiAsgPrgFid";
    objEmision.NumPrograma =  objCmbOrigen.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmision);
    makeAjaxRequest(url, "HTML", cargaComboDependienteRes, null);
    
  }
  else if(objCmbOrigen.name == "cmbNumAutoridad" && objCmbOrigen.value == -1) {
    borraCombos("paramNomResponsable");
    GI("paramNomAutoridad").value = "";
    hideWaitLayer();
    return;
  }
  else if(objCmbOrigen.name == "cmbNumAutoridad" && objCmbOrigen.value != -1) {
    GI("paramNomAutoridad").value = objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
    paramCmb = JSON.parse("{\"NumAutoridad\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNomResponsable"));
  }
  
  else if(objCmbOrigen.name == "envpIdPrograma") {
    borraCombos("envpIdFideicomiso,envpIdEmision");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("envpIdFideicomiso"),"next","mostrarValoresCmb");
    }
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("envpIdFideicomiso"));
  }
  else if(objCmbOrigen.name == "envpIdFideicomiso") {
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("envpIdEmision"),"next","mostrarValoresCmb");
    }
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("envpIdPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("envpIdEmision"));
  }
  else if(objCmbOrigen.name == "cmbAutoridad" && objCmbOrigen.value == -1) {
    borraCombos("envpNombre");
    GI("envpPuesto").value = "";
    GI("envpDireccion").value = "";
    GI("envpNomAut").value = "";
    hideWaitLayer();
    return;
  }
  else if(objCmbOrigen.name == "cmbAutoridad" && objCmbOrigen.value != -1) {
    borraCombos("envpNombre");
    GI("envpPuesto").value = "";
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("envpNombre"),"next","mostrarValoresCmb");
    }
    else
      SA(GI("envpNombre"),"next","asignaDireccionAutoridad");
    GI("envpNomAut").value = objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
    paramCmb = JSON.parse("{\"NumAutoridad\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("envpNombre"));
  }
}

function cargaComboDependienteRes(obj,result)
{
  resultado = JSON.parse(result)[0];
  
  GI("paramNumPrograma").value = resultado.eemiIdPrograma;
  GI("paramNumFiso").value = resultado.eemiIdFideicomiso;
  
}

function mostrarValoresCmb(){
  setValuesFormObject(cat.getCatalogo());
  
  if(objCmbOrigenGlobal.name == "envpIdPrograma") {
    SA(GI("envpIdFideicomiso"),"next","hideWaitLayer");
    //cargaComboDependiente(GI("envpIdFideicomiso"),true);
  }
  else if(objCmbOrigenGlobal.name == "envpIdFideicomiso") {
    SA(GI("envpIdEmision"),"next","hideWaitLayer");
    catLoaded2();
  }
  else if(objCmbOrigenGlobal.name == "cmbAutoridad")
  {
    SA(GI("envpNombre"),"next","hideWaitLayer");
    hideWaitLayer();
  }
}

////////////////////////////////////////////////////////////////////
//Funciones para asignar la Dirección de la Autoridad y el Puesto del Responsable
function asignaDireccionAutoridad() {
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conETDirAut\",\"NumAutoridad\":" + GI("cmbAutoridad").value + "}";
  makeAjaxRequest(url, "HTML", validaAsignaDireccionAutoridad, null);
}

function validaAsignaDireccionAutoridad(obj, result) {
  resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado[0]))
    GI("envpDireccion").value = resultado[0].eautDirAutoridad;
  
  SA(GI("envpNombre"),"next","hideWaitLayer");
  hideWaitLayer();
}


function asignaPuestoResponsable(objCmb) {
  if(objCmb.value == -1) {
    GI("envpPuesto").value = "";
    return;
  }
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conETPueRes\",\"NomResponsable\":\"" + objCmb.value + "\"}";
  makeAjaxRequest(url, "HTML", validaAsignaPuestoResponsable, null);
}

function validaAsignaPuestoResponsable(obj, result) {
  resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado[0]))
    GI("envpPuesto").value = resultado[0].eareNomPuestRespo;
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para determinar el ENV_ID_SECUENCIAL de Parámetros de Impresión
function determinaIdSecuencial() {
  if(GI("envpIdPrograma").value!=-1&& GI("envpIdEmision").value!=-1 && GI("envpIdTipoAviso").value!=-1 && GI("envpIdNumPos").value!=-1)
  {
    showWaitLayer();
    var IdSecuencial = JSON.parse("{\"id\":\"asiETValSecParImp\",\"NumPrograma\":0,\"NumFiso\":0,\"NumEmision\":0,\"TipoAviso\":0,\"NumPosicion\":0}");
    IdSecuencial.NumPrograma = GI("envpIdPrograma").value;
    IdSecuencial.NumFiso = GI("envpIdFideicomiso").value!=-1?GI("envpIdFideicomiso").value:"0" ;
    IdSecuencial.NumEmision = GI("envpIdEmision").value;
    IdSecuencial.TipoAviso = GI("envpIdTipoAviso").value;
    IdSecuencial.NumPosicion = GI("envpIdNumPos").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(IdSecuencial);
    makeAjaxRequest(url, "HTML", insertaIdSecuencial, null);
  }
}


function insertaIdSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("envpIdSecuencial").value=objResult[0].numSecuencial;
  hideWaitLayer();
}



/// ------------- ID RC----------

var cmbEmisorG;
var cmbProgramaG;
var cmbFideicomisoG; 

function consultaEmisor(cmbObjEmisor,cmbObjPrograma,cmbObjFideicomiso,cmbObjEmision)
{
  existeIdRC(cmbObjEmisor);
  
   cmbEmision = JSON.parse("{\"NumEmisor\":\""+numIdRC(cmbObjEmisor.value)+"\",\"order\":\"s\"}");
   loadElement(cmbObjEmision);
   
  consultaPrograma(cmbObjEmisor,cmbObjPrograma);
   consultaFideicomiso(cmbObjEmisor,cmbObjFideicomiso);
}

function consultaPrograma(cmbObjEmisor,cmbObjPrograma)
{
    cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(cmbObjEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
    loadElement(cmbObjPrograma);
    cmbProgramaG = cmbObjPrograma;
    setTimeout("cargaDatosPrograma(cmbProgramaG)",2000); 
}


function cargaDatosPrograma(cmbObjPrograma)
{

    if(cmbObjPrograma.options.length==1)
    {
      //habilitaCampos("eemiIdPrograma");
      return;
     }
     
    cmbObjPrograma.selectedIndex=1;
    //deshabilitaCampos("eemiIdPrograma");
    
}

function consultaFideicomiso(cmbObjEmisor,cmbObjFideicomiso)
{
    cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(cmbObjEmisor.value)+",\"order\":\"s\"}");
    loadElement(cmbObjFideicomiso);
    cmbEmisorG = cmbObjEmisor; 
    cmbFideicomisoG = cmbObjFideicomiso;
    setTimeout("consultaTimeFideicomiso(cmbEmisorG,cmbFideicomisoG)",2000);    
}

function consultaTimeFideicomiso(cmbObjEmisor,cmbObjFideicomiso)
{
  var objEmisor = JSON.parse("{}");
   objEmisor.id = "emision.conETEmisorFideicomiso";
   objEmisor.idEmisor = numIdRC(cmbObjEmisor.value);
       
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmisor);
   makeAjaxRequest(url, "HTML", consultaFideicomisoRes,cmbObjFideicomiso);
}

function consultaFideicomisoRes(cmbObjFideicomiso,result)
{
    var res = JSON.parse(result);
    if(res.length>0)
    {
      cmbObjFideicomiso.selectedIndex=1;
      //deshabilitaCampos("eemiIdFideicomiso");
    }
    else
    {
      cmbObjFideicomiso.selectedIndex=0;
      //habilitaCampos("eemiIdFideicomiso");
    }
}
