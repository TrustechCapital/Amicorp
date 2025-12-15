var fvReportes = new FormValidator();

fvReportes.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaReporte(reporte) {
  var objReporte = GI("dvReporte");
  var urlReportes = ctxRoot + "/modules/Honorarios/Reportes/";
  
  if(reporte == "-1") {
    doInnerHTML(objReporte, "");
  } else {
    showWaitLayer();
    LDSCR(urlReportes + reporte + ".do", objReporte, hideWaitLayer);
  }
}

function ejecutaReporte() {
  if(fvReportes.checkForm()) {
    
    if(isDefinedAndNotNull(GI("paramFideicomiso")))
      if(GI("paramFideicomiso").value == "")
        GI("paramFideicomiso").value = 0;
    
    var parametros = getParameters(GI("frmReportes"));
    parametros.template = GI("template").value;
    parametros.nombreReporte = GI("nombreReporte").value;
    if(isDefinedAndNotNull(GI("refSP"))) {
      parametros.id = GI("refSP").value;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
    } else {
      validaEjecucionReporte(parametros, "{\"RESULTADO\":0}");
    }
    showWaitLayer();
    makeAjaxRequest(url, "HTML", validaEjecucionReporte, parametros);
  } else {
    
  }
}

function validaEjecucionReporte(obj, result) {
  // TODO: Dejar el mensaje de espera hasta que se despliegue el guardar como
  var objResult = JSON.parse(result);
  if(objResult.RESULTADO == 0) { // Ejecucion OK
    obj.id = GI("refQry").value;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI("linkReporte");
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  } else if(objResult.RESULTADO == 1){ // Error
  } else { // Error ORACLE
  }
  
  //hideWaitLayer();
}


//////////////////////////////////////////
//Funciones para cambiar el tipo de *.xsl que se mandará llamar
function PrimerRecordatorio(objCmbPeriodicidad) {
  if(objCmbPeriodicidad.value == 1)
    GI("template").value = "/xml/Reportes/Honorarios/PrimerRecordatorioM.xsl";
  else
    GI("template").value = "/xml/Reportes/Honorarios/PrimerRecordatorioBTSA.xsl";
}

function SegundoRecordatorio(objCmbPeriodicidad) {
  if(objCmbPeriodicidad.value == 1 || objCmbPeriodicidad.value == 2)
    GI("template").value = "/xml/Reportes/Honorarios/SegundoRecordatorioMB.xsl";
  else
    GI("template").value = "/xml/Reportes/Honorarios/SegundoRecordatorioTSA.xsl";
}

function TercerRecordatorio(objCmbPeriodicidad) {
  if(objCmbPeriodicidad.value == 1 || objCmbPeriodicidad.value == 3)
    GI("template").value = "/xml/Reportes/Honorarios/TercerRecordatorioMT.xsl";
  else
    GI("template").value = "/xml/Reportes/Honorarios/TercerRecordatorioBSA.xsl";
}