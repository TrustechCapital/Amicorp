var catPagoHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Detcart");

var clavesCombo6 = JSON.parse("{\"llaveClave\":6}");
var clavesCombo27 = JSON.parse("{\"llaveClave\":27}");

var claveLiminf12 = JSON.parse("{\"clave\":12}");
var claveLiminf164 = JSON.parse("{\"clave\":164}");
var interNumContrato;

var fechaActual = JSON.parse("{\"id\":\"regresaFechaActual\"}");
var validacionContratoExistencia = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionContratoActivo = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");

var tablaPagoHonorariosData = new Array();
tablaPagoHonorariosData[0] = "decCvePersFid,120px";
tablaPagoHonorariosData[1] = "decNumPersFid,50px";
tablaPagoHonorariosData[2] = "decCveTipoHono,215px";
tablaPagoHonorariosData[3] = "decFecCalcHono,150px";
tablaPagoHonorariosData[4] = "decNumSecuencial,100px";
tablaPagoHonorariosData[5] = "decImpOrigHonor,90px,right";
tablaPagoHonorariosData[6] = "decImpRemHonor,95px,right";
tablaPagoHonorariosData[7] = "decCveCalifHono,115px,right";

var fechaPago = new Date();
var numPantalla = 0;
pkInfo = null;
GI("paramCveCalifHono").value="PENDIENTE";

formsLoaded();

function cargaPrincipalPagoHonorarios() {
  numPantalla = 0;
  pkInfo = null;
  onButtonClickPestania("Honorarios.PrincipalPagoHonorariosConsulta","");
}

function cargaPrincipalPagoHonorariosConsulta2() {
  if (pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 1;
    var contrato=pkInfo.decNumContrato;
    showWaitLayer();
    interNumContrato=JSON.parse("{\"ContratoInter\":1000,\"NumContrato\":" +pkInfo.decNumContrato + "}");
    var urlCliente = ctxRoot + "/modules/Honorarios/PrincipalPagoHonorariosConsulta2.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}


function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
}

function clickTabla(pk) {
  pkInfo = pk;
}

function limpiarParametrosConsulta() {
  RF(GI('frmPagoHonorariosConsulta'));
  GI("paramCveCalifHono").value="PENDIENTE";
}


////////////////////////////////////////////////////////////////////////////
function validacionesPorContrato() {
  validacionContratoExistencia.numContrato = GI("paramNumCto").value;
  validacionContratoActivo.numContrato = GI("paramNumCto").value;
  
  if(GI("paramNumCto").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionContratoExistencia);
    makeAjaxRequest(url, "HTML", verificarContratoExistencia, null);
  }
  else
    alert("Ingrese un número de Fideicomiso");
}

function verificarContratoExistencia(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
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
  {
    consultar(GI("Aceptar"), GI('frmPagoHonorariosConsulta'), false);
    var consultaTotalCartera = JSON.parse("{\"id\":\"conHonTotCart\",\"numContrato\":" + GI("paramNumCto").value + ",\"CveCalifHono\": \"" + GI("paramCveCalifHono").value + "\"}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaTotalCartera);
    makeAjaxRequest(url, "HTML", ingresaTotalCartera, null);
  }
}

function ingresaTotalCartera(obj, result) {
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult[0].totalCartera))
    asignaEtiqueta("txtTotCartera","Total Cartera:    "+objResult[0].totalCartera);
}


/////////////////////////////////////////////////////////////////////////////
//PROGRAMACION CORRESPONDIENTE A LA SEGUNDA PANTTALLA: PrincipalPagoHonorariosConsulta2
/////////////////////////////////////////////////////////////////////////////
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
  //fechaActual.tipoFecha="CONTABLE";
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(fechaActual);
  makeAjaxRequest(url, "HTML", insertaFechaActual, null);
}

function insertaFechaActual(obj, result) {
  var objResult = JSON.parse(result);
  
  GI("fcoDiaDia").value=objResult[0].fcoDiaDia;
  GI("fcoMesDia").value=objResult[0].fcoMesDia;
  GI("fcoAnoDia").value=objResult[0].fcoAnoDia;
  
  GI("txtFechaPago").value= formatString(GI("fcoDiaDia").value,"0",2,"Izquierda") + "/" + formatString(GI("fcoMesDia").value,"0",2,"Izquierda") + "/" + GI("fcoAnoDia").value;
  GI("txtMesAbierto").value = 0;
}

function validaFechaCorrectaYFideicomiso() {
  verificaFecha(GI("txtFechaPago"));
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
    GI("txtFechaPago").value=GI("fcoDiaDia").value+"/"+GI("fcoMesDia").value+"/"+GI("fcoAnoDia").value;
    GI("txtMesAbierto").value = 0;
  }
  else
  {
    var fecha = GI("txtFechaPago").value;
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
  catPagoHonorarios.setOnUpdate(catLoaded);
  
  //Asignar llaves primarias a la pantalla 2
  GI("decCveTipoHono").value = pkInfo.decCveTipoHono;
  GI("decNumPersFid").value = pkInfo.decNumPersFid;
  GI("decCvePersFid").value = pkInfo.decCvePersFid;
  GI("decNumContrato").value = pkInfo.decNumContrato;
  GI("decFecCalcHono").value = pkInfo.decFecCalcHono;
  GI("decNumSecuencial").value = pkInfo.decNumSecuencial;
  
  //Ocultar los objetos no necesarios
  ocultaObjs("Banco,cmbBanco,CuentaNafin,cmbCuentaNafin,CuentaNafinBancomer,cmbCuentaNafinBancomer,ContratoDeInversion,cmbContratoInversion,Referencia");
  
  catPagoHonorarios.buscaCatalogoPK();
}

function catLoaded() {
  GI("txtImpPago").value = eval(GI("decImpRemHonor").value);
  //No permitir editar el campo visible: Número de Contrato (Num. Fid.)
  SA(GI("frmPagoHonorarios2").decNumContrato, "LKD", "true");
  SA(GI("frmPagoHonorarios2").decNumContrato, "disabled", "true");
  
  //Añadiéndole la funcionalidad de calendario a Fecha Pago
  Calendar.setup({
    inputField     :    "txtFechaPago",   // id of the input field
    button         :    "txtFechaPago",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaPago,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Ingresa la fecha actual al iniciar la pantalla 2
  muestraFechaActual();
  //Colocar las fechas FechaDel y FechaAl en una sola caja de texto
  GI("txtFechaDel").value=GI("decDiaPerDel").value+"/"+GI("decMesPerDel").value+"/"+GI("decAnoPerDel").value;
  GI("txtFechaAl").value=GI("decDiaPerAl").value+"/"+GI("decMesPerAl").value+"/"+GI("decAnoPerAl").value;
  
  formsLoaded();
}

/////////////////////////////////////////////////////////////////////////////
//Valida que lo ingresado en la caja no sea mayor que DEC_IMP_REM_HONOR
function validaNoSeaMayor() {
  var ImportePago=eval(GI("txtImpPago").value);
  var RemHonor=eval(GI("decImpRemHonor").value);
  if(ImportePago > RemHonor)
  {
    alert("La cantidad no puede ser mayor a: "+RemHonor);
    GI("txtImpPago").value="";
  }
}

/////////////////////////////////////////////////////////////////////////////
//Muestra los objetos según la opción seleccionada del Combo
function muestraElementosAcordes() {
  ocultaObjs("Banco,cmbBanco,CuentaNafin,cmbCuentaNafin,CuentaNafinBancomer,cmbCuentaNafinBancomer,ContratoDeInversion,cmbContratoInversion,Referencia");
  
  if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="EFECTIVO")
    muestraObj("Referencia");
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONCENTRACION EMPRESARIAL INMEDIATA")
    muestraObjs("Referencia,CuentaNafinBancomer,cmbCuentaNafinBancomer");
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONFORMIDAD INICIATIVA") {}
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="DESCONTAR DEL FONDO")
    muestraObjs("ContratoDeInversion,cmbContratoInversion");
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="MATRIZ Y SUCURSALES") {}
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRANSFERENCIA ELECTRONICA")
    muestraObjs("Banco,cmbBanco,CuentaNafin,cmbCuentaNafin");
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRASPASO DE BANCOMER CIE A BANXICO") {}
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRASPASOS INTERNOS VIA 2311") {}
}

/////////////////////////////////////////////////////////////////////////////
//Lleva a cabo la función una vez que se tienen todos los datos
function aplicaFuncion() {
  ejecutaFuncionPagaOPeriodo();
}

function ejecutaFuncionPagaOPeriodo(){
  var ejecutaFuncion = true;
  
  var objParametros = JSON.parse("{\"id\":\"funcionProvisiones\"}");
  eval("objParametros.TipoOperacion=2");
  eval("objParametros.Fideicomiso=" + GI("decNumContrato").value);
  eval("objParametros.Fecha='" + GI("decFecCalcHono").value+"'");
  eval("objParametros.Tipo_Servicio='" + GI("decCveTipoHono").value+"'");
  if(GI("txtImpPago").value!="")
  {
    eval("objParametros.Cantidad=" + GI("txtImpPago").value);
    eval("objParametros.Moneda=" + (GI("cmbMoneda").selectedIndex > 0?GI("cmbMoneda").value:0) );
  }
  else
  {
    ejecutaFuncion = false;
    alert("Por favor coloque el Importe");
  }
  
  eval("objParametros.TipoPersona='" + GI("decCvePersFid").value+"'");
  eval("objParametros.NumTipoPersona=" + GI("decNumPersFid").value);
  eval("objParametros.Const2=''");
  eval("objParametros.MesAbierto=" + GI("txtMesAbierto").value);
  eval("objParametros.Const3=683");
  eval("objParametros.FechaDel='" + GI("txtFechaDel").value+"'");
  eval("objParametros.FechaAl='" + GI("txtFechaAl").value+"'");
  eval("objParametros.Secuencial=" + GI("decNumSecuencial").value);
  eval("objParametros.FechaPago='" + GI("txtFechaPago").value+"'");
  eval("objParametros.TipoServicio='" + GI("decCveTipoHono").value+"'");
  if(GI("cmbFormaPago").value!=-1)
    eval("objParametros.FormaPago='" + GI("cmbFormaPago").value+"'");
  else
  {
    ejecutaFuncion = false;
    alert("Por favor elija una Forma de Pago");
  }
  ///
  if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRANSFERENCIA ELECTRONICA" && GI("cmbBanco").value!=-1)
    eval("objParametros.BancoTransf=" + GI("cmbBanco").value);
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRANSFERENCIA ELECTRONICA" && GI("cmbBanco").value==-1)
  {
    ejecutaFuncion = false;
    alert("Por favor elija un Banco");
  }
  ///
  if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRANSFERENCIA ELECTRONICA" && GI("cmbCuentaNafin").value!=-1)
    eval("objParametros.CuentaNafin=" + GI("cmbCuentaNafin").value);
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="TRANSFERENCIA ELECTRONICA" && GI("cmbCuentaNafin").value==-1)
  {
    ejecutaFuncion = false;
    alert("Por favor elija una Cuenta Nafin");
  }
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONCENTRACION EMPRESARIAL INMEDIATA" && GI("cmbCuentaNafinBancomer").value!=-1)
    eval("objParametros.CuentaNafin=" + GI("cmbCuentaNafinBancomer").value);
  else if(GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONCENTRACION EMPRESARIAL INMEDIATA" && GI("cmbCuentaNafinBancomer").value==-1)
  {
    ejecutaFuncion = false;
    alert("Por favor elija una Cuenta Nafin Bancomer");
  }
  ///
  if((GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="EFECTIVO" || GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONCENTRACION EMPRESARIAL INMEDIATA") && GI("txtReferencia").value!="")
    eval("objParametros.ReferenciaCie=" + GI("txtReferencia").value);
  else if((GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="EFECTIVO" || GI("cmbFormaPago").options[GI("cmbFormaPago").selectedIndex].text=="CONCENTRACION EMPRESARIAL INMEDIATA") && GI("txtReferencia").value=="")
  {
    ejecutaFuncion = false;
    alert("Por favor coloque una Referencia");
  }
  
  if(GI("cmbContratoInversion").value != -1)
    eval("objParametros.Const10=" + GI("cmbContratoInversion").value);
  else
    eval("objParametros.Const10=0");
  
  eval("objParametros.Const11=0");
  
  if(ejecutaFuncion)
  {
    showWaitLayer();
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    makeAjaxRequest(url, "HTML", respuestaFuncionPagaOPeriodo, null);
  }
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
      alert("Error al pagar: "+res);
  }
  cargaPrincipalPagoHonorarios();
  hideWaitLayer();
}