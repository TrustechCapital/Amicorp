showWaitLayer();

var cmbLoadParam510 = JSON.parse("{\"Indice\":510,\"orderDescripcion\":\"s\"}");
var cmbLoadParam511 = JSON.parse("{\"Indice\":511,\"orderDescripcion\":\"s\"}");
var cmbLoadParam512 = JSON.parse("{\"Indice\":512,\"orderSecuencial\":\"s\"}");
var cmbEmisor = JSON.parse("{\"order\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FPrograma");
var fvCat = new FormValidator();
var strIdPK = "eproIdPrograma";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var fechas = new Date();
var numVerificacionBaja = 0;
var montoProgramaAnterior = null;
var montoDisponible = null;
pkInfo = null;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,80px";
arrTblDat[1] = "eproIdPrograma,80px";
arrTblDat[2] = "eindDescripcion,140px";
arrTblDat[3] = "eproNomPrograma,200px";
arrTblDat[4] = "eproInstrumento,200px";
arrTblDat[5] = "eproModalidadEmision,150px";
arrTblDat[6] = "eproImpPrograma,100px,right";
arrTblDat[7] = "eproImpDisponible,100px,right";
//arrTblDat[6] = "eproStPrograma,100px,right";

cmbStatusParam = JSON.parse("{\"Indice\":500,\"orderDescripcion\":\"S\"}");

//---------------DATOS EMISION--------------------


var arrTblEmiDat = new Array();
arrTblEmiDat[0] = "eemiIdPrograma,150px";
arrTblEmiDat[1] = "eemiCvePizarra,100px";
arrTblEmiDat[2] = "eemiNumSerie,100px";
arrTblEmiDat[3] = "eemiIdFideicomiso,100px";
arrTblEmiDat[4] = "eemiImpEmision,150px,right";
arrTblEmiDat[5] = "eemiFecInicio,70px";
arrTblEmiDat[6] = "eemiFecVencimiento,70px";
arrTblEmiDat[7] = "eemiAnoPlazo,100px";
arrTblEmiDat[8] = "eemiDiasPlazo,100px";
//arrTblEmiDat[9] = "eemiStEmision,80px";

function consultaEmision()
{
   GI("datEmision").style.visibility="visible";
   GI("paramNumPrograma").value = pkInfo.eproIdPrograma;
   GI("cmdConsultaEmision").click();
   
}

//----------------------------------------------------------

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

Calendar.setup({
  inputField     :    "paramFechaInicio",   // id of the input field
  button         :    "paramFechaInicio",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDateAll,
  date           :    fechas,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

Calendar.setup({
  inputField     :    "paramFechaVencimiento",   // id of the input field
  button         :    "paramFechaVencimiento",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDateAll,
  date           :    fechas,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
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
}

function cargaMantenimientoProgramas(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Programas/MantenimientoProgramas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProgramas, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoProgramas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  montoProgramaAnterior = 0;
  montoDisponible = 0;
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
    deshabilitaCampos('eproEmisor');
    deshabilitaPK(arrIdPK);
    
    setTimeout("consultaEmision()",2000);// DATOS EMISION
    
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA)
    muestraObjs("cmdAceptar,cmdCancelar");
  
  
  Calendar.setup({
    inputField     :    "eproFecInicio",   // id of the input field
    button         :    "eproFecInicio",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "eproFecVencimiento",   // id of the input field
    button         :    "eproFecVencimiento",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "eproFecCnbv",   // id of the input field
    button         :    "eproFecCnbv",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "eproFecBanxico",   // id of the input field
    button         :    "eproFecBanxico",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "eproFecRegval",   // id of the input field
    button         :    "eproFecRegval",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  deshabilitaPK("eproImpDisponible,eproDiasPlazo,eproAnoPlazo".split(","));
  deshabilitaCampos("nomEmisor,nomFideicomiso");
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
  montoProgramaAnterior = eval(GI("eproImpPrograma").value);
  montoDisponible = eval(GI("eproImpDisponible").value);
  formsLoaded();
  
  formatoComasMonto('eproImpPrograma,eproImpDisponible');
  
  formaEmisorR('eproEmisor');
  cargaDatosRC(GI('eproEmisor'));
}

function ejecutaOperacionIndice(){


  if(modo == OPER_ALTA||modo == OPER_MODIFICAR)
    limpiaComasMonto('eproImpPrograma,eproImpDisponible');
    
  if(modo == OPER_ALTA)
  {    
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaIndice();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm())
    {
        formaEmisorSinR('eproEmisor');
    
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
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiProg\",\"NumPrograma\":" + GI("eproIdPrograma").value + ",\"IdRC\":\"" + GI("eproEmisor").value + "\"}";
    makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
  }
  if(modo == OPER_BAJA){
    numVerificacionBaja = 1;
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETProgVSFiso\",\"NumPrograma\":" + pkInfo.eproIdPrograma + "}";
    makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
  }
}

function validaOperacionPrograma(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Resgistro ya existe!");
        hideWaitLayer();
      }else
      {
        formaEmisorSinR('eproEmisor');
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.altaCatalogo();
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro!=0 && numVerificacionBaja==1){
        alert("No se puede dar de baja un Programa que mantenga Fideicomiso dependiente!");
        hideWaitLayer();
      }
      else if (resultado[0].existeRegistro==0 && numVerificacionBaja==1){
        numVerificacionBaja = 2;
        var url = ctxRoot + "/getRef.do?json={\"id\":\"verETProgVSEmis\",\"NumPrograma\":" + pkInfo.eproIdPrograma + "}";
        makeAjaxRequest(url, "HTML", validaOperacionPrograma, obj);
      }
      else if(resultado[0].existeRegistro!=0 && numVerificacionBaja==2){
        alert("No se puede dar de baja un Programa que mantenga Emision dependiente!");
        hideWaitLayer();
      }
      else if(resultado[0].existeRegistro==0 && numVerificacionBaja==2){
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.bajaCatalogo(false);
      }
    break;
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.Programas.PrincipalProgramas","");
  hideWaitLayer();
}


///////////////////////////////////////////////////////////////////////////
//Calcula el monto disponible, según sea Alta o Modificación
function calcularMontoDisponible() {
  showWaitLayer();
  if(modo == OPER_ALTA)
  {
    limpiaComasMonto('eproImpPrograma,eproImpDisponible');
    GI("eproImpDisponible").value = "";
    GI("eproImpDisponible").value = GI("eproImpPrograma").value;
    formatoComasMonto('eproImpPrograma,eproImpDisponible');
  }
  else if(modo == OPER_MODIFICAR)
  {
    
    limpiaComasMonto('eproImpPrograma,eproImpDisponible');
    
    montoDisponible += (eval(GI("eproImpPrograma").value) - montoProgramaAnterior);
    GI("eproImpDisponible").value = "";
    GI("eproImpDisponible").value = montoDisponible;
    
    montoProgramaAnterior = eval(GI("eproImpPrograma").value);
    montoDisponible = eval(GI("eproImpDisponible").value);
    
    formatoComasMonto('eproImpPrograma,eproImpDisponible');
  }
  hideWaitLayer();
}


///////////////////////////////////////////////////////////////////////////
//Calcula el plazo en años y el plazo en días
function plazoAniosDias(objFecInicio,objFecVencimiento) {
  if(objFecInicio.value!="" && objFecVencimiento.value!="")
  {
    var objPlazo = JSON.parse("{}");
    objPlazo.id = "conETPlaDia";
    objPlazo.FecInicio = objFecInicio.value;
    objPlazo.FecVencimiento = objFecVencimiento.value;
    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objPlazo);
    makeAjaxRequest(url, "HTML", insertaPlazoAniosDias, null);
  }
}

function insertaPlazoAniosDias(obj, result)
{
  resultado = JSON.parse(result);
  
  if(resultado[0].diasPlazo <= 0)
  {
    alert("La Fecha de Inicio debe ser anterior a la Fecha de Vencimiento");
    GI("eproFecInicio").value = "";
    GI("eproFecVencimiento").value = "";
    GI("eproDiasPlazo").value = "";
    GI("eproAnoPlazo").value = "";
    return
  }
  
  GI("eproDiasPlazo").value = resultado[0].diasPlazo;
  
  var anios = resultado[0].diasPlazo/365;
  var posDecimal;
  //alert("posición: "+posDecimal+"   dias: "+resultado[0].diasPlazo+"    años: "+anios);
  anios = anios.toString();
  posDecimal = anios.indexOf(".");
  if(posDecimal != -1)
    anios = anios.substring(0,posDecimal+3);
  GI("eproAnoPlazo").value = anios;
}

///////////////////////////////////////////////////////////////////////////
//Funciones para el uso de las Fechas
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}


function isValidDateAll(date)
{
  return false;
}


//------------------------------------------

// ---- id rc-------------------------

function cargaDatosRC(objRC)
{
   if(objRC.value=='')
      return;
   
   cargaEmisorRC(objRC);
   cargaFideicomisoRC(objRC);
}

function cargaEmisorRC(objRC)
{
   var objProgr = JSON.parse("{}");
   objProgr.id = "conEmisorRepresComun";
   objProgr.Emisor = objRC.value;
   showWaitLayer();
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objProgr);
   makeAjaxRequest(url, "HTML", cargaEmisorRCRes,objRC);
}

function cargaEmisorRCRes(objRC,result)
{

  var res = JSON.parse(result);
  
  if(res.length<1)
  {
  
   alert("¡No existe Representación Común!");
   GI('eproEmisor').focus();
    GI("nomEmisor").value = "";
    hideWaitLayer();
    return;
  }
  
  GI("nomEmisor").value = res[0].esorNombre;
}

function cargaFideicomisoRC(objRC)
{
   
  var objProgr = JSON.parse("{}");
   objProgr.id = "emision.conETEmisorFideicomiso";
   objProgr.idEmisor = ""+numIdRC(objRC.value);
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objProgr);
   makeAjaxRequest(url, "HTML", cargaFideicomisoRCRes,null);
}

function cargaFideicomisoRCRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(res.length<1)
  {

    GI("nomFideicomiso").value = "";
    hideWaitLayer();
    return;
  }
  
  GI("nomFideicomiso").value = res[0].nomFideicomiso;
  
    hideWaitLayer();
  
}

function consultaExistePrograma(objPrograma,objRC)
{
  if(objRC.value==""||objPrograma.value=="")
    return;

  var objExisteProg = JSON.parse("{}");
  objExisteProg.id = "conETPriProg"; 
  objExisteProg.IdRC = objRC.value; 
  objExisteProg.NumPrograma = objPrograma.value; 
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objExisteProg);
  
  makeAjaxRequest(url,"html",consultaExisteProgramaRes,objPrograma);
}

function consultaExisteProgramaRes(objPrograma,result)
{
  var res = JSON.parse(result);
  
  if(res.length>0) // existe programa y rc
  { 
    alert("El número de programa ya existe");
    objPrograma.focus();
  }  

}

//------------------------------------