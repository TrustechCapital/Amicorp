var catSubCuenta = new Catalogo("mx.com.inscitech.fiducia.domain.FCambNvmanual");


var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo29 = JSON.parse("{\"llaveClave\":29}");
var clavesCombo1004 = JSON.parse("{\"llaveClave\":1004}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroSubCuentaPB\",\"Fideicomiso\":0,\"numSubCuenta\":0}");

initForms();

var tablaDatosSubCuentasData = new Array();
tablaDatosSubCuentasData[0] = "fcnFideicomiso,70px";
tablaDatosSubCuentasData[1] = "fcnTipoPers,270px";
tablaDatosSubCuentasData[2] = "fcnRfc,130px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var frmMantenimientoCatalogoSubCuentas = new FormValidator();
var CONSULTAR = 3;

function cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises() {
  onButtonClickPestania("Otros.PrincipalSubCuentas","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosGeneralesEstructuraGeograficaPaises)
function cargaMantenimientoSubCuentas(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Otros/MantenimientoSubCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  frmMantenimientoCatalogoSubCuentas.setup({
    formName      : "frmMantenimientoCatalogoSubCuentas",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
hideWaitLayer();
}

///////////////////////////
function loadCatalogo() {
  catSubCuenta.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catSubCuenta.buscaCatalogoPK(false);
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
    //deshabilitaPK("fcnFideicomiso,fcnTipoPers,fcnRfc".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogoSubCuentas"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catSubCuenta.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && frmMantenimientoCatalogoSubCuentas.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catSubCuenta.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && frmMantenimientoCatalogoSubCuentas.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catSubCuenta.modificaCatalogo();
  }
  
  
  var objCargaMasivaParam = JSON.parse("{\"id\":\"ejeFunCargaMasivacambioRiesgo\"}");
    objCargaMasivaParam.Fideicomiso = GI("fcnFideicomiso").value;
	objCargaMasivaParam.TipoPersona = GI("fcnTipoPers").value;
	objCargaMasivaParam.Rfc = GI("fcnRfc").value;  
	objCargaMasivaParam.NivelRiesgo = GI("fcnNivelRiesgo").value;    
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objCargaMasivaParam);
  makeAjaxRequest(url, "HTML", validaCargaMasiva, null);  
}

function validaCargaMasiva(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado == "CORRECTO"||resultado == "0"){
      alert("Proceso concluido satisfactoriamente!");
      cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises();
    }else if(resultado == "NORFC")
      alert("No existe algun tipo de Persona con ese RFC!");
    else if(resultado == "ERROR NUM COLS")
      alert("Número de columnas invalido!");
    else if(resultado == "ERROR NUM SPD")
      alert("Error de dato númerico que no debería tener punto décimal!");
    else if(resultado == "ERROR NUM CPD")
      alert("Error de dato númerico que maneja punto décimal!");
    else if(resultado == "ERROR PROC. ASIGNADO")
      alert("Error al procesar el rubro de asignado!");
    else if(resultado == "ERROR PROC. COMPROMETIDO")
      alert("Error al procesar el rubro de comprometido!");
    else if(resultado == "ERROR PROC. EJERCIDO")
      alert("Error al procesar el rubro de ejercido!");
    if(resultado == "ERROR ORACLE")
      alert("Ocurrió un error inesperado (oracle)!");
    }
  else
    alert("Ocurrió un error inesperado!"+resultado);
  hideWaitLayer();
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    catSubCuenta.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catSubCuenta);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("fcnFideicomiso").value!="" && GI("fcnTipoPers").value!="" && GI("fcnRfc").value!="")
  {
    showWaitLayer();
    validacionAlta.Fideicomiso = GI("fcnFideicomiso").value;
	validacionAlta.TipoPersona = GI("fcnTipoPers").value;
	validacionAlta.Rfc = GI("fcnRfc").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe un registro con esos datos, verifique");
    GI("fcnFideicomiso").value="";
	GI("fcnTipoPers").value="";
	GI("fcnRfc").value="";
  }
  hideWaitLayer();
}



function validarPkAlta(objeto) {
  if(GI("fcnFideicomiso").value!="")
  {
    var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
    validacionAlta.numContrato = GI("fcnFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, objeto);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = GI("fcnFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("fcnFideicomiso").value="";
	GI("fcnTipoPers").value="";
	GI("fcnRfc").value="";
    obj.focus();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("fcnFideicomiso").value="";
	GI("fcnTipoPers").value="";
	GI("fcnRfc").value="";
    obj.focus();
  }
  else
  {
    consultaNombreFideicomiso("nomFideicomiso",GI("fcnFideicomiso"));    
  }
}