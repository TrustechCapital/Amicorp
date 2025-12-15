var catCalendarioSesiones = new Catalogo("mx.com.inscitech.fiducia.domain.Reuncom");

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraDatosFideicomisos\",\"NumFideicomiso\":0}");
var consultaDatosInformativos2 = JSON.parse("{\"id\":\"muestraDatosComiteTecnico\",\"NumFiso\":0}");
var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaCalendarioSesionesAdmon\",\"numContrato\":0,\"numReunion\":0,\"ano\":0,\"mes\":0,\"dia\":0}");

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");

initForms();

var tablaCalendarioSesionesData = new Array();
tablaCalendarioSesionesData[0] = "recNumContrato,90px";
tablaCalendarioSesionesData[1] = "recNumReunion,80px";
tablaCalendarioSesionesData[2] = "recAnoReunion,80px";
tablaCalendarioSesionesData[3] = "recMesReunion,80px";
tablaCalendarioSesionesData[4] = "recDiaReunion,80px";
tablaCalendarioSesionesData[5] = "recLugarReunion,250px";
tablaCalendarioSesionesData[6] = "recCveStReucom,90px";

var operacion = 0;
var numPantalla = 0;
var numParametroPantalla = 0;
pkInfo = null;
var fechaSesion1 = new Date();
var fechaSesion2 = new Date();
var fvMantenimientoCalendarioSesiones = new FormValidator();

Calendar.setup({
    inputField     :    "txtFechaSesion1",   // id of the input field
    button         :    "txtFechaSesion1",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaSesion1,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalCalendarioSesiones() {
  onButtonClickPestania("Administracion.PrincipalCalendarioSesionesComiteTecnico","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catCalendarioSesiones.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catCalendarioSesiones = new Catalogo("mx.com.inscitech.fiducia.domain.Reunsub");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCalendarioSesiones();
  hideWaitLayer();
}


//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoCalendarioSesiones(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoCalendarioSesionesComiteTecnico.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCalendarioSesiones, null);
  }
}

function despliegaPantallaMantenimientoCalendarioSesiones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoCalendarioSesiones.setup({
    formName      : "frmDatosCalendarioSesionesMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Para la funcionalidad del calendario
  Calendar.setup({
  inputField     :    "txtFechaSesion2",   // id of the input field
  button         :    "txtFechaSesion2",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaSesion2,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
  });
  
  //No permitir editar los campos informativos de la página de mantenimiento:
  //1. Nombre del fiso
  //2. Nombre del comité técnico
  deshabilitaPK("txtNomFiso,txtNomComite".split(","));
}


function loadCatalogo() {
  catCalendarioSesiones.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catCalendarioSesiones.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(numPantalla==1 && (operacion==MODIFICAR || operacion==CONSULTAR))
    GI("txtFechaSesion2").value=formatString(GI("recDiaReunion").value,"0",2,"Izquierda") + "/" + formatString(GI("recMesReunion").value,"0",2,"Izquierda") + "/" + GI("recAnoReunion").value;
  
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("recNumContrato,recNumReunion,txtFechaSesion2".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosCalendarioSesionesMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  mostrarDatosInformativos(3);
  formsLoaded();
}

function AltaOModificaInfo() {
  catCalendarioSesiones.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoCalendarioSesiones.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catCalendarioSesiones.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoCalendarioSesiones.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catCalendarioSesiones.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catCalendarioSesiones.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catCalendarioSesiones);
  }
}


//////////////////////////////////////////////////////////////////
function mostrarDatosInformativos(parametroPantalla) {
  numParametroPantalla = parametroPantalla;
  
  if(GI("recNumContrato").value!="")
  {
    GI("txtNomFiso").value="";
    GI("txtNomComite").value="";
    if(parametroPantalla==2)
    {
      consultaDatosInformativos.NumFideicomiso = GI("recNumContrato").value;
      consultaDatosInformativos2.NumFiso = GI("recNumContrato").value;
      validacionAlta.numContrato = GI("recNumContrato").value;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
      makeAjaxRequest(url, "HTML", verificarAlta, null);
    }
    else
    {
      consultaDatosInformativos.NumFideicomiso = GI("recNumContrato").value;
      consultaDatosInformativos2.NumFiso = GI("recNumContrato").value;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
      makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
    }
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionAlta2.numContrato = GI("recNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("recNumContrato").value="";
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("recNumContrato").value="";
  }
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomFiso").value=objResult[0].ctoNomContrato;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos2);
  makeAjaxRequest(url, "HTML", insertaDatosInformativos2, null);
}

function insertaDatosInformativos2(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomComite").value=objResult[0].conNomComite;
}

//Verificar al intentar dar de alta si el Registro aún no existe
function verificacionExistenciaRegistro(isNumContrato) {
  if(GI("recNumContrato").value!=""  && GI("recNumReunion").value!="" && GI("txtFechaSesion2").value!="")
  {
    validacionExistenciaRegistro.numContrato = GI("recNumContrato").value;
    validacionExistenciaRegistro.numReunion = GI("recNumReunion").value;
    validacionExistenciaRegistro.ano = GI("recAnoReunion").value;
    validacionExistenciaRegistro.mes = GI("recMesReunion").value;
    validacionExistenciaRegistro.dia = GI("recDiaReunion").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistenciaRegistroFunction, null);
  }
  if(GI("recNumContrato").value!="" && isNumContrato)
    mostrarDatosInformativos(2);
    
}

function verificacionExistenciaRegistroFunction(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Registro ya existe, verifique");
    GI("recNumContrato").value="";
    GI("recNumReunion").value="";
    GI("recNumReunion").value="";
    GI("recFechaSesion2").value="";
    GI("recAnoReunion").value="";
    GI("recMesReunion").value="";
    GI("recDiaReunion").value="";
  }
}


////////////////////////////////////////////////////////////////////////
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

function descomponeFecha1(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  GI("paramDiaSesion").value=fecha[0];
  GI("paramMesSesion").value=fecha[1];
  GI("paramAnoSesion").value=fecha[2];
}

function descomponeFecha2(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  GI("recDiaReunion").value=fecha[0];
  GI("recMesReunion").value=fecha[1];
  GI("recAnoReunion").value=fecha[2];
}
