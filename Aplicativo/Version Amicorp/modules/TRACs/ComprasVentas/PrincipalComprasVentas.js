showWaitLayer();
deshabilitaPK("txtEmisora,txtSerie,txtCupon".split(","));

var divNombreFideicomisoParam;
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");
var txtPosicionParam = JSON.parse("{\"numFideicomiso\":-1,\"numContratoInversion\":-1,\"numIntermediario\":-1,\"order\":\"1\"}");
var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbEmisionParam = JSON.parse("{\"tipoMercado\":1,\"numInstrumento\":6,\"order\":1}");
var fncCompraVentaParam = JSON.parse("{\"id\":\"ejeFunCompraVenta\"}");
var txtRetencionParam = JSON.parse("{\"numMercado\":-1,\"numContratoInversion\":-1,\"numInstrumento\":-1}");
var fechaDefault = new Date();
var fvComprasVentas = new FormValidator();
var arrTblPosDat = new Array();
pkInfo = null;

arrTblPosDat[0] = "posNomPizarra,86";
arrTblPosDat[1] = "posNumSerEmis,70";
arrTblPosDat[2] = "posNumCuponVig,67";
arrTblPosDat[3] = "posVtasPosicPer,100";
arrTblPosDat[4] = "posCpasPosicPer,100";
arrTblPosDat[5] = "posPosicActual,120";
arrTblPosDat[6] = "posPosicComprom,120";
arrTblPosDat[7] = "posPosicDisponible,120";
arrTblPosDat[8] = "posCostoHistoric,120";

initForms();

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  return false;
  /*if(date > today) return true;
  else return false;*/
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

Calendar.setup({
    inputField     :    "txtFechaLiq",
    button         :    "txtFechaLiq",
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

fvComprasVentas.setup({
  formName      : "frmComprasVentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  var objTemp = new Object();
  objTemp.value = "0,0,0," + pk.posNomPizarra + "," + pk.posNumSerEmis + "," + pk.posNumCuponVig;
  asignaEmisoraSerieCupon(objTemp);
  pkInfo = pk;
}

function cargaCmbContratoInversion(objTxtNumFideicomiso,objCmbContratoInversion){
  if(objTxtNumFideicomiso.value != ""){
    showWaitLayer();
    objCmbContratoInversion.selectedIndex = 0;
    cmbContratoInversionParam.fideicomiso = objTxtNumFideicomiso.value;
    loadElement(objCmbContratoInversion);
  }
}
function cargaComboEmisiones(objCmbMercado){
  limpiaCombos("cmbEmisiones");
  limpiaTxts("txtEmisora,txtSerie,txtCupon");  
  if(GI("rdTipoMovimiento").checked){
    showWaitLayer();
    cmbEmisionParam.tipoMercado = objCmbMercado.value; 
    loadElement(GI("cmbEmisiones"));
  }
  
  if(objCmbMercado.value==1) // mercado capitales
  {
    GI('trFechaLiq').style.visibility = 'visible';
  }
  else // otros mercados
  {
    GI('trFechaLiq').style.visibility = 'hidden';
  }
}
function consultaNomFid(){
  consultaNombreFideicomiso("nomFideicomiso",GI("numFideicomiso"));
}

function calculaImporte(valor1, valor2){
  valor1 = isDefinedAndNotNull(valor1)?valor1:0;
  valor2 = isDefinedAndNotNull(valor2)?valor2:0;
  if(valor1 != 0 && valor2 !=0)
    GI("txtImporte").value = valor1 * valor2;
}

function calculaPrecio(valor1, valor2){
  valor1 = isDefinedAndNotNull(valor1)?valor1:0;
  valor2 = isDefinedAndNotNull(valor2)?valor2:0;
  if(valor1 != 0 && valor2 !=0)
    GI("txtPrecio").value = valor1 / valor2;
}

function asignaEmisoraSerieCupon(objCmbEmisiones){
  if(objCmbEmisiones.selectedIndex != 0){
    GI("txtEmisora").value = objCmbEmisiones.value.split(",")[3];
    GI("txtSerie").value = objCmbEmisiones.value.split(",")[4];
    GI("txtCupon").value = objCmbEmisiones.value.split(",")[5];
  }else{
    limpiaTxts("txtEmisora,txtSerie,txtCupon");
  }
}
function cargaObjetosTipoMovimiento(objRdMovimiento){
  ocultaObjs("cmbEmisiones,dvEmisiones,dvMercado");
  RA(GI("cmbEmisiones"),"required");
  limpiaCombos("cmbContratoInversion,cmbEmisiones");
  borraCombos("cmbContratoInversion");
  limpiaTxts("numFideicomiso,txtEmisora,txtSerie,txtCupon,txtNoTitulos,txtPrecio,txtImporte,nomFideicomiso");  
  limpiaDivs("nomFideicomiso");
  RA(GI("tblRegPriPos"),"NoRecordsMsg");
  loadTableElement(GI("tblRegPriPos"),"[]");
  SA(GI("tblRegPriPos"),"NoRecordsMsg","No existen Registros para estos criterios de búsqueda");
  asignaValueRadio2Master("rdTipoMovimiento",objRdMovimiento);
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  switch(tipoMovimiento){
    case 1:
      muestraObjs("cmbEmisiones,dvEmisiones,dvMercado");
      SA(GI("cmbEmisiones"),"required","true");
    case 2:
      muestraObjs("dvMercado");
    break;
  }
}

function cargaPosicion(cmbContratoInversion){
  RA(GI("tblRegPriPos"),"NoRecordsMsg");
  loadTableElement(GI("tblRegPriPos"),"[]");
  SA(GI("tblRegPriPos"),"NoRecordsMsg","No existen Registros para estos criterios de búsqueda");
  if(GI("rdTipoMovimiento").value == 2 && cmbContratoInversion.selectedIndex != 0){
    showWaitLayer();
    limpiaTxts("txtEmisora,txtSerie,txtCupon");
    txtPosicionParam.numFideicomiso = GI("numFideicomiso").value;
    txtPosicionParam.numContratoInversion = GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1);
    txtPosicionParam.numIntermediario = GI("cmbContratoInversion").value;
    loadElement(GI("txtMesAbierto"));
  }
}
function cargaTablaPosicion(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    SA(GI("tblRegPriPos"),"NoRecordsMsg","No existen Registros para estos criterios de búsqueda");
    loadTableElement(GI("tblRegPriPos"),result);
  }else{
    SA(GI("tblRegPriPos"),"NoRecordsMsg","No existen Registros para estos criterios de búsqueda");
    loadTableElement(GI("tblRegPriPos"),result);
    alert("El Fideicomiso no tiene posición");
    hideWaitLayer();
  }
}
function asignaRetencionISR(){
  var numMercado;
  var numInstrumento;
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  if(fvComprasVentas.checkForm()){
    if(GI("txtEmisora").value != ""){
      showWaitLayer();
      switch(tipoMovimiento){
       case 1:
        numMercado = GI("cmbMercado").value;
        numInstrumento = GI("cmbEmisiones").value.split(",")[1];
       break;
       case 2:
        numMercado = pkInfo.posCveTipoMerca;
        numInstrumento = pkInfo.posNumInstrume;
       break;
      }
      txtRetencionParam.numMercado = numMercado
      txtRetencionParam.numInstrumento = numInstrumento
      loadElement(GI("txtRetencionISR"));
    }else{
      alert("Selecciona Emisora, Serie, y Cupón");
    }
  }
}

function ejecutaCompraVenta(){
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  if(fvComprasVentas.checkForm()){
    if(GI("txtEmisora").value != ""){
      var numUsuario = 683; //ALERTA: SE PUSIERON DE ESTA FORMA EN EL CODIGO YA QUE LOS PARAMETROS PARA FUNCIONES Y STROES DEBEN IR UNO A UNO ORDENADOS(NO ES COMO LOS QUERYS)
      fncCompraVentaParam.numFideicomiso = eval(GI("numFideicomiso").value);
      if(numsubcuenta.length!=0&&numsubcuenta!=null)
          fncCompraVentaParam.numSubFideicomiso = eval(numsubcuenta);
       else
          fncCompraVentaParam.numSubFideicomiso = eval(0);   
      fncCompraVentaParam.numIntermediario = eval(GI("cmbContratoInversion").value); 
      fncCompraVentaParam.numContratoInversion = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
      fncCompraVentaParam.Emisora = GI("txtEmisora").value;
      fncCompraVentaParam.Serie = GI("txtSerie").value;
      fncCompraVentaParam.numCupon = eval(GI("txtCupon").value);
      fncCompraVentaParam.numTitulos = eval(GI("txtNoTitulos").value);
      switch(tipoMovimiento){
        case 1:
          fncCompraVentaParam.numMercado = eval(GI("cmbMercado").value);
          fncCompraVentaParam.TipoAdministracion = GI("nomFideicomiso").value;
          fncCompraVentaParam.numInstrumento = eval(GI("cmbEmisiones").value.split(",")[1]);
          fncCompraVentaParam.numMoneda = 1;
          fncCompraVentaParam.FechaContable = GI("txtFechaValor").value;
          fncCompraVentaParam.numImporte = eval(GI("txtImporte").value);
          fncCompraVentaParam.numPrecio = eval(GI("txtPrecio").value);
          fncCompraVentaParam.numRetencionISR = eval(GI("txtRetencionISR").value);
          fncCompraVentaParam.numTipoCambio = 1;
          fncCompraVentaParam.numEmision = eval(GI("cmbEmisiones").value.split(",")[2]);
          fncCompraVentaParam.numTipo = tipoMovimiento;
          fncCompraVentaParam.numTipoMovimiento = 22;
        break;
        case 2:
          fncCompraVentaParam.numMercado = pkInfo.posCveTipoMerca;
          fncCompraVentaParam.TipoAdministracion = GI("nomFideicomiso").value;
          fncCompraVentaParam.numInstrumento = pkInfo.posNumInstrume;
          fncCompraVentaParam.numMoneda = 1;
          fncCompraVentaParam.FechaContable = GI("txtFechaValor").value;
          fncCompraVentaParam.numImporte = eval(GI("txtImporte").value);
          fncCompraVentaParam.numPrecio = eval(GI("txtPrecio").value);
          fncCompraVentaParam.numRetencionISR = eval(GI("txtRetencionISR").value);
          fncCompraVentaParam.numTipoCambio = 1;
          fncCompraVentaParam.numEmision = pkInfo.posNumSecEmis;
          fncCompraVentaParam.numTipo= tipoMovimiento;
          fncCompraVentaParam.numTipoMovimiento = 23;
        break;
      }
      
      if(eval(GI("cmbMercado").value)==1)//mercado de capitales
      {
        fncCompraVentaParam.FechaAnterior = GI("txtFechaLiq").value;
      }
      else // otros mercados
      {
        fncCompraVentaParam.FechaAnterior = GI("txtFechaValor").value;
      }
      
      
      
      fncCompraVentaParam.mesAbierto = eval(GI("txtMesAbierto").value);
      fncCompraVentaParam.numUsuario = numUsuario;
      fncCompraVentaParam.numUnidades = 0;
      var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncCompraVentaParam);
      
      makeAjaxRequest(url, "HTML", validaCompraVenta, null);
    }else{
      alert("Selecciona Emisora, Serie, y Cupón");
    }
  }
}

function validaCompraVenta(obj, result){

  var resultado = JSON.parse(result)[0];
  var folio = resultado;
  var numOperacion = 0;
  if(resultado.substring(0,1) == 3){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        if(fncCompraVentaParam.numTipo == 1)
        {
          //alert("Compra realizada satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
          alert("Compra realizada satisfactoriamente");
        }
        else 
        {
          //alert("Venta realizada satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
          alert("Venta realizada satisfactoriamente");
        }
        onButtonClickPestania("TRACs.ComprasVentas.PrincipalComprasVentas","");
      break;
      case 1:alert("No existe Posición!");break;
      case 2:alert("Posición insuficiente!");break;
      case 3:alert("No existe la Operación " + numOperacion + " ó la Operación no tiene asignada Estructura Contable!");break;
      case 4:alert("No se grabó la Compra en COMPEMIS!");break;
      case 5:alert("No se grabó la Venta en COMPEMIS!");break;
      case 6:alert("No se grabó DATOVAL!");break;
      case 7:alert("No se determinó la Utilidad/Perdida!");break;
      case 8:alert("No se Contabilizó!");break;
      case 9:alert("No se grabó la Posición!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}

var numsubcuenta = new Array();
function recuperaSubCuenta()
{
  if(GI("cmbContratoInversion").selectedIndex!=0)
  {
      var nfideicomiso = eval(GI("numFideicomiso").value);
      var nctoinver = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
      var url = ctxRoot + "/getRef.do?json={\"id\":\"conPriSubCuentasporCtoInver\",\"Fideicomiso\":" + nfideicomiso + ",\"CtoInver\":" + nctoinver + "}";
      makeAjaxRequest(url, "HTML", validaSubCuenta, GI("numFideicomiso"));
  }
}
function validaSubCuenta(obj, result){
  var resultado = JSON.parse(result)[0];
  GI("numSubcuenta").value=resultado.subcuenta;
  numsubcuenta=resultado.subcuenta.split("-")[0];
}