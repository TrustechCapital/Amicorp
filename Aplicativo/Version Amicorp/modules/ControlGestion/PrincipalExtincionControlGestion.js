var catExtincion = new Catalogo("mx.com.inscitech.fiducia.domain.Contrato");

showWaitLayer();

var clavesCombo133 = JSON.parse("{\"llaveClave\":133}");

var validacionExistaFideicomiso = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"claveProducto\",\"numeroProducto\":0}");
var consultaSaldoActual = JSON.parse("{\"id\":\"muestraSaldoActual\",\"NumFiso\":0}");
var consultaValorFondo1 = JSON.parse("{\"id\":\"muestraValorFondo1\",\"NumFiso\":0}");
var consultaValorFondo2 = JSON.parse("{\"id\":\"muestraValorFondo2\",\"NumFiso\":0}");
var consultaValorPosicion = JSON.parse("{\"id\":\"muestraValorPosicion\",\"NumFiso\":0}");

//Primer pantalla
var numPantalla = 0;
var fvExtincion = new FormValidator();
var NumFiso = 0;
pkInfo = null;

//Segunda pantalla
var fvFuncionExtincion = new FormValidator();
var fecha1 = new Date();
var fechaSustituto = new Date();

//Agregando la funcionalidad del required
fvExtincion.setup({
  formName      : "frmPrincipalExtincionControlGestion",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//Deshabilitar los datos que son informativos
deshabilitaPK("ctoFechaConstit,ctoNomContrato,ctoNomProducto".split(","));

GI("txtTipoAdmon").value="NO";

hideWaitLayer();

function cargaPrincipalExtincionControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalExtincionControlGestion","");
}

//CONSULTAR DATOS Y MOSTRARLOS EN LA PRIMER PANTALLA (PrincipalExtincionControlGestion)
function muestraDatosConsulta() {
  //Si ya existe algún fideicomiso
  if(fvExtincion.checkForm())
  {
    validacionExistaFideicomiso.numContrato=GI("ctoNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistaFideicomiso);
    makeAjaxRequest(url, "HTML", verificandoExistenciaFideicomiso, null);
  }
}

function verificandoExistenciaFideicomiso(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    loadCatalogo();
    ingresaSaldoActual(); //Agrega el Saldo Actual
    ingresaValorPosicion(); //Agrega el Valor Posicion
    ingresaValorFondo(); //Agrega el Valor del Fondo
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("ctoNumContrato").value="";
    GI("ctoNumContrato").focus();
  }
}

function loadCatalogo() {
  catExtincion.setOnUpdate(catLoaded);
  catExtincion.buscaCatalogoPK();
}

function catLoaded() {
  //Colocar el Nombre del producto, teniendo el número del mismo
  consultaDatosInformativos.numeroProducto = GI("ctoNumProducto").value;
  if(GI("ctoNumProducto").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", asinaNomProducto, null);
  }
  
  formsLoaded();
}

function asinaNomProducto(obj, result) {
  var objResult = JSON.parse(result);
  GI("ctoNomProducto").value=objResult[0].prlNomProducto;
  GI("ctoFechaConstit").value=GI("ctoAnoApertura").value+"/"+GI("ctoMesApertura").value+"/"+GI("ctoDiaApertura").value;
}

function ingresaSaldoActual() {
  consultaSaldoActual.NumFiso = GI("ctoNumContrato").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaSaldoActual);
  makeAjaxRequest(url, "HTML", ingresandoSaldoActual, null);
}

function ingresandoSaldoActual(obj, result) {
  var objResult = JSON.parse(result);
  
  if(objResult.length<1)
    GI("txtSaldoActual").value=0;
  else
    GI("txtSaldoActual").value=objResult[0].honorario;
  
  
}

function ingresaValorPosicion() {
  consultaValorPosicion.NumFiso = GI("ctoNumContrato").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaValorPosicion);
  makeAjaxRequest(url, "HTML", ingresandoValorPosicion, null);
}

function ingresandoValorPosicion(obj, result) {
  var objResult = JSON.parse(result);
  
  if(objResult.length<1)
    GI("txtValorPosicion").value=0;
  else
    GI("txtValorPosicion").value=objResult[0].posicion;
}

function ingresaValorFondo() {
  if(GI("txtTipoAdmon").value=="SI")
  {
    consultaValorFondo1.NumFiso = GI("ctoNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaValorFondo1);
    makeAjaxRequest(url, "HTML", ingresandoValorFondo, null);
  }
  else
  {
    consultaValorFondo2.NumFiso = GI("ctoNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaValorFondo2);
    makeAjaxRequest(url, "HTML", ingresandoValorFondo, null);
  }
}

function ingresandoValorFondo(obj, result) {
  var objResult = JSON.parse(result);
  
  if(objResult.length<1)
    GI("txtValorFondo").value=0;
  else
    GI("txtValorFondo").value=objResult[0].saldo;
}


///////////////////////////////////////////////////////////////////////////
//PASANDO A LA SEGUNDA PANTALLA (MantenimientoExtincionControlGestion)
function verificarExtinguir() {
  if(fvExtincion.checkForm())
  {
    if(eval(GI("txtSaldoActual").value)==0)
    {
      if(eval(GI("txtValorFondo").value)==0)
      {
        if(eval(GI("txtValorPosicion").value)==0)
          cargaMantenimientoExtincionControlGestion(GI("ctoNumContrato"));
        else
          alert("Este contrato no se puede extinguir porque tiene posición");
      }
      else
        alert("Este Fideicomiso no se puede extinguir porque tiene saldo");
    }
    else
      alert("Este Fideicomiso tiene honorarios pendientes por liquidar, no puede ser extinguido");
  }
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoExtincionControlGestion)
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

function cargaMantenimientoExtincionControlGestion(obj) {
  NumFiso = obj.value;
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoExtincionControlGestion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  GI("txtFiso").value=NumFiso;
  
  //Agregando la funcionalidad del required
  fvFuncionExtincion.setup({
    formName      : "frmMantenimientoExtincionControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad para la Fecha1
  Calendar.setup({
    inputField     :    "txtFecha",   // id of the input field
    button         :    "txtFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fecha1,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Agregando la funcionalidad para la Fecha Sustituto
  Calendar.setup({
    inputField     :    "txtFechaSust",   // id of the input field
    button         :    "txtFechaSust",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaSustituto,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
}

function verificarEjecucionFuncion() {
  if(fvFuncionExtincion.checkForm())
    ejecutaFuncionExtincion();
}

function ejecutaFuncionExtincion() {
  var objParametros = JSON.parse("{\"id\":\"funcionExtincion\"}");
  eval("objParametros.Fideicomiso=" + GI("txtFiso").value);
  eval("objParametros.Motivo='" + GI("cmbMotivo").value +"'");
  eval("objParametros.Comentario='" + GI("txtComentarios").value +"'");
  eval("objParametros.Fecha='" + GI("txtFecha").value +"'");
  eval("objParametros.Usuario=" + GI("cmbUsuario").value);
  //
  if(GI("txtFidSust").value!="")
    eval("objParametros.FidSust='" + GI("txtFidSust").value +"'");
  else
    eval("objParametros.FidSust=''");
  //
  if(GI("txtFechaSust").value!="")
    eval("objParametros.FechaSust='" + GI("txtFechaSust").value +"'");
  else
    eval("objParametros.FechaSust=''");
  
  showWaitLayer();
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(url, "HTML", respuestaFuncionExtincion, null);
}

function respuestaFuncionExtincion(obj, result){
  var res=JSON.parse(result).resultado;
  switch(res){
    case 0:
      alert("Proceso satisfactorio");
      break;
    case 1:
      alert("Este Fideicomiso no se puede extinguir porque tiene saldo");
      break;
    case 2:
      alert("Este Contrato no se puede extinguir porque tiene posición");
      break;
    case -1:
      alert("Operación No realizada");
      break;
    default:
      alert("Error: "+res);
  }
  cargaPrincipalExtincionControlGestion();
  hideWaitLayer();
}