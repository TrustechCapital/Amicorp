var catOpciones = new Catalogo("mx.com.inscitech.fiducia.domain.Opcenc");

var validacionAltaOpciones = JSON.parse("{\"id\":\"verificaExistenciaRegistroOpciones\",\"numOpcion\":0}");

var tablaDatosOpcionesData = new Array();
tablaDatosOpcionesData[0] = "oecNumOpcion,100px";
tablaDatosOpcionesData[1] = "oecDescripcionOpcion,250px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoOpciones = new FormValidator();
var CONSULTAR = 3;

formsLoaded();

function cargaPrincipalEncuestaOpcionesControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalEncuestaOpcionesControlGestion","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catOpciones.getCatalogo());
}


function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catOpciones.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catOpciones);
  }
}


////////////////////////////////////////////////////////////////////////////////
//SEGUNDA PANTALLA Y FUNCIONES QUE SE USARÁN EN ELLA
//Carga la Segunda Pantalla (MantenimientoEncuenstaOpcionesControlGestion)
function cargaMantenimientoEncuenstaOpcionesControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoEncuestaOpcionesControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoOpciones.setup({
    formName      : "frmMantenimientoEncuestaOpcionesControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}

function loadCatalogo() {
  catOpciones.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catOpciones.buscaCatalogoPK(false);
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
    deshabilitaPK("oecNumOpcion".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoEncuestaOpcionesControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catOpciones.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoOpciones.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catOpciones.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoOpciones.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catOpciones.modificaCatalogo();
  }
}


function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalEncuestaOpcionesControlGestion();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistroOpciones() {
  if(operacion==OPER_ALTA && GI("oecNumOpcion").value!="")
  {
    showWaitLayer();
    validacionAltaOpciones.numOpcion = GI("oecNumOpcion").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaOpciones);
    makeAjaxRequest(url, "HTML", verificacionAltaOpciones, null);
  }
}

function verificacionAltaOpciones(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El registro ya existe, verifique");
    GI("oecNumOpcion").value="";
  }
  hideWaitLayer();
}
