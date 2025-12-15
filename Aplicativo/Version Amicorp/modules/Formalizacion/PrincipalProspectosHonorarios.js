var catProspectosHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Aphono");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo6   = JSON.parse("{\"llaveClave\":6}");
var clavesCombo9   = JSON.parse("{\"llaveClave\":9}");
var clavesCombo10  = JSON.parse("{\"llaveClave\":10}");
var clavesCombo31  = JSON.parse("{\"llaveClave\":31}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraNombreAnteproyecto\",\"numAnteproyecto\":0}");
var validacionAlta = JSON.parse("{\"id\":\"cuentaAnteproyectosBajaProspectos\",\"numProspecto\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaHonorarios\",\"anteproyecto\":0}");

initForms();

var tablaHonorariosData = new Array();
tablaHonorariosData[0] = "ahoAnteproyecto,80";
tablaHonorariosData[1] = "antNomNegocio,300";
tablaHonorariosData[2] = "ahoNumDiaCorte,100";
tablaHonorariosData[3] = "ahoCvePeriodic,200";
tablaHonorariosData[4] = "ahoCveEstado,100";

var operacion = 0;
var numPantalla = 0;
pkInfo=null;
var fvMantenimientoHonorarios = new FormValidator();


//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalProspectosHonorarios() {
  onButtonClickPestania("Formalizacion.PrincipalProspectosHonorarios","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catProspectosHonorarios.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalProspectosHonorarios();
  hideWaitLayer();
}


//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoHonorarios(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosHonorarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProspectosHonorarios, null);
  }
}

function despliegaPantallaMantenimientoProspectosHonorarios(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoHonorarios.setup({
    formName      : "frmDatosMantenimientoHonorarios",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //No permitir editar el campo informativo de la página de mantenimiento:
  //1. Nombre del proyecto (Nombre del negocio, Nombre del fideicomiso)
  deshabilitaPK("txtNomProyecto".split(","));
}

function loadCatalogo() {
  catProspectosHonorarios.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catProspectosHonorarios.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("ahoAnteproyecto".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoHonorarios"));                  //Deshabilita objetos (excepto botones)
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar datos en campos informativos
  mostrarDatosInformativos(3);
  formsLoaded();
}

function AltaOModificaInfo() {
  catProspectosHonorarios.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoHonorarios.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catProspectosHonorarios.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoHonorarios.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catProspectosHonorarios.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catProspectosHonorarios.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectosHonorarios);
  }
}

//////////////////////////////////////////////////////////////
function consultarExistenciaHonorarios(objeto) {
  if(GI("ahoAnteproyecto").value!="")
  {
    validacionAlta2.anteproyecto = GI("ahoAnteproyecto").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificacionAlta2, objeto);
  }
  else
    GI("txtNomProyecto").value="";
}

function verificacionAlta2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe ese registro, verifique");
    GI("ahoAnteproyecto").value="";
    GI("txtNomProyecto").value="";
    obj.focus();
  }
  else
    mostrarDatosInformativos(2);
}

function mostrarDatosInformativos(parametroPantalla) {
  GI("txtNomProyecto").value="";
  
  consultaDatosInformativos.numAnteproyecto = GI("ahoAnteproyecto").value;
  if(parametroPantalla==2)
  {
    validacionAlta.numProspecto = GI("ahoAnteproyecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, null);
  }
  else
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].totalAnteproy > 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
  else
  {
    alert("El Proyecto no existe, verifique");
    GI("txtNomProyecto").value="";
  }
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomProyecto").value=objResult[0].antNomNegocio;
}


//Desactiva los checks restantes al elegir uno de ellos
function desactivarChecksRestantes(obj) {
  if(obj.checked)
  {
    if(obj.name != "ahoCveImpFijoChk")
      GI("ahoCveImpFijoChk").checked = false;
    if(obj.name != "ahoCvePjePactadChk")
      GI("ahoCvePjePactadChk").checked = false;
    if(obj.name != "ahoCveTablaCalcChk")
      GI("ahoCveTablaCalcChk").checked = false;
    if(obj.name != "ahoCveExentoChk")
      GI("ahoCveExentoChk").checked = false;
  }
}