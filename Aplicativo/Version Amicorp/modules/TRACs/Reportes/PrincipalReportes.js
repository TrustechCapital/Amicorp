var fvReportes = new FormValidator();
var cmbCtaChequesParam = JSON.parse("{\"fideicomiso\":-1,\"tipo\":-1,\"orden\":\"s\"}");
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");

var cmbFideicomisoTrac = JSON.parse("{}");


fvReportes.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

var fechaDefault = new Date();

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
  else if((isDefinedAndNotNull(GI("paramFechaInical"))&&isDefinedAndNotNull(GI("paramFechaFinal"))) || (isDefinedAndNotNull(GI("paramFechaUnica"))) )
  {
  
  }
}

function validaFecha()
{
  if(isDefinedAndNotNull(GI("Fecha"))&&GI("paramEstructura").value==3) 
    alert("La Fecha es un campo Obligatorio");
}

function isValidDate(date) { 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false});

function cargaCalendario(idCalendario) {
    cal.manageFields(idCalendario,idCalendario, "%d/%m/%Y");
}

function cargaReporte(reporte) {
  var objReporte = GI("dvReporte");
  var urlReportes = ctxRoot + "/modules/TRACs/Reportes/";
  if(reporte == "-1") {
    doInnerHTML(objReporte, "");
  } else {
    LDSCR(urlReportes + reporte + ".do", objReporte, pantallaCargada);
  }
}

function pantallaCargada() {
  hideWaitLayer();
    if(isDefinedAndNotNull(GI("Fecha")))
    try { cargaCalendario("Fecha"); } catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFecha"))) 
    try { cargaCalendario("paramFecha");} catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramfecha"))) 
    try { cargaCalendario("paramfecha");} catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFechaDel"))&&isDefinedAndNotNull(GI("paramFechaAl"))) 
    try { cargaCalendario("paramFechaDel");cargaCalendario("paramFechaAl");} catch(ex) {} 
 else if(isDefinedAndNotNull(GI("paramFechaInicial"))&&isDefinedAndNotNull(GI("paramFechaFinal"))) 
    try { cargaCalendario("paramFechaInicial");cargaCalendario("paramFechaFinal");} catch(ex) {} 
  else if(isDefinedAndNotNull(GI("paramFechaUnica"))) 
    try { cargaCalendario("paramFechaUnica");} catch(ex) {}
    
  if(isDefinedAndNotNull(GI("paramfiso")))
    try { loadElement(GI("paramfiso")); } catch(ex) {}  
    
}

function ejecutaReporte() {
  var bandera=1;

  if(isDefinedAndNotNull(GI("paramFiso")))
    if(GI("paramFiso").value==""&&GI("paramEstructura").value==3) {
      alert("El Fideicomiso es un campo Obligatorio");
      bandera=0;
    }
  if(isDefinedAndNotNull(GI("Fecha")))
    if(GI("Fecha").value==""&&GI("paramEstructura").value==3) {
      alert("La Fecha es un campo Obligatorio");
      bandera=0;
    }
  if(isDefinedAndNotNull(GI("paramFecha"))){
    if(GI("paramFecha").value==""&&GI("paramEstructura").value==3) 
      alert("La Fecha es un campo Obligatorio"); 
      }
 if(fvReportes.checkForm()&&bandera==1) {
    var parametros = getParameters(GI("frmReportes"));
    var par = JSON.stringify(parametros);
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

function setTipoReporte(tipo) {
  GI("paramtipoReporte").value = tipo;
  
  if(tipo == "MSA")
    GI("paramEstructura").value = 2;
  else if(tipo == "H")
    GI("paramEstructura").value = 3;
  else  
    GI("paramEstructura").value = 1;
}

var s_fideicomiso="";
var s_tipo="";
// -------------- Estado Cuenta-------------------------------------

function cargaEdoCue()
{ 
  loadElement(GI("cmbCtaCheques"));
}

function valorFide(parametro)
{
  s_fideicomiso = parametro;
  
}
function valorTipo(parametro)
{
  s_tipo = parametro;
  
   if(s_fideicomiso!="")
  {
    cargaCombo(s_fideicomiso,s_tipo);
    GI("cmbCtaCheques").style.visibility="visible";
  }
  else
  {
    alert("Seleccione Fideicomiso");
  }
}

function cargaCombo(s_fide,s_tip)
{
  cmbCtaChequesParam.fideicomiso = eval(s_fide);
  cmbCtaChequesParam.tipo= eval(s_tip);
  cmbCtaChequesParam.orden = 's';
  
  loadElement(GI("cmbCtaCheques"));  
}


function cargaComboCto(item)
{
  GI('cmbContratoInversion').selectedIndex = 0;
  cmbContratoInversionParam.fideicomiso = eval(item.value);
  cmbContratoInversionParam.order = 's';
  
  loadElement(GI("cmbContratoInversion"));  
}

function cargaCuenta(valor)
{
  GI("paramCtaCheques").value = ((valor!="-1")?valor:"");
}



//--------------------------------contratos inversion
