var catActividades = new Catalogo("mx.com.inscitech.fiducia.domain.Activida");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroActividadesEconomicas\",\"numRama\":0,\"numSrama\":0}");

var validacionBaja1 = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numRama\":0,\"numSrama\":0}");
var validacionBaja2 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad1\",\"numRama\":0,\"numSrama\":0}");
var validacionBaja3 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad2\",\"numRama\":0,\"numSrama\":0}");
var validacionBaja4 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad3\",\"numRama\":0,\"numSrama\":0}");

var tablaDatosActividadesData = new Array();
tablaDatosActividadesData[0] = "actNumRama,70px";
tablaDatosActividadesData[1] = "actNumSrama,70px";
tablaDatosActividadesData[2] = "actNomRama,300px";
tablaDatosActividadesData[3] = "actCveStRama,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoActividades = new FormValidator();
var CONSULTAR = 3;

formsLoaded();

function cargaPrincipalCatalogosGeneralesActividadesEconomicas() {
  onButtonClick("ControlGestion.PrincipalCatalogosGeneralesActividadesEconomicas","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catActividades.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    validacionBaja1.numRama = pkInfo.actNumRama;
    validacionBaja1.numSrama = pkInfo.actNumSrama;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja1);
    makeAjaxRequest(url, "HTML", validandoBaja1, null);
  }
}

function validandoBaja1(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    alert("No se puede dar de baja, la Actividad se encuentra asignada a Fideicomisos");
    hideWaitLayer();
  }
  else
  {
    validacionBaja2.numRama=pkInfo.actNumRama;
    validacionBaja2.numSrama=pkInfo.actNumSrama;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja2);
    makeAjaxRequest(url, "HTML", validandoBaja2, null);
  }
}

function validandoBaja2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeDependencia > 0)
  {
    alert("No se puede dar de baja, la Actividad se encuentra asignada a Fideicomitentes");
    hideWaitLayer();
  }
  else
  {
    validacionBaja3.numRama=pkInfo.actNumRama;
    validacionBaja3.numSrama=pkInfo.actNumSrama;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja3);
    makeAjaxRequest(url, "HTML", validandoBaja3, null);
  }
}

function validandoBaja3(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeDependencia > 0)
  {
    alert("No se puede dar de baja, la Actividad se encuentra asignada a Fideicomisarios");
    hideWaitLayer();
  }
  else
  {
    validacionBaja4.numRama=pkInfo.actNumRama;
    validacionBaja4.numSrama=pkInfo.actNumSrama;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja4);
    makeAjaxRequest(url, "HTML", validandoBaja4, null);
  }
}

function validandoBaja4(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeDependencia > 0)
  {
    alert("No se puede dar de baja, la Actividad se encuentra asignada a Terceros");
    hideWaitLayer();
  }
  else
  {
    catActividades.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catActividades);
  }
}


function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralesActividadesEconomicas();
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoAutorizacionesControlGestion)
function cargaMantenimientoCatalogosGeneralesActividadesEconomicas(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosGeneralesActividadesEconomicas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoActividades.setup({
    formName      : "frmMantenimientoCatalogosGeneralesActividadesEconomicas",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catActividades.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catActividades.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("actNumRama,actNumSrama".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosGeneralesActividadesEconomicas"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catActividades.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoActividades.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catActividades.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoActividades.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catActividades.modificaCatalogo();
  }
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("actNumRama").value!="" && GI("actNumSrama").value!="")
  {
    showWaitLayer();
    validacionAlta.numRama = GI("actNumRama").value;
    validacionAlta.numSrama = GI("actNumSrama").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La clave ya existe, verifique");
    GI("actNumRama").value="";
    GI("actNumSrama").value="";
  }
  hideWaitLayer();
}


/* es actividad padre? o subactividad? */

function esActividadPadre(objChk)
{
  if(objChk.checked)
  {
    GI('paramEsActividadPadre').value = 0;
  }else
  {
    GI('paramEsActividadPadre').value = '';
  }
}