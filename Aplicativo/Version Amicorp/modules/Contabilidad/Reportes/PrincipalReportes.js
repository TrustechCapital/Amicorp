var fvReportes = new FormValidator();
var cmbCtaChequesParam = JSON.parse("{\"fideicomiso\":-1,\"tipo\":-1,\"orden\":\"s\"}");
var cmbContratoInversionParam = JSON.parse("{\"fideicomiso\":-1}");

var cmbScta = JSON.parse("{\"Fideicomiso\":0}");
var cmbCtoInver = JSON.parse("{\"Fideicomiso\":0}");
var cmbEjecutivos = JSON.parse("{\"order\":\"s\"}");


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
    // nada
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

function cargaCalendario(idCalendario) 
{
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

// calendarios -----------

var repSelected; // nombre del reporte  seleccionado

function cargaReporte(reporte) {
  var objReporte = GI("dvReporte");
  var urlReportes = ctxRoot + "/modules/Contabilidad/Reportes/";
  if(reporte == "-1") {
    doInnerHTML(objReporte, "");
  } else {
    LDSCR(urlReportes + reporte + ".do", objReporte, pantallaCargada);
  }
  repSelected = reporte;
  
  if(reporte=="EstadoCuenta")
  {
    cargaEdoCue();
  }
  
}

function pantallaCargada() {
  hideWaitLayer();
  if(repSelected=="PosicionporPeriodo"||repSelected=="ContratosInversion")
  {
    cargaPosPer();
  }
  
  if(repSelected=="EstadoResultados"||repSelected=="BalanceGeneral")
  {
    cargaEjecutivos();
    cargaEmpresas();
  }
  if(repSelected=="BalanzaComprobacion")
  {
    cargaEmpresas();
  }
  
  if(isDefinedAndNotNull(GI("Fecha")))
    try { cargaCalendario("Fecha"); } catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFecha"))) 
    try { cargaCalendario("paramFecha");} catch(ex) {}
  else if(isDefinedAndNotNull(GI("paramFechaDel"))&&isDefinedAndNotNull(GI("paramFechaAl"))) 
    try { cargaCalendario("paramFechaDel");cargaCalendario("paramFechaAl");} catch(ex) {} 
 else if(isDefinedAndNotNull(GI("paramFechaInicial"))&&isDefinedAndNotNull(GI("paramFechaFinal"))) 
    try { cargaCalendario("paramFechaInicial");cargaCalendario("paramFechaFinal");} catch(ex) {} 
 else if(isDefinedAndNotNull(GI("paramFechaIni"))&&isDefinedAndNotNull(GI("paramFechaFin"))) 
    try { cargaCalendario("paramFechaIni");cargaCalendario("paramFechaFin");} catch(ex) {} 
  else if(isDefinedAndNotNull(GI("paramFechaUnica"))) 
    try { cargaCalendario("paramFechaUnica");} catch(ex) {} 
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
    
    if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("urlReporte"))) 
    {
     
      var url = GI("urlReporte").value;
      
      for(k in parametros) {
        url += k + "=" + parametros[k] + "&";    
      }
      url += "web=0";
      
      // ESTADOS FINANCIEROS REEXPRESADOS
      if(repSelected=="BalanceGeneral"||repSelected=="EstadoResultados"||repSelected=="BalanzaComprobacion")
      { 
        var reexpMoneda = (moneda=="MONEDA NACIONAL"?"Dolares Americanos":"Moneda Nacional");
        moneda = (moneda=="DOLAR AMERICANO"?"Dolares Americanos":"Moneda Nacional");
        url += '&monedarexp='+reexpMoneda+''+'&moneda='+moneda+'';

        if(confirm("¿Estado Financiero Reexpresado en "+reexpMoneda+"?"))
        {
          url += '&reexpresado="SI"';
          //alert(url)
          ejecutaReporteReexresado(url);
          return;
        }
      }
      
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
      
    } 
    else 
    {
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


// -------------- Posición por contrato-------------------------------------

function cargaPosPer()
{ 
  loadElement(GI("paramFideicomiso"));
}

function cargaEjecutivos()
{
  loadElement(GI("paramEjecutivoFirma"));
}

function cargaEmpresas()
{
  loadElement(GI("paramEmpresa"));
}

function cargaCmbPosporPer(objCmb)
{
  if(objCmb==GI("paramFideicomiso"))
  {
    cmbScta = JSON.parse("{\"Fideicomiso\":"+objCmb.value+"}");
    loadElement(GI("paramSubcuenta"));
  }
  else if (objCmb==GI("paramSubcuenta"))
  {
    cmbCtoInver = JSON.parse("{\"Fideicomiso\":"+GI("paramFideicomiso").value+",\"SubCuenta\":"+objCmb.value+"}");
    loadElement(GI("paramCtoInver"));
  } 
}

// ----------------- estados reexpresados --------------------------

var moneda = "MONEDA NACIONAL";

function ejecutaReporteReexresado(url)
{
  if(repSelected=="BalanceGeneral"||repSelected=="EstadoResultados"||repSelected=="BalanzaComprobacion")
  {
    var objEjecutaReexpresada = JSON.parse("{}");
    objEjecutaReexpresada.id = "ejeFunEdoReexpresado";
    objEjecutaReexpresada.Fideicomiso = GI("paramFiso").value;
    if(repSelected=="BalanzaComprobacion")
      objEjecutaReexpresada.Fecha = GI("Fecha").value;
    else
      objEjecutaReexpresada.Fecha = GI("paramFecha").value;
    objEjecutaReexpresada.Estructura = 1;
    
    var surl = ctxRoot+"/executeRef.do?json="+JSON.stringify(objEjecutaReexpresada);
    
    makeAjaxRequest(surl,"html",ejecutaReporteReexresadoRes,url);
  
  }
}

function ejecutaReporteReexresadoRes(url,result)
{
  var res = JSON.parse(result).RESULTADO;

  if(isDefinedAndNotNull(res))
  {
    switch(Number(res))
    {
      case 0:
        var link = GI("linkReporteNew");
        link.href=url;
        link.click();
        break;
      default:
        alert("Error al Reexpresar el Estado Financiero");
        break;
    }
  }
  else
  {
    alert("Ocurrió un error inesperado");
  }
}

function obtenerMonedaFiso(txtFiso)
{
  if(txtFiso.value==""){  return; }
    
  var objConsultaMoneda = JSON.parse("{}");
  objConsultaMoneda.id = "muestraMonedaAnteproyecto";
  objConsultaMoneda.numFiso = txtFiso.value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objConsultaMoneda);
  //alert(url)
  makeAjaxRequest(url, "HTML", obtenerMonedaFisoRes, null);
}

function obtenerMonedaFisoRes(obj,result)
{
   //var res = JSON.parse(result)[0];
  var res = JSON.parse(result);
  if(res)
  {
    moneda = res[0].antMoneda;
    //alert(moneda)    
  }
  else
  {
    moneda = "MONEDA NACIONAL";
  }
}