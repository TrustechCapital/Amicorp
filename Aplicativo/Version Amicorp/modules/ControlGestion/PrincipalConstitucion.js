var catConstitucion = new Catalogo("mx.com.inscitech.fiducia.domain.Anteproy");

showWaitLayer();

var clavesCombo161 = JSON.parse("{\"llaveClave\":161}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"claveProducto\",\"numeroProducto\":0}");
//var validacion = JSON.parse("{\"id\":\"cuentaAnteproyectosBajaProspectos\",\"numProspecto\":-1}");
initForms();

var tablaDatosFichaConstitucionData = new Array();
tablaDatosFichaConstitucionData[0] = "antNumProspecto,70px";
tablaDatosFichaConstitucionData[1] = "antNomNegocio,250px";
tablaDatosFichaConstitucionData[2] = "antFechaApertura,90px";
tablaDatosFichaConstitucionData[3] = "antCveTipoNeg,250px";
tablaDatosFichaConstitucionData[4] = "antCveClasifPro,160px";
tablaDatosFichaConstitucionData[5] = "antCveStProspec,90px";
tablaDatosFichaConstitucionData[6] = "antNumContrato,70px";

var numPantalla = 0;
var fvFuncConstit = new FormValidator();
var fechaConstitucion = new Date();
pkInfo = null;

//Variables para el uso de los checkBox
var fideicomisoFoseg=0;
var contabilidadDetallada=0;
var enviaMensajeria=0;

function cargaPrincipalConstitucion() {
  numPantalla = 0;
  pkInfo = null;
  onButtonClickPestania("ControlGestion.PrincipalConstitucion","");
}

function clickTabla(pk) {
  if(pk.antCveStProspec=="ACTIVO")
  {
    pkInfo = pk;
    cargaMantenimientoConstitucion();
  }
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoConstitucion)
function cargaMantenimientoConstitucion() {
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoConstitucion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();  
}

function loadCatalogo() {
  catConstitucion.setOnUpdate(catLoaded);
  
  //Asignar llave primaria a la pantalla de mantenimiento
  GI("antNumProspecto").value = pkInfo.antNumProspecto;
  catConstitucion.buscaCatalogoPK();
}

function catLoaded() {
  //Deshabilitar los datos que son informativos
  deshabilitaPK("antNumProspecto,antNomNegocio,antCveTipoNeg,antCveClasifPro,antNomProducto,antImpApertura".split(","));
  
  //Colocar el Nombre del producto, teniendo el número del mismo
  consultaDatosInformativos.numeroProducto = GI("antNumProducto").value;
  if(GI("antNumProducto").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", asinaNomProducto, null);
  }
  
  //Agregando la funcionalidad del required
  fvFuncConstit.setup({
    formName      : "frmMantenimientoConstitucion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad para la Fecha de Constitución
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
  
  formsLoaded();
  
}

function asinaNomProducto(obj, result) {
  var objResult = JSON.parse(result);
  GI("antNomProducto").value=objResult[0].prlNomProducto;
  
}

//Refrescar los valores de los checkBox
function refrescarValorFideicomisoFoseg() {
  if(GI("ChkFideicomisoFoseg").checked)
    fideicomisoFoseg=1;
  else
    fideicomisoFoseg=0;
}

function refrescarValorContabilidadDetallada() {
  if(GI("ChkContabilidadDetallada").checked)
    contabilidadDetallada=1;
  else
    contabilidadDetallada=0;
}

function refrescarValorEnviaMensajeria() {
  if(GI("ChkEnviaMensajeria").checked)
    enviaMensajeria=1;
  else
    enviaMensajeria=0;
}


function verificarEjecucionFuncion() {
  
  if(fvFuncConstit.checkForm())
    ejecutaFuncionConstitucion();
  
  // código antiguo
  /*var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaExisteKYCConstitucion\",\"Proyecto\":"+eval(GI("antNumProspecto").value)+"}";
  makeAjaxRequest(url, "HTML", existeKYC, null);
  */
}


function existeKYC(obj,result)
{
  var resultado = JSON.parse(result)[0];
  if(resultado.contador == 0)
    alert("No existen registros en KYC")
    else
    {
      var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaKYCConstitucion\"}";
      makeAjaxRequest(url, "HTML", completoKYC, null);
    }
}

function completoKYC(obj,result)
{
  var resultado = JSON.parse(result)[0];
  if(resultado.contador!=0)
    alert("No esta completa la información de KYC");
  else
  {
    if(fvFuncConstit.checkForm())
    ejecutaFuncionConstitucion();
  }  
}


function vaciarNombreAdministrador() {
  if(GI("cmbAdmonResponsable").selectedIndex==0)
    GI("txtAdmonResponsable").value="";
  else
    GI("txtAdmonResponsable").value=GI("cmbAdmonResponsable").options[GI("cmbAdmonResponsable").selectedIndex].text;
}


//Funciones para la funcionalidad de la Fecha Constitución
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

///////////////////////////////////////////////////////////////////////////
//FUNCION QUE SE EJECUTARÁ UNA VEZ QUE SE DE CLICK EN ACEPTAR
function ejecutaFuncionConstitucion(){
  
  var objParametros = JSON.parse("{\"id\":\"funcionConstitucion\"}");
  eval("objParametros.Prospecto=" + GI("antNumProspecto").value);
  eval("objParametros.Fideicomiso=" + GI("antNumContrato").value);
  eval("objParametros.ContabilidadDetallada=" + contabilidadDetallada);
  eval("objParametros.EnvioMensajeria=" + enviaMensajeria);
  eval("objParametros.FideicomisoFoseg=" + fideicomisoFoseg);
  eval("objParametros.FechaConstitucion='" + GI("txtFechaConstitucion").value +"'");
  eval("objParametros.NumAdministradorResponsable=" + GI("cmbAdmonResponsable").value);
  eval("objParametros.NomAdministradorResponsable='" + GI("txtAdmonResponsable").value +"'");
  eval("objParametros.Comentarios='" + GI("txtComentarios").value +"'");
  
  showWaitLayer();
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  
  makeAjaxRequest(url, "HTML", respuestaFuncionConstitucion, null);
}

function respuestaFuncionConstitucion(obj, result){
  var res=JSON.parse(result).resultado;
  switch(res){
    case 0:
      alert("Proceso satisfactorio");
      break;
    case -1:
      alert("Operación No Realizada");
      break;
    case 2:
      alert("Proceso satisfactorio");
      break;
    default:
      alert("Error: "+res);
  }
  cargaPrincipalConstitucion();
  hideWaitLayer();
}