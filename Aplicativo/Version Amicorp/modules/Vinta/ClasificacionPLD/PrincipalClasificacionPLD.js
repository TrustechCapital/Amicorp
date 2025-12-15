// JavaScript Document
pkInfo = null;

var arrTblDat = new Array();
arrTblDat[0] = "idPago,50px,right";
arrTblDat[1] = "vfechaPago,80px,center";
arrTblDat[2] = "vnRs,200px";
arrTblDat[3] = "vnivelRiesgo,130px,center";
arrTblDat[4] = "vmoneda,130px,center";
arrTblDat[5] = "imonto,100px,right";
arrTblDat[6] = "vclasificacion,150px,center";
arrTblDat[7] = "vstatus,100px,center";
arrTblDat[8] = "vreportado,130px,center";

//Calendario para "Fecha"
Calendar.setup({
    inputField     :    "paramFechaInicio",   // id of the input field
    button         :    "paramFechaInicio",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    disableFunc    :    isValidDate,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

//Calendario para "Fecha"
Calendar.setup({
    inputField     :    "paramFechaFin",   // id of the input field
    button         :    "paramFechaFin",
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

function consultarCPLD(objButton, objForm, reqParams, idParamOrder) {
  consultar(objButton, objForm, reqParams, idParamOrder);
  pkInfo = null;
  ocultaObj("trSeccion");
}

function clickTabla(pk) {
  pkInfo = pk;
  GI("txtComentariosEjecutivo").value = pkInfo.vcomentarios;
  GI("txtComentarios").value = pkInfo.vcomentariosOc;
  
  GI("chkReporta").checked = pkInfo.ireporta == 1;
  
  muestraObj("trSeccion");
}

function operacionClasificacionPago() {
  if(pkInfo == null) {
    alert("Debe seleccionar un registro de la tabla!");
    return;
  }
  
  var objParametros = JSON.parse("{\"id\":\"updVintaClasificacionPago\"}");
  eval("objParametros.clasificacion='" + pkInfo.vclasificacion + "'");
  eval("objParametros.reporta=" + (GI("chkReporta").checked? 1: 0));
  eval("objParametros.idPago=" + pkInfo.idPago);
  eval("objParametros.idTipoPago=" + pkInfo.idTipoPago);
  eval("objParametros.periodo=" + pkInfo.iperiod);
  eval("objParametros.idProducto=" + pkInfo.idProducto);
  eval("objParametros.idCredito=" + pkInfo.idCredito);
  eval("objParametros.idCliente=" + pkInfo.idCliente);
  eval("objParametros.comentarios='" + GI("txtComentarios").value + "'");
  
  showWaitLayer();
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(url, "HTML", respuestaClasificacionPago, null);
}

function respuestaClasificacionPago(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado) && resultado.codigoError == 0) {
    alert("Operación realizada exitosamente!");
  } else {
    alert("Ocurrió un error al realizar la operación!");
  }
  pkInfo = null;
  ocultaObj("trSeccion");
  GI("cmdBuscar").click();
  hideWaitLayer();
}

function cargaPrincipalClasificacionPagos() {
  onButtonClickPestania("Vinta.ClasificacionPLD.PrincipalClasificacionPLD","");
}
