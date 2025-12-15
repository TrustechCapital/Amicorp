var catPaises = new Catalogo("mx.com.inscitech.fiducia.domain.Paises");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroPais\",\"numPais\":0}");
var validacionBaja = JSON.parse("{\"id\":\"verificaDependenciaPais\",\"numPais\":0}");

initForms();

var tablaDatosPaisesData = new Array();
tablaDatosPaisesData[0] = "paiNumPais,70px";
tablaDatosPaisesData[1] = "paiNomPais,270px";
tablaDatosPaisesData[2] = "paiAbrPais,130px";
tablaDatosPaisesData[3] = "paiCveStPais,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoPaises = new FormValidator();
var CONSULTAR = 3;

function cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises() {
  onButtonClick("ControlGestion.PrincipalCatalogosGeneralesEstructuraGeograficaPaises","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catPaises.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosGeneralesEstructuraGeograficaPaises)
function cargaMantenimientoCatalogosGeneralesEstructuraGeograficaPaises(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosGeneralesEstructuraGeograficaPaises.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoPaises.setup({
    formName      : "frmMantenimientoCatalogosGeneralesEstructuraGeograficaPaises",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

///////////////////////////
function loadCatalogo() {
  catPaises.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catPaises.buscaCatalogoPK(false);
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
    deshabilitaPK("paiNumPais".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosGeneralesEstructuraGeograficaPaises"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catPaises.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoPaises.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catPaises.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoPaises.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catPaises.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    validacionBaja.numPais=pkInfo.paiNumPais;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja);
    makeAjaxRequest(url, "HTML", verificacionBaja, null);
  }
}

function verificacionBaja(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeDependencia > 0)
  {
    alert("El país no se puede eliminar porque tiene una dependencia");
    hideWaitLayer();
  }
  else
  {
    catPaises.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catPaises);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("paiNumPais").value!="")
  {
    showWaitLayer();
    validacionAlta.numPais = GI("paiNumPais").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe un registro con ese número, verifique");
    GI("paiNumPais").value="";
  }
  hideWaitLayer();
}