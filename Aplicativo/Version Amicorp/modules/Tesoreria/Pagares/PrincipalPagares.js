showWaitLayer();
deshabilitaPK("txtPremio,txtFechaVencimiento,txtImporteVencimiento".split(","));

var divNombreFideicomisoParam;
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");
var fncPagareParam = JSON.parse("{\"id\":\"ejeFunReporto\"}");
var txtRetencionParam = JSON.parse("{\"numMercado\":-1,\"numContratoInversion\":-1,\"numInstrumento\":-1}");

var fechaDefault = new Date();
var fvPagare = new FormValidator();

initForms();

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today) return true;
  else return false;
}

Calendar.setup({
    inputField     :    "txtFechaValor",
    button         :    "txtFechaValor",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});
fvPagare.setup({
  formName      : "frmPagares",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaCmbContratoInversion(objTxtNumFideicomiso,objCmbContratoInversion){
  if(objTxtNumFideicomiso.value != ""){
    showWaitLayer();
    objCmbContratoInversion.selectedIndex = 0;
    cmbContratoInversionParam.fideicomiso = objTxtNumFideicomiso.value;
    loadElement(objCmbContratoInversion);
  }
}

function consultaNomFid(){
  consultaNombreFideicomiso("nomFideicomiso",GI("numFideicomiso"));
  hideWaitLayer();
}

function calculaCantidades(){
  var plazo = isDefinedAndNotNull(eval(GI("txtPlazo").value))?eval(GI("txtPlazo").value):0;
  var tasa = isDefinedAndNotNull(eval(GI("txtTasa").value))?eval(GI("txtTasa").value):0;
  var importe = isDefinedAndNotNull(eval(GI("txtImporte").value))?eval(GI("txtImporte").value):0;
  var premio;
  if(plazo != 0 && tasa != 0 && importe != 0){
    premio = importe * plazo * tasa / 36000
    GI("txtPremio").value = premio;
    GI("txtImporteVencimiento").value = importe + premio;
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunProyectaFechaReporto\",\"Fecha\":\"" + GI("txtFechaValor").value  + "\",\"numPlazo\":" + GI("txtPlazo").value  + "}";
    makeAjaxRequest(url, "HTML", asignaFechaVencimiento, GI("txtFechaVencimiento"));
  }
}
function asignaFechaVencimiento(obj, result){
  var fecha = JSON.parse(result)[0];
  if(isDefinedAndNotNull(fecha)){
    obj.value = fecha;
  }else{
    alert("Error al cálcular la Fecha de Vencimiento");
  }
}

function asignaRetencionISR(){
  var numMercado;
  var numInstrumento;
  if(fvPagare.checkForm()){
    showWaitLayer();
    txtRetencionParam.numMercado = 4;
    txtRetencionParam.numInstrumento = 1;
    loadElement(GI("txtRetencionISR"));
  }
}

function ejecutaPagare(){
  if(fvPagare.checkForm()){
    var numUsuario = 683; //ALERTA: SE PUSIERON DE ESTA FORMA EN EL CODIGO YA QUE LOS PARAMETROS PARA FUNCIONES Y STORES DEBEN IR UNO A UNO ORDENADOS(NO ES COMO LOS QUERYS)
    fncPagareParam.numFideicomiso = eval(GI("numFideicomiso").value);
    if(numsubcuenta.length!=0&&numsubcuenta!=null)
        fncPagareParam.numSubFideicomiso = eval(numsubcuenta);
    else
        fncPagareParam.numSubFideicomiso = eval(0);
    fncPagareParam.numIntermediario = eval(GI("cmbContratoInversion").value); 
    fncPagareParam.numContratoInversion = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
    fncPagareParam.Emisora = "";
    fncPagareParam.Serie = "";
    fncPagareParam.numCupon = 0;
    fncPagareParam.numTitulos = 0;
    fncPagareParam.numMercado = 4;
    fncPagareParam.TipoAdministracion = GI("nomFideicomiso").value;
    fncPagareParam.numInstrumento = 1;
    fncPagareParam.numMoneda = 1;
    fncPagareParam.FechaContable = GI("txtFechaContable").value;
    fncPagareParam.numImporte = eval(GI("txtImporte").value);
    fncPagareParam.numPrecio = 0;
    fncPagareParam.numPlazo = eval(GI("txtPlazo").value);
    fncPagareParam.numTipoMovimiento = 1;
    fncPagareParam.numTasa = eval(GI("txtTasa").value);
    fncPagareParam.numTipoCambio = 1;
    fncPagareParam.numRetencionISR = eval(GI("txtRetencionISR").value);
    fncPagareParam.FechaAnterior = GI("txtFechaValor").value;
    fncPagareParam.mesAbierto = eval(GI("txtMesAbierto").value);
    fncPagareParam.numUsuario = numUsuario;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncPagareParam);
    makeAjaxRequest(url, "HTML", validaPagare, null);
  }
}

function validaPagare(obj, result){
  var resultado = JSON.parse(result)[0];
  var folio = resultado;
  var numOperacion = 0;
  
  if(resultado.substring(0,2) == 10){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  else if(resultado.substring(0,1) == 0){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        alert("Proceso concluido satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
        onButtonClickPestania("Tesoreria.Pagares.PrincipalPagares","");
      break;
      case 1:alert("Plazo erroneo!");break;
      case 2:alert("Plazo erroneo!");break;
      case 3:alert("Fecha de vencimiento feriada!");break;
      case 4:alert("No se grabó DATOVAL!");break;
      case 5:alert("No se grabó DETVALOR!");break;
      case 6:alert("No se contabilizó!");break;
      case 7:alert("El Pagare no se encuentra para el vencimiento!");break;
      case 8:alert("No se grabo DATOVAL en el vencimiento!");break;
      case 9:alert("No se grabó DETVALOR en el vencimiento!");break;
      case 10:alert("No existe la Operación " + numOperacion + " ó la Operación no tiene asignada Estructura Contable!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}

function verificaFechaMesAnteriorFideicomiso(){
  var fecha = GI("txtFechaValor").value;
  var fideicomiso = GI("numFideicomiso").value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesAnterior\",\"Fecha\":\"" + fecha + "\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaFechaMesAnterior, GI("numFideicomiso"));
}
function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result)[0];
  switch(resultado){
    case 0:
    case 2:
      showWaitLayer();
      asignaRetencionISR();
    break;
    case 1:
    case -1:
      alert("El Fideicomiso se encuentra cerrado");
      obj.focus();
    break;
  }
  hideWaitLayer();
}

var numsubcuenta = new Array();
function recuperaSubCuenta()
{
  var nfideicomiso = eval(GI("numFideicomiso").value);
  var nctoinver = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conPriSubCuentasporCtoInver\",\"Fideicomiso\":" + nfideicomiso + ",\"CtoInver\":" + nctoinver + "}";
  makeAjaxRequest(url, "HTML", validaSubCuenta, GI("numFideicomiso"));
}
function validaSubCuenta(obj, result){
  var resultado = JSON.parse(result)[0];
  GI("numSubcuenta").value=resultado.subcuenta;
  numsubcuenta=resultado.subcuenta.split("-")[0];
}
