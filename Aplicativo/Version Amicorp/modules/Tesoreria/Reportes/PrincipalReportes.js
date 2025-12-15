var fvReportes = new FormValidator();

fvReportes.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaReporte(reporte) {
  var objReporte = GI("dvReporte");
  var urlReportes = ctxRoot + "/modules/Tesoreria/Reportes/";
  
  if(reporte == "-1") {
    doInnerHTML(objReporte, "");
  } else {
    showWaitLayer();
    LDSCR(urlReportes + reporte + ".do", objReporte, hideWaitLayer);
    
    eval(reporte+"();")
  }
}

function ejecutaReporte() {
  if(fvReportes.checkForm()) {
    var parametros = getParameters(GI("frmReportes"));
    var par = JSON.stringify(parametros);
    if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("paramurlReporte"))) {
     
      var url = GI("paramurlReporte").value;
      
      for(k in parametros) {
        url += k + "=" + parametros[k] + "&";    
      }
      url += "web=0";
      var link = GI("linkReporteNew");
      
      link.href=url;
      link.click();    
      return;
    }

    if(isDefinedAndNotNull(GI("template"))) parametros.template = GI("template").value;
    if(isDefinedAndNotNull(GI("nombreReporte"))) parametros.nombreReporte = GI("nombreReporte").value;
    if(isDefinedAndNotNull(GI("refSP"))) {
      parametros.id = GI("refSP").value;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
      
    } else {
      validaEjecucionReporte(parametros, "{\"RESULTADO\":0}");
    }
    makeAjaxRequest(url, "HTML", validaEjecucionReporte, parametros);
  } else {
    
  }
}


function validaEjecucionReporte(obj, result) {
  var objResult = JSON.parse(result);
  var resultado = -1;
  
  if(isDefinedAndNotNull(objResult.RESULTADO))
    resultado = objResult.RESULTADO;
  else if(isDefinedAndNotNull(objResult.codigoError))
    resultado = objResult.codigoError
  if(resultado == 0) { // Ejecucion OK
    var idLink = "linkReporte"; 
    if(isDefinedAndNotNull(obj.sendToJSP)) idLink = "linkReporteNew"; 
    obj.id = GI("refQry").value;
    //obj.id = GI("refQryAct").value;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI(idLink);
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();
  } else {
    hideWaitLayer();
    if(resultado == 1){ // Error
    } else { // Error ORACLE
    }
  }
      hideWaitLayer();
}

