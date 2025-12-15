showWaitLayer();

var regresaFechaContable = JSON.parse("{\"id\":\"devuelveFechaContable\"}");
var devuelveParamValor2 = JSON.parse("{\"id\":\"muestraParamValor2\",\"paramGlobal\":0}");

var fvPrincipalPolizas = new FormValidator();
var fvEnviarInterfaseSIF = new FormValidator();
var fvReportes = new FormValidator();

//Agregando la funcionalidad del required
fvPrincipalPolizas.setup({
  formName      : "frmPolizasInterfaseContable",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


//Variables para la fecha contable
var Ano=null;
var Mes=null;
var Dia=null;

//Desactivar la casilla de la Fecha de Aplicación
GI("txtFechaContable").disabled=true;

var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(regresaFechaContable);
makeAjaxRequest(url, "HTML", vaciaFechaContable, null);

/////////////////////////////////////////////////////////////////////////////
//Función para cargar la pantalla principal
function cargaPolizasInterfaseContableSIF() {
  onButtonClick("Contabilidad.InterfaseSIF.PolizasInterfaseContableSIF","");
}

/////////////////////////////////////////////////////////////////////////////
//Función para colocar la Fecha Contable en las cajas de texto destinadas para ello
function vaciaFechaContable(obj, result) {
  var objResult = JSON.parse(result);
  
  //Vaciar datos en Fecha de Proceso
  GI("txtDiaContable").value=objResult[0].fcoDiaApliConta;
  GI("txtMesContable").value=objResult[0].fcoMesApliConta;
  GI("txtAnoContable").value=objResult[0].fcoAnoApliConta;
  
  Dia=objResult[0].fcoDiaApliConta;
  Mes=objResult[0].fcoMesApliConta;
  Ano=objResult[0].fcoAnoApliConta;
  
  //Vaciar datos en Fecha de Aplicación
  GI("txtFechaContable").value=formatString(GI("txtDiaContable").value,"0",2,"Izquierda") + "/" + formatString(GI("txtMesContable").value,"0",2,"Izquierda") + "/" + GI("txtAnoContable").value;
  
  formsLoaded();
}

/////////////////////////////////////////////////////////////////////////////
//Funnción para llevar a cabo la acción de Pólizas
function nuevaFechaProceso() {
  if(fvPrincipalPolizas.checkForm())
  {
    if(GI("txtDiaContable").value=="")
    {
      var objParametros = JSON.parse("{\"id\":\"funcionFechaCuandoDiaNoExiste\"}");
      showWaitLayer();
      var urlFuncNuevaFecha = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
      makeAjaxRequest(urlFuncNuevaFecha, "HTML", respuestaFuncionNuevaFecha, null);
    }
    else
      ejecutaFuncionGeneraPoliza();
  } 
}

function respuestaFuncionNuevaFecha(obj, result){
  var res=JSON.parse(result).resultado;
  descomponeFecha(res,GI("txtDiaContable"),GI("txtMesContable"),GI("txtAnoContable"));
  ejecutaFuncionGeneraPoliza();
  hideWaitLayer();
}

function ejecutaFuncionGeneraPoliza() {
  var objParametros = JSON.parse("{\"id\":\"funcionPolizasInterfaseContableSIF\"}");
  eval("objParametros.Ano='" + GI("txtAnoContable").value +"'");
  eval("objParametros.Mes='" + GI("txtMesContable").value +"'");
  
  if(GI("txtDiaContable").value!="")
    eval("objParametros.Dia='" + GI("txtDiaContable").value +"'");
  else
    eval("objParametros.Dia=''");
    
  eval("objParametros.Poliza=" + GI("txtNoPoliza").value);
  
  if(GI("txtNoFolio").value!="")
    eval("objParametros.Folio=" + GI("txtNoFolio").value);
  
  showWaitLayer();
  var urlFuncPoliza = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(urlFuncPoliza, "HTML", respuestaFuncionGeneraPoliza, null);
}

function respuestaFuncionGeneraPoliza(obj, result){
  var res=JSON.parse(result).resultado;
    
  if(res!=0)
    alert("Ocurrió un error, verifique el reporte de errores");
  else
    alert("Proceso satisfactorio");
  
  Dia=GI("txtDiaContable").value;
  Mes=GI("txtMesContable").value;
  Ano=GI("txtAnoContable").value;
  
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//Función para descomponer la fecha devuelta por la función en los tres campos
function descomponeFecha(strFecha,objDia,objMes,objAno)
{
  strFecha=strFecha.split("/");
  
  objDia.value=strFecha[0];
  objMes.value=strFecha[1];
  objAno.value=strFecha[2];
}



///////////////////////////////////////////////////////////////////////////
//Para pasar a la CUARTA pantalla (EnviarInterfaseContableSIF)
function cargaEnviarInterfaseContableSIF() {
  numPantalla = 3;
  showWaitLayer();
  Dia=GI("txtDiaContable").value;
  Mes=GI("txtMesContable").value;
  Ano=GI("txtAnoContable").value;
  var urlCliente = ctxRoot + "/modules/Contabilidad/InterfaseSIF/EnviarInterfaseContableSIF.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

function muestraDestino(obj,result) {
  var objResult = JSON.parse(result);
  GI("txtDestino").value=objResult[0].paramValor2;
  
  devuelveParamValor2.paramGlobal=3;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(devuelveParamValor2);
  makeAjaxRequest(url, "HTML", muestraUsuario, null);
}

function muestraUsuario(obj,result) {
  var objResult = JSON.parse(result);
  GI("txtUsuario").value=objResult[0].paramValor2;
  
  devuelveParamValor2.paramGlobal=5;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(devuelveParamValor2);
  makeAjaxRequest(url, "HTML", muestraRuta, null);
}

function muestraRuta(obj,result) {
  var objResult = JSON.parse(result);
  GI("txtRuta").value=objResult[0].paramValor2;
  
  formsLoaded();
}

//Función para ejecutar cuando se pulse Enviar
function botonEnviar() {
  if(fvEnviarInterfaseSIF.checkForm())
  {
    var objArchivosPlanosParam = JSON.parse("{}");
    objArchivosPlanosParam.tipoId = 1;
    objArchivosPlanosParam.fileName = GI("txtArchivo").value;
    objArchivosPlanosParam.colData = "arpDescripcion";
    objArchivosPlanosParam.queryId = "conArcPla";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    //window.open(url,GI("txtArchivo").value,"width=120,height=300,scrollbars=NO");
    /*var archivoGenerado = window.open(url,GI("txtArchivo").value,"width=120,height=300,scrollbars=NO");
    archivoGenerado.document.execCommand("saveas",true,GI("txtArchivo").value + ".txt");
    archivoGenerado.close();*/
  }
}
///////////////////////////////////////////////////////////////////////////
//Para pasar a la TERCERA pantalla (ImprimirInterfaseContableSIF)
function cargaImprimirInterfaseContableSIF() {
  numPantalla = 2;
  showWaitLayer();
  Dia=GI("txtDiaContable").value;
  Mes=GI("txtMesContable").value;
  Ano=GI("txtAnoContable").value;
  var urlCliente = ctxRoot + "/modules/Contabilidad/InterfaseSIF/ImprimirInterfaseContableSIF.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}


///////////////////////////////////////////////////////////////////////////
//Para pasar a la SEGUNDA pantalla (ApliconInterfaseContableSIF)
function cargaApliconInterfaseContableSIF() {
  numPantalla = 1;
  showWaitLayer();
  Dia=GI("txtDiaContable").value;
  Mes=GI("txtMesContable").value;
  Ano=GI("txtAnoContable").value;
  var urlCliente = ctxRoot + "/modules/Contabilidad/InterfaseSIF/ApliconInterfaseContableSIF.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

//Cuando se da Aceptar en la pantalla de Aplicon
function generaArchivoAplicon() {
  var objParametros = JSON.parse("{\"id\":\"funcionGeneraApliconSIF\"}");
  eval("objParametros.Fecha='" + GI("txtFechaProceso").value +"'");
  eval("objParametros.Archivo='" + GI("txtArchivo").value +"'");
  
  showWaitLayer();
  var urlApliconSIF = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(urlApliconSIF, "HTML", respuestaFuncionAplicon, null);
}

function respuestaFuncionAplicon(obj, result) {
  var res=JSON.parse(result).resultado;
  
  if(res!=0)
    alert("Ocurrió un error");
  else
    alert("Proceso satisfactorio");
  
  hideWaitLayer();
}

///////////////////////////////////////////////////////////////////////////
//Compartida de las pantallas 2,3 y 4
function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  
  if(numPantalla==2)
  {
    deshabilitaPK("paramRepInfoRavFechaProceso".split(","));
    GI("paramRepInfoRavFechaProceso").value=Dia+"/"+Mes+"/"+Ano;
      
      fvReportes.setup({
      formName      : "frmImprimirInterfaseContable",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
  }
  else
  {
    deshabilitaPK("txtFechaProceso".split(","));
    
    if(Ano!=null)
      GI("txtFechaProceso").value=Dia+"/"+Mes+"/"+Ano;
  }
  
  if(numPantalla==1 && Ano!=null)
  {
    deshabilitaPK("txtArchivo".split(","));
    GI("txtArchivo").value="FIDUAPLC"+Ano+Mes+Dia;
  }
  
  else if(numPantalla==3)
  {
    //inhabilitar todos los campos de la pantalla excepto el Password
    deshabilitaPK("txtDestino,txtUsuario,txtArchivo,txtRuta".split(","));
    //Agregando la funcionalidad del required
    fvEnviarInterfaseSIF.setup({
      formName      : "frmEnviarInterfaseContable",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    if(Ano!=null)
    {
      GI("txtArchivo").value="FIDUAPLC"+Ano+Mes+Dia;
      devuelveParamValor2.paramGlobal=2;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(devuelveParamValor2);
      makeAjaxRequest(url, "HTML", muestraDestino, null);
    }
  }
  
  hideWaitLayer();
}


///////////////////////////////////////////////////////////////////////////
//Mandar llamar la impresión de los reportes
function ejecutaReporte() {
  if(fvReportes.checkForm()) {
    var parametros = getParameters(GI("frmImprimirInterfaseContable"));
    
    if(GI("rdFichaUnica").checked) 
    {
      parametros.id = "getSIFFichaUnica";
      //parametros.id = "getSIFErrores";
      //parametros.template = "/xml/Reportes/Contabilidad/FichaUnica.xsl";
      parametros.sendToJSP = "true";
      parametros.urlReporte = "/jsp/Reportes/Contabilidad/FichaUnica.jsp";
      parametros.nombreReporte = "Ficha Unica";
      
      var url1 = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametros);
      var link = GI("linkReporte");
      link.href=url1;
      link.target = "_new";
      link.click();
    }
    else if(GI("rdReporteErrores").checked)
    {
      parametros.id = "getSIFErrores";
      parametros.template = "/xml/Reportes/Contabilidad/ReporteErrores.xsl";
      parametros.nombreReporte = "Reporte de Errores";
      
      var url2 = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametros);
      var link = GI("linkReporte");
      link.href = url2;
      link.click();
    }
  }
}


