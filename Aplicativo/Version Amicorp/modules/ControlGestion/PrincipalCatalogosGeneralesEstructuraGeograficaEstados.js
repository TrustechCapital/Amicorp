var catEstados = new Catalogo("mx.com.inscitech.fiducia.domain.Estados");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroEstado\",\"numEstado\":0,\"numPais\":0}");

initForms();

var tablaDatosEstadosData = new Array();
tablaDatosEstadosData[0] = "paiNomPais,200px";
tablaDatosEstadosData[1] = "edoNomEstado,200px";
tablaDatosEstadosData[2] = "edoAbrvEstado,110px";
tablaDatosEstadosData[3] = "edoHrDiferencia,110px";
tablaDatosEstadosData[4] = "edoMinDiferencia,110px";
tablaDatosEstadosData[5] = "edoCveStEstado,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvPrincipalEstados = new FormValidator();
var fvMantenimientoEstados = new FormValidator();

var parametroComboEstado;
var usarSetValuesFormObject=false;
var CONSULTAR = 3;

//Agregando la funcionalidad del required
fvPrincipalEstados.setup({
  formName      : "frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaPrincipalCatalogosGeneralEstructuraGeograficaEstados() {
  onButtonClick("ControlGestion.PrincipalCatalogosGeneralesEstructuraGeograficaEstados","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catEstados.getCatalogo());
}

function buscarRegistros() {
  if(fvPrincipalEstados.checkForm())
    consultar(GI("cmdAceptar"), GI("frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados"), false);
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosGeneralesEstructuraGeograficaEstado)
function cargaMantenimientoCatalogosGeneralesEstructuraGeograficaEstado(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosGeneralesEstructuraGeograficaEstado.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoEstados.setup({
    formName      : "frmMantenimientoCatalogosGeneralesEstructuraGeograficaEstados",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

///////////////////////////
function loadCatalogo() {
  catEstados.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catEstados.buscaCatalogoPK(false);
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
    deshabilitaPK("edoNumEstado,edoNumPais".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosGeneralesEstructuraGeograficaEstados"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catEstados.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoEstados.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catEstados.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoEstados.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catEstados.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catEstados.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catEstados);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralEstructuraGeograficaEstados();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("edoNumPais").value!=-1 && GI("edoNumEstado").value!="")
  {
    showWaitLayer();
    validacionAlta.numEstado = GI("edoNumEstado").value;
    validacionAlta.numPais = GI("edoNumPais").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El estado ya existe, verifique");
    GI("edoNumPais").selectedIndex=0;
    GI("edoNumEstado").value="";
  }
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Estados luego de haber elegido alguna opción del combo Paises
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  
  parametroComboEstado = JSON.parse("{\"clavePais\":" +eval(objCombo.value) + "}");
  SA(GI("paramEstado"),"next","asignaEstado");
  loadElement(GI("paramEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(catEstados.getCatalogo());
  }
  else
    GI("paramEstado").selectedIndex=0;
  
  formsLoaded();
}