var catProspectosNotarios = new Catalogo("mx.com.inscitech.fiducia.domain.Notarios");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaNotario\",\"numNotario\":0}");

var tablaNotariosData = new Array();
tablaNotariosData[0] = "notNumOficNota,100";
tablaNotariosData[1] = "notNomNotario,300";
tablaNotariosData[2] = "notLocalidadNota,150";

var operacion = 0;
var numPantalla = 0;
pkInfo=null;
var parametroComboEstado;
var usarSetValuesFormObject=false;
var fvMantenimientoNotarios = new FormValidator();

formsLoaded();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalProspectosNotarios() {
  onButtonClickPestania("Formalizacion.PrincipalProspectosNotarios","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catProspectosNotarios.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalProspectosNotarios();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoNotarios(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosNotarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProspectosNotarios, null);
  }
}


function despliegaPantallaMantenimientoProspectosNotarios(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoNotarios.setup({
    formName      : "frmDatosMantenimientoNotarios",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true,
    showErrors    : true
  });
}

function loadCatalogo() {
  catProspectosNotarios.setOnUpdate(catLoaded);
  deshabilitaPK("notNumNotario".split(","));
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catProspectosNotarios.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    
    var Secuencial = JSON.parse("{\"id\":\"numSecNotarios\"}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(Secuencial);
    makeAjaxRequest(url, "HTML", verificarSecuencial, null);
  }
}

function verificarSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("notNumNotario").value=objResult[0].secNumNotario;
  hideWaitLayer();
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("notNumNotario".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoNotarios"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  
  cargaParamComboEstado(GI("notNomPais"),true);
  formsLoaded();
}

function AltaOModificaInfo() {
  //alert("Operacion: " + operacion);
  catProspectosNotarios.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoNotarios.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catProspectosNotarios.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoNotarios.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catProspectosNotarios.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catProspectosNotarios.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectosNotarios);
  }
}

//////////////////////////////////////////////////////////////
//Funciones para cargar el combo Estado
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"llaveClaveEstado\": \"" +objCombo.value + "\"}");
  SA(GI("notNomEstado"),"next","asignaEstado");
  loadElement(GI("notNomEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectosNotarios.getCatalogo());
  else
    GI("notNomEstado").selectedIndex=0;
  
  formsLoaded();
}

//////////////////////////////////////////////////////////////
function consultarExistenciaNotario() {
  if(GI("notNumNotario").value!="")
  {
    validacionAlta2.numNotario = GI("notNumNotario").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificacionAlta2, null);
  }
}

function verificacionAlta2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe ese registro, verifique");
    GI("notNumNotario").value="";
  }
}

