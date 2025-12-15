showWaitLayer();

var cmbLoadParam527 = JSON.parse("{\"Indice\":527,\"orderDescripcion\":\"s\"}");
var paramAutoridad = JSON.parse("{\"orderDescripcion\":\"s\"}");

var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");
var cmbEmision = JSON.parse("{\"NumEmisor\":\"-1\",\"order\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAutaviso");
var fvCat = new FormValidator();
var strIdPK = "idRC,eaavIdPrograma,eaavIdFideicomiso,eaavIdEmision,eaavIdAutoridad,eaavIdResponsable,eaavIdDiasAntes,eaavIdTipoAviso";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,50px";
arrTblDat[1] = "eproNomPrograma,150px";
arrTblDat[2] = "ctoNomContrato,150px";
arrTblDat[3] = "pizarraSerie,150px";
arrTblDat[4] = "eautNomAutoridad,150px";
arrTblDat[5] = "eareNomResponsable,150px";
arrTblDat[6] = "eaavIdTipoAviso,100px";
arrTblDat[7] = "eaavIdDiasAntes,80px";
arrTblDat[8] = "eaavPublica,80px";

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
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FPrograma");
  pkInfo = null;
  borraCombos("paramNumFiso,paramNumEmision,paramNumResponsable");
}

function cargaMantenimientoAvisosAutoridades(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/AvisosAutoridades/MantenimientoAvisosAutoridades.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAvisosAutoridades, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoAvisosAutoridades(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms(); 
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
    // Id RC
    GI('idRC').value = pkInfo.idRc;
    consultaEmisor(GI('idRC'),GI('eaavIdPrograma'),GI('eaavIdFideicomiso'),GI('eaavIdEmision'));
    
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

var once=true;

function asignaValues2ObjHTML(){
  if(once)
  {
   once = false;
     if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
       cat.setOnUpdate(catLoaded);
       cat.buscaCatalogoPK(false);
     }else{
       formsLoaded();
     }
   }
}

function catLoaded() 
{
   hideWaitLayer();
 //cargaComboDependiente(GI("eaavIdPrograma"),true);
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
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiAviAut\",\"NumPrograma\":" + GI("eaavIdPrograma").value + ",\"NumFiso\":" + GI("eaavIdFideicomiso").value + 
                                         ",\"NumEmision\":" + GI("eaavIdEmision").value + ",\"NumAutoridad\":" + GI("eaavIdAutoridad").value + ",\"NumResponsable\":" + GI("eaavIdResponsable").value +
                                         ",\"DiasAntes\":" + GI("eaavIdDiasAntes").value + ",\"TipoAviso\": \"" + GI("eaavIdTipoAviso").value + "\"}";
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
  onButtonClickPestania("EmisionTitulos.AvisosAutoridades.PrincipalAvisosAutoridades","");
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
  else if(objCmbOrigen.name == "paramNumAutoridad") {
    borraCombos("paramNumResponsable");
    paramCmb = JSON.parse("{\"NumAutoridad\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("paramNumResponsable"));
  }
  
  else if(objCmbOrigen.name == "eaavIdPrograma")
  {
    borraCombos("eaavIdFideicomiso,eaavIdEmision");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("eaavIdFideicomiso"),"next","mostrarValoresCmb");
    }
    paramCmb = JSON.parse("{\"NumPrograma\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("eaavIdFideicomiso"));
  }
  else if(objCmbOrigen.name == "eaavIdFideicomiso") {
    borraCombos("eaavIdEmision");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("eaavIdEmision"),"next","mostrarValoresCmb");
    }
    paramCmb = JSON.parse("{\"NumPrograma\": " + GI("eaavIdPrograma").value + ",\"NumFideicomiso\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("eaavIdEmision"));
  }
  else if(objCmbOrigen.name == "eaavIdAutoridad") {
    borraCombos("eaavIdResponsable");
    if(booleano) {
      objCmbOrigenGlobal = objCmbOrigen;
      SA(GI("eaavIdResponsable"),"next","mostrarValoresCmb");
    }
    paramCmb = JSON.parse("{\"NumAutoridad\": " + objCmbOrigen.value + ",\"order\":\"s\"}");
    loadElement(GI("eaavIdResponsable"));
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
  
  if(objCmbOrigenGlobal.name == "eaavIdPrograma") {
    SA(GI("eaavIdFideicomiso"),"next","hideWaitLayer");
    //cargaComboDependiente(GI("eaavIdFideicomiso"),true);
  }
  else if(objCmbOrigenGlobal.name == "eaavIdFideicomiso") {
    SA(GI("eaavIdEmision"),"next","hideWaitLayer");
    cargaComboDependiente(GI("eaavIdAutoridad"),true);
  }
  else if(objCmbOrigenGlobal.name == "eaavIdAutoridad") {
    SA(GI("eaavIdResponsable"),"next","hideWaitLayer");
    hideWaitLayer();
  }
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
