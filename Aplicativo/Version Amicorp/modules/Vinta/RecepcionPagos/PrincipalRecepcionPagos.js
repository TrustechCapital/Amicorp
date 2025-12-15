// JavaScript Document

var clavesCombo81 = JSON.parse("{\"llaveClave\":81, \"cveParam1\":1, \"orderDescripcion\":\"s\"}");
var tipoPagoCombo = JSON.parse("{\"order\":\"s\"}");

var fvConsultaRecepcionPagos = new FormValidator();
var fvRecepcionPagos = new FormValidator();
pkInfo = null;

var arrTblDat = new Array();
arrTblDat[0] = "anumeroCredito,90px,center";
arrTblDat[1] = "iperiod,60px,right";
arrTblDat[2] = "dfechaIni,80px,center";
arrTblDat[3] = "dfechaFin,80px,center";
arrTblDat[4] = "idiasPeriod,40px,center";
arrTblDat[5] = "itasaInteres,40px,center";
arrTblDat[6] = "icapital,100px,right";
arrTblDat[7] = "iintereses,100px,right";
arrTblDat[8] = "iiva,100px,right";
arrTblDat[9] = "ipagoTotal,100px,right";
arrTblDat[10] = "isaldoCapital,100px,right";

loadElement(GI("cmbFormaPago"));

fvConsultaRecepcionPagos.setup({
  formName      : "frmDatosConsulta",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//Calendario para "Fecha"
Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    disableFunc    :    isValidDate,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});
//Calendario para "FechaPago"
Calendar.setup({
    inputField     :    "txtFechaPago",   // id of the input field
    button         :    "txtFechaPago",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    disableFunc    :    isValidDate,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

function isValidDate(date) {
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

function consultarRP(objButton, objForm, reqParams) {
  if(fvConsultaRecepcionPagos.checkForm()) {
    consultar(objButton, objForm, reqParams);
  }
  pkInfo = null;
  ocultaObj("trSeccion");  
}

function clickTabla(pk) {
  RF(GI("frmDatos"));
  if(pk.vanteriorPagada != "PAGADA") {
    ocultaObj("trSeccion");
    alert("Debe pagar el período más antiguo!");
    return;
  }
  pkInfo = pk;
  
  fvRecepcionPagos.setup({
    formName      : "frmDatos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  muestraObj("trSeccion");
}

function aplicaPago() {
  if(pkInfo == null) {
    alert("Debe seleccionar un registro de la tabla!");
    return;
  }
  if(fvRecepcionPagos.checkForm()) {
    switch(GI("cmbTipoPago").value) {
      case "1":
        if(parseFloat(GI("txtImporte").value) > parseFloat(pkInfo.icapital.replace(/,/g, ""))) {
          alert("El Importe de la operación debe ser menor o igual al Movimiento Capital del registro seleccionado!");
          GI("txtImporte").focus();
          return;
        }
      break;
      case "2":
        if(parseFloat(GI("txtImporte").value) > parseFloat(pkInfo.iintereses.replace(/,/g, ""))) {
          alert("El Importe de la operación debe ser menor o igual al Pago de Interés del registro seleccionado!");
          GI("txtImporte").focus();
          return;
        }
      break;
      case "3":
        if(parseFloat(GI("txtImporte").value) > pkInfo.iiva.replace(/,/g, "")) {
          alert("El Importe de la operación debe ser menor o igual al IVA del registro seleccionado!");
          GI("txtImporte").focus();
          return;
        }
      break;
    }
    showWaitLayer();
    var url = ctxRoot + "/executeRef.do?json={'id':'ejeFunAsignaFolio','TipoFolio':2}";
    makeAjaxRequest(url, "HTML", obtenerFolioyAplicarPago);
  }
}

function obtenerFolioyAplicarPago(obj, result) {
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado) && resultado != -1) {
    var objParametros = JSON.parse("{\"id\":\"insVintaPago\"}");
    eval("objParametros.idPago=" +  resultado);
    eval("objParametros.idTipoPago=" + GI("cmbTipoPago").value);
    eval("objParametros.periodo=" + pkInfo.iperiod);
    eval("objParametros.idProducto=" + pkInfo.idProducto);
    eval("objParametros.idCredito=" + pkInfo.idCredito);
    eval("objParametros.idCliente=" + pkInfo.idCliente);
    eval("objParametros.fechaPago='" + GI("txtFechaPago").value + "'");
    eval("objParametros.monto=" + GI("txtImporte").value);
    eval("objParametros.formaPago='" + GI("cmbFormaPago").value + "'");
    eval("objParametros.moneda='" + GI("cmbMoneda").value + "'");
    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objParametros);
    makeAjaxRequest(url, "HTML", respuestaAplicacionPago, objParametros);
  } else {
    alert("Error al asignar el folio de la operación!");
    hideWaitLayer();
  }
}

function respuestaAplicacionPago(obj, result) {
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado) && resultado.codigoError == 0) {
    var objParametros = JSON.parse("{\"id\":\"fncVintaPago\"}");
    eval("objParametros.idPago=" +  obj.idPago);
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    makeAjaxRequest(url, "HTML", respuestaFuncionPago, obj);
  } else {
    alert("Ocurrió un error al realizar la operación!");
    hideWaitLayer();
  }
}

function respuestaFuncionPago(obj, result) {
  var fnc = JSON.parse(result);
  if(isDefinedAndNotNull(fnc) && (fnc.resultado == 0 || fnc.resultado == 1)) {
    if(fnc.resultado == 1) {
      enviaCorreo(obj);
    }
    alert("Operación realizada exitosamente!");
  } else {
    alert("Ocurrió un error al realizar la operación, sin embargo el pago ha sido registrado!");
  }
  pkInfo = null;
  ocultaObj("trSeccion");
  RF(GI("frmDatos"));
  GI("cmdBuscar").click();
  hideWaitLayer();
}

function enviaCorreo(objParametros) {    
  var idLink = GI("linkReporteNew"); 
  //var parametrosUrl = new Object;
  
  objParametros.sendToJSP="true";
  objParametros.urlReporte= "/modules/Vinta/RecepcionPagos/EnviarCorreo.jsp";
  
  objParametros.id = "vinta.qryVintaClasificacionPago";
  objParametros.takeParameters = true;
  
  var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(objParametros);
  idLink.href = url;
  window.open(url, idLink.value, "width=450,height=205,scrollbars=NO");
  document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
}

function cargaPrincipalRecepcionPagos() {
  onButtonClickPestania("Vinta.RecepcionPagos.PrincipalRecepcionPagos","");
}
