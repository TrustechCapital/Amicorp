var catProspectosPoderes = new Catalogo("mx.com.inscitech.fiducia.domain.Poderes");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo96 = JSON.parse("{\"llaveClave\":96}");
var clavesCombo1001 = JSON.parse("{\"llaveClave\":1001}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var paramOrderNotario = JSON.parse("{\"order\":\"s\"}");

initForms();

var tablaPoderesData = new Array();
tablaPoderesData[0] = "podNumContrato,80";
tablaPoderesData[1] = "podNomApoderado,300";
tablaPoderesData[2] = "podEscrituraOto,175";
tablaPoderesData[3] = "podNotarioOto,200";
tablaPoderesData[4] = "podCveStPoderes,100";

var operacion = 0;
var numPantalla = 0;
pkInfo=null;
var fechaEscritura = new Date();
var fechaSolicitud = new Date();
var fechaEscrituraOtorgamiento = new Date();
var fechaRegistroOtorgamiento = new Date();
var fechaSolicitudOtorgamiento = new Date();
var fechaSolicitudRevocacion = new Date();
var fechaEscrituraRevocacion = new Date();
var fechaRegistroRevocacion = new Date();

var fvMantenimientoPoderes = new FormValidator();

Calendar.setup({
    inputField     :    "paramFechaEscrituraOto",   // id of the input field
    button         :    "paramFechaEscrituraOto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaEscritura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
Calendar.setup({
    inputField     :    "paramFechaSolicitudOto",   // id of the input field
    button         :    "paramFechaSolicitudOto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaSolicitud,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });


/******* Cargar PrincipalProspectosPoderes.jsp****************/
function cargaPrincipalProspectosPoderes() {
  onButtonClickPestania("Formalizacion.PrincipalProspectosPoderes","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catProspectosPoderes.getCatalogo());
}

function operacionExitosa() {
  /*if(operacion==1)
  {
    pkInfo = JSON.parse("{\"podIdPoder\":" + GI("podIdPoder").value + ", \"podNumPoder\":" + GI("podNumPoder").value + "}");  
    operacion = 2;
  }*/
  alert("La operación se realizó correctamente");
  cargaPrincipalProspectosPoderes();
  hideWaitLayer();
}

/******* Cargar Base de Otorgamiento/Revocación desde PrincipalProspectosPoderes.jsp****************/
function cargaMantenimientoPoderesOtorgamientoRevocacion(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesOtorgamientoRevocacion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
  }
}

/******* Cargar Base de Otorgamiento/Revocación ****************/
function cargaMantenimientoPoderesOtorgamientoRevocacionTab() {
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesOtorgamientoRevocacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
}

/******* Cargar Solicitud de Otorgamiento ****************/
function cargaMantenimientoPoderesSolicitudOtorgamientoTab() {
  numPantalla = 2;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesSolicitudOtorgamiento.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
}

/******* Cargar Otorgamiento ****************/
function cargaMantenimientoPoderesOtorgamientoTab() {
  numPantalla = 3;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesOtorgamiento.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
}

/******* Cargar Solicitud de Revocacion ****************/
function cargaMantenimientoPoderesSolicitudRevocacionTab() {
  numPantalla = 4;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesSolicitudRevocacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
}

/******* Cargar Revocacion ****************/
function cargaMantenimientoPoderesRevocacionTab() {
  numPantalla = 5;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosPoderesRevocacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPoderes, null);
}


/********* Despliega el mantenimiento de la pantalla llamada **********/
function despliegaPantallaMantenimientoPoderes(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  if(numPantalla==1)
  {
    //Si se trata de una alta, colocar el Número del poder de forma automática
    if(operacion==ALTA)
    {
      GI("Tabs").style.visibility="hidden";       //Esconder los tabs
      ejecutaAsignaFolio(GI("podIdPoder"));
    }
    
    //Agregando la funcionalidad del required
    fvMantenimientoPoderes.setup({
      formName      : "frmDatosMantenimientoProspectosPoderesOtorgamientoRevocacion",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
  }
  
  if(numPantalla==2)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoPoderes.setup({
      formName      : "frmDatosMantenimientoProspectosPoderesSolicitudOtorgamiento",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    Calendar.setup({
    inputField     :    "podFecSolOto",   // id of the input field
    button         :    "podFecSolOto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaSolicitudOtorgamiento,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
  }
  
  if(numPantalla==3)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoPoderes.setup({
      formName      : "frmDatosMantenimientoProspectosPoderesOtorgamiento",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    Calendar.setup({
    inputField     :    "podFecEscrOto",   // id of the input field
    button         :    "podFecEscrOto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaEscrituraOtorgamiento,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "podFecRegOto",   // id of the input field
    button         :    "podFecRegOto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaRegistroOtorgamiento,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
  }
  
  if(numPantalla==4)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoPoderes.setup({
      formName      : "frmDatosMantenimientoProspectosPoderesSolicitudRevocacion",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    Calendar.setup({
    inputField     :    "podFecSolRev",   // id of the input field
    button         :    "podFecSolRev",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaSolicitudRevocacion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
  }
  
  if(numPantalla==5)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoPoderes.setup({
      formName      : "frmDatosMantenimientoProspectosPoderesRevocacion",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    Calendar.setup({
    inputField     :    "podFecEscrRev",   // id of the input field
    button         :    "podFecEscrRev",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaEscrituraRevocacion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "podFecRegRev",   // id of the input field
    button         :    "podFecRegRev",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaRegistroRevocacion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
  }
    
  if(operacion==ALTA && numPantalla!=1)
    deshabilitaPK("podNumPoder,podNumPoder2,podNumPoder3,podNumContrato,podTipoApoderado,podNomApoderado".split(","));
  
  deshabilitaPK("podCveStPoderes".split(","));
  GI("podNumContrato").disabled = true;
}


/*********** Abre un catálogo ***************/
function loadCatalogo() {
  catProspectosPoderes.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catProspectosPoderes.buscaCatalogoPK(false);
    
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    
  }
  formsLoaded();
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("podNumPoder,podNumPoder2,podNumPoder3,podNumContrato,podTipoApoderado,podNomApoderado".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    if(numPantalla==1)//Para la página de Otorgamiento/Revocación
      deshabilitaObjetos(GI("frmDatosMantenimientoProspectosPoderesOtorgamientoRevocacion"));                   //Deshabilita objetos (excepto botones)
    else if(numPantalla==2)//Para la página de Solicitud de Otorgamiento
      deshabilitaObjetos(GI("frmDatosMantenimientoProspectosPoderesSolicitudOtorgamiento"));                  //Deshabilita objetos (excepto botones)
    else if(numPantalla==3)//Para la página de Otorgamiento
      deshabilitaObjetos(GI("frmDatosMantenimientoProspectosPoderesOtorgamiento"));                  //Deshabilita objetos (excepto botones)
    else if(numPantalla==4)//Para la página de Solicitud de Revocación
      deshabilitaObjetos(GI("frmDatosMantenimientoProspectosPoderesSolicitudRevocacion"));                  //Deshabilita objetos (excepto botones)
    else if(numPantalla==5)//Para la página de Revocación
      deshabilitaObjetos(GI("frmDatosMantenimientoProspectosPoderesRevocacion"));                  //Deshabilita objetos (excepto botones)
    
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  
  cargaRadiosConMaster("podNumPoder","podNumPoder2,podNumPoder3");
  formsLoaded();
}

/**********************/
function AltaOModificaInfo() {
  catProspectosPoderes.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoPoderes.checkForm())//Se trata de una alta
  {
    hideWaitLayer();
    catProspectosPoderes.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoPoderes.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    modificaStatus();
    catProspectosPoderes.modificaCatalogo();
  }
}


function modificaStatus() {
  if(GI("podCveStPoderes").value=="ACTIVO" && numPantalla==2)
    GI("podCveStPoderes").value="EN TRAMITE OTORGAMIENTO";
  else if(GI("podCveStPoderes").value=="EN TRAMITE OTORGAMIENTO" && numPantalla==3)
    GI("podCveStPoderes").value="OTORGADO";
  else if(GI("podCveStPoderes").value=="OTORGADO" && numPantalla==4)
    GI("podCveStPoderes").value="EN TRAMITE REVOCACION";
  else if(GI("podCveStPoderes").value=="EN TRAMITE REVOCACION" && numPantalla==5)
    GI("podCveStPoderes").value="REVOCADO";
}


function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catProspectosPoderes.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectosPoderes);
  }
}


////////////////////////////////////////////////////
function validarPkAlta(objNumFiso) {
  validacionAlta.numContrato = GI("podNumContrato").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
  makeAjaxRequest(url, "HTML", verificarAlta, objNumFiso);
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionAlta2.numContrato = GI("podNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("podNumContrato").value="";
    obj.focus();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("podNumContrato").value="";
    obj.focus();
  }
}

//Ejecutando la asignación de Folio (Llave primaria: podNumPoder)
function ejecutaAsignaFolio(objFolio){
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunAsignaFolio\",\"TipoFolio\":34}";
  makeAjaxRequest(url, "HTML", asignaFolio, objFolio);
}

function asignaFolio(objFolio, result){
  var resultado = JSON.parse(result);
  objFolio.value = resultado;
  if(isDefinedAndNotNull(resultado)){
    //Se ejecuta la alta
  }else{
    alert("Error al asignar el folio de operación: "+resultado);
    cargaPrincipalProspectosPoderes();
    hideWaitLayer();
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


///////////////////////////////////////////////////////////////////////////
//Función para modificar los parámetros de búsqueda cuando se hace click en algún radio
function modificaParametrosBusqueda() {
  if(GI("Otorgamiento").checked)
  {
    SA(GI("paramEscrituraRev"), "id", "paramEscrituraOto");
    SA(GI("paramFechaEscrituraRev"), "id", "paramFechaEscrituraOto");
    SA(GI("paramFechaSolicitudRev"), "id", "paramFechaSolicitudOto");
    SA(GI("paramNotarioRev"), "id", "paramNotarioOto");
    SA(GI("paramAbogadoResponsableRev"), "id", "paramAbogadoResponsableOto");
  }
  else if(GI("Revocacion").checked)
  {
    SA(GI("paramEscrituraOto"), "id", "paramEscrituraRev");
    SA(GI("paramFechaEscrituraOto"), "id", "paramFechaEscrituraRev");
    SA(GI("paramFechaSolicitudOto"), "id", "paramFechaSolicitudRev");
    SA(GI("paramNotarioOto"), "id", "paramNotarioRev");
    SA(GI("paramAbogadoResponsableOto"), "id", "paramAbogadoResponsableRev");
  }
}


///////////////////////////////////////////////////////////////////////////
//Función para colocar el Número de Contrato como requerido o no requerido
function contratoNecesario(obj) {
  if(obj.id == "podNumPoder")
  {
    SA(GI("podNumContrato"), "required", "");
    SA(GI("podNumContrato"), "message", "El Número de Fideicomiso es un campo obligatorio cuando se selecciona la Referencia Fideicomiso");
    GI("podNumContrato").disabled = false;
  }
  else
  {
    RA(GI("podNumContrato"), "required");
    RA(GI("podNumContrato"), "message");
    GI("podNumContrato").disabled = true;
    GI("podNumContrato").value = "";
  }
  
  asignaValueRadio2Master('podNumPoder',obj)
}