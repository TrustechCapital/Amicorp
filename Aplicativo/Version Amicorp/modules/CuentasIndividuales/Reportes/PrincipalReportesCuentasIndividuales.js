//

//showWaitLayer();

var numContrato = GI("Fideicomiso").value;

var cmbNivelParam = JSON.parse("{}");
var objDatosNivelesParam = JSON.parse("{}");
var acumulaLongitud = 0;
var longMax = 0;
var nivelActual = 1;
var t;
var fvRepCtasInd = new FormValidator();
var numNiveles = 0;

var fechaDefault = new Date();
var reporte1;

//----------------------------------------------------VARIABLES GLOBALES para el timmer--------------------------------------------
  var t=0;
  var NTInvs;
  var PE=0;
  var NumeroNivelesActuales=0;
  var NTNiv=0;
  var tantoPorCiento=0;
  var rep=0;
  var auxNTNivAct=0;
  
  var porcTimer = 0;
  var NTI=0;
  var NTIaux = 0;
  var NumeroInversionistasActuales = 0;
  var ci = false;
  var cont = 0;
  var porctot=0;
  var NIAct=0;
  var NTNiv=0;

//------------------------------------------------------------------------------------------------------------------


//Agregando funcionalidad para los parámetros de búsqueda obligatorios
fvRepCtasInd.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//Colocar el Número de Fideicomiso en pantalla, así como el nombre correspondiente
consultaNombreFideicomiso("nomFideicomiso",GI("Fideicomiso"));

//Agregando funcionalidad para que se muestre el calendario en los parámetros de búsqueda
function cargaCalendario(idCalendario) {
  Calendar.setup({
      inputField     :    idCalendario,   // id of the input field
      button         :    idCalendario,
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    setFechaCal,
      disableFunc    :    isValidDate,
      date           :    fechaDefault,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
  });                   
}

////////////////////////////////////////////////////////////////////
//Funciones que se mandan llamar al inicio para conocer la información de los Niveles que conforman el Fideicomiso elegido
function cargaDatosNiveles() {

  objDatosNivelesParam.id = "con3NumNivNomNivLogNivFid";
  objDatosNivelesParam.Fideicomiso = numContrato;
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosNivelesParam);
  makeAjaxRequest(url, "HTML", asignaDatosNiveles, null);
}

function asignaDatosNiveles(obj, result) {
  asignaEtiqueta("dvFechaInicial","Fecha Inicial");
  asignaEtiqueta("dvFechaFinal","Fecha Final");
  
  objDatosNivelesParam = JSON.parse(result);
  if(!isDefinedAndNotNull(objDatosNivelesParam.codigoError))
  {
    numNiveles = objDatosNivelesParam.length;
    if(numNiveles==1)
    GI("rdResXNiv2").style.visibility = "hidden";

    for(i=0; i<numNiveles; i++)
    {
      longMax += objDatosNivelesParam[i].lonNivel;
      
      if(i==0) {
        asignaEtiqueta("dvNivel"+(i+1)+"1","Resumen por "+objDatosNivelesParam[i].nomNivel);
        asignaEtiqueta("dvNivel"+(i+1)+"2","Detalle por "+objDatosNivelesParam[i].nomNivel);
        asignaEtiqueta("dvNivel"+(i+1)+"3",objDatosNivelesParam[i].nomNivel);
  
      }
      else if(i==1) {
        asignaEtiqueta("dvNivel"+(i+1)+"1","Resumen por "+objDatosNivelesParam[i].nomNivel);
        asignaEtiqueta("dvNivel"+(i+1)+"2",objDatosNivelesParam[i].nomNivel);
        
      }
      else if(i==2)
        asignaEtiqueta("dvNivel"+(i+1),objDatosNivelesParam[i].nomNivel);
        
      if(i==numNiveles-1)
       
        asignaEtiqueta("dvUltNivel","Movimientos de Depósitos y Retiros por "+objDatosNivelesParam[i].nomNivel);
    }
    cargaCalendario("paramFecIni");
    cargaCalendario("paramFecFin");
    cargarCombosPrincipal(1);
  }
  else
    hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos de los niveles
function cargarCombosPrincipal(nivelActualLocal) {
  if(nivelActualLocal==2)
    borraCombos("cmbNivel2,cmbNivel3");
  else if(nivelActualLocal==3)
    borraCombos("cmbNivel3");
  
  cmbNivelParam = JSON.parse("{}");
  
  switch (nivelActualLocal) {
    case 1: cmbNivelParam.inicioNivel = 1; break;
    case 2: cmbNivelParam.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel; break;
    case 3: cmbNivelParam.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel + objDatosNivelesParam[1].lonNivel; break;
    default: cmbNivelParam.inicioNivel = 0; break;
  }
  
  if(isDefinedAndNotNull(objDatosNivelesParam[nivelActualLocal-1]))
  {
    cmbNivelParam.longitudNivel = objDatosNivelesParam[nivelActualLocal-1].lonNivel;
    cmbNivelParam.Fideicomiso = numContrato;
    cmbNivelParam.Nivel = nivelActualLocal;
    cmbNivelParam.parentNivel = (nivelActualLocal==1) ? 0 : eval("GI('cmbNivel"+(nivelActualLocal-1)+"').value");
    
    loadElementDo(eval("GI('cmbNivel"+nivelActualLocal+"')"));
  }
  else
    formsLoaded();
}

////////////////////////////////////////////////////////////////////
//boton Aceptar de la pantalla Principal//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function imprimirReporte() {
  GI("txtProgreso").value="";
  if(fvRepCtasInd.checkForm())
  {
    showWaitLayer();
    var parametros = getParameters(GI("frmReportes"));
    
    eval("parametros.Tipo = " + GI("rdMovDepRet").value);
    eval("parametros.Fideicomiso = " + GI("Fideicomiso").value);
    eval("parametros.FechaInicial = '" + GI("paramFecIni").value + "'");
    eval("parametros.FechaFinal = '" + GI("paramFecFin").value + "'");
    eval("parametros.CveNiv1 = '" + GI("cmbNivel1").value + "'");
    eval("parametros.CveNiv2 = '" + GI("cmbNivel2").value + "'");
    eval("parametros.CveNiv3 = '" + GI("cmbNivel3").value + "'");
    
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[0])){
      eval("parametros.NomNiv1 = '" + objDatosNivelesParam[0].nomNivel + "'");

    }  
    else
      eval("parametros.NomNiv1 = ''");
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[1])){
      eval("parametros.NomNiv2 = '" + objDatosNivelesParam[1].nomNivel + "'");
    }  
    else
      eval("parametros.NomNiv2 = ''");
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[2])){
      eval("parametros.NomNiv3 = '" + objDatosNivelesParam[2].nomNivel + "'");
    }  
    else
      eval("parametros.NomNiv3 = ''");
    ////////
    eval("parametros.NumNiveles = " + numNiveles);
    //Determinar el reporte que va a imprimirse
    switch(parametros.Tipo) {
      case 1: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/MovDepositosRetiros.jsp'"); break;
      case 2: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/EstadoCuenta.jsp'"); break;
      case 3: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/ResumenNivel_1.jsp'"); break;
      case 4: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/ResumenNivel_2.jsp'"); break;
      case 5: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/DetalleNivel_1.jsp'"); break;
      default: eval("parametros.urlReporte = '/jsp/Reportes/CuentasIndividuales/MovDepositosRetiros.jsp'"); break;
    }
    
    if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("urlReporte"))) {
      var url = GI("urlReporte").value;
      for(k in parametros) {
        url += k + "=" + parametros[k] + "&";
      }
      url += "web=0";
      var link = GI("linkReporteNew");
      link.href=url;
      link.click();    
      return;
    }
    if(isDefinedAndNotNull(GI("template"))) parametros.template = GI("template").value;
    if(isDefinedAndNotNull(GI("nombreReporte"))) parametros.nombreReporte = GI("nombreReporte").value;
    if(isDefinedAndNotNull(GI("refSP"))) {
      parametros.id = GI("refSP").value;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
      //alert(url);
      makeAjaxRequest(url, "HTML", validaImprimirReporte, parametros);
      //timedCount();
      iniciarProcesoParaObtenerPorcentajeDeTiempoTranscurrido(parametros.Tipo);
    } else {
      validaImprimirReporte(parametros, "{\"RESULTADO\":0}");
    }
    //showWaitLayer();
  //  makeAjaxRequest(url, "HTML", validaImprimirReporte, parametros);    
  }
}

/*function timedCount()
{
t=setTimeout("timedCount()",3000);
}

function stopCount()
{
clearTimeout(t);
}*/

function stopCount()
{
  clearTimeout(t);
  GI("txtProgreso").value="100 %";
  porcTimer = 0;
  NumeroInversionistasActuales = 0;
  porctot = 0;
  NIAct=0;
  
  NTNiv=0;
  
  auxNTNivAct=0;
  
  //t=0;
  NTInvs=0;
  PE=0;
  NTNiv=0;
  NumeroNivelesActuales=0; 
  tantoPorCiento=0;
  rep=0;
}


function validaImprimirReporte(obj, result) {
  // TODO: Dejar el mensaje de espera hasta que se despliegue el guardar como
  var objResult = JSON.parse(result);
  stopCount();//------------------------------------------------------------------------------------------------------------------------------STOP
  alert("Proceso concluido satisfactoriamente");
  reporte1=GI("rdMovDepRet").value;
  if(objResult.RESULTADO == 0) { // Ejecucion OK
    var idLink = "linkReporte"; 
    idLink = "linkReporteNew"; 
    if(reporte1==1){
    obj.id = GI("refQry1").value;
    }
    else
    obj.id = GI("refQry").value;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI(idLink);
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  } 
  else if(objResult.RESULTADO == -1){ // Error
    alert("Ocurrio un error, favor de verificar");
  }
  
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para la funcionalidad de la fecha
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



////////////////////////////////////////////////////////////////////
//Funcion para mostrar los objetos de acuerdo al combo seleccionado
function muestraObjetos(cad,obj) {
  asignaValueRadio2Master(cad,obj);
    //Ocultar todos los objetos
  GI("dvFechaInicial").style.visibility = "hidden";
  GI("paramFecIni").style.visibility = "hidden";
  GI("dvNivel13").style.visibility = "hidden";
  GI("cmbNivel1").style.visibility = "hidden";
  GI("dvNivel22").style.visibility = "hidden";
  GI("cmbNivel2").style.visibility = "hidden";
  GI("dvNivel3").style.visibility = "hidden";
  GI("cmbNivel3").style.visibility = "hidden";
  
  //Quitar el atributo required a los objetos
  RA(GI("paramFecIni"),"required");
  RA(GI("cmbNivel1"),"required");
  RA(GI("cmbNivel2"),"required");
  RA(GI("cmbNivel3"),"required");
  
  //Colocar los objetos sin datos
  GI("paramFecIni").value = "";
  limpiaCombos("cmbNivel1");
  borraCombos("cmbNivel2,cmbNivel3");
  
  if(obj.id == "rdMovDepRet") { //Movimientos de depósitos y retiros
    if(numNiveles!=1){
    GI("dvFechaInicial").style.visibility = "visible";
    GI("paramFecIni").style.visibility = "visible";
    SA(GI("paramFecIni"),"required","true");
    
    GI("dvNivel13").style.visibility = "visible";
    GI("dvNivel22").style.visibility = "visible";
    GI("dvNivel3").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
    GI("cmbNivel2").style.visibility = "visible";
    GI("cmbNivel3").style.visibility = "visible";
  }
   else {
      GI("dvFechaInicial").style.visibility = "visible";
    GI("paramFecIni").style.visibility = "visible";
    SA(GI("paramFecIni"),"required","true");
    
    GI("dvNivel13").style.visibility = "visible";
    GI("dvNivel22").style.visibility = "visible";
    GI("dvNivel3").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
   }
  }
  else if(obj.id == "rdEdoCta") { //Estado de cuenta
    if(numNiveles!=1){
    GI("dvNivel13").style.visibility = "visible";
    GI("dvNivel22").style.visibility = "visible";
    GI("dvNivel3").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
    GI("cmbNivel2").style.visibility = "visible";
    GI("cmbNivel3").style.visibility = "visible";
    
    //Hacer obligatorios los combos
    SA(GI("cmbNivel1"),"required","true");
    SA(GI("cmbNivel2"),"required","true");
    SA(GI("cmbNivel3"),"required","true");
    }
    else{
        GI("dvNivel13").style.visibility = "visible";
    GI("dvNivel22").style.visibility = "visible";
    GI("dvNivel3").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
    //Hacer obligatorios los combos
    SA(GI("cmbNivel1"),"required","true");
    }
  }
  else if(obj.id == "rdResXNiv1") { //Resumen por nivel 1
    GI("dvNivel13").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
  }
  else if(obj.id == "rdResXNiv2") { //Resumen por nivel 2
    GI("dvNivel13").style.visibility = "visible";
    GI("dvNivel22").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
    GI("cmbNivel2").style.visibility = "visible";
  }
  else if(obj.id == "rdDetXNiv1") { // Detalle por nivel 1
    GI("dvNivel13").style.visibility = "visible";
    GI("cmbNivel1").style.visibility = "visible";
  }
}

function reedireccionar(){
//showWaitLayer();
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
    showWaitLayer();
} 

//**************************************************************************************   TIMER    ***************************************************************

function iniciarProcesoParaObtenerPorcentajeDeTiempoTranscurrido(reporte){
  GI("txtProgreso").value=porcTimer+" % ";
  if(reporte!=3){
      obtenerNumTotalInversionistas(reporte,100);
  }
  else{
      obtenerNumTotalNiveles();
  }
}

//-----------------------------------------------------------------------------PARA TODOS LOS REPORTES---------------------------------------------------------------------
function  obtenerNumTotalInversionistas(reporte,tp){
    rep = reporte;
    tantoPorCiento = tp;
    var qryTotalInvers = JSON.parse("{\"id\":\"obtenTotalInversss\"}");
    qryTotalInvers.fiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(qryTotalInvers);
    makeAjaxRequest(url, "HTML", muestraTotalInvers, null);
}

function muestraTotalInvers(obj,result){
    var result = JSON.parse(result)[0];
    NTInvs = result.totInvers;//NUMERO TOTAL DE INVERSIONISTAS variable global
    //GI("txt1").value=NTInvs;
    if(rep!=3)
        timedCount();//INICIA EL CONTADOR PARA TODOS LOS REPORTE QUE NO SEAN 3
    else
        obtenerNumInversActualesYcalcularPorcentaje();//CUANDO EL REPORTE ES 3, SE ESTA ITERANDO APARTIR DE timedCount2()
 
    
}

function timedCount(){
   obtenerNumInversActualesYcalcularPorcentaje();
}

function obtenerNumInversActualesYcalcularPorcentaje(){
    var qryNumInversActuales = JSON.parse("{\"id\":\"obtenInversActuales\"}");
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(qryNumInversActuales);
    makeAjaxRequest(url, "HTML", muestraNumInversActuales,null);
}

function muestraNumInversActuales(obj,result){
    //alert(result);
    var result = JSON.parse(result)[0];
    numeroInversionistaActual = result.numInvAct;// VALOR DEL INVERSIONISTA ACTUAL
    //alert(numeroInversionistaActual);
    //GI("txt2").value=numeroInversionistaActual;
    //alert(numeroInversionistaActual);
    obtenerPorcentajeDeProcesoTranscurrido(numeroInversionistaActual);
}


function obtenerPorcentajeDeProcesoTranscurrido(varNumeroInversionistaActual){
    var porcentajeDeProcesoTranscurrido = Math.round((varNumeroInversionistaActual*tantoPorCiento)/NTInvs,3);
     GI("txtProgreso").value=porcentajeDeProcesoTranscurrido+" % ";//SE MUESTRA EL PORCENTAJE DE TIEMPO TRANSCURRIDO
     if(rep!=3)
        t=setTimeout("timedCount()",3000);//PROCESO PARA ITERAR timedCount Y SACAR EL PORCENTAJE DE FROMA RECURSIVA POR CADA 3 SEGUNDOS SI EL REPORTE NO ES TRES
}


//--------------------------------------------------------------REPORTE 3----------------------------------------------------------------------------


function obtenerNumTotalNiveles(){
    var qryTotalNiveles = JSON.parse("{\"id\":\"obtenerTotalNiveles\"}");
    qryTotalNiveles.fiso = GI("paramFideicomiso").value;
    qryTotalNiveles.fiso2 = GI("paramFideicomiso").value;
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(qryTotalNiveles);
    makeAjaxRequest(url, "HTML", muestraTotalNivelesYcalculaElPorcentajeExterior, null);
}


function muestraTotalNivelesYcalculaElPorcentajeExterior(obj,result){
    //alert(result);
    var res = JSON.parse(result)[0];
    NTNiv = res.numnivel;//NUMERO TOTAL DE NIVELES variable global
    //GI("txt3").value=NTNiv;
    calculaPorcentajeExterno();
    
}

function calculaPorcentajeExterno(){
  PE=100/NTNiv;//PORCENTAJE EXTERIOR variable global
  auxNTNivAct=1; //variable global
  porcTimer=0;
  timedCount2();// inicia el proceso recursivo exclusivo del reporte 3
}


function timedCount2(){
    //verificar si proceso termino
    //si termino no invocar timecount2 y ejecutar stop
    var qryVerDatosRepctaind = JSON.parse("{\"id\":\"obtenDatosRepctaind\"}");
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(qryVerDatosRepctaind);
    makeAjaxRequest(url, "HTML", muestraDatosRepctaind,null);
}

function muestraDatosRepctaind(obj,result){
  var result = JSON.parse(result)[0];
  NumeroDatosRepctaind = result.numDat;
  //alert(NumeroDatosRepctaind);
  if(NumeroDatosRepctaind>0){//SI HAY DATOS EN LA TABLA REPCTAIND, ES QUE EL PROCESO HA TERMINADO SI NO, EJECUTAR PROCESO
     stopCount();
  }
  else
       obtenerNumnNivelesActuales();
}

function obtenerNumnNivelesActuales(){
    var qryObtenNivelActual = JSON.parse("{\"id\":\"obtenNivelActual\"}");
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(qryObtenNivelActual);
    makeAjaxRequest(url, "HTML", muestraNumNivelActual,null);
}

function muestraNumNivelActual(obj,result){
    //alert(result);
    var result = JSON.parse(result)[0];
    NumeroNivelesActuales = result.numInvAct; //NUMERO DE NIVELES ACTUALES POR CADA ITERACION
    //GI("txt4").value=NumeroNivelesActuales;
    //alert(NumeroNivelesActuales+" "+auxNTNivAct);
    obtenerPorcentajeInterno(NumeroNivelesActuales);
}


function obtenerPorcentajeInterno(NumeroNivelesActuales){
   /* if(NumeroNivelesActuales==auxNTNivAct){//MIENTRAS NO CAMBIE EL NIVEL ACTUAL, ITERAR PARA OBTENER EL PORCENTAJE INTERNO
      obtenerNumTotalInversionistas(1,PE); // REUTILIZACION DE ESTA FUNCION PARA SACAR EL PORCENTAJE INTERNO DONDE EL 100% ES LO QUE ARROJE PE, el parametro 1 es indiferente
    }*/
   // else{//SE ACTUALIZA EL PORCENTAJE TOTAL 
      auxNTNivAct=NumeroNivelesActuales;
      //GI("txt5").value=auxNTNivAct;
      //GI("txt6").value=PE;
      porcTimer=Math.round(PE*auxNTNivAct,3);//PE  ES UNA FRACCION QUE SE MULTIPLICA POR EL NIVEL ACTUAL PARA OBTENER EL PORCENTAJE EXTERNO TOTAL TRANSCURRIDO
      GI("txtProgreso").value=porcTimer+" % ";
  //  }
     t=setTimeout("timedCount2()",3000);//PROCESO PARA ITERAR timedCount2 Y SACAR EL PORCENTAJE DE FROMA RECURSIVA POR CADA 3 SEGUNDOS SI EL REPORTE ES EL TRES
}




//*****************************************************************************************************************************************************************