showWaitLayer();

var cmbLoadParam26y27 = JSON.parse("{\"Clave1\":26,\"Clave2\":27,\"orderDescripcion\":\"s\"}");
var cmbStatusParam = JSON.parse("{\"Indice\":500,\"orderDescripcion\":\"S\"}");
var cmbInstrumento = JSON.parse("{\"Indice\":510,\"orderDescripcion\":\"S\"}");

var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");
var cmbRepComun = JSON.parse("{\"Status\":\"ACTIVO\",\"order\":\"s\"}");

var cmbTNegocioParam = JSON.parse("{\"Indice\":512,\"orderDescripcion\":\"S\"}");

// total titulos-------
function calculaTotalTitulos(objImpEmi,objValNom)
{
  
  limpiaComasMonto('eemiImpEmision,eproImpDisponible,eemiImpNomEmision,eemiNumTitulos');

  if(objImpEmi.value!=''&&objValNom.value!=''&&objValNom.value!=0)
  {
    objTotTitulos = GI("eemiNumTitulos");
    objTotTitulos.value = eval(objImpEmi.value/objValNom.value);
  }
  
   // Valida  Imp Disponible > Imp Emision
   
   if(Number(GI("eproImpDisponible").value)<Number(GI("eemiImpEmision").value))
  {   
        alert("El Monto de la Emisión supera el Monto Disponible del Programa");
        GI("eemiImpEmision").focus();
        
  }
  
    formatoComasMonto('eemiImpEmision,eproImpDisponible,eemiImpNomEmision,eemiNumTitulos');
}


//----------------------

// emisor---------
var paramEmisor = JSON.parse("{\"order\":\"S\"}");

function consultaDivEmisor(cmbEmisor)
{
  // funciones anidadas--
  existeIdRC(cmbEmisor);
  consultaPrograma(cmbEmisor);
  //----------------------------
  
   if(numIdRC(cmbEmisor.value)!=-1)
   {
       var objEmisor = JSON.parse("{}");
       objEmisor.id = "conETCmbEmisor";
       objEmisor.idEmisor = numIdRC(cmbEmisor.value);
       
       var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmisor);
       makeAjaxRequest(url, "HTML", consultaDivEmisorRes,null);
   }
   else
   {
      GI("dvTipoEmisor").innerHTML= "";
   }
}

function consultaDivEmisorRes(obj,result)
{
   var res = JSON.parse(result);
   if(res.length>0)
      GI("dvTipoEmisor").innerHTML= "TIPO DE EMISOR:  "+res[0].esorTipoEmisor;
   else
      GI("dvTipoEmisor").innerHTML= "";
}

function consultaPrograma(cmbEmisor)
{
    cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(cmbEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
    loadElement(GI("eemiIdPrograma"));
   
    setTimeout("cargaDatosPrograma()",2000); 
      
    consultaFideicomiso(cmbEmisor);
}

function cargaDatosPrograma()
{

    if(GI("eemiIdPrograma").options.length==1)
    {
      //habilitaCampos("eemiIdPrograma");
      cargaDatosAutorizacionRes(null,"[]");
      return;
     }
     
    GI("eemiIdPrograma").selectedIndex=1;
    //deshabilitaCampos("eemiIdPrograma");
    
    if(manto)
    {
    determinaNumEmision(GI("eemiIdPrograma"),GI('eemiIdFideicomiso'),GI("eemiIdPrograma"));
    cargaDatosAutorizacion( GI("eemiIdPrograma").value);
    
    }
}
var cmbEmisorG;

function consultaFideicomiso(cmbEmisor)
{
    cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(cmbEmisor.value)+",\"order\":\"s\"}");
    loadElement(GI("eemiIdFideicomiso"));
    cmbEmisorG = cmbEmisor; 
    setTimeout("consultaTimeFideicomiso(cmbEmisorG)",2000);    
}

function consultaTimeFideicomiso(cmbEmisor)
{
  var objEmisor = JSON.parse("{}");
   objEmisor.id = "emision.conETEmisorFideicomiso";
   objEmisor.idEmisor = numIdRC(cmbEmisor.value);
       
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmisor);
   makeAjaxRequest(url, "HTML", consultaFideicomisoRes,cmbEmisor);
}



function consultaFideicomisoRes(cmbEmisor,result)
{
    var res = JSON.parse(result);
    if(res.length>0)
    {
      GI("eemiIdFideicomiso").selectedIndex=1;
      //deshabilitaCampos("eemiIdFideicomiso");
    }
    else
    {
      GI("eemiIdFideicomiso").selectedIndex=0;
      //habilitaCampos("eemiIdFideicomiso");
    }
}
//emisor----------


var DATOS_GENERALES = 1;
var FECHAS_EMISION = 2;

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmision");
var fvCat = new FormValidator();
var strIdPK = "eemiIdPrograma,eemiIdFideicomiso,eemiIdEmision";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fechas = new Date();
var usarSetValuesFormObject = true;
var comboDestino = null;
var infoCatalogo = null;
var objEncabezados = null;
var numTab = null;
var valorCmbSeleccionado = 0;

var objDatosEliminar = JSON.parse("{}");
var borrarRegistro = true;
var eliminados = 0;

var montoDisponiblePrograma = 0;
var montoPrograma = 0;
var montoEmisionAnt = 0;
var MontoEmisionDiferencia = 0;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,80px";
arrTblDat[1] = "eproNomPrograma,150px";
arrTblDat[2] = "eemiCvePizarra,100px";
arrTblDat[3] = "eemiNumSerie,100px";
arrTblDat[4] = "ctoNomContrato,150px";
arrTblDat[5] = "eproInstrumento,150px";
arrTblDat[6] = "eemiImpEmision,200px";
//arrTblDat[6] = "eemiNomEmisor,150px";
arrTblDat[7] = "eemiFecInicio,70px";
//arrTblDat[7] = "eemiStEmision,80px";

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

initForms();

function clickTabla(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmision");
  pkInfo = null;
  borraCombos("paramNumFiso,paramNumEmision");
}

function cargaMantenimientoDatosGenerales(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    numTab = DATOS_GENERALES;
    var urlCliente = "modules/EmisionTitulos/DatosGeneralesEmisiones/MantenimientoDatosGenerales.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoDatosGenerales, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    eliminados = 0;
    borrarRegistro = true;
    ejecutaOperacionIndice();
  }
}

function cargaMantenimientoDatosGeneralesTab() {
  showWaitLayer();
  numTab = DATOS_GENERALES;
  var urlCliente = ctxRoot + "/modules/EmisionTitulos/DatosGeneralesEmisiones/MantenimientoDatosGenerales.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoDatosGenerales, null);
}

function cargaMantenimientoFechasEmision() {
  showWaitLayer();
  numTab = FECHAS_EMISION;
  var urlCliente = ctxRoot + "/modules/EmisionTitulos/DatosGeneralesEmisiones/MantenimientoFechasEmision.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoDatosGenerales, null);
}

var manto = false;

function despliegaPantallaMantenimientoDatosGenerales(obj, result) 
{
   
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  manto = true;
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
  
    deshabilitaCampos('eemiNomEmisor');
    deshabilitaPK(arrIdPK);
    //muestraObjs("Tabs");
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA)
  {
    
  
    deshabilitaPK("eemiIdEmision".split(","));
    muestraObjs("cmdCancelar");
    
    if(numTab == DATOS_GENERALES)
    {
      muestraObjs("cmdAceptar");
    }
    else if(numTab == FECHAS_EMISION)
    {
      deshabilitaPK("eemiIdPrograma,eemiIdFideicomiso".split(","));
      muestraObjs("cmdAceptar");
    }
    
    //secuencialEmision();// CALCULA SECUENCIAL EMISION
  }
  
  if(numTab == DATOS_GENERALES)
  {
    var strFechas = "eemiFecInicio,eemiFecVencimiento,eemiFecCnbv,eemiFecBanxico";
    deshabilitaPK("eproMoneda,eproImpDisponible,eemiDiasPlazo,eemiAnoPlazo".split(","));
  }
  else
    var strFechas = "eemiFecEmision,eemiFecOfrecimiento,eemiFecSubasta,eemiFecBolsa,eemiFecCruce,eemiFecLiquidacion,eemiFecCnbv,eemiFecBanxico";
  
  var arrFechas = strFechas.split(",");
  for(var i in arrFechas)
  {
    if(arrFechas[i] == "eemiFecInicio" || arrFechas[i] == "eemiFecVencimiento")
    {
      Calendar.setup({
        inputField     :    arrFechas[i],   // id of the input field
        button         :    arrFechas[i],
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
    }
    else
    {
      Calendar.setup({
        inputField     :    arrFechas[i],   // id of the input field
        button         :    arrFechas[i],
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
    }
  }
}

function asignaValues2ObjHTML()
{
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
  {
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
    
  }else{
    catLoadedAlta();
  }
}

var cLOnce = 0;

function catLoaded() {

  if(cLOnce==0)
  {
      cLOnce = 1;
      if(numTab == DATOS_GENERALES)
      {
        determinaDatosDeProg(GI("eemiIdPrograma"));
        montoEmisionAnt = eval(GI("eemiImpEmision").value);
        montoDisponiblePrograma = eval(GI("eproImpDisponible").value);
      }
        cargaProgFid(GI("eemiNomEmisor"),GI("eemiIdPrograma"),GI("eemiIdFideicomiso"));
  }
      formatoComasMonto('eemiImpEmision,eproImpDisponible,eemiImpNomEmision,eemiNumTitulos,eemiNumTitulos');
      formaEmisorR('eemiNomEmisor');
    hideWaitLayer();
}

function catLoadedAlta() {
  if(numTab == DATOS_GENERALES)
    formsLoaded();
  else if(numTab == FECHAS_EMISION)
  {
    GI("eemiIdPrograma").value = objEncabezados.Programa;
    GI("eemiIdEmision").value = objEncabezados.Emision;
    GI("eemiCvePizarra").value = objEncabezados.ClavePizarra;
    GI("eemiNumSerie").value = objEncabezados.Serie;
    GI("eemiCveInstrumento").value = objEncabezados.Instrumento;
    GI("eemiAutorizacionCnbv").value = objEncabezados.AutorizacionCNBV;
    GI("eemiFecCnbv").value = objEncabezados.FechaCNBV;
    GI("eemiAutorizacionBanxico").value = objEncabezados.NumRegNalValores;
    GI("eemiFecBanxico").value = objEncabezados.FecNumRegNalValores;
    GI("eemiStEmision").value = objEncabezados.Status;
    
    cargaComboFideicomiso(GI("eemiIdPrograma"),GI("eemiIdFideicomiso"),false,objEncabezados.Fideicomiso);
  }
}

function guardaInfoSiguiente() 
{
  //Para tener toda la información al dar de alta
  
  limpiaComasMonto('eemiImpEmision,eproImpDisponible,eemiImpNomEmision,eemiNumTitulos');
  if(fvCat.checkForm())
  {
   manto=false;
    showWaitLayer();
    infoCatalogo = cat.getCatalogo();
    setValuesToObject(infoCatalogo);
    montoDisponiblePrograma = eval(GI("eproImpDisponible").value);
    objEncabezados = JSON.parse("{}");
    
    objEncabezados.Programa = GI("eemiIdPrograma").value;
    objEncabezados.Fideicomiso = GI("eemiIdFideicomiso").value;
    objEncabezados.Emision = GI("eemiIdEmision").value;
    objEncabezados.Emisor = GI("eemiNomEmisor").value;
    objEncabezados.ClavePizarra = GI("eemiCvePizarra").value;
    objEncabezados.Serie = GI("eemiNumSerie").value;
    objEncabezados.Instrumento = GI("eemiCveInstrumento").value;
    objEncabezados.AutorizacionCNBV = GI("eemiAutorizacionCnbv").value;
    objEncabezados.FechaCNBV = GI("eemiFecCnbv").value;
    objEncabezados.NumRegNalValores = GI("eemiAutorizacionBanxico").value;
    objEncabezados.FecNumRegNalValores = GI("eemiFecBanxico").value;
    objEncabezados.Status = GI("eemiStEmision").value;
    
    verificarActualizacionMontoDisponible((eval(GI("eemiImpEmision").value))*(-1));
  }
}

function verificarActualizacionMontoDisponible(montoEmisionDiferencia) {
  MontoEmisionDiferencia = montoEmisionDiferencia;
  if(GI("eemiNumMoneda").value != GI("eproMoneda").value)
  {
    arrFecha = (GI("eemiFecInicio").value).split("/");
    var objConValorUdi = JSON.parse("{}");
    objConValorUdi.id = "conETValUdi";
    objConValorUdi.ClaveIndice = "UDIS";
    objConValorUdi.DiaIndice = arrFecha[0];
    objConValorUdi.MesIndice = arrFecha[1];
    objConValorUdi.AnoIndice =arrFecha[2];
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objConValorUdi);
    makeAjaxRequest(url, "HTML", validaValorUdi, "true");
  }
  else
    validaValorUdi("false", "{\"valorUdi\":\"" + "null" + "\"}");
}

function validaValorUdi(obj, result) {
  var objResult = JSON.parse(result);
  
  if(eval(obj)) { //Si las monedas son diferentes
    if(isDefinedAndNotNull(objResult[0])) {
      if(GI("eproMoneda").value != 99)
        montoDisponiblePrograma += (MontoEmisionDiferencia * objResult[0].valorUdi);
      else
        montoDisponiblePrograma += (MontoEmisionDiferencia / objResult[0].valorUdi);
      
      if(montoDisponiblePrograma < 0) {
        alert("El Monto de la Emisión supera el Monto Disponible del Programa");
        hideWaitLayer();
        return;
      }
    }
    else {
      alert("No existe valor de UDI para la Fecha de Inicio");
      hideWaitLayer();
      return;
    }
  }
  else { //Si las monedas son iguales
    if(modo == OPER_ALTA) {
      if(eval(GI("eemiImpEmision").value) > eval(GI("eproImpDisponible").value)) {
        alert("El Monto de la Emisión supera el Monto Disponible del Programa");
        hideWaitLayer();
        return;
      }
      else
        montoDisponiblePrograma = montoPrograma- eval(GI("eemiImpEmision").value);
        //montoDisponiblePrograma -= eval(GI("eemiImpEmision").value);
    }
    else if(modo == OPER_MODIFICAR) {
      if(MontoEmisionDiferencia < 0 && (((MontoEmisionDiferencia)*(-1)) > eval(GI("eproImpDisponible").value))) {
        alert("El Monto de la Emisión supera el Monto Disponible del Programa");
        hideWaitLayer();
        return;
      }
      else
        montoDisponiblePrograma = montoPrograma- eval(GI("eemiImpEmision").value);
        //montoDisponiblePrograma -= eval(GI("eemiImpEmision").value);
        //montoDisponiblePrograma = eval(GI("eproImpDisponible").value) + MontoEmisionDiferencia;
    }
  }
  
  if(modo == OPER_ALTA) {
    hideWaitLayer();
    cargaMantenimientoFechasEmision();
  }
  else if(modo == OPER_MODIFICAR) {
    var url = ctxRoot + "/doRef.do?json={\"id\":\"modETMonDisPro\",\"MontoDisponible\":" + montoDisponiblePrograma + ",\"Programa\":" + GI("eemiIdPrograma").value + "}";
    makeAjaxRequest(url, "HTML", validaMontoDisponiblePrograma, null);
  }
}

function ejecutaOperacionIndice(){

  if(modo == OPER_ALTA||modo == OPER_MODIFICAR)
  {
    limpiaComasMonto('eemiImpEmision,eproImpDisponible,eemiImpNomEmision,eemiNumTitulos');
    formaEmisorSinR('eemiNomEmisor');
  }  
  if(modo == OPER_ALTA)
  {
    secuencialEmision();// CALCULA SECUENCIAL EMISION
    
    /*
      aqui iba, tuo que moverse porque primero tiene que asignar el secuencial
       if(fvCat.checkForm()).... etc
    */
  }
  else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      if(numTab == DATOS_GENERALES)   //&& montoEmisionAnt != eval(GI("eemiImpEmision").value))
        verificarActualizacionMontoDisponible(montoEmisionAnt - eval(GI("eemiImpEmision").value)); // no hace nada
      else {
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.modificaCatalogo();
      }
    }
  }
  else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaIndice();
  }
}

function validaMontoDisponiblePrograma(obj, result) {
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  if(modo == OPER_ALTA)
    cat.altaCatalogo();
  else if(modo == OPER_MODIFICAR)
    cat.modificaCatalogo();
}

function verificaIndice(){
  /*if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiProg\",\"NumPrograma\":" + GI("eproIdPrograma").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
  }*/
  if(modo == OPER_BAJA){
    objDatosEliminar.id = "delEMIAMOR";
    objDatosEliminar.NumPrograma = pkInfo.eemiIdPrograma;
    objDatosEliminar.NumFideicomiso = pkInfo.eemiIdFideicomiso;
    objDatosEliminar.NumEmisor = pkInfo.eemiIdEmision;
    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosEliminar);
    makeAjaxRequest(url, "HTML", validaOperacionDatosGenerales, eliminados);
  }
}

function validaOperacionDatosGenerales(obj, result){
  resultado = JSON.parse(result);
  switch (obj)
  {
    case 0 : objDatosEliminar.id = "delEMIPCAL"; break;  //Antes delEMIPAG
    case 1 : objDatosEliminar.id = "delCALCULO"; break;
    case 2 : objDatosEliminar.id = "delEMIMORA"; break;
    case 3 : objDatosEliminar.id = "delEMISEGR"; break;
    case 4 : objDatosEliminar.id = "delEMIADIC"; break;
    case 5 : objDatosEliminar.id = "delEMIDIASF"; break;
    case 6 : objDatosEliminar.id = "delEMIPAGO"; break;
    case 7 : objDatosEliminar.id = "delEMIAMAD"; break;
    case 8 : objDatosEliminar.id = "delEMICAINT"; break;
    case 9 : objDatosEliminar.id = "delEMIAMAP"; break;
    case 10: objDatosEliminar.id = "delEMIAMORC"; break; //Antes delEMICAPI
    case 11: objDatosEliminar.id = "delEMIPROI"; break;
    case 12: objDatosEliminar.id = "delEMIINST"; break;
    case 13: objDatosEliminar.id = "delEMIINTE"; break;
    case 14: objDatosEliminar.id = "delEMIREND"; break;
    case 15: objDatosEliminar.id = "delASISASAM"; break;
    case 16: objDatosEliminar.id = "delASAMBLEA"; break;
    case 17: objDatosEliminar.id = "delAUTENVP"; break; //Antes delAUTCOPIA
    case 18: objDatosEliminar.id = "delAUTAVISO"; break;
    case 19: objDatosEliminar.id = "delEMICALIF"; break;
    default: { cat.setOnUpdate(validaAvisoOperacionCatalogo);
               cat.bajaCatalogo(false);
             }
  }
  
  if(borrarRegistro)
  {
    objDatosEliminar.NumPrograma = pkInfo.eemiIdPrograma;
    objDatosEliminar.NumFideicomiso = pkInfo.eemiIdFideicomiso;
    objDatosEliminar.NumEmisor = pkInfo.eemiIdEmision;
    
    if(eliminados == 19)
      borrarRegistro = false;
    eliminados++;
    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosEliminar);
    makeAjaxRequest(url, "HTML", validaOperacionDatosGenerales, eliminados);
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  manto = false;
  onButtonClickPestania("EmisionTitulos.DatosGeneralesEmisiones.PrincipalDatosGenerales","");
  
  hideWaitLayer();
}

///////////////////////////////////////////////////////////////////////////
//Calcula el monto disponible, según sea Alta o Modificación
function calcularMontoDisponible(objMontoPrograma,objMontoDisponible) {
  if(modo == OPER_ALTA)
    GI("eproImpDisponible").value = objMontoProg.value;
  else if(modo == OPER_MODIFICAR)
  {
    montoDisponible += (objMontoPrograma.value - montoProgramaAnterior);
    objMontoDisponible.value = "";
    objMontoDisponible.value = montoDisponible;
  }
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

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Fideicomisos luego de haber elegido alguna opción del combo Programa
function cargaComboFideicomiso(objComboOrigen,objComboDestino,booleano,ValorCmbSeleccionado)
{
  if(objComboOrigen.name == "eemiIdPrograma")
  {
    //borraCombos("eemiIdFideicomiso");//borraCombos("eemiIdFideicomiso,eemiNomEmisor");
  }
  else if (objComboOrigen.name == "eemiIdFideicomiso")
    borraCombos("eemiNomEmisor");
  
  usarSetValuesFormObject = booleano;
  valorCmbSeleccionado = ValorCmbSeleccionado;
  paramCmbProg = JSON.parse("{\"NumPrograma\": " + objComboOrigen.value + ",\"order\":\"s\",\"NumFideicomiso\": " + objComboOrigen.value + "}");
  
  if(objComboOrigen.name == "paramNumPrograma")
    borraCombos("paramNumEmision,paramNumFiso");
  if(objComboOrigen.name == "paramNumFiso")
    paramCmbProg = JSON.parse("{\"NumPrograma\": " + GI("paramNumPrograma").value + ",\"order\":\"s\",\"NumFideicomiso\": " + objComboOrigen.value + "}");
  
  comboDestino = objComboDestino;
  SA(objComboDestino,"next","asignaFideicomiso");
  loadElement(objComboDestino);
}

function asignaFideicomiso(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(cat.getCatalogo());
    if(comboDestino.name == "eemiIdFideicomiso")
      cargaComboFideicomiso(GI("eemiIdFideicomiso"),GI("eemiNomEmisor"),true,0);
  }
  else
    comboDestino.selectedIndex=0;
  
  if(modo==OPER_ALTA && numTab==FECHAS_EMISION)
  {
    comboDestino.value=valorCmbSeleccionado;
    if(comboDestino.name == "eemiIdFideicomiso")
      cargaComboFideicomiso(GI("eemiIdFideicomiso"),GI("eemiNomEmisor"),false,objEncabezados.Emisor);
  }
  
  formsLoaded();
}


////////////////////////////////////////////////////////////////////
//Funciones para determinar el Número de Emisión (Secuencial - EEMI_ID_EMISION) a partir del Id de Programa y Id de Fideicomiso

function determinaNumEmision(cmbIdPrograma,cmbIdFideicomiso,cmbNameLlama) 
{

  if(cmbNameLlama.name=="eemiIdPrograma" && cmbIdPrograma.value!=-1)
  {
    determinaDatosDeProg(cmbIdPrograma);
  }
  else if(cmbNameLlama.name=="eemiIdPrograma" && cmbIdPrograma.value==0)
  {
    GI("eproMoneda").value = -1;
    GI("eproImpDisponible").value = "";
  }
}

function secuencialEmision()
{
   showWaitLayer();
    //var IdEmision = JSON.parse("{\"id\":\"secETIdEmi\"}");
    //----------- EMISION CON PARAMETROS
    var IdEmision = JSON.parse("{\"id\":\"secETIdEmi\",\"NumPrograma\":0,\"NumFideicomiso\":0}");
    IdEmision.NumPrograma = GI('eemiIdPrograma').selectedIndex>0?GI('eemiIdPrograma').value:0;
    IdEmision.NumFideicomiso =  GI('eemiIdFideicomiso').selectedIndex>0?GI('eemiIdFideicomiso').value:0;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(IdEmision);
    makeAjaxRequest(url, "HTML", insertaNumEmision, null);
}

function insertaNumEmision(obj, result)
{
  var objResult = JSON.parse(result);
  GI("eemiIdEmision").value=objResult[0].eemiIdEmision;
  hideWaitLayer();
  
  
  // sigue con el proceso de alta
   if(fvCat.checkForm())
    {
      showWaitLayer();
      var url = ctxRoot + "/doRef.do?json={\"id\":\"modETMonDisPro\",\"MontoDisponible\":" + (montoDisponiblePrograma-eval(GI("eemiImpEmision").value)) + ",\"Programa\":" + GI("eemiIdPrograma").value + "}";
      makeAjaxRequest(url, "HTML", validaMontoDisponiblePrograma, null);
      //verificaIndice();
    }
}


////////////////////////////////////////////////////////////////////
//Funciones para determinar la Moneda y el Importe Disponible del Programa
function determinaDatosDeProg(cmbIdPrograma) 
{
   if(!manto)// Solo en la pantalla de mantenimiento lo hace
      return;

  showWaitLayer();
  var datPrograma = JSON.parse("{\"id\":\"conDatPrg\",\"NumPrograma\":0}");
  datPrograma.NumPrograma = cmbIdPrograma.value;
  
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(datPrograma);
  makeAjaxRequest(url, "HTML", insertaDatosDeProg, null);
}

function insertaDatosDeProg(obj, result) 
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult[0]))
  {
    if(objResult[0].eproMoneda == 0)
      GI("eproMoneda").selectedIndex=0;
    else
      GI("eproMoneda").value=objResult[0].eproMoneda;
  }
  
  if(isDefinedAndNotNull(objResult[0]))
  {
    GI("eproImpDisponible").value=objResult[0].eproImpDisponible;
    montoPrograma = objResult[0].eproImpPrograma;
    
    limpiaComasMonto('eproImpDisponible,eemiImpEmision,eemiImpNomEmision');
    
    montoDisponiblePrograma = eval(GI("eproImpDisponible").value);
    montoEmisionAnt = eval(GI("eemiImpEmision").value);
    
    formatoComasMonto('eproImpDisponible,eemiImpEmision,eemiImpNomEmision');
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
    GI("eemiFecInicio").value = "";
    GI("eemiFecVencimiento").value = "";
    GI("eemiDiasPlazo").value = "";
    GI("eemiAnoPlazo").value = "";
    return
  }
  
  GI("eemiDiasPlazo").value = resultado[0].diasPlazo;
  
  var anios = resultado[0].diasPlazo/365;
  var posDecimal;
  //alert("posición: "+posDecimal+"   dias: "+resultado[0].diasPlazo+"    años: "+anios);
  anios = anios.toString();
  posDecimal = anios.indexOf(".");
  if(posDecimal != -1)
    anios = anios.substring(0,posDecimal+3);
  GI("eemiAnoPlazo").value = anios;
}

// Autorización programa-----


function cargaDatosAutorizacion(numPrograma)
{
   var objProgr = JSON.parse("{}");
   objProgr.id = "conETPriProg";
   objProgr.NumPrograma = numPrograma;
   showWaitLayer();
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objProgr);
   makeAjaxRequest(url, "HTML", cargaDatosAutorizacionRes,null);
}

function cargaDatosAutorizacionRes(obj,result)
{
  var resultado = JSON.parse(result);
  
  if(resultado.length>0)
  {
    deshabilitaCampos("eemiAutorizacionCnbv,eemiFecCnbv,eemiAutorizacionBanxico,eemiFecBanxico");
    
    var res = resultado[0];
  
    GI("eemiFecInicio").value = res.eproFecInicio!=null?res.eproFecInicio:'';
    GI("eemiFecVencimiento").value = res.eproFecVencimiento!=null?res.eproFecVencimiento:'';
    GI("eemiAutorizacionCnbv").value = res.eproAutorizacionCnbv!=null?res.eproAutorizacionCnbv:'';
    GI("eemiFecCnbv").value = res.eproFecCnbv!=null?res.eproFecCnbv:'';
    GI("eemiAutorizacionBanxico").value = res.eproAutorizacionBanxico!=null?res.eproAutorizacionBanxico:'';
    GI("eemiFecBanxico").value =  res.eproFecBanxico!=null?res.eproFecBanxico:'';
  
    fechasPrograma(GI("eemiFecInicio").value,GI("eemiFecVencimiento").value);
    
    plazoAniosDias(GI("eemiFecInicio"),GI('eemiFecVencimiento'));
  
  }
  else
  {
    
    fechasPrograma('','');
    habilitaCampos("eemiAutorizacionCnbv,eemiFecCnbv,eemiAutorizacionBanxico,eemiFecBanxico");
  }

  hideWaitLayer();
}


// combos dependen emisor-------------------

function cargaProgFid(comboEmisor,comboPrograma,comboFideicomiso)
{
  cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
   cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"s\"}");
   
    loadElement(comboPrograma);
    loadElement(comboFideicomiso);
   
    setTimeout("cargaProgFidValores('"+comboPrograma.id+"','"+comboFideicomiso.id+"')",2000); 
}

function cargaProgFidValores(idCmbPrograma,idCmbFideicomiso)
{

    if(GI(idCmbPrograma).options.length==1)
      {
        GI(idCmbPrograma).selectedIndex=0;
        //habilitaCampos(idCmbPrograma);
      }
     else
     {
      GI(idCmbPrograma).selectedIndex=1;
      determinaDatosDeProg(GI("eemiIdPrograma"));
      
      //deshabilitaCampos(idCmbPrograma);
    }
    
    if(GI(idCmbFideicomiso).options.length==1)
      {
        
        GI(idCmbFideicomiso).selectedIndex=0;
        //habilitaCampos(idCmbFideicomiso);
      }
     else
     {
        GI(idCmbFideicomiso).selectedIndex=1;
        //deshabilitaCampos(idCmbFideicomiso);
    }   
}

// ---- Fechas Programa--------------

var progFecIni;
var progFecFin;

function fechasPrograma(fecIni,fecFin) // establece periodo programa
{
  progFecIni = fecIni;
  progFecFin = fecFin;
  
    Calendar.setup({
          inputField     :    'eemiFecInicio',   // id of the input field
          button         :    'eemiFecInicio',
          ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
          showsTime      :    false,
          timeFormat     :    "24",
          onUpdate       :    setFechaCal,
          disableFunc    :    isValidDateProg,
          date           :    fechas,
          weekNumbers    :    false,
          cache          :    true,
          step           :    1
        });
    
    Calendar.setup({
      inputField     :    'eemiFecVencimiento',   // id of the input field
      button         :    'eemiFecVencimiento',
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    setFechaCal,
      disableFunc    :    isValidDateProg,
      date           :    fechas,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
    });
}

var fle = false;

function isValidDateProg(date) // valida periodo del progrma
{
  sprogFecIni = progFecIni.split("/");// dia mes año
  sprogFecFin = progFecFin.split("/"); // dia mes año
  
  var fini = 'undefined'
  var ffin = 'undefined'
  
  if(sprogFecIni.length==3)
      fini = new Date(sprogFecIni[2],sprogFecIni[1]-1,sprogFecIni[0]);
  if(sprogFecFin.length==3)
      ffin = new Date(sprogFecFin[2],sprogFecFin[1]-1,sprogFecFin[0]);
  
  var cadId = "true";
  
   if(fini=='undefined'&&ffin=='undefined')
     cadId = "false";
  
  
  if(fini!='undefined'&&ffin=='undefined')
      cadId += "&&date<fini";
  /*if(fini=='undefined'&&ffin!='undefined')
      cadId += "&&date>ffin";
  
  if(fini!='undefined'&&ffin!='undefined')
      cadId += "&&(date<fini||date>ffin)";*/
      
  if(fini!='undefined'&&ffin!='undefined')
      cadId += "&&(date<fini)";
  
      if(eval(cadId))
        return true;
      else
        return false;
  
}


//------------------------------------------

//-------------valida pizarra serie-------

function validaPizarraSerie()
{
    var vpizarra = GI('eemiCvePizarra').value;
    var vserie = GI('eemiNumSerie').value;
    
    if(vpizarra!=''&&vserie!=''&&(modo != OPER_CONSULTAR&&modo != OPER_BAJA))
    {
    
    var objPizSer = JSON.parse("{}");
     objPizSer.id = "conETPriDatGen";
     objPizSer.Pizarra = vpizarra;
     objPizSer.Serie = vserie;
   
     var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objPizSer);
     makeAjaxRequest(url, "HTML",validaPizarraSerieRes,null);
     
     
    }

}

function validaPizarraSerieRes(obj,result)
{
    var res = JSON.parse(result);
    
   if( res.length>0)
   {
      alert('Ya existen esa Pizarra y Serie');
   }
}

// clonar emision---------

function clonarEmision()
{
  if(isDefinedAndNotNull(pkInfo.eemiIdEmision))
  {
     var objClonar = JSON.parse("{}");
     objClonar.id = "ejeFunClonarEmision";
     objClonar.Emision = pkInfo.eemiIdEmision;
     objClonar.Programa = pkInfo.eemiIdPrograma;
     objClonar.Fideicomiso = pkInfo.eemiIdFideicomiso;
     
      var url = ctxRoot +"/executeRef.do?json="+JSON.stringify(objClonar);
      makeAjaxRequest(url,"HTML",clonarEmisionRes,null);
  }
  else
  {
      alert("Seleccione emisión");
  }

}


function clonarEmisionRes(obj,result)
{
   var res = JSON.parse(result).RESULTADO;
   
   switch(Number(res))
   {
         case -1:
            alert("Ocurrió un error en el proceso de clonación de Emisión");
            break;
         default:
            pkInfo.eemiIdEmision =res;
            cloneObject(pkInfo,cat.getCatalogo());
            GI('cmdModificar').click();
            break;
   }

}