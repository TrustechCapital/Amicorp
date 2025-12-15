var catFacturacionHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Factura");
catFacturacionHonorarios.dateFormat = "dd/MM/YYYY";

showWaitLayer();

var clavesCombo165 = JSON.parse("{\"llaveClave\":165}");
//var fechaActual = JSON.parse("{\"id\":\"regresaFechaActual\"}");
var regresaFechaContable = JSON.parse("{\"id\":\"devuelveFechaContable\"}");
var validacionContratoExistencia = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionContratoActivo = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var mostrarSerie = JSON.parse("{\"id\":\"muestraSerie\"}");

var asignandoFolio = JSON.parse("{\"id\":\"asignaFolio\",\"NoFolio\":0,\"Serie\":0,\"NumFiso\":0,\"NumFolio\":0}");
var sustituyendoFolio = JSON.parse("{\"id\":\"sustituyeFolio\",\"NoFolio\":0,\"NumFiso\":0,\"Serie\":0,\"NumFolio\":0}");
var cancelandoFolio = JSON.parse("{\"id\":\"cancelaFolio\",\"Motivo\":0,\"NumFiso\":0,\"Serie\":0,\"NumFolio\":0}");

var verificarExistenciaNoFolio = JSON.parse("{\"id\":\"verificaExistenciaNoFolio\",\"NoFolio\":0}");
var mostrarClaveAnterior = JSON.parse("{\"id\":\"anteriorClaveAutorizacion\"}");
var llevaACaboCambioClave = JSON.parse("{\"id\":\"cambioClaveAutorizacion\",\"claveConfirmada\":\"0\"}");
var llevaACaboCambioSerie = JSON.parse("{\"id\":\"cambioSerieAutorizacion\",\"serieConfirmada\":\"0\"}");
var cambiaStatusImpresa = JSON.parse("{\"id\":\"cambioStatusFacturacion\",\"Serie\":\"0\"}");

initForms();

var tablaFacturacionHonorariosData = new Array();
//tablaFacturacionHonorariosData[0] = "facSecFactura,90px";
tablaFacturacionHonorariosData[0] = "facNumFactura,70px";
tablaFacturacionHonorariosData[1] = "facNumContrato,80px";
tablaFacturacionHonorariosData[2] = "facImpConcepto,100px,right";
tablaFacturacionHonorariosData[3] = "facImpIva,80px,right";
tablaFacturacionHonorariosData[4] = "total,80px,right";
tablaFacturacionHonorariosData[5] = "facPerDel,60px,right";
tablaFacturacionHonorariosData[6] = "facPerAl,60px,right";
tablaFacturacionHonorariosData[7] = "facFechaFactura,80px,right";
tablaFacturacionHonorariosData[8] = "facNumFacNuevo,80px";
tablaFacturacionHonorariosData[9] = "facObservaciones,130px";
tablaFacturacionHonorariosData[10] = "facFechaUltMod,80px";
tablaFacturacionHonorariosData[11] = "facStFactura,70px";

var fechaCaptura = new Date();
var numPantalla = 0;
pkInfo = null;
var operacion = 0;
var fvConfiguracionFacturacion = new FormValidator();

//Añadiéndole la funcionalidad de calendario a Fecha Captura
  Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaCaptura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });

function consultaFechaContable() {
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(regresaFechaContable);
  makeAjaxRequest(url, "HTML", vaciaFechaContable, null);
}

function vaciaFechaContable(obj, result) {
  var objResult = JSON.parse(result);
  
  //Vaciar datos en Fecha de Proceso
  GI("txtDiaContable").value=objResult[0].fcoDiaApliConta;
  GI("txtMesContable").value=objResult[0].fcoMesApliConta;
  GI("txtAnoContable").value=objResult[0].fcoAnoApliConta;
  
  //Vaciar datos en Fecha
  GI("paramFecha").value=formatString(GI("txtDiaContable").value,"0",2,"Izquierda") + "/" + formatString(GI("txtMesContable").value,"0",2,"Izquierda") + "/" + GI("txtAnoContable").value;
  
  formsLoaded();
}

//Funciones para la fecha de consulta (FAC_FECHA_CAPTURA)
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}

function cargaPrincipalFacturacion() {
  onButtonClickPestania("Honorarios.PrincipalFacturacion","");
}


function clickTabla(pk) {
  pkInfo = pk;
  //Mostrar la pantalla 1 (MantenimientoAsignaFolioFacturacion)
  cargaMantenimientoAsignaFolioFacturacion();
}

function armaFolio() {
  if(GI("txtSerie").value!="" && GI("txtNoFactura").value!="")
    GI("paramFolio").value=GI("txtSerie").value+"-"+GI("txtNoFactura").value;
  else
    GI("paramFolio").value=GI("txtSerie").value+GI("txtNoFactura").value;
}

////////////////////////////////////////////////////////////////////////////
function validacionesPorContrato() {
  validacionContratoExistencia.numContrato = GI("paramNumFiso").value;
  validacionContratoActivo.numContrato = GI("paramNumFiso").value;
  
  if(GI("paramNumFiso").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionContratoExistencia);
    makeAjaxRequest(url, "HTML", verificarContratoExistencia, null);
  }
}

function verificarContratoExistencia(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionContratoActivo);
    makeAjaxRequest(url, "HTML", verificarContratoActivo, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("paramNumFiso").value="";
  }
}

function verificarContratoActivo(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("paramNumFiso").value="";
  }
}

/////////////////////////////////////////////////////////////////////////////
//PROGRAMACION CORRESPONDIENTE A LA SEGUNDA PANTTALLA: MantenimientoAsignaFolioFacturacion
/////////////////////////////////////////////////////////////////////////////
//Activar los radiobotones correspondientes al Status y Folio
function deshabilitarRadioBotones() {
  //Para deshabilitar el botón AsignaFolio
  if(GI("facStFactura").value!="PENDIENTE" || (GI("facStFactura").value=="PENDIENTE" && GI("txtFolioOpera").value!="0"))
  {
    SA(GI("frmMantenimientoAsignaFolio").rdAsignaFolio, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdAsignaFolio, "disabled", "true");
  }
  //Para deshabilitar el botón Modificar y CambiaFolio
  if(GI("facStFactura").value!="PENDIENTE" || (GI("facStFactura").value=="PENDIENTE" && GI("txtFolioOpera").value=="0"))
  {
    SA(GI("frmMantenimientoAsignaFolio").rdModificar, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdModificar, "disabled", "true");
    
    SA(GI("frmMantenimientoAsignaFolio").rdCambiaFolio, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdCambiaFolio, "disabled", "true");
  }
  //Para deshabilitar el botón RecuperaProvision
  if(GI("facStFactura").value!="CANCELADA" || (GI("facStFactura").value=="CANCELADA" && GI("txtFolioOpera").value=="0"))
  {
    SA(GI("frmMantenimientoAsignaFolio").rdRecuperaProvision, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdRecuperaProvision, "disabled", "true");
  }
  //Para deshabilitar el botón SustityeFolio
  if(GI("facStFactura").value!="IMPRESA")
  {
    SA(GI("frmMantenimientoAsignaFolio").rdSustituyeFolio, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdSustituyeFolio, "disabled", "true");
  }
  //Para deshabilitar el botón Detalle
  if((GI("facStFactura").value!="CANCELADA" && GI("facStFactura").value!="SUSTITUCION" && GI("facStFactura").value!="IMPRESA") || (GI("facStFactura").value=="CANCELADA" && GI("txtFolioOpera").value=="0"))
  {
    SA(GI("frmMantenimientoAsignaFolio").rdDetalle, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdDetalle, "disabled", "true");
  }
  //Para deshabilitar el botón CancelaFolio
  if(GI("facStFactura").value!="IMPRESA")
  {
    SA(GI("frmMantenimientoAsignaFolio").rdCancelaFolio, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdCancelaFolio, "disabled", "true");
  }
  //Para deshabilitar el botón Imprimir
  if((GI("facStFactura").value!="PENDIENTE" && GI("facStFactura").value!="CANCELADA" && GI("facStFactura").value!="SUSTITUCION" && GI("facStFactura").value!="IMPRESA") || (GI("facStFactura").value=="PENDIENTE" && GI("txtFolioOpera").value=="0") || (GI("facStFactura").value=="CANCELADA" && GI("txtFolioOpera").value=="0"))
  {
    SA(GI("frmMantenimientoAsignaFolio").rdImprimir, "LKD", "true");
    SA(GI("frmMantenimientoAsignaFolio").rdImprimir, "disabled", "true");
  }
}

function ejecutaAccionSegunCombo() {
  if(GI("rdAsignaFolio").checked || GI("rdCambiaFolio").checked || GI("rdSustituyeFolio").checked)
    validarNoFolio();
  else if(GI("rdCancelaFolio").checked) //Si Cancela Folio
  {
    if(GI("txtMotivo").value!="")
    {
      if((GI("txtPuesto").value!="GERENTE" && GI("txtClaveAutorizacion").value==GI("txtClaveAnteriorConfirma").value) || GI("txtPuesto").value=="GERENTE")
      {
        cancelandoFolio.Motivo = GI("txtMotivo").value;
        cancelandoFolio.NumFiso = GI("facNumContrato").value;
        cancelandoFolio.Serie = GI("facSecFactura").value;
        cancelandoFolio.NumFolio = GI("txtFolioOpera").value;
        
        //Llevar a cabo la Cancelación de Folio
        var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cancelandoFolio);
        makeAjaxRequest(url, "HTML", ejecutaCancelandoFolio, null);    
      }
      else
        alert("Ingrese la clave de autorización");
    }
    else
      alert("Por favor coloque el Motivo");
  }
  else if(GI("rdModificar").checked)
  {
    //alert("Ejecuta check Modificar");
    cargaMantenimientoFacturacion(2);
  }
  else if(GI("rdRecuperaProvision").checked)
    alert("Ejecuta check Recupera Provision");
  else if(GI("rdDetalle").checked)
    cargaMantenimientoFacturacion(3);
  else if(GI("rdImprimir").checked)
  {
    //alert("Ejecuta check Imprimir");
    ejecutaImprimir();
  }
  else
    alert("Por favor seleccione alguna opción");
}

function cargaMantenimientoAsignaFolioFacturacion() {
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoAsignaFolioFacturacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaAsignaFolio, null);
}

function despliegaPantallaAsignaFolio(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Asignar llaves primarias a la pantalla 1 (MantenimientoAsignaFolioFacturacion)
  GI("facNumContrato").value = pkInfo.facNumContrato;
  GI("facSecFactura").value = pkInfo.facSecFactura;
  GI("facNumFactura").value = pkInfo.facNumFactura;
  
  //Asignación de los parámetros necesarios para la impresión del Reporte -> pantalla 1 (MantenimientoAsignaFolioFacturacion)
  GI("paramFideicomiso").value = pkInfo.facNumContrato;
  GI("paramSecuencial").value = pkInfo.facSecFactura;
  GI("paramNumFactura").value = pkInfo.facNumFactura;
  
  //No son llaves primarias pero servirán para llevar a cabo validaciones
  GI("txtFolioOpera").value = pkInfo.facNumFactura;
  GI("facStFactura").value = pkInfo.facStFactura;
  
  //Asignar el número de serie
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(mostrarSerie);
  makeAjaxRequest(url, "HTML", ejecutaMuestraSerie, null);
  
  deshabilitarRadioBotones();
  ocultaObjs("NoFolio,Guion,txtNoFolio,Motivo,txtMotivo"); //Ocultar FolioFactura
  ocultaObjs("ClaveAutorizacion,txtClaveAutorizacion"); //Ocultar la Clave de Autorizacion
  
  hideWaitLayer();
}

/////////////////////////////////////////////////////////////////
//Validaciones y muestra de Informacion
function ejecutaMuestraSerie(obj, result){
  var objResult = JSON.parse(result);
  
  GI("txtSerie").value=objResult[0].serie;
  //Asigna la Clave por si es requerida para autorizar la Sustitución de un folio
  vaciaClaveAnterior();
}


function muestraOcultaFolioFactura() {
  //Despliega u Oculta el número de folio según el radio elegido
  if(GI("rdAsignaFolio").checked || GI("rdCambiaFolio").checked || GI("rdSustituyeFolio").checked || GI("rdCancelaFolio").checked)
    muestraObjs("NoFolio,Guion,txtNoFolio");
  else
    ocultaObjs("NoFolio,Guion,txtNoFolio");
  
  //Despliega u Oculta el Número de Factura
  if(GI("rdCancelaFolio").checked)
    ocultaObjs("Guion,txtNoFolio");
  
  //Despliega u Oculta el Motivo
  if(GI("rdSustituyeFolio").checked || GI("rdCancelaFolio").checked)
    muestraObjs("Motivo,txtMotivo");
  else
    ocultaObjs("Motivo,txtMotivo");
  
  //Despliega u Oculta la Clave de Autorización
  if((GI("rdSustituyeFolio").checked || GI("rdCancelaFolio").checked) && GI("txtPuesto").value!="GERENTE")
    muestraObjs("ClaveAutorizacion,txtClaveAutorizacion");
  else
    ocultaObjs("ClaveAutorizacion,txtClaveAutorizacion");
}

function validarNoFolio() {
  GI("txtFolioFactura").value=GI("txtSerie").value+"-"+GI("txtNoFolio").value;
  verificarExistenciaNoFolio.NoFolio = GI("txtFolioFactura").value;
  
  if(GI("txtNoFolio").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(verificarExistenciaNoFolio);
    makeAjaxRequest(url, "HTML", verificarExistenciaRegistroNoFolio, null);
  }
  else
    alert("Por favor ingrese un Número de Factura");
}

function verificarExistenciaRegistroNoFolio(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    GI("txtNoFolio").value="";
    GI("txtNoFolio").focus();
    alert("Ya existe una factura con ese folio");
  }
  else
  {
    if(GI("rdAsignaFolio").checked || GI("rdCambiaFolio").checked)  //Si Asigna o Cambia Folio
    {
      asignandoFolio.NoFolio = GI("txtFolioFactura").value;
      asignandoFolio.Serie = GI("facSecFactura").value;
      asignandoFolio.NumFiso = GI("facNumContrato").value;
      asignandoFolio.NumFolio = GI("facNumFactura").value;;
      
      //Llevar a cabo la Asignación de Folio
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(asignandoFolio);
      makeAjaxRequest(url, "HTML", ejecutaAsignandoFolio, null);
    }
    else if(GI("rdSustituyeFolio").checked) //Si Sustituye Folio
    {
      if(GI("txtMotivo").value!="")
      {
        if((GI("txtPuesto").value!="GERENTE" && GI("txtClaveAutorizacion").value==GI("txtClaveAnteriorConfirma").value) || GI("txtPuesto").value=="GERENTE")
        {
          sustituyendoFolio.NoFolio = GI("txtFolioFactura").value;
          sustituyendoFolio.NumFiso = GI("facNumContrato").value;
          sustituyendoFolio.Serie = GI("facSecFactura").value;
          sustituyendoFolio.NumFolio = GI("txtFolioOpera").value;
          
          //Llevar a cabo la Asignación de Folio
          var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(sustituyendoFolio);
          makeAjaxRequest(url, "HTML", ejecutaSustituyendoFolio, null);    
        }
        else
          alert("Ingrese la clave de autorización");
      }
      else
        alert("Por favor coloque el Motivo");
    }
  }
}

function ejecutaAsignandoFolio(obj, result){
  var objResult = JSON.parse(result);
  
  alert("Asignacion de Folio exitoso");
  cargaPrincipalFacturacion();
}

function ejecutaSustituyendoFolio(obj, result){
  var objResult = JSON.parse(result);
  
  alert("Sustituyendo Folio exitoso");
  cargaPrincipalFacturacion();
}

function ejecutaCancelandoFolio(obj, result){
  var objResult = JSON.parse(result);
  
  alert("Cancelando Folio exitoso");
  cargaPrincipalFacturacion();
}

function ejecutaImprimir() {
  cambiaStatusImpresa.Serie = GI("facNumFactura").value;
  
  if(GI("facNumFactura").value!="")
  {
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cambiaStatusImpresa);
    //makeAjaxRequest(url, "HTML", ejecutaCambioStatus, null);
    ejecutaReporte();
  }
}

function ejecutaCambioStatus(obj, result){
  var objResult = JSON.parse(result);
  ejecutaReporte();
  alert("aqui");
  //cargaPrincipalFacturacion();
}

function ejecutaReporte() {
    var parametros = getParameters(GI("frmMantenimientoAsignaFolio"));
    
    if(GI("refSP").value != ""){
      parametros.id = GI("refSP").value;
      parametros.template = GI("template").value;
      parametros.nombreReporte = GI("nombreReporte").value;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
      showWaitLayer();
      makeAjaxRequest(url, "HTML", validaEjecucionReporte, parametros);
    } else {
      parametros.template = GI("template").value;
      parametros.nombreReporte = GI("nombreReporte").value;
      validaEjecucionReporte(parametros,"{\"RESULTADO\":0}");
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
  } else if(objResult.RESULTADO == 1){ // Error
  } else { // Error ORACLE
  }
  
  hideWaitLayer();
}



/////////////////////////////////////////////////////////////////////////////
//PROGRAMACION CORRESPONDIENTE A LA TERCERA PANTTALLA: MantenimientoFacturacion
/////////////////////////////////////////////////////////////////////////////
function cargaMantenimientoFacturacion(tipoPantalla) {
  numPantalla = 2;
  operacion = tipoPantalla;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoFacturacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

/////////////////////////////////////////////////////////////////////////////
//Incorporar los datos del catálogo
function loadCatalogo() {
  catFacturacionHonorarios.setOnUpdate(catLoaded);
  //Asignar llaves primarias a la pantalla de mantenimiento
  GI("facNumContrato").value = pkInfo.facNumContrato;
  GI("facSecFactura").value = pkInfo.facSecFactura;
  GI("facNumFactura").value = pkInfo.facNumFactura;
  
  catFacturacionHonorarios.buscaCatalogoPK();
}

function catLoaded() {
  if(operacion==2) //Para modificar deshabilita las PK
    deshabilitaPK("facNumContrato,facNumFactura".split(","));
  else if(operacion==3) //Para el Detalle deshabilita todo
  {
    deshabilitaObjetos(GI("frmMantenimientoFacturacion"));                  //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoFacturacion").cmdAceptar, "LKD", "true");
    SA(GI("frmMantenimientoFacturacion").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  formsLoaded();
}

function modificaInfo() {
  catFacturacionHonorarios.modificaCatalogo();
}

/////////////////////////////////////////////////////////////////////////////
//PROGRAMACION CORRESPONDIENTE A LA CUARTA PANTTALLA: MantenimientoConfiguracionFacturacion
/////////////////////////////////////////////////////////////////////////////
function cargaMantenimientoConfiguracionFacturacion() {
  numPantalla = 3;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoConfiguracionFacturacion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

function vaciaClaveAnterior() {
  //Asignar la clave anterior
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(mostrarClaveAnterior);
  makeAjaxRequest(url, "HTML", ejecutaMuestraClave, null);
}

function ejecutaMuestraClave(obj, result){
  var objResult = JSON.parse(result);
  GI("txtClaveAnteriorConfirma").value=objResult[0].claveAnterior;
}

function actualizaSerieOCambiaClave() {
  if(fvConfiguracionFacturacion.checkForm())
  {
    if(GI("rdActualizaSerie").checked)
    {
      RA(GI("txtClaveAnterior"), "required");
      RA(GI("txtClaveAnterior"), "message");
      
      RA(GI("txtClaveNueva"), "required");
      RA(GI("txtClaveNueva"), "message");
      
      RA(GI("txtConfirmarClave"), "required");
      RA(GI("txtConfirmarClave"), "message");
      
      SA(GI("txtSerieActual"), "required", "");
      SA(GI("txtSerieActual"), "message", "La Serie es un dato obligatorio");
      
      SA(GI("txtSerieNueva"), "required", "");
      SA(GI("txtSerieNueva"), "message", "La Serie es un dato obligatorio");
      
      SA(GI("txtClaveAutorizacion"), "required", "");
      SA(GI("txtClaveAutorizacion"), "message", "La Serie es un dato obligatorio");
      
      if(fvConfiguracionFacturacion.checkForm())
      {
        if(GI("txtSerieActual").value==GI("txtSerie").value && GI("txtClaveAutorizacion").value==GI("txtClaveAnteriorConfirma").value)
          realizaCambioSerie();
        else
          alert("La Serie o la Clave es incorrecta");
      }
    }
    else if(GI("rdCambiaClave").checked)
    {
      RA(GI("txtSerieActual"), "required");
      RA(GI("txtSerieActual"), "message");
      
      RA(GI("txtSerieNueva"), "required");
      RA(GI("txtSerieNueva"), "message");
      
      RA(GI("txtClaveAutorizacion"), "required");
      RA(GI("txtClaveAutorizacion"), "message");
      
      SA(GI("txtClaveAnterior"), "required", "");
      SA(GI("txtClaveAnterior"), "message", "La Serie es un dato obligatorio");
      
      SA(GI("txtClaveNueva"), "required", "");
      SA(GI("txtClaveNueva"), "message", "La Serie es un dato obligatorio");
      
      SA(GI("txtConfirmarClave"), "required", "");
      SA(GI("txtConfirmarClave"), "message", "La Serie es un dato obligatorio");
      
      if(fvConfiguracionFacturacion.checkForm())
      {
        if(GI("txtClaveAnterior").value==GI("txtClaveAnteriorConfirma").value && GI("txtClaveNueva").value==GI("txtConfirmarClave").value)
          realizaCambioClave();
        else
          alert("La Clave anterior es incorrecta o no Confirmó bien la Clave Nueva");
      }
    }
  }
}

function realizaCambioClave() {
  llevaACaboCambioClave.claveConfirmada=GI("txtConfirmarClave").value;
  
  //Llevar a cabo el cambio de clave
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(llevaACaboCambioClave);
  makeAjaxRequest(url, "HTML", ejecutaCambioClave, null);
}

function ejecutaCambioClave(obj, result){
  var objResult = JSON.parse(result);
  
  alert("Cambio de clave exitoso");
  cargaPrincipalFacturacion();
}

function realizaCambioSerie() {
  llevaACaboCambioSerie.serieConfirmada=GI("txtSerieNueva").value;
  
  //Llevar a cabo el cambio de la Serie
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(llevaACaboCambioSerie);
  makeAjaxRequest(url, "HTML", ejecutaCambioSerie, null);
}

function ejecutaCambioSerie(obj, result){
  var objResult = JSON.parse(result);
  
  alert("Cambio de serie exitoso");
  cargaPrincipalFacturacion();
}

function habilitaCajasTexto() {
  if(GI("rdActualizaSerie").checked)
  {
    GI("txtSerieActual").disabled=false;
    GI("txtSerieNueva").disabled=false;
    GI("txtClaveAutorizacion").disabled=false;
    
    GI("txtClaveAnterior").disabled=true;
    GI("txtClaveNueva").disabled=true;
    GI("txtConfirmarClave").disabled=true;
  }
  else if(GI("rdCambiaClave").checked)
  {
    GI("txtSerieActual").disabled=true;
    GI("txtSerieNueva").disabled=true;
    GI("txtClaveAutorizacion").disabled=true;
    
    GI("txtClaveAnterior").disabled=false;
    GI("txtClaveNueva").disabled=false;
    GI("txtConfirmarClave").disabled=false;
  }
}


/////////////////////////////////////////////////////////////////
//FUNCIONES COMPARTIDAS
function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  if(numPantalla==3)
  {
    vaciaClaveAnterior();
    
    //Agregando la funcionalidad del required
    fvConfiguracionFacturacion.setup({
    formName      : "frmMantenimientoConfiguracionFacturacion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
    });
    
    //Deshabilitar las cajas de texto
    GI("txtSerieActual").disabled=true;
    GI("txtSerieNueva").disabled=true;
    GI("txtClaveAutorizacion").disabled=true;
    
    GI("txtClaveAnterior").disabled=true;
    GI("txtClaveNueva").disabled=true;
    GI("txtConfirmarClave").disabled=true;
    
    //Vaciar número de serie actual
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(mostrarSerie);
    makeAjaxRequest(url, "HTML", ejecutaMuestraSerie, null);
    
    hideWaitLayer();
  }
}