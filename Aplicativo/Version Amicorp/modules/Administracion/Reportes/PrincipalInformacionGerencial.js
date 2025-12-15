var fvReportes = new FormValidator();

fvReportes.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

var fechaDefault = new Date();
var cmbObligacionesFiscalesParam = JSON.parse("{\"chido\":140}");
function setFechaCal() {
  var fecha;
  if(isDefinedAndNotNull(GI("Fecha")))
  { 
    fecha = GI("Fecha").value.split("/");
    
     GI("paramDia").value = fecha[0];  
     GI("paramMes").value = fecha[1];  
     GI("paramAno").value = fecha[2];
  }
  else if(isDefinedAndNotNull(GI("paramFecha")))
  {
    fecha = GI("paramFecha").value.split("/");
     GI("paramDia").value = fecha[0];  
     GI("paramMes").value = fecha[1];  
     GI("paramAno").value = fecha[2];
  }
  else if((isDefinedAndNotNull(GI("paramFechaDel"))&&isDefinedAndNotNull(GI("paramFechaAl"))) )
  {
    // nada
	
  }
}

function isValidDate(date) { 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

function cargaCalendario(idCalendario) {
  Calendar.setup({
      inputField     :    idCalendario,   // id of the input field
      button         :    idCalendario,
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    setFechaCal,
      disableFunc    :    isValidDate,
      date           :    fechaDefault,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
  });                   
}

function cargaReporte(reporte) {
  var objReporte = GI("dvReporte");
  var urlReportes = ctxRoot + "/modules/Administracion/Reportes/";
  
  if(reporte == "-1") {
    doInnerHTML(objReporte, "");
  } 
  else {
    showWaitLayer();
    LDSCR(urlReportes + reporte + ".do", objReporte, pantallaCargada);
  }
}

function pantallaCargada() {
  hideWaitLayer();
  
  if(isDefinedAndNotNull(GI("Fecha")))
    try { cargaCalendario("Fecha"); } catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFecha"))) 
    try { cargaCalendario("paramFecha"); } catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFechaDel"))&&isDefinedAndNotNull(GI("paramFechaAl"))) 
    try { cargaCalendario("paramFechaDel");cargaCalendario("paramFechaAl");} catch(ex) {} 

}

function ejecutaReporte() {
  if(fvReportes.checkForm()) {
    var parametros = getParameters(GI("frmReportes"));
    //alert(parametros)
    if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("urlReporte"))) {
      var url = GI("urlReporte").value;
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
      showWaitLayer();
      makeAjaxRequest(url, "HTML", validaEjecucionReporte, parametros);
	  //alert(url)
    } else {
      validaEjecucionReporte(parametros, "{\"RESULTADO\":0}");
    }
  }
}

function validaEjecucionReporte(obj, result) {
  var objResult = JSON.parse(result);
  var resultado = -1;
  
  if(isDefinedAndNotNull(objResult.RESULTADO))
    resultado = objResult.RESULTADO;
  else if(isDefinedAndNotNull(objResult.codigoError))
    resultado = objResult.codigoError;
  //alert(resultado)  
  if(resultado == 0) { // Ejecucion OK
	//alert(GI("refSP").value)
	if(GI("refSP").value!='repInformacionPersonas'){
		//alert(GI("cmbReportes").value	)	
		var idLink = "linkReporte"; 
		if(isDefinedAndNotNull(obj.sendToJSP)) idLink = "linkReporteNew"; 
		obj.id = GI("refQry").value;
		var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
		var link = GI(idLink);
		link.href=url;
		link.click();
		hideWaitLayer();	
		if(GI("cmbReportes").value.indexOf("InformacionPersonas")!=-1)
			descarga_archivo();
		document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
	}
	else{
		hideWaitLayer();		
		descarga_archivo_infopers();
	}	
  } else {
    if(resultado == 1){ // Error
    } else { // Error ORACLE
    }
  }
  hideWaitLayer();
}

var fncValidaTransferencia = JSON.parse("{\"id\":\"conArcPlaTAS\"}");

function descarga_archivo()
{
	//alert("entro aki")	
    fncValidaTransferencia.queryId = "conArcPlaTAS";
	fncValidaTransferencia.colData = "arpDescripcion";
	fncValidaTransferencia.order = "\"s\"";	
    fncValidaTransferencia.fileName = "ARCHIVO";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(fncValidaTransferencia);
	//alert(url)
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Archivo concluido satisfactoriamente!");
    hideWaitLayer();	
}

function descarga_archivo_infopers()
{
	//alert("entro aki")	
    fncValidaTransferencia.queryId = "conArcPla";
	fncValidaTransferencia.colData = "arpDescripcion";
	fncValidaTransferencia.order = "\"s\"";	
    fncValidaTransferencia.fileName = "ARCHIVO";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(fncValidaTransferencia);
	//alert(url)
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Archivo concluido satisfactoriamente!");
    hideWaitLayer();	
}