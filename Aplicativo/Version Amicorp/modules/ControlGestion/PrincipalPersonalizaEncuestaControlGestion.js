var catPreguntas = new Catalogo("mx.com.inscitech.fiducia.domain.Persenc");
var catIncisos = new Catalogo("mx.com.inscitech.fiducia.domain.Incenc");

var validacionAltaPreguntas = JSON.parse("{\"id\":\"verificaExistenciaRegistroPreguntas\",\"numPregunta\":0}");
var validacionBajaPreguntas = JSON.parse("{\"id\":\"verificaExistenciaRegistroIncisos\",\"numPregunta\":0}");

var validacionAltaIncisos = JSON.parse("{\"id\":\"verificaExistenciaRegistroIncisos\",\"numPregunta\":0,\"numInciso\":0}");

var tablaDatosPreguntasData = new Array();
tablaDatosPreguntasData[0] = "pecNumPregunta,100px";
tablaDatosPreguntasData[1] = "pecDescrPregunta,300px";

var tablaDatosIncisosData = new Array();
tablaDatosIncisosData[0] = "ienNumInciso,90px";
tablaDatosIncisosData[1] = "ienDescrInciso,500px";

var operacionPreguntas = 0;
var operacionIncisos = 0;
var numPantalla = 0;
pkInfo = null;
var CONSULTAR = 3;

var pkInfoPreguntas = null;
var pkInfoIncisos = null;
var fvMantenimientoPreguntas = new FormValidator();
var fvMantenimientoIncisos = new FormValidator();

formsLoaded();

function cargaPrincipalPersonalizaEncuestaControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalPersonalizaEncuestaControlGestion","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
}

function eliminarRegistroPreguntas() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    //Verificar que el Registro no tenga dependencias
    validacionBajaPreguntas.numPregunta = pkInfo.pecNumPregunta;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBajaPreguntas);
    makeAjaxRequest(url, "HTML", verificacionBajaPreguntas, null);
  }
}

function verificacionBajaPreguntas(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La pregunta no puede ser eliminada, tiene incisos asignados");
    hideWaitLayer();
  }
  else
  {
    catPreguntas.setOnUpdate(operacionExitosaPreguntas);
    eliminaCatalogo(catPreguntas);
  }
}



////////////////////////////////////////////////////////////////////////////////
//SEGUNDA PANTALLA Y FUNCIONES QUE SE USARÁN EN ELLA
//Carga la Segunda Pantalla (MantenimientoPersonalizaEncuenstaControlGestion)
function cargaMantenimientoPersonalizaEncuenstaControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacionPreguntas = tipoPantalla;
    numPantalla = 1;
    pkInfoPreguntas = pkInfo;
    pkInfo = null;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoPersonalizaEncuestaControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPreguntas, null);
  }
}

function despliegaPantallaPreguntas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoPreguntas.setup({
    formName      : "frmMantenimientoPersonalizaEncuestaControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogoPreguntas();
}

function loadCatalogoPreguntas() {
  catPreguntas.setOnUpdate(catLoadedPreguntas);
  if(operacionPreguntas==OPER_MODIFICAR || operacionPreguntas==CONSULTAR)
  {
    //Asignar llave primaria a la pantalla de mantenimiento
    GI("pecNumPregunta").value = pkInfoPreguntas.pecNumPregunta;
    catPreguntas.buscaCatalogoPK();
  }
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoadedPreguntas() {
  if(operacionPreguntas==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("pecNumPregunta".split(","));
  }
  else if(operacionPreguntas==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoPersonalizaEncuestaControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfoPreguntas() {
  catPreguntas.setOnUpdate(operacionExitosaPreguntas);
  if(operacionPreguntas==OPER_ALTA && fvMantenimientoPreguntas.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catPreguntas.altaCatalogo();
  }
  else if(operacionPreguntas==OPER_MODIFICAR && fvMantenimientoPreguntas.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catPreguntas.modificaCatalogo();
  }
}


function operacionExitosaPreguntas() {
  alert("La operación se realizó correctamente");
  cargaPrincipalPersonalizaEncuestaControlGestion();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistroPreguntas() {
  if(operacionPreguntas==OPER_ALTA && GI("pecNumPregunta").value!="")
  {
    showWaitLayer();
    validacionAltaPreguntas.numPregunta = GI("pecNumPregunta").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaPreguntas);
    makeAjaxRequest(url, "HTML", verificacionAltaPreguntas, null);
  }
}

function verificacionAltaPreguntas(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El registro ya existe, verifique");
    GI("pecNumPregunta").value="";
  }
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////////////
//TERCERA PANTALLA Y FUNCIONES QUE SE USARÁN EN ELLA
//Carga la Tercera Pantalla (PrincipalPersonalizaEncuenstaIncisosControlGestion)
function cargaPrincipalPersonalizaEncuenstaIncisosControlGestion() {
  if (pkInfo==null && pkInfoPreguntas==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 2;
    operacionIncisos = 0;
    
    if(pkInfoPreguntas==null)
    {
      pkInfoPreguntas = pkInfo;
      pkInfo = null;
    }
    
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/PrincipalPersonalizaEncuestaIncisosControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaIncisos, null);
  }
}

function despliegaPantallaIncisos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Asignando la llave primaria
  GI("paramNoPregunta").value = pkInfoPreguntas.pecNumPregunta;
  
  //No permitir modificar el campo de consulta (paramNoPregunta)
  deshabilitaPK("paramNoPregunta".split(","));
  
  //Mostrar la consulta en la tabla
  consultar(GI("hdRegistrosIncisos"), GI('frmPrincipalPersonalizaEncuestaIncisosControlGestion'), false);
  formsLoaded();
}

function eliminarRegistroIncisos() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catIncisos.setOnUpdate(operacionExitosaIncisos);
    showWaitLayer();
    eliminaCatalogo(catIncisos);
  }
}


////////////////////////////////////////////////////////////////////////////////
//CUARTA PANTALLA Y FUNCIONES QUE SE USARÁN EN ELLA
//Carga la Cuarta Pantalla (MantenimientoPersonalizaEncuenstaIncisosControlGestion)
function cargaMantenimientoPersonalizaEncuenstaIncisosControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacionIncisos = tipoPantalla;
    numPantalla = 3;
    pkInfoIncisos = pkInfo;
    pkInfo = null;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoPersonalizaEncuestaIncisosControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaIncisosMantenimiento, null);
  }
}

function despliegaPantallaIncisosMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  if(operacionIncisos==OPER_ALTA)
  {
    //Asignando la llave primaria
    GI("ienNumPregunta").value = pkInfoPreguntas.pecNumPregunta;
  
    //No permitir modificar el campo donde se muestra el Número de Pregunta
    deshabilitaPK("ienNumPregunta".split(","));
  }
  
  //Agregando la funcionalidad del required
  fvMantenimientoIncisos.setup({
    formName      : "frmMantenimientoPersonalizaEncuestaIncisosControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogoIncisos();
}

function loadCatalogoIncisos() {
  catIncisos.setOnUpdate(catLoadedIncisos);
  if(operacionIncisos==OPER_MODIFICAR || operacionIncisos==CONSULTAR)
  {
    //Asignar llaves primarias a la pantalla de mantenimiento
    GI("ienNumInciso").value = pkInfoIncisos.ienNumInciso;
    GI("ienNumPregunta").value = pkInfoIncisos.ienNumPregunta;
    
    catIncisos.buscaCatalogoPK();
  }
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoadedIncisos() {
  if(operacionIncisos==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("ienNumInciso,ienNumPregunta".split(","));
  }
  else if(operacionIncisos==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoPersonalizaEncuestaIncisosControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfoIncisos() {
  catIncisos.setOnUpdate(operacionExitosaIncisos);
  if(operacionIncisos==OPER_ALTA && fvMantenimientoIncisos.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catIncisos.altaCatalogo();
  }
  else if(operacionIncisos==OPER_MODIFICAR && fvMantenimientoIncisos.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catIncisos.modificaCatalogo();
  }
}


function operacionExitosaIncisos() {
  alert("La operación se realizó correctamente");
  cargaPrincipalPersonalizaEncuenstaIncisosControlGestion();
  hideWaitLayer();
}


//Verificar que el registro aún no exista
function verificaExistenciaRegistroIncisos() {
  if(operacionIncisos==OPER_ALTA && GI("ienNumInciso").value!="")
  {
    showWaitLayer();
    validacionAltaIncisos.numPregunta = GI("ienNumPregunta").value;
    validacionAltaIncisos.numInciso = GI("ienNumInciso").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaIncisos);
    makeAjaxRequest(url, "HTML", verificacionAltaIncisos, null);
  }
}

function verificacionAltaIncisos(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El registro ya existe, verifique");
    GI("ienNumInciso").value="";
  }
  hideWaitLayer();
}
