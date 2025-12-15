var catComiteTecnico = new Catalogo("mx.com.inscitech.fiducia.domain.Comiteno");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");

initForms();

var tablaComiteTecnicoData = new Array();
tablaComiteTecnicoData[0] = "conNumContrato,100px";
//tablaComiteTecnicoData[1] = "conNomComite,135px";
tablaComiteTecnicoData[1] = "conFinalidComite,400px";
//tablaComiteTecnicoData[3] = "conComComite,220px";
//tablaComiteTecnicoData[4] = "conAnoConst,110px";
//tablaComiteTecnicoData[5] = "conMesConst,110px";
//tablaComiteTecnicoData[6] = "conDiaConst,120px";
tablaComiteTecnicoData[2] = "conCveStComite,100px";

var operacionComiteTecnico = 0;
var numPantallaComiteTecnico = 0;
pkInfo = null;
var fechaConstitucion = new Date();
var fvMantenimientoComiteTecnico = new FormValidator();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalComiteTecnico() {
  onButtonClickPestania("Administracion.PrincipalComiteTecnico","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catComiteTecnico.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catComiteTecnico = new Catalogo("mx.com.inscitech.fiducia.domain.Comiteno");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalComiteTecnico();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoComiteTecnico(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacionComiteTecnico = tipoPantalla;
    numPantallaComiteTecnico = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoComiteTecnico.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoComiteTecnico, null);
  }
}

function despliegaPantallaMantenimientoComiteTecnico(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoComiteTecnico.setup({
    formName      : "frmDatosComiteTecnicoMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  Calendar.setup({
  inputField     :    "txtFechaConstitucion",   // id of the input field
  button         :    "txtFechaConstitucion",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaConstitucion,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
  });
}

function descomponeFecha(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  GI("conDiaConst").value=fecha[0];
  GI("conMesConst").value=fecha[1];
  GI("conAnoConst").value=fecha[2];
}


function loadCatalogo() {
  catComiteTecnico.setOnUpdate(catLoaded);
  
  if(operacionComiteTecnico==MODIFICAR || operacionComiteTecnico==CONSULTAR)
    catComiteTecnico.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(numPantallaComiteTecnico==1 && (operacionComiteTecnico==MODIFICAR || operacionComiteTecnico==CONSULTAR))
    GI("txtFechaConstitucion").value=formatString(GI("conDiaConst").value,"0",2,"Izquierda") + "/" + formatString(GI("conMesConst").value,"0",2,"Izquierda") + "/" + GI("conAnoConst").value;
  
  if(operacionComiteTecnico==MODIFICAR)
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("conNumContrato".split(","));//No permitir modificar la PK
  }
  else if(operacionComiteTecnico==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    muestraObjs("cmdMiembros"); //Mostrar el botón Miembros
    deshabilitaObjetos(GI("frmDatosComiteTecnicoMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar datos en los campos informativos
  consultaNombreFideicomiso("nomFideicomiso",GI("conNumContrato"));
  formsLoaded();
}

function AltaOModificaInfoComiteTecnico() {
  catComiteTecnico.setOnUpdate(operacionExitosa);
  if(operacionComiteTecnico==ALTA && fvMantenimientoComiteTecnico.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catComiteTecnico.altaCatalogo();
  }
  else if(operacionComiteTecnico==MODIFICAR && fvMantenimientoComiteTecnico.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catComiteTecnico.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catComiteTecnico.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catComiteTecnico);
  }
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la tercera pantalla
function cargaPrincipalMiembrosComiteTecnico() {
  numPantallaComiteTecnico = 2;
  showWaitLayer();
  
  loadDynamicJS (ctxRoot + "/modules/Administracion/PrincipalMiembrosComiteTecnico.js");
  var urlCliente = ctxRoot + "/modules/Administracion/PrincipalMiembrosComiteTecnico.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoMiembrosComiteTecnico, GI("conNomComite").value);
}


function despliegaPantallaMantenimientoMiembrosComiteTecnico(obj, result) {
  GI("dvPantalla").innerHTML = result;
  nombreComite = obj;
  
  if(numPantallaMiembrosComiteTecnico==0)
  {
    GI("paramNumContratoMiembros").value=pkAux.conNumContrato;
    
    consultaNombreFideicomiso("nomFideicomiso",GI("paramNumContratoMiembros"));
    GI("txtNomComite").value = nombreComite;
    
    //varNumContratoMiembros.NumContratoMiembros = pkAux.conNumContrato;
    deshabilitaPK("paramNumContratoMiembros,txtNomComite".split(","));
    consultar(GI("hdRegistrosMiembrosComiteTecnico"), GI('frmDatosMiembrosComiteTecnicoConsulta'), false);
    hideWaitLayer();
  }
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para validar si es posible dar una alta
function verificaExisteRegistro(objLlave) {
  if(objLlave.value=="")
    return;
  
  showWaitLayer();
  var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
  validacionAlta.numContrato = objLlave.value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
  makeAjaxRequest(url, "HTML", verificarAlta, objLlave);
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    obj.value="";
    obj.focus();
    hideWaitLayer();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaComiteTecnicoAdmon\",\"numContrato\":0}");
    validacionExistenciaRegistro.numContrato = obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistenciaRegistroFunction, obj);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    obj.value="";
    obj.focus();
    hideWaitLayer();
  }
}

function verificacionExistenciaRegistroFunction(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Registro ya existe, verifique");
    obj.value="";
    obj.focus();
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",obj);
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////////
//Funciones para agregar funcionalidad de fecha
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}