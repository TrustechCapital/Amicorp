var catFisosCtasIndividuales = new Catalogo("mx.com.inscitech.fiducia.domain.ParamFisos");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroParamFisos\",\"numContrato\":0}");

var tablaFisosCuentasIndividualesData = new Array();
tablaFisosCuentasIndividualesData[0] = "ctoNumContrato,79";
tablaFisosCuentasIndividualesData[1] = "pctoParticip,112";
tablaFisosCuentasIndividualesData[2] = "descripcion,292";
tablaFisosCuentasIndividualesData[3] = "estatus,100";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoFisosCtasInd = new FormValidator();
var numContrato = GI("paramFideicomiso").value;

hideWaitLayer();

function cargaPrincipalFideicomisosCuentasIndividuales() {
  onButtonClickPestania("CuentasIndividuales.FideicomisosCuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catFisosCtasIndividuales.getCatalogo());
}

function limpiar(){
  GI("paramFideicomiso").value="";
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoFideicomisosCuentasIndividuales)
function cargaMantenimientoFideicomisosCuentasIndividuales(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/CuentasIndividuales/FideicomisosCuentasIndividuales/MantenimientoFideicomisosCuentasIndividuales.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoFisosCtasInd.setup({
    formName      : "frmMantenimientoFideicomisosCuentasIndividuales",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catFisosCtasIndividuales.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catFisosCtasIndividuales.buscaCatalogoPK(false);
  else
    formsLoaded();
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("ctoNumContrato".split(","));
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmMantenimientoFideicomisosCuentasIndividuales"));         //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoFideicomisosCuentasIndividuales").cmdAceptar, "LKD", "true");
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    ocultaObj("cmdAceptar");
    //SA(GI("frmMantenimientoFideicomisosCuentasIndividuales").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  
  //consultaNombreFideicomiso("nomFideicomiso",GI("ctoNumContrato"));
  formsLoaded();
}

function AltaOModificaInfo() {
  catFisosCtasIndividuales.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoFisosCtasInd.checkForm())//Se trata de una alta
    catFisosCtasIndividuales.altaCatalogo();
  else if(operacion==MODIFICAR && fvMantenimientoFisosCtasInd.checkForm())//Se trata de una modificación
     catFisosCtasIndividuales.modificaCatalogo();
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catFisosCtasIndividuales.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catFisosCtasIndividuales);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalFideicomisosCuentasIndividuales();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==ALTA && GI("ctoNumContrato").value!="")
  {
    validacionAlta.numContrato = GI("ctoNumContrato").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0) //Si el registro ya existe
  {
    alert("La clave ya existe, verifique");
    GI("ctoNumContrato").value="";
  }
  else  //Si el registro aún no existe: ejecutar en el DIV
    consultaNombreFideicomiso("nomFideicomiso",GI("ctoNumContrato"));
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    
  
}

function resultrefer(obj, result) {
   //alert("hola")
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    //nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 