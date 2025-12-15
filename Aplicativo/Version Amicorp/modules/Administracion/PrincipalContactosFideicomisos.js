var catContactosFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.Contacto");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var verificarExistenciaRegistro = JSON.parse("{\"id\":\"verificaExisteContactoFideicomiso\",\"numContrato\":0,\"numSecContac\":0}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraDatosFideicomisos\",\"NumFideicomiso\":0}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");

var tablaContactosFideicomisosData = new Array();
tablaContactosFideicomisosData[0] = "conNumContrato,90px";
tablaContactosFideicomisosData[1] = "conNomContacto,250px";
tablaContactosFideicomisosData[2] = "conDependencia,250px";
tablaContactosFideicomisosData[3] = "conCargo,150px";
tablaContactosFideicomisosData[4] = "conCveStContact,90px";

var operacion = 0;
var numPatalla = 0;
var numParametroPantalla = 0;
pkInfo = null;
var fvMantenimientoFideicomisos = new FormValidator();

//No permitir editar los 4 campos informativos de la página principal:
//1. Cto. Eje
//2. Nombre
//3. Tipo de persona
//4. No. Cliente
deshabilitaPK("txtCtoEje,txtNombre,txtTipoPersona,txtNoCliente".split(","));

formsLoaded();


//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalContactosFideicomisos() {
  onButtonClickPestania("Administracion.PrincipalContactosFideicomisos","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catContactosFideicomisos.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalContactosFideicomisos();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoContactosFideicomisos(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoContactosFideicomisos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoContactosFideicomisos, null);
  }
}

function despliegaPantallaMantenimientoContactosFideicomisos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoFideicomisos.setup({
    formName      : "frmDatosMantenimientoContactosFideicomisos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //No permitir editar los 4 campos informativos de la página de mantenimiento:
  //1. Cto. Eje
  //2. Nombre
  //3. Tipo de persona
  //4. No. Cliente
  deshabilitaPK("txtCtoEje,txtNombre,txtTipoPersona,txtNoCliente,conNumSecContac".split(","));
}

function loadCatalogo() {
  catContactosFideicomisos.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catContactosFideicomisos.buscaCatalogoPK(false);
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
    deshabilitaPK("conNumSecContac,conNumContrato".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoContactosFideicomisos"));
  }
  //Mostrar datos en campos informativos
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  mostrarDatosInformativos(3);
  formsLoaded();
}

function AltaOModificaInfo() {
  catContactosFideicomisos.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoFideicomisos.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catContactosFideicomisos.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoFideicomisos.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catContactosFideicomisos.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catContactosFideicomisos.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catContactosFideicomisos);
  }
}


//////////////////////////////////////////////////////////////
//Verificar si el Registro aún no existe
/*function verificarSiExisteRegistro() {
  if(GI("conNumContrato").value!="" && GI("conNumSecContac").value!="")
  {
    verificarExistenciaRegistro.numContrato=GI("conNumContrato").value;
    verificarExistenciaRegistro.numSecContac=GI("conNumSecContac").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(verificarExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificarSiExisteRegistroAction, null);
  }
  else if(GI("conNumContrato").value!="")
  
  
  mostrarDatosInformativos(2);
}

function verificarSiExisteRegistroAction(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Registro ya existe, verifique");
    GI("conNumContrato").value="";
    GI("conNumSecContac").value="";
    
    GI("txtCtoEje").value="";
    GI("txtNombre").value="";
    GI("txtTipoPersona").value="";
    GI("txtNoCliente").value="";
  }
  else
    mostrarDatosInformativos(2);
}*/

//Muestra los datos informativos
function mostrarDatosInformativos(parametroPantalla) {
  numParametroPantalla = parametroPantalla;
  GI("txtCtoEje").value="";
  GI("txtNombre").value="";
  GI("txtTipoPersona").value="";
  GI("txtNoCliente").value="";
  
  if(parametroPantalla==1)
  {
    if(GI("paramNumFiso").value !="")
    {
      showWaitLayer();
      validacionAlta2.numContrato = GI("paramNumFiso").value;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
      makeAjaxRequest(url, "HTML", funcVerExistRegistro, GI("paramNumFiso"));
    }
  }
  else if(parametroPantalla==2)
  {
    consultaDatosInformativos.NumFideicomiso = GI("conNumContrato").value;
    validacionAlta.numContrato = GI("conNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, GI("conNumContrato"));
  }
  else
  {
    showWaitLayer();
    consultaDatosInformativos.NumFideicomiso = GI("conNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, GI("conNumContrato"));
  }
}

function funcVerExistRegistro(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    consultaDatosInformativos.NumFideicomiso = GI("paramNumFiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, GI("paramNumFiso"));
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    obj.value="";
    obj.focus();
    hideWaitLayer();
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionAlta2.numContrato = obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    obj.value="";
    obj.focus();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    var SecNumContacto = JSON.parse("{\"id\":\"numSecNumContacto\",\"NumFiso\":0}");
    SecNumContacto.NumFiso=obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumContacto);
    makeAjaxRequest(url, "HTML", agregarContacto, obj);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    obj.value="";
    obj.focus();
  }
}

function agregarContacto(obj, result) {
  var objResult = JSON.parse(result);
  GI("conNumSecContac").value=objResult[0].secNumContacto;
  
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
  makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtCtoEje").value=objResult[0].ctoNumCtoEje;
  GI("txtNombre").value=objResult[0].ctoNomContrato;
  GI("txtTipoPersona").value=objResult[0].ctoCveTipoPer;
  GI("txtNoCliente").value=objResult[0].ctoNumCliente;
  hideWaitLayer();
}