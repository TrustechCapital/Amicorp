showWaitLayer();
deshabilitaPK("txtEmisora,txtSerie,txtCupon".split(","));

var divNombreFideicomisoParam;
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");
var cmbSubCta = JSON.parse("{\"Fideicomiso\":0,\"order\":\"s\"}");
//var txtPosicionParam = JSON.parse("{\"numFideicomiso\":-1,\"numContratoInversion\":-1,\"numIntermediario\":-1,\"order\":\"1\"}");
var txtPosicionParam = JSON.parse("{\"numFideicomiso\":-1,\"numContratoInversion\":-1,\"order\":\"s\"}");
var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbEmisionParam = JSON.parse("{\"tipoMercado\":-1,\"order\":1}");
var fncEntradaSalidaFisicaParam = JSON.parse("{\"id\":\"ejeFunEntradaSalidaFisica\"}");
var txtRetencionParam = JSON.parse("{\"numMercado\":-1,\"numContratoInversion\":-1,\"numInstrumento\":-1}");
var fechaDefault = new Date();
var fvEntradasSalidas = new FormValidator();
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
fvEntradasSalidas.setup({
  formName      : "frmEntradasSalidas",
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
    cmbSubCta.Fideicomiso = objTxtNumFideicomiso.value;
    
    loadElement(objCmbContratoInversion);
    loadElement(GI('numSubcuenta'));
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
}
function consultaNomFid(){
  consultaNombreFideicomiso("nomFideicomiso",GI("numFideicomiso"));
  hideWaitLayer();
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
  ocultaObjs("cmbEmisiones,dvEmisiones,cmbMercado,dvMercado");
  RA(GI("cmbEmisiones"),"required");
  RA(GI("cmbMercado"),"required");
  limpiaCombos("cmbContratoInversion,cmbMercado,cmbEmisiones,numSubcuenta");
  borraCombos("cmbContratoInversion");
  limpiaTxts("numFideicomiso,txtEmisora,txtSerie,txtCupon,txtNoTitulos,txtPrecio,txtImporte,nomFideicomiso");  
  limpiaDivs("nomFideicomiso");
  loadTableElement(GI("tblRegPriPos"),"[]");
  asignaValueRadio2Master("rdTipoMovimiento",objRdMovimiento);
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  switch(tipoMovimiento){
    case 1:
      muestraObjs("cmbEmisiones,dvEmisiones,cmbMercado,dvMercado");
      SA(GI("cmbEmisiones"),"required","true");
      SA(GI("cmbMercado"),"required","true");
    break;
  }
}

function cargaPosicion(cmbContratoInversion){
var subcuenta
  loadTableElement(GI("tblRegPriPos"),"[]");
  if(GI("rdTipoMovimiento").value == 2 && cmbContratoInversion.selectedIndex != 0){
    showWaitLayer();
    limpiaTxts("txtEmisora,txtSerie,txtCupon");
    txtPosicionParam.numFideicomiso = GI("numFideicomiso").value;
    //txtPosicionParam.numContratoInversion = GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1);
    //alert(GI("numSubcuenta").value)
    if(GI("numSubcuenta").value!=null&&GI("numSubcuenta").value!=-1){
        subcuenta=GI("numSubcuenta").value
    }
    else{
        subcuenta=0;
    }
    txtPosicionParam.numContratoInversion = subcuenta//GI("numSubcuenta").value;
    //txtPosicionParam.numIntermediario = GI("cmbContratoInversion").value;
    loadElement(GI("txtMesAbierto"));
  }
}
function cargaTablaPosicion(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    loadTableElement(GI("tblRegPriPos"),result);
  }else{
    loadTableElement(GI("tblRegPriPos"),result);
    alert("El Fideicomiso no tiene posición");
    hideWaitLayer();
  }
}
function asignaRetencionISR(){
  var numMercado;
  var numInstrumento;
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  if(fvEntradasSalidas.checkForm()){
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

function ejecutaEntradaSalidaFisica(){
  var tipoMovimiento = eval(GI("rdTipoMovimiento").value);
  if(fvEntradasSalidas.checkForm()){
    if(GI("txtEmisora").value != ""){
      var numUsuario = 683; //ALERTA: SE PUSIERON DE ESTA FORMA EN EL CODIGO YA QUE LOS PARAMETROS PARA FUNCIONES Y STORES DEBEN IR UNO A UNO ORDENADOS(NO ES COMO LOS QUERYS)
      fncEntradaSalidaFisicaParam.numFideicomiso = eval(GI("numFideicomiso").value);
      fncEntradaSalidaFisicaParam.numIntermediario = eval(GI("cmbContratoInversion").value); 

//    alert((GI("cmbContratoInversion").selectedIndex))

      if(GI("cmbContratoInversion").selectedIndex==0)
        fncEntradaSalidaFisicaParam.numIntermediario = 0;
      else
        fncEntradaSalidaFisicaParam.numIntermediario = eval(GI("cmbContratoInversion").value); 
      
      if(GI("cmbContratoInversion").selectedIndex==0)
        fncEntradaSalidaFisicaParam.numContratoInversion = 0;
      else
        fncEntradaSalidaFisicaParam.numContratoInversion = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
        
      if(GI("numSubcuenta").selectedIndex==0)
          fncEntradaSalidaFisicaParam.numSubFideicomiso = 0;
      else
          fncEntradaSalidaFisicaParam.numSubFideicomiso = eval(GI("numSubcuenta").value);
        
        
      //fncEntradaSalidaFisicaParam.numContratoInversion = eval(GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.split("/")[0].substring(0,GI("cmbContratoInversion").options[GI("cmbContratoInversion").selectedIndex].text.length - 1));
        
      fncEntradaSalidaFisicaParam.Emisora = GI("txtEmisora").value;
      fncEntradaSalidaFisicaParam.Serie = GI("txtSerie").value;
      fncEntradaSalidaFisicaParam.numCupon = eval(GI("txtCupon").value);
      fncEntradaSalidaFisicaParam.numTitulos = eval(GI("txtNoTitulos").value);
      fncEntradaSalidaFisicaParam.numTipoMovimiento = eval(GI("rdTipoMovimiento").value);
      switch(tipoMovimiento){
        case 1:
      //  alert("mercado"+eval(GI("cmbMercado").value))
          fncEntradaSalidaFisicaParam.numMercado = eval(GI("cmbMercado").value);
          //fncEntradaSalidaFisicaParam.TipoAdministracion = "\"" + GI("nomFideicomiso").value + "\"";
   //       alert("tipo admon"+ GI("nomFideicomiso").value)
          fncEntradaSalidaFisicaParam.TipoAdministracion = GI("nomFideicomiso").value;
          fncEntradaSalidaFisicaParam.numInstrumento = eval(GI("cmbEmisiones").value.split(",")[1]);
          fncEntradaSalidaFisicaParam.numMoneda = 1;
          fncEntradaSalidaFisicaParam.FechaContable = GI("txtFechaValor").value;
          fncEntradaSalidaFisicaParam.numImporte = eval(GI("txtImporte").value);
          fncEntradaSalidaFisicaParam.numPrecio = eval(GI("txtPrecio").value);
          fncEntradaSalidaFisicaParam.numRetencionISR = eval(GI("txtRetencionISR").value);
          fncEntradaSalidaFisicaParam.numTipoCambio = 1;
          fncEntradaSalidaFisicaParam.numEmision = eval(GI("cmbEmisiones").value.split(",")[2]);
        break;
        case 2:
          fncEntradaSalidaFisicaParam.numMercado = pkInfo.posCveTipoMerca;
          //fncEntradaSalidaFisicaParam.TipoAdministracion = "\"" + GI("nomFideicomiso").value + "\"";
          fncEntradaSalidaFisicaParam.TipoAdministracion = GI("nomFideicomiso").value;
          fncEntradaSalidaFisicaParam.numInstrumento = pkInfo.posNumInstrume;
          fncEntradaSalidaFisicaParam.numMoneda = 1;
          fncEntradaSalidaFisicaParam.FechaContable = GI("txtFechaValor").value;
          fncEntradaSalidaFisicaParam.numImporte = eval(GI("txtImporte").value);
          fncEntradaSalidaFisicaParam.numPrecio = eval(GI("txtPrecio").value);
          fncEntradaSalidaFisicaParam.numRetencionISR = eval(GI("txtRetencionISR").value);
          fncEntradaSalidaFisicaParam.numTipoCambio = 1;
          fncEntradaSalidaFisicaParam.numEmision = pkInfo.posNumSecEmis;
        break;
      }
      fncEntradaSalidaFisicaParam.FechaAnterior = GI("txtFechaValor").value;
      fncEntradaSalidaFisicaParam.mesAbierto = eval(GI("txtMesAbierto").value);
      fncEntradaSalidaFisicaParam.numUsuario = numUsuario;
      fncEntradaSalidaFisicaParam.numTituloGarantia = GI("chkTitulosGarantia").checked?1:0;
      var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncEntradaSalidaFisicaParam);
     
      makeAjaxRequest(url, "HTML", validaEntradaSalidaFisica, null);
    }else{
      alert("Selecciona Emisora, Serie, y Cupón");
    }
  }
}

function validaEntradaSalidaFisica(obj, result){
//alert(result)
  var resultado = JSON.parse(result)[0];
  var folio = resultado;
  var numOperacion = 0;
  
  
  if(resultado.substring(0,1) == 3){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }else if(resultado.substring(0,1) == 0){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  
  
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        if(fncEntradaSalidaFisicaParam.numTipoMovimiento == 1)
          alert("Entrada física realizada satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
        else
          alert("Salida física realizada satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
        onButtonClickPestania("Garantias.ControlAccionario.EntradasSalidas.PrincipalEntradasSalidas","");
      break;
      case 1:alert("No existe Posición!");break;
      case 2:alert("Posición insuficiente!");break;
      case 3:alert("No existe la Operación " + numOperacion + " ó la Operación no tiene asignada Estructura Contable!");break;
      case 4:alert("No se grabó la Entrada en COMPEMIS!");break;
      case 5:alert("No se grabó la Salida en COMPEMIS!");break;
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
