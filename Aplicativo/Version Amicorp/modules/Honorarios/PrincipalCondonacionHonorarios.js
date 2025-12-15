var catCondonacionHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Detcart");

var fechaActual = JSON.parse("{\"id\":\"regresaFechaActual\"}");
var validacionContratoExistencia = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionContratoActivo = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");

var tablaCondonacionoHonorariosData = new Array();
tablaCondonacionoHonorariosData[0] = "decCvePersFid,120px";
tablaCondonacionoHonorariosData[1] = "decNumPersFid,50px";
tablaCondonacionoHonorariosData[2] = "decCveTipoHono,215px";
tablaCondonacionoHonorariosData[3] = "decFecCalcHono,150px";
tablaCondonacionoHonorariosData[4] = "decNumSecuencial,130px";
tablaCondonacionoHonorariosData[5] = "decImpOrigHonor,90px,right";
tablaCondonacionoHonorariosData[6] = "decImpRemHonor,95px,right";
tablaCondonacionoHonorariosData[7] = "decCveCalifHono,85px,right";

var fechaCondonacion = new Date();
var numPantalla = 0;
pkInfo = null;
var fvCondonacion = new FormValidator();

formsLoaded();

function cargaPrincipalCondonacionHonorarios() {
  onButtonClickPestania("Honorarios.PrincipalCondonacionHonorarios","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catCondonacionHonorarios.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (PrincipalCondonacionHonorarios2)
function cargaPrincipalCondonacionHonorarios2() {
  if (pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Honorarios/PrincipalCondonacionHonorarios2.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvCondonacion.setup({
    formName      : "frmCondonacionHonorarios2",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}

/////////////////////////////////////////////////////////////////////////////
//PROGRAMACION CORRESPONDIENTE A LA SEGUNDA PANTTALLA: PrincipalPagoHonorariosConsulta2
/////////////////////////////////////////////////////////////////////////////
function validacionesPorContrato() {
  if(GI("paramNumCto").value!="")
  {
    validacionContratoExistencia.numContrato = GI("paramNumCto").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionContratoExistencia);
    makeAjaxRequest(url, "HTML", verificarContratoExistencia, null);
  }
}

function verificarContratoExistencia(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionContratoActivo.numContrato = GI("paramNumCto").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionContratoActivo);
    makeAjaxRequest(url, "HTML", verificarContratoActivo, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("paramNumCto").value="";
  }
}

function verificarContratoActivo(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("paramNumCto").value="";
  }
  else
    consultar(GI("Aceptar"), GI('frmCondonacionHonorarios'), false);
}

//Funciones para la fecha de pago
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

//MOSTRAR LA FECHA ACTUAL EN LA CAJA DE TEXTO DESTINADA PARA ELLO
function muestraFechaActual() {
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(fechaActual);
  makeAjaxRequest(url, "HTML", insertaFechaActual, null);
}

function insertaFechaActual(obj, result) {
  var objResult = JSON.parse(result);
  
  GI("fcoDiaDia").value=objResult[0].fcoDiaDia;
  GI("fcoMesDia").value=objResult[0].fcoMesDia;
  GI("fcoAnoDia").value=objResult[0].fcoAnoDia;
  
  GI("txtFechaCondonacion").value=formatString(GI("fcoDiaDia").value,"0",2,"Izquierda") + "/" + formatString(GI("fcoMesDia").value,"0",2,"Izquierda") + "/" + GI("fcoAnoDia").value;
  GI("txtMesAbierto").value = 0;
}

function validaFechaCorrectaYFideicomiso() {
  verificaFecha(GI("txtFechaCondonacion"));
}

///////////////////////////////////////////////////////////////////////////
//VERIFICA SI LA FECHA SELECCIONADA ES VÁLIDA
function verificaFecha(objFecha){
  showWaitLayer();
  var fecha = objFecha.value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFecha\",\"Fecha\":\"" + fecha + "\"}";
  makeAjaxRequest(url, "HTML", validaFecha, objFecha);
}

function validaFecha(obj, result){
  var resultado = JSON.parse(result).result;
  switch(resultado){
    case 0:
      GI("txtMesAbierto").value = 0;
      break;
    case 1:
        GI("txtMesAbierto").value = 1;
      break;
    case 2:
      alert("La fecha seleccionada corresponde un día no hábil");
      obj.focus();
      break;
    case 3:
      alert("La fecha seleccionada corresponde a un día feriado");
      obj.focus();
      break;
    case 4:
      alert("Error al defasar la fecha contable un mes");
      obj.focus();
      break;
    case 5:
      alert("El mes seleccionado se encuentra cerrado");
      obj.focus();
      break;
    case 6:
      alert("Solo se permiten movimientos del mes actual o del mes anterior");
      obj.focus();
      break;
    case -1:
      alert("Error al verificar la fecha seleccionada");
      obj.focus();
  }
  
  if(resultado!=0 && resultado!=1)
  {
    GI("txtFechaCondonacion").value=GI("fcoDiaDia").value+"/"+GI("fcoMesDia").value+"/"+GI("fcoAnoDia").value;
    GI("txtMesAbierto").value = 0;
  }
  else
  {
    var fecha = GI("txtFechaCondonacion").value;
    var fideicomiso = GI("decNumContrato").value;
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesAnterior\",\"Fecha\":\"" + fecha + "\",\"Fideicomiso\":" + fideicomiso + "}";
    makeAjaxRequest(url, "HTML", validaFechaMesAnterior, null);
  }
  
  hideWaitLayer();
}

function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result).result;
  switch(resultado){
    case 0:
    case 2:
      showWaitLayer();
      break;
    case 1:
    case -1:
      alert("El fideicomiso se encuentra cerrado");
      //obj.focus();
  }
  hideWaitLayer();
}

/////////////////////////////////////////////////////////////////////////////
//Incorporar los datos del catálogo
function loadCatalogo() {
  catCondonacionHonorarios.setOnUpdate(catLoaded);
  
  catCondonacionHonorarios.buscaCatalogoPK(false);
}

function catLoaded() {
  //No permitir editar el campo visible: Número de Contrato (Num. Fid.)
  SA(GI("frmCondonacionHonorarios2").decNumContrato, "LKD", "true");
  SA(GI("frmCondonacionHonorarios2").decNumContrato, "disabled", "true");
  
  //Añadiéndole la funcionalidad de calendario a Fecha Pago
  Calendar.setup({
    inputField     :    "txtFechaCondonacion",   // id of the input field
    button         :    "txtFechaCondonacion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaCondonacion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Ingresa la fecha actual al iniciar la pantalla 2
  muestraFechaActual();
  
  formsLoaded();
}

/////////////////////////////////////////////////////////////////////////////
//Valida que lo ingresado en la caja no sea mayor que DEC_IMP_REM_HONOR
function validaNoSeaMayor() {
  var ImportePago=eval(GI("txtImpCondonacion").value);
  var RemHonor=eval(GI("decImpRemHonor").value);
  if(ImportePago > RemHonor)
  {
    alert("La cantidad no puede ser mayor a: "+RemHonor);
    GI("txtImpCondonacion").value="";
  }
}

/////////////////////////////////////////////////////////////////////////////
//Lleva a cabo la función una vez que se tienen todos los datos
function aplicaFuncion() {
  if(fvCondonacion.checkForm())
    ejecutaFuncionPagaOPeriodo();
}

function ejecutaFuncionPagaOPeriodo(){
  var objParametros = JSON.parse("{\"id\":\"funcionProvisiones\"}");
  eval("objParametros.TipoOperacion=3");
  eval("objParametros.Fideicomiso=" + GI("decNumContrato").value);
  eval("objParametros.Fecha='" + GI("txtFechaCondonacion").value+"'");
  eval("objParametros.Tipo_Servicio=''");  
  eval("objParametros.Cantidad=" + GI("txtImpCondonacion").value);
  eval("objParametros.TipoPersona=''");
  eval("objParametros.NumTipoPersona=0");
  eval("objParametros.Const2=''");
  eval("objParametros.MesAbierto=" + GI("txtMesAbierto").value);
  eval("objParametros.Const3=683");
  eval("objParametros.FechaDel=''");
  eval("objParametros.FechaAl=''");
  eval("objParametros.Secuencial=0");
  eval("objParametros.FechaPago='" + GI("txtFechaCondonacion").value+"'");
  eval("objParametros.TipoServicio=''");
  eval("objParametros.FormaPago=''");
  eval("objParametros.BancoTransf=0");
  eval("objParametros.CuentaNafin=0");
  eval("objParametros.ReferenciaCie=0");
  eval("objParametros.Const10=0");
  eval("objParametros.Const11=0");
  
  showWaitLayer();
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(url, "HTML", respuestaFuncionPagaOPeriodo, null);
}

function respuestaFuncionPagaOPeriodo(obj, result){
  var cad=JSON.parse(result).resultado;
  var res = cad.substring(0, 1);
  
  switch(res){
    case '0':
      alert("Proceso concluido satisfactoriamente con folio de operación: " + cad.substring(2,cad.length));
      break;
    case '1':
      alert("No existen parámetros de honorarios");
      break;
    case '2':
      alert("No existe el porcentaje de pago del tipo de persona que paga los honorarios");
      break;
    case '3':
      alert("No existe La operacion: " + cad.substring(2,cad.length));
      break;
    case '4':
      alert("Error al buscar claves para operaciion");
      break;
    case '5':
      alert("Error al armar DATOVAL");
      break;
    case '6':
      alert("No se contabilizó correctamente");
      break;
    case '7':
      alert("No existe domicilio fiscal");
      break;
    case '8':
      alert("No se grabó correctamente la factura");
      break;
    case '9':
      alert("No se grabó correctamente en la estructura de honorarios");
      break;
    default:
      alert("Error al condonar: ");
  }
  cargaPrincipalCondonacionHonorarios();
  hideWaitLayer();
}