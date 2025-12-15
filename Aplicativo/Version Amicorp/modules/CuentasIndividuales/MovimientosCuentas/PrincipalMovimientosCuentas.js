//valor
var catMovCuentas = new Catalogo("mx.com.inscitech.fiducia.domain.FidMovCtasInd");

showWaitLayer();

var numContrato = GI("Fideicomiso").value; 
var fechaMovto = "19/02/2008";
var fechaDefault = new Date();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var operacion = 0;
var numPantalla = 0;
pkInfo = null;

var cmbNivelParam = JSON.parse("{}");
var objDatosNivelesParam = JSON.parse("{}");
var objDatosNivelesParam2 = JSON.parse("{}");
var acumulaLongitud = 0;
var longMax = 0;
var nivelActual = 1;

var fvMovCuentas = new FormValidator();
var numNiveles = 0;

var fechaMovDel = new Date();
var fechaMovAl = new Date(); 

//----VARIABLES GLOBALES QUE HACEN QUE  MANTENGAN SUS VALORES LOS OBJETOS DE LA PANTALLA PRINCIPAL---------------------------
var vgCombo1; 
var vgCombo2; 
var vgCombo3;
var vgFechaDel;
var vgFechaAl;
var vgChkDeposito;
var vgChkRetiro;
var valorKeyCombo2;
//-----------------------------------------------------------------------------------------------------------------

//Agregando funcionalidad para los parámetros de búsqueda obligatorios
fvMovCuentas.setup({
  formName      : "frmPrincipalMovimientosCuentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//Agregando funcionalidad para que se muestre el calendario en los parámetros de búsqueda
Calendar.setup({
  inputField     :    "FechaDel",   // id of the input field
  button         :    "FechaDel",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    null,
  disableFunc    :    isValidDate,
  date           :    fechaDefault,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

Calendar.setup({
  inputField     :    "FechaAl",   // id of the input field
  button         :    "FechaAl",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    null,
  disableFunc    :    isValidDate,
  date           :    fechaDefault,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

//calendarios
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
});


function verificaFechaMesAnteriorFideicomiso(){
  var fecha = GI("movFecOper").value;
  var fideicomiso = GI("movContrato").value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesMovCtaInd\",\"Fecha\":\"" + fecha + "\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaFechaMesAnterior, GI("movFecOper"));
}
function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado.result)){
    switch(resultado.result){
      case 0:
        catMovCuentas.altaCatalogo();
        onButtonClickPestania('CuentasIndividuales.MovimientosCuentas.PrincipalMovimientosCuentas','');       
        break;
      case 2:
        alert("El Mes se encuentra Capitalizado");
        obj.focus();
        break;      
      case 1:
      case -1:
        alert("No es posible introducir movimientos a esta Fecha");
        obj.focus();
        break;
    }
  }  
  hideWaitLayer();
}


//Arreglo para llenar el grid
var tablaDatosMovCuentasData = new Array();
tablaDatosMovCuentasData[0] = "movFecOper,65";
tablaDatosMovCuentasData[1] = "idCuenta,345";
tablaDatosMovCuentasData[2] = "movSecuencial,70";
tablaDatosMovCuentasData[3] = "movTipoOper,100";
tablaDatosMovCuentasData[4] = "movImporte,100";

//Colocar el Número de Fideicomiso en pantalla, así como el nombre correspondiente
GI("Fideicomiso").value = numContrato;
consultaNombreFideicomiso("nomFideicomiso",GI("Fideicomiso"));
deshabilitaPK("Fideicomiso".split(","));

////////////////////////////////////////////////////////////////////
//Funciones que se mandan llamar al inicio para conocer la información de los Niveles que conforman el Fideicomiso elegido
function cargaDatosNiveles() {
  nivelActual=1;
  acumulaLongitud=0;
  objDatosNivelesParam.id = "con3NumNivNomNivLogNivFid";
  objDatosNivelesParam.Fideicomiso = numContrato;
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosNivelesParam);
  makeAjaxRequest(url, "HTML", asignaDatosNiveles, null);
}

function asignaDatosNiveles(obj, result) {
  objDatosNivelesParam = JSON.parse(result);
  if(!isDefinedAndNotNull(objDatosNivelesParam.codigoError))
  { 
    numNiveles = objDatosNivelesParam.length;
    for(i=0; i<numNiveles; i++)
    {
      longMax += objDatosNivelesParam[i].lonNivel;
      asignaEtiqueta("dvNivel"+(i+1),objDatosNivelesParam[i].nomNivel);
      muestraObj("cmbNivel"+(i+1));
      
      if(i==numNiveles-1)
        asignaEtiqueta("dvUltNivel",objDatosNivelesParam[i].nomNivel);
    }
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
//Cargar la página principal
function cargaPrincipalMovimientosCuentas() {
  onButtonClickPestania("CuentasIndividuales.MovimientosCuentas.PrincipalMovimientosCuentas","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  pkInfo.movContrato = numContrato;
  
  cloneObject(pk,catMovCuentas.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catMovCuentas.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catMovCuentas);
  }
}

function operacionExitosa() {
   //catMovCuentas.setOnUpdate(retornaValoresAPrincipal)
  alert("La operación se realizó correctamente");
  cargaPrincipalMovimientosCuentas();
}

////////////////////////////////////////////////////////////////////
//boton Aceptar de la pantalla Principal
function principalAceptar() {
  if(fvMovCuentas.checkForm())
  {
    showWaitLayer();
    
    cmbNivelParam = JSON.parse("{\"id\":\"muestraDatosCuentasIndividuales\"}");
    eval("cmbNivelParam.numNiveles = " + numNiveles);
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[0])){
      eval("cmbNivelParam.longNivel1 = " + objDatosNivelesParam[0].lonNivel);
    }  
    else
      eval("cmbNivelParam.longNivel1 = 0");
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[1])){
      eval("cmbNivelParam.longNivel2 = " + objDatosNivelesParam[1].lonNivel);
    }  
    else
      eval("cmbNivelParam.longNivel2 = 0");
    ////////
    if(isDefinedAndNotNull(objDatosNivelesParam[2])){
      eval("cmbNivelParam.longNivel3 = " + objDatosNivelesParam[2].lonNivel);
    }  
    else
      eval("cmbNivelParam.longNivel3 = 0");
    ////////
    eval("cmbNivelParam.numFiso =" + numContrato);
    eval("cmbNivelParam.fecPeriodoIni = '" + GI("FechaDel").value +"'");
    eval("cmbNivelParam.fecPeriodoFin = '" + GI("FechaAl").value +"'");
    ////////
    eval("cmbNivelParam.claveCombo1 = '" + GI("cmbNivel1").value + "'");
    eval("cmbNivelParam.claveCombo2 = '" + GI("cmbNivel2").value + "'");
    eval("cmbNivelParam.claveCombo3 = '" + GI("cmbNivel3").value + "'");
    
    if(GI("chkDeposito").checked)
      eval("cmbNivelParam.deposito = 1");
    else
      eval("cmbNivelParam.deposito = 0");
    
    if(GI("chkRetiro").checked)
      eval("cmbNivelParam.retiro = 1");
    else
      eval("cmbNivelParam.retiro = 0");
    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
    makeAjaxRequest(url, "HTML", resultadoConsulta, GI("tablaRegistrosMovIndividuales"));
  }
}

function resultadoConsulta(objTabla, result) {
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado) && resultado.length>0)
    loadTableElement(objTabla, result);
  else
    alert("No existen Registros para estos criterios de búsqueda");
  
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






//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoMovimientosCuentas(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
     if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR))
          obtenValoresDePrincipal();
    var urlCliente = ctxRoot + "/modules/CuentasIndividuales/MovimientosCuentas/MantenimientoMovimientosCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña


  //Agregando la funcionalidad del required
  fvMovCuentas.setup({
    formName      : "frmMantenimientoMovimientosCuentas",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  
  cal.manageFields("movFecOper","movFecOper", "%d/%m/%Y");
  
  
  contabilidadCtasIndiv(); // Contabiliza Ctas. Individuales
  loadCatalogo();
}

function loadCatalogo() {
  catMovCuentas.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR){
     //SA(GI("cmdCancelar"),"onclick",retornaAprincipal());
    catMovCuentas.buscaCatalogoPK(false);
  }
  else //Si se trata de una alta
  {
    //SA(GI("cmdCancelar"),"onclick",cargaPrincipalMovimientosCuentas());
    GI("movContrato").value = numContrato;
    SA(GI("NomFideicomiso"),"next","prepararAltaPantalla");
    consultaNombreFideicomiso("nomFideicomiso",GI("movContrato"));
    deshabilitaPK("movContrato,movClaveInv,movSecuencial".split(","));
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("movContrato,movClaveInv,movSecuencial,cmbNivel1,cmbNivel2,cmbNivel3".split(","));
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmMantenimientoMovimientosCuentas"));         //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoMovimientosCuentas").cmdAceptar, "LKD", "true");
    SA(GI("frmMantenimientoMovimientosCuentas").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  
  //GI("movFecUltMod").value = <%=session.getAttribute("fechaContable")%>;
   nivelActual=1;
   acumulaLongitud=0;
  SA(GI("nomFideicomiso"),"next","cargarCombosModificaConsulta");
  consultaNombreFideicomiso("nomFideicomiso",GI("movContrato"));
  cargaRadiosConMaster("movTipoOper","movTipoOper2");
}

function cargarCombosModificaConsulta() {
  cmbNivelParam.inicioNivel = 1 + acumulaLongitud;
  cmbNivelParam.longitudNivel = objDatosNivelesParam[nivelActual-1].lonNivel;
  cmbNivelParam.Fideicomiso = numContrato;
  cmbNivelParam.Nivel = nivelActual;
  cmbNivelParam.parentNivel = (nivelActual==1) ? 0 : eval("GI('cmbNivel"+(nivelActual-1)+"').value");
  SA(eval("GI('cmbNivel"+nivelActual+"')"),"next","asignaValorCombo");
  loadElementDo(eval("GI('cmbNivel"+nivelActual+"')"));
}

function asignaValorCombo() {
  try{
    SA(eval("GI('cmbNivel"+nivelActual+"')"),"next","formsLoaded");
    asignaEtiqueta("dvNivel"+nivelActual,objDatosNivelesParam[nivelActual-1].nomNivel); //Asigna etiquetas de acuerdo al Número de Niveles
    muestraObj("cmbNivel" + nivelActual);  //Muestra los combos
    
    SA(eval("GI('cmbNivel"+nivelActual+"')"),"required",""); //Coloca el atributo de que sean campos obligatorios
    SA(eval("GI('cmbNivel"+nivelActual+"')"),"message","Este es un campo obligatorio");
    valorKeyCombo2 = GI("movClaveInv").value;
    var valorKeyCombo = GI("movClaveInv").value.substring(0,acumulaLongitud+objDatosNivelesParam[nivelActual-1].lonNivel);//**********************************************------------------------***********************--------------
    valorKeyCombo = formatString(valorKeyCombo,"0",longMax,"Derecha");
    GI("cmbNivel"+nivelActual).value = valorKeyCombo;
    
    acumulaLongitud += objDatosNivelesParam[nivelActual-1].lonNivel;
    nivelActual++;
    if(nivelActual <= objDatosNivelesParam.length)
      cargarCombosModificaConsulta();
    else{
      formsLoaded();
      nivelActual=1
   }   
  }catch(e){alert(JSON.stringify(e));}
}

//Da de Alta o Modifica la informacion
function AltaOModificaInfo() {
  catMovCuentas.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMovCuentas.checkForm())//Se trata de una alta
  {
    
    var validaCtasIndiv = true; // valida campos contabilidad
    if(GI("movContabilizar").checked)// esta Seelccionado Contabilizar
    {
      validaCtasIndiv = contabilizarCtasIndiv();// Contabilizar
    }
    
    if(GI("cmbNivel3").value != -1&&validaCtasIndiv)
    { 
      showWaitLayer();
      muestraClaveInversionista(GI("cmbNivel3"));
    }
    else if(GI("cmbNivel2").value != -1&&validaCtasIndiv)
    {
      showWaitLayer();
      muestraClaveInversionista(GI("cmbNivel2"));
    }
    
  }
  else if(operacion==MODIFICAR && fvMovCuentas.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catMovCuentas.modificaCatalogo();
  }
}

//Muestra las etiquetas, los combos, carga el primero de ellos y vacia la fecha de Operacion
function prepararAltaPantalla() {
  for(i=0; i<numNiveles; i++) {
    asignaEtiqueta("dvNivel"+(i+1),objDatosNivelesParam[i].nomNivel);
    muestraObj("cmbNivel" + (i+1));  //Muestra los combos
    SA(eval("GI('cmbNivel"+(i+1)+"')"),"required",""); //Coloca el atributo de que sean campos obligatorios
    SA(eval("GI('cmbNivel"+(i+1)+"')"),"message","Este es un campo obligatorio");
  }
  //GI("movFecOper").value = fechaMovto;
  GI("movFecAlta").value = fechaMovto;
  GI("movFecUltMod").value = fechaMovto;
  
  cargarCombosPrincipal(1);
}

//Coloca la clave del inversionista de acuerdo al dato elegido en el combo
function muestraClaveInversionista(objCombo) {
  if(objCombo.value != -1)
  {
    GI("movClaveInv").value = objCombo.value;
    
    //if(operacion==ALTA)
    //{
      cmbNivelParam = JSON.parse("{\"id\":\"muestraSecuencialMovCtasIndividuales\"}");
      eval("cmbNivelParam.Fideicomiso = " + numContrato);
      eval("cmbNivelParam.FechaOperacion = '" + GI("movFecOper").value + "'");
      eval("cmbNivelParam.Clave = '" + GI("movClaveInv").value + "'");
      
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
      makeAjaxRequest(url, "HTML", resultadoSecuencial, null);
    //}
  }
}

function resultadoSecuencial(obj, result) {
  var resultado = JSON.parse(result);
  
  if(isDefinedAndNotNull(result))
    GI("movSecuencial").value = resultado[0].secuencial; 
    verificaFechaMesAnteriorFideicomiso();
}


function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("Fideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);    
  
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
} 

function asignaSecuencial(){
      cmbNivelParam = JSON.parse("{\"id\":\"muestraSecuencialMovCtasIndividuales\"}");
      eval("cmbNivelParam.Fideicomiso = " + numContrato);
      eval("cmbNivelParam.FechaOperacion = '" + GI("movFecOper").value + "'");
      eval("cmbNivelParam.Clave = '" + GI("movClaveInv").value + "'");
      
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
      makeAjaxRequest(url, "HTML", resultadoSecuencial, GI("movSecuencial"));
}

//***********************************FUNCIONALIDAD PARA HACER QUE LOS OBJETOS DE LA PANTALLA PRINCIPAL MANTENGAN SU VALOR**************************************************


// Funcion que inicializa las variables globales con los valores de los objetos de la pantalla principal
  function obtenValoresDePrincipal(){
     vgCombo1 = GI("cmbNivel1").value; 
     vgCombo2 = GI("cmbNivel2").value; 
     vgCombo3 = GI("cmbNivel3").value; 
     vgFechaDel = GI("FechaDel").value; 
     vgFechaAl = GI("FechaAl").value;
     /////Asignaciones para checkboxes
     if(GI("chkDeposito").checked)
        vgChkDeposito = true;
    else
        vgChkDeposito = false;
    if(GI("chkRetiro").checked)
        vgChkRetiro = true;
    else
        vgChkRetiro = false;
  }
  

//FUNCION PRINCIPAL QUE REGRESA LOS VALORES DE LAS VARIABLES GLOBALES A SUS RESPECTIVOS OBJETOS 
//-----------------------------------------------------------------------------------------------
  function retornaAprincipal(){
     var urlCliente = ctxRoot + "/modules/CuentasIndividuales/MovimientosCuentas/PrincipalMovimientosCuentas.do";
     makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipal, null);
  }

function despliegaPantallaPrincipal(obj,result){
    GI("dvPantalla").innerHTML = result; // pestaña
    //GI("dvContenido").innerHTML = result;
    
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/MovimientosCuentas/PrincipalMovimientosCuentas.js");
      initForms();
      //retornando valores globales
      SA(GI("cmbNivel1"),"next","cargaDatosNiveles2");
      loadElementDo(GI("cmbNivel1"));
      GI("FechaDel").value = vgFechaDel;
      GI("FechaAl").value = vgFechaAl
      /////Asignaciones para checkboxes
      if(vgChkDeposito)
        GI("chkDeposito").checked=true;
    else
        GI("chkDeposito").checked=false;
    if(vgChkRetiro)
       GI("chkRetiro").checked  = true;
    else
        GI("chkRetiro").checked = false;
}


/*function llenaCombos(){
  GI("cmbNivel1").value = vgCombo1; 
  
}*/

function cargaDatosNiveles2() {
  objDatosNivelesParam2.id = "con3NumNivNomNivLogNivFid";
  objDatosNivelesParam2.Fideicomiso = numContrato;
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosNivelesParam2);
  makeAjaxRequest(url, "HTML", asignaDatosNiveles2, null);
}

function asignaDatosNiveles2(obj, result) {
  objDatosNivelesParam2 = JSON.parse(result);
  if(!isDefinedAndNotNull(objDatosNivelesParam2.codigoError))
  {
    numNiveles = objDatosNivelesParam2.length;
    longMax=0;
    for(i=0; i<numNiveles; i++)
    {
      longMax += objDatosNivelesParam2[i].lonNivel;
    }
   acumulaLongitud=0;
   nivelActual=1
   recargarCombosPantallaPrincipal()
  }
  else
    hideWaitLayer();
}

function recargarCombosPantallaPrincipal(){
  cmbNivelParam.inicioNivel = 1 + acumulaLongitud;
  cmbNivelParam.longitudNivel = objDatosNivelesParam2[nivelActual-1].lonNivel;
  cmbNivelParam.Fideicomiso = numContrato;
  cmbNivelParam.Nivel = nivelActual;
  
  cmbNivelParam.parentNivel = (nivelActual==1) ? 0 : eval("GI('cmbNivel"+(nivelActual-1)+"').value");
  SA(eval("GI('cmbNivel"+nivelActual+"')"),"next","reAsignaValorCombo");
  loadElementDo(eval("GI('cmbNivel"+nivelActual+"')"));
}

function reAsignaValorCombo() {
  try{
    SA(eval("GI('cmbNivel"+nivelActual+"')"),"next","formsLoaded");
    var valorKeyCombo = valorKeyCombo2.substring(0,acumulaLongitud+objDatosNivelesParam2[nivelActual-1].lonNivel);
    valorKeyCombo = formatString(valorKeyCombo,"0",longMax,"Derecha");
    GI("cmbNivel"+nivelActual).value = valorKeyCombo;
    //SA(eval("GI('cmbNivel"+nivelActual+"')"),"value",valorKeyCombo);
    acumulaLongitud += objDatosNivelesParam2[nivelActual-1].lonNivel;
    nivelActual++;
    if(nivelActual <= objDatosNivelesParam2.length)
      recargarCombosPantallaPrincipal();
    else
      formsLoaded();
      principalAceptar();
  }catch(e){alert(JSON.stringify(e));}
}
//*************************************************************************************************************************************************************************


//-- Contabilidad---

var cmbScta = JSON.parse("{\"Fideicomiso\":0}");
var cmbCtoInver = JSON.parse("{\"Fideicomiso\":0}");//Cto Inver Origen


function contabilidadCtasIndiv()
{ 
  if(operacion==MODIFICAR||operacion==CONSULTAR)// deshabilitar si no es Alta
  {
    deshabilitaCampos("movContabilizar,movScta,movCtaCheques");
  }
  else // es Alta
  {  
    deshabilitaCampos("movScta,movCtaCheques");
  }
}

function cargaCmbCtaCheques(objCmb)// onchange combo Subcuentas
{
  cmbCtoInver = JSON.parse("{\"Fideicomiso\":"+GI("movContrato").value+",\"SubCuenta\":"+objCmb.value+"}");
  loadElement(GI("movCtaCheques"));  
}

function chkContabiliza(objChk)
{
  if(objChk.checked)
  {
    habilitaCampos("movScta,movCtaCheques");
    cmbScta = JSON.parse("{\"Fideicomiso\":"+GI("movContrato").value+"}");
    loadElement(GI("movScta"));
  }
  else
  {
    deshabilitaCampos("movScta,movCtaCheques");
  }
  
}

function contabilizarCtasIndiv()
{
  if(GI("movScta").selectedIndex>0&&GI("movCtaCheques").selectedIndex>0)// selecciono subcta y cta cheques
  {
  
    var surl = "\"id\":\"ejeFunContabilizaCtasIndiv\",";
      surl += "\"fideicomiso\":"+GI("movContrato").value+",";
      surl += "\"pensionado\":"+GI("cmbNivel2").value+",";
      surl += "\"subcuenta\":"+GI("movScta").value+",";
      surl += "\"ctaCheques\":"+GI("movCtaCheques").value+",";
      surl += "\"importe\":"+GI("movImporte").value+",";
      surl += "\"fecha\":\""+GI("movFecOper").value+"\",";
      surl += "\"opcion\":"+(GI("movTipoOper").checked?1:2)+","; // 1 - Deposito 2 - Retiro
      surl += "\"usuario\":"+ctxUser+"";
    
    var url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    makeAjaxRequest(url,"HTML",contabilizarCtasIndivResp,null);
      
    return true;
  }
  else// faltan datos
  {
    alert("Seleccione Cuenta de Cheques y Subcuenta");
    return false;
  }
}

function contabilizarCtasIndivResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  
  switch(eval(res))
  {
    case 0:
      break;
    case 1:
      alert("Error al Contabilizar");
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
}



//-- Contabilidad---
