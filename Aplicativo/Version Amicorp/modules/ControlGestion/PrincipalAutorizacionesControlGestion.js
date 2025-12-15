var catAutorizaciones = new Catalogo("mx.com.inscitech.fiducia.domain.Autoriza");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroAutorizaciones\",\"numOperacion\":0,\"autorizacion\":0,\"numUsuario\":0}");

initForms();

var tablaDatosAutorizacionesData = new Array();
tablaDatosAutorizacionesData[0] = "opeNomOperacion,300";
tablaDatosAutorizacionesData[1] = "autAutorizacion,150";
tablaDatosAutorizacionesData[2] = "autImpAutoriza,90";
tablaDatosAutorizacionesData[3] = "autCveStAutoriz,90";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoAutorizaciones = new FormValidator();
var fechaInicio = new Date();
var fechaFin = new Date();
var CONSULTAR = 3;

function cargaPrincipalAutorizacionesControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalAutorizacionesControlGestion","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catAutorizaciones.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catAutorizaciones.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catAutorizaciones);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalAutorizacionesControlGestion();
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoAutorizacionesControlGestion)
function cargaMantenimientoAutorizacionesControlGestion(tipoPantalla) {
  if ((tipoPantalla==2 || tipoPantalla==3) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoAutorizacionesControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoAutorizaciones.setup({
    formName      : "frmMantenimientoAutorizacionesControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad para la Fecha de Inicio
  Calendar.setup({
    inputField     :    "txtFechaInicio",   // id of the input field
    button         :    "txtFechaInicio",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaInicio,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Agregando la funcionalidad para la Fecha Fin
  Calendar.setup({
    inputField     :    "txtFechaFin",   // id of the input field
    button         :    "txtFechaFin",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaFin,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  deshabilitaPK("txtNumUsuario".split(","));
}

function loadCatalogo() {
  catAutorizaciones.setOnUpdate(catLoaded);
  if(operacion==2 || operacion==3)
  {
    //Asignar llaves primarias a la pantalla de mantenimiento
    GI("autNumOperacion").value = pkInfo.autNumOperacion;
    GI("autAutorizacion").value = pkInfo.autAutorizacion;
    GI("autNumUsuario").value = pkInfo.autNumUsuario;
    
    catAutorizaciones.buscaCatalogoPK();
  }
  else
    formsLoaded();
}

function catLoaded() {
  if(operacion==2)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("autNumOperacion,autAutorizacion,autNumUsuario".split(","));
  else if(operacion==3)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmMantenimientoAutorizacionesControlGestion"));         //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoAutorizacionesControlGestion").cmdAceptar, "LKD", "true");
    SA(GI("frmMantenimientoAutorizacionesControlGestion").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  
  //Obtener la Fecha de Inicio y de Fin y juntarla en las cajas de texto destinadas para ello
  GI("txtFechaInicio").value=formatString(GI("autDiaIniAut").value,"0",2,"Izquierda") + "/" + formatString(GI("autMesIniAut").value,"0",2,"Izquierda") + "/" + GI("autAnoIniAut").value;
  GI("txtFechaFin").value=formatString(GI("autDiaFinAut").value,"0",2,"Izquierda") + "/" + formatString(GI("autMesFinAut").value,"0",2,"Izquierda") + "/" + GI("autAnoFinAut").value;
  
  mostrarNumUsuario();
  formsLoaded();
}

function AltaOModificaInfo() {
  catAutorizaciones.setOnUpdate(operacionExitosa);
  if(operacion==1 && fvMantenimientoAutorizaciones.checkForm())//Se trata de una alta
    catAutorizaciones.altaCatalogo();
  else if(operacion==2 && fvMantenimientoAutorizaciones.checkForm())//Se trata de una modificación
    catAutorizaciones.modificaCatalogo();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==1 && GI("autNumUsuario").value!="" && GI("autAutorizacion").value!="" && GI("autNumOperacion").value!=-1)
  {
    validacionAlta.numOperacion = GI("autNumOperacion").value;
    validacionAlta.autorizacion = GI("autAutorizacion").value;
    validacionAlta.numUsuario = GI("autNumUsuario").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La clave ya existe, verifique");
    GI("autNumOperacion").selectedIndex=0;
    GI("autAutorizacion").value="";
    GI("autNumUsuario").value="";
  }
}

//Funciones para la funcionalidad de la Fecha Indice
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

//Descompone la fecha obtenida del calendario a sus respectivas cajas de texto
function descomponeFecha(objOriginal,objDia,objMes,objAno) {
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  objDia.value=fecha[0];
  objMes.value=fecha[1];
  objAno.value=fecha[2];
}

//Si selecciona un valor del combo Nombre, se cambia el combo Operaciones y viceversa
function mostrarNumUsuario() {
  GI("txtNumUsuario").value=GI("autNumUsuario").value;
}