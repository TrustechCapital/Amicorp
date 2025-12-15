var catUsuarios = new Catalogo("mx.com.inscitech.fiducia.domain.Usuarios");
catUsuarios.dateFormat = "dd/MM/YYYY";
var catPersonal = new Catalogo("mx.com.inscitech.fiducia.domain.Personal");

//showWaitLayer();


//var clavesMayor = JSON.parse("{\"mayor2000\":2000}");
var clavesMayor = JSON.parse("{\"mayor2000\":2000,\"orderPuesto\":\"s\"}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var recuperaNumUsuario = JSON.parse("{\"id\":\"recuperaMaxNumUsuario\"}");
var paramPerfil = JSON.parse("{\"orderPerfil\":\"s\"}");
initForms();

var tablaDatosUsuariosInternetData = new Array();
tablaDatosUsuariosInternetData[0] = "perNomUsuario,150px";
tablaDatosUsuariosInternetData[1] = "usuTipoUsuario,100px";
tablaDatosUsuariosInternetData[2] = "perTelefono,200px";
tablaDatosUsuariosInternetData[3] = "perNivelEstudios,300px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var pkInfo2 = null;
var fechaUltimoAcceso = new Date();
var fvMantenimientoUsuariosInternet = new FormValidator();

var nombreUsuarioID=null;

//Añadiéndole la funcionalidad de calendario a Fecha Alta Registro como parámetro de consulta
Calendar.setup({
  inputField     :    "fechaAltaRegistro",   // id of the input field
  button         :    "fechaAltaRegistro",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaUltimoAcceso,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

function cargaPrincipalSeguridadUsuariosInternet() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadUsuariosInternet","");
}

function clickTabla(pk) {
  pkInfo = pk;
  
  cloneObject(pk,catUsuarios.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoUsuariosInternetPersonas)
function cargaMantenimientoUsuariosInternetPersonas(tipoPantalla) {
  if ((tipoPantalla==2 || tipoPantalla==3) && pkInfo==null){
     SA(GI("usuTokenChk"), "disabled", "true");
    alert("No ha seleccionado campo alguno de la tabla");
    }
  else
  {
    SA(GI("usuTokenChk"), "disabled", "true");
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoUsuariosInternetPersonas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoUsuariosInternet.setup({
    formName      : "frmMantenimientoUsuariosInternetPersonas",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Añadiéndole la funcionalidad de calendario a Fecha Captura
  Calendar.setup({
    inputField     :    "usuFechaUltAcceso",   // id of the input field
    button         :    "usuFechaUltAcceso",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaUltimoAcceso,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //No mostrar los tabs
//  if (operacion==1 || operacion==3)
//    GI("tabs").style.visibility="hidden";       //Esconder los tabs
}


function loadCatalogo() {
  catPersonal.setOnUpdate(catLoadedPersonal);
  SA(GI("usuTokenChk"), "disabled", "true");
  if(operacion==2 || operacion==3)
  {
    //Asignar llave primaria
    GI("perNumUsuario").value=pkInfo.usuNumUsuario;
    catPersonal.buscaCatalogoPK();
  }
  else
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(recuperaNumUsuario);
    makeAjaxRequest(url, "HTML", asignandoNumPersonal, null);
    formsLoaded();
  }
}

function catLoadedPersonal() {
  if(operacion==2)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("perNumUsuario".split(","));
  
  catUsuarios.setOnUpdate(catLoadedUsuarios);
  //Asignar llave primaria
  GI("usuNumUsuario").value=pkInfo.usuNumUsuario;
  catUsuarios.buscaCatalogoPK();//Verificar que abra el catálogo por causa del tipo de dato DATE
  formsLoaded();
}

function catLoadedUsuarios() {
  if(operacion==2)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("usuNumUsuario".split(","));
  else if(operacion==3)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmMantenimientoUsuariosInternetPersonas"));         //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoUsuariosInternetPersonas").cmdAceptar, "LKD", "true");
    SA(GI("frmMantenimientoUsuariosInternetPersonas").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  formsLoaded();
}

function AltaOModificaInfo() {
  catUsuarios.setOnUpdate(modificaCatalogoPersonal);
  if(operacion==1 && fvMantenimientoUsuariosInternet.checkForm()) { //Se trata de una alta
    altaUsuariosYPersonal();
    catUsuarios.altaCatalogo();
  }  
  else if(operacion==2 && fvMantenimientoUsuariosInternet.checkForm()) {//Se trata de una modificación
    var Token;
    if(GI("usuNumPuesto").value==3000 || GI("usuNumPuesto").value==3002 || GI("usuNumPuesto").value==3005)
      Token=0;
    else
      Token=1;    
    GI("usuTokenChk").checked=Token;  
    catUsuarios.modificaCatalogo();
    catPersonal.modificaCatalogo();
    operacionExitosa();
  }  
}

function AsignaNombrePerfil(objeto){
 GI("usuNomPuesto").value = objeto.options[objeto.selectedIndex].text;
}

function altaUsuariosYPersonal() {
  var Token=0;
  var numUsuario = GI("usuNumUsuario").value;
  var nomUsuario = GI("usuNomUsuario").value;
  var numPuesto = GI("usuNumPuesto").value;
  var nomPuesto = GI("usuNumPuesto").options[GI("usuNumPuesto").selectedIndex].text;
  var fechaUltimoAcceso = GI("usuFechaUltAcceso").value;
  if(GI("usuNumPuesto").value==3000 || GI("usuNumPuesto").value==3002 || GI("usuNumPuesto").value==3005)
    Token=0;
  else
    Token=1;    
  GI("usuTokenChk").checked=Token;
  var objInsertaUsuario = JSON.parse("{\"id\":\"insertaDatoUsuarios\",\"NumUsuario\":" + numUsuario +
                                                                   ",\"NomUsuario\":\"" + nomUsuario + 
                                                                   "\",\"NumPuesto\":"  + numPuesto  + 
                                                                   ",\"NomPuesto\":\""  + nomPuesto  + 
                                                                   "\",\"FechaUltimoAcceso\":\""  + fechaUltimoAcceso  + 
                                                                   "\",\"Token\":"  + Token  + "}");

  var urlUsuario = ctxRoot + "/doRef.do?json=" + JSON.stringify(objInsertaUsuario);
  
  
  var nomUsuario = GI("perNomUsuario").value;
  var numUsuario = GI("perNumUsuario").value;
  var eMail = GI("perNivelEstudios").value;
  var telefono = GI("perTelefono").value;
  var direccion = GI("perDireccion").value;
  var rfc = GI("perRfc").value;
  var certificadoDigital = GI("perUbicacion").value;
  var expLaboral = GI("perExpLaboral").value;
  
  var objInsertaPersonal = JSON.parse("{\"id\":\"insertaDatoPersonal\",\"NomUsuario\":\"" + nomUsuario +
                                                                   "\",\"NumUsuario\":" + numUsuario + 
                                                                   ",\"NivelEstudios\":\""  + eMail  + 
                                                                   "\",\"Telefono\":\""  + telefono  + 
                                                                   "\",\"Direccion\":\""  + direccion  + 
                                                                   "\",\"Rfc\":\""  + rfc  + 
                                                                   "\",\"Ubicacion\":\""  + certificadoDigital  + 
                                                                   "\",\"ExpLaboral\":\""  + expLaboral  + 
                                                                   "\"}");
 
  var urlPersonal = ctxRoot + "/doRef.do?json=" + JSON.stringify(objInsertaPersonal);
  
  makeAjaxRequest(urlPersonal, "HTML", null, null);
  
  makeAjaxRequest(urlUsuario, "HTML", respInsertaPersonal, null);
      
}

function respInsertaPersonal(obj, result) {


  operacionExitosa();
}

function modificaCatalogoPersonal() {
  catPersonal.setOnUpdate(operacionExitosa);
  
  
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadUsuariosInternet();
}

//Recupera el registro con el Número más alto para dar de alta el siguiente
function asignandoNumPersonal(obj,result) {
  var objResult = JSON.parse(result);
  GI("perNumUsuario").value = objResult[0].numUsuario+1;
  GI("usuNumUsuario").value = objResult[0].numUsuario+1;
  deshabilitaPK("perNumUsuario,usuNumUsuario".split(","));
}

/////////////////////////////////////////////////////////////////////////////
//Eliminar un registro
function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catUsuarios.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catUsuarios);
  }
}

//Funciones para la fecha de Último Acceso (USU_FECHA_ULT_ACCESO)
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


function descomponeFecha(objOriginal,objDia,objMes,objAno)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  objDia.value=fecha[0];
  objMes.value=fecha[1];
  objAno.value=fecha[2];
}


////////////////////////////////////////////////////////////////////
var tablaDatosUsuariosAsignacionData = new Array();
tablaDatosUsuariosAsignacionData[0] = "ateNumContrato,170";
tablaDatosUsuariosAsignacionData[1] = "ctoNomContrato,825";

var validacionAlta1 = JSON.parse("{\"id\":\"muestraDatosUsuariosInternet1\",\"NoUsuario\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"validaExistaComite\",\"NoFiso\":0}");
var validacionAlta3 = JSON.parse("{\"id\":\"validaExistaRegistroAsignadoFiso\",\"NoUsuario\":0,\"NoFiso\":0}");

var fvMantenimientoUsuariosAsignacion = new FormValidator();
var divNombreFideicomisoParam;

//CARGA LA TERCERA PANTALLA (MantenimientoAsignacionFideicomisos)
function cargaMantenimientoAsignacionFideicomisos() {
  if(nombreUsuarioID==null)
    nombreUsuarioID=GI("perNomUsuario").value;
  pkInfo2=null;
  numPantalla = 2;
  //showWaitLayer();
  var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoUsuariosInternetAsignacionFideicomisos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaAsignaFideicomisos, null);
  
}

function despliegaPantallaAsignaFideicomisos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoUsuariosAsignacion.setup({
    formName      : "frmMantenimientoUsuariosInternetAsignacionFideicomisos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  GI("paramEjecutivoAtencion").value=pkInfo.usuNumUsuario;
  consultar(GI("hdRegistrosAsignacion"), GI('frmMantenimientoUsuariosInternetAsignacionFideicomisos'), false);
  formsLoaded();
}

function clickTabla2(pk) {
  pkInfo2 = pk;
}

////////////////////////////////////////////////////////////////////
//Validar el usuario y el comité técnico para dar de Alta una Asignación de Fideicomiso
function validaAltaAsignacion() {
  if(fvMantenimientoUsuariosAsignacion.checkForm())
  {
    validacionAlta1.NoUsuario = GI("paramEjecutivoAtencion").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta1);
    makeAjaxRequest(url, "HTML", verificacionUsuario, null);
  }
}

function verificacionUsuario(obj, result) {
  var objResult = JSON.parse(result);
  /*alert("verifica usuario"+objResult[0].pueNomPuesto);
  if(objResult[0].pueNomPuesto!="CLIENTE SECRETARIO DE ACTAS" && objResult[0].pueNomPuesto!="EJECUTIVO SECRETARIO DE ACTAS")
  {*/
    validacionAlta2.NoFiso = GI("paramFideicomiso").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificacionExistenciaComite, null);
  /*}
  else
    alert("No se pudo asignar el Fideicomiso");*/
}

function verificacionExistenciaComite(obj, result) {
  /*var objResult = JSON.parse(result);
  if(objResult[0].existe==1)
  {*/
    validacionAlta3.NoUsuario = GI("paramEjecutivoAtencion").value;
    validacionAlta3.NoFiso = GI("paramFideicomiso").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta3);
    makeAjaxRequest(url, "HTML", verificacionExistenciaComiteAsignacion, null);
  /*}
  else
    alert("No se pudo asignar el Fideicomiso, no cuenta con un Comité Técnico");*/
}

function verificacionExistenciaComiteAsignacion(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
    alert("La Asignación del Fideicomiso ya existe");
  else
    altaAsignarFideicomiso();
}

//Realizar el Update y mostrarlo en el Grid
function altaAsignarFideicomiso() {
  var numFiso = GI("paramFideicomiso").value;
  var numUsuario = GI("paramEjecutivoAtencion").value;
  var nomUsuario = nombreUsuarioID;
  var objInsertaAtencion = JSON.parse("{\"id\":\"insertaDatoAsignacionAtencion\",\"NumFiso\":" + numFiso +
                                                                              ",\"NumUsuario\":" + numUsuario + 
                                                                              ",\"NomEjec\":\""  + nombreUsuarioID + "\"}");
  
  var urlAtencion = ctxRoot + "/doRef.do?json=" + JSON.stringify(objInsertaAtencion);
  //makeAjaxRequest(urlAtencion, "HTML", insertandoEliminandoEnAtencion, null);
  makeAjaxRequest(urlAtencion, "HTML", eliminandoEnAtencion, null);
}

function eliminandoEnAtencion(obj, result) {
  var objResult = JSON.parse(result);
  
  cargaMantenimientoAsignacionFideicomisos();
}

////////////////////////////////////////////////////////////////////
//Validar que exista la Asignación del Fideicomiso para darlo de Baja
function validaExistaAsignacionComite() {
  if(pkInfo2==null)
    alert("Seleccione un registro de la tabla");
  else
    deleteEnAtencion();
}

function deleteEnAtencion() {
  var cveBanca = pkInfo2.ateCveBanca;
  var ejecAtencion = pkInfo2.ateEjecAtencion;
  var numContrato = pkInfo2.ateNumContrato
  
  var objDeleteAtencion = JSON.parse("{\"id\":\"EliminaDatoAsignacionAtencion\",\"CveBanca\":\"" + cveBanca +
                                                                              "\",\"EjecAtencion\":" + ejecAtencion + 
                                                                              ",\"NumContrato\":"  + numContrato  + 
                                                                              "}");
  var urlAtencion = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDeleteAtencion);
  makeAjaxRequest(urlAtencion, "HTML", eliminandoEnAtencion, null);
}

function convertirMayusculas( objeto ) {
   var strMayusculas = objeto.value;
   objeto.value = strMayusculas.toUpperCase();
   }
