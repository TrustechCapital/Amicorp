var catProspectosFideicomisarios = new Catalogo("mx.com.inscitech.fiducia.domain.Afidben");

var clavesCombo23 = JSON.parse("{\"llaveClave\":23}");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraNombreAnteproyecto\",\"numAnteproyecto\":0}");
var validacionAlta = JSON.parse("{\"id\":\"cuentaAnteproyectosBajaProspectos\",\"numProspecto\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaFideicomitente\",\"cvePersona\":0,\"numFidben\":0,\"anteproyecto\":0}");

var contenedor = new Object();

initForms();

var tablaFideicomisariosData = new Array();
tablaFideicomisariosData[0] = "afbAnteproyecto,70";
tablaFideicomisariosData[1] = "afbNumFidben,104";
tablaFideicomisariosData[2] = "afbNomFidben,296";
tablaFideicomisariosData[3] = "afbCveStFidBen,100";

var operacion = 0;
numPantalla = 0;
pkInfo=null;
var parametroComboEstado;
var usarSetValuesFormObject=false;
var fvMantenimientoFideicomisarios = new FormValidator();

//No permitir editar el campo informativo de la página principal:
//1. Nombre del proyecto (Nombre del negocio)
//deshabilitaPK("txtNomProyecto".split(","));

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalProspectosFideicomisarios() {
  onButtonClickPestania("Formalizacion.PrincipalProspectosFideicomisarios","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catProspectosFideicomisarios.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalProspectosFideicomisarios();
  hideWaitLayer();
}


function operacionExitosaKYC() {

  alert("La operación se realizó correctamente");
  //cargaPrincipalProspectosFideicomisarios();
  ocultaObjs("cmdAceptar");
  SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisarios"));
  cargaCheckList();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoFideicomisarios(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosFideicomisarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProspectosFideicomisarios, null);
  }
}

function despliegaPantallaMantenimientoProspectosFideicomisarios(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoFideicomisarios.setup({
    formName      : "frmDatosMantenimientoFideicomisarios",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //No permitir editar el campo informativo de la página de mantenimiento:
  //1. Nombre del proyecto (Nombre del negocio)
  deshabilitaPK("txtNomProyecto,txtTipoPersona,txtTipoNegocio,txtClasificacion,txtProducto,afbCvePersona,afbNumFidben".split(","));
}

function loadCatalogo() {
  catProspectosFideicomisarios.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catProspectosFideicomisarios.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  //cargaParamComboEstado(GI("afbNomPais"),true);
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("afbCvePersona,afbNumFidben,afbAnteproyecto".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisarios"));
    // muestraObjs("cmdKYC");
     cargaCheckList();
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar datos en campos informativos
  //mostrarDatosInformativos(3);
  formsLoaded();
}


function AltaOModificaInfo() {
  catProspectosFideicomisarios.setOnUpdate(operacionExitosaKYC);
  if(operacion==ALTA && fvMantenimientoFideicomisarios.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catProspectosFideicomisarios.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoFideicomisarios.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catProspectosFideicomisarios.modificaCatalogo();
  }
}




function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catProspectosFideicomisarios.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectosFideicomisarios);
  }
}

//////////////////////////////////////////////////////////////
//Funciones para cargar el combo Estado
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"llaveClaveEstado\": \"" +objCombo.value + "\"}");
  SA(GI("afbNomEstado"),"next","asignaEstado");
  loadElement(GI("afbNomEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectosFideicomisarios.getCatalogo());
  else
    GI("afbNomEstado").selectedIndex=0;
  
  formsLoaded();
}

//////////////////////////////////////////////////////////////
function consultarExistenciaFideicomisario() {
  /*if(GI("afbNumFidben").value!="" && GI("afbAnteproyecto").value!="")
  {
    validacionAlta2.cvePersona = GI("afbCvePersona").value;
    validacionAlta2.numFidben = GI("afbNumFidben").value;
    validacionAlta2.anteproyecto = GI("afbAnteproyecto").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificacionAlta2, null);
  }
  else*/ if(GI("afbAnteproyecto").value!="")
    mostrarDatosInformativos(2);
  else if(GI("afbAnteproyecto").value==""){
    GI("txtNomProyecto").value="";
	GI("txtTipoPersona").value="";
	GI("txtTipoNegocio").value="";
	GI("txtClasificacion").value="";
	GI("txtProducto").value="";
  }	
}

function verificacionAlta2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe ese registro, verifique");
    GI("afbNumFidben").value="";
    GI("afbAnteproyecto").value="";
    GI("txtNomProyecto").value="";
	GI("txtTipoPersona").value="";
	GI("txtTipoNegocio").value="";
	GI("txtClasificacion").value="";	
	GI("txtProducto").value="";
  }
  else
    mostrarDatosInformativos(2);
}

function mostrarDatosInformativos(parametroPantalla) {
  GI("txtNomProyecto").value="";
  showWaitLayer();
  if(parametroPantalla==1)
  {
    consultaDatosInformativos.numAnteproyecto = GI("paramProyecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
  else if(parametroPantalla==2)
  {
    var Secuencial = JSON.parse("{\"id\":\"numSecAfidben\",\"Anteproyecto\":0,\"Fideicomisarios\":\"BENEFICIARIO\"}");
    Secuencial.Anteproyecto=GI("afbAnteproyecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(Secuencial);
    makeAjaxRequest(url, "HTML", verificarSecuencial, null);
  }
  else
  {
    consultaDatosInformativos.numAnteproyecto = GI("afbAnteproyecto").value;
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
    GI("afbAnteproyecto").value="";
    GI("txtNomProyecto").value="";
    GI("afbNumFidben").value="";
    GI("afbAnteproyecto").focus();
    hideWaitLayer();
  }
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomProyecto").value=objResult[0].antNomNegocio;
  GI("txtTipoPersona").value=objResult[0].tipopersona;
  GI("txtTipoNegocio").value=objResult[0].tiponegocio;
  GI("txtClasificacion").value=objResult[0].clasificacion;  
  GI("txtProducto").value=objResult[0].producto;  
  hideWaitLayer();
}

function verificarSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("afbNumFidben").value=objResult[0].secNumAfidben;
  
  consultaDatosInformativos.numAnteproyecto = GI("afbAnteproyecto").value;
  validacionAlta.numProspecto = GI("afbAnteproyecto").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
  makeAjaxRequest(url, "HTML", verificarAlta, null);
}

/// enlace CHECKLIST-----------------

function cargaCheckList()
{
  contenedor.Proyecto = GI("afbAnteproyecto").value;
  contenedor.NumPersona = GI("afbNumFidben").value;
  contenedor.NomPersona = GI("afbNomFidben").value;
  contenedor.TPersona = "P"+GI("afbTipoPersona").value.substring(0,1)+((GI("afbNomPais").value=="MEXICO")?"NAC":"EXT");
  var url = ctxRoot + "/modules/Formalizacion/KYC/PrincipalCheckList.do";
  makeAjaxRequest(url, "HTML", cargaParametros, contenedor);
  loadDynamicJS(ctxRoot + "/modules/Formalizacion/KYC/PrincipalCheckList.js");
}


function cargaParametros(obj,result)
{
  GI("cargaCheck").innerHTML = result;
  //initForms();
  GI("paramProyecto").value= obj.Proyecto;
  GI("paramTPersona").value= obj.TPersona;
  GI("paramNumPersona").value= obj.NumPersona;
  GI("paramNomPersona").value= obj.NomPersona;
  GI("idRegresar").value = 2;
   GI("paramTipo").value = 2;
  
 var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunCargaConceptosKYCProyecto\",\"TPersona\":\"" + obj.TPersona + "\",\"Proyecto\":" + obj.Proyecto + ",\"Tipo\":" + 2 + ",\"NumPersona\":" + obj.NumPersona + "}";
 
 makeAjaxRequest(url, "HTML",cargaConceptosKYC,null);
}

function cargaConceptosKYC(obj,result){
  var resultado = JSON.parse(result).result;
  switch(resultado){
    case 0:
        consultar(GI("cmdCargar"), GI('frmCheckList'), false);
    break;
    case 1:
      alert("No hay Conceptos para esta Persona");
    break;
  }
  hideWaitLayer();
  GI('ContenedorKYC').style.visibility='visible';
  GI('cargaConceptos').innerHTML='<div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div>';
}


