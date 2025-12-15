showWaitLayer();

var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");
var clavesCombo705  = JSON.parse("{\"llaveClave\":705,\"orderDescripcion\":\"s\"}");

var fvCat = new FormValidator();
var strIdPK = "folio";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fechas = new Date();

var arrTblDat = new Array();
arrTblDat[0] = "fideicomiso,100px";
arrTblDat[1] = "folio,100px";
arrTblDat[2] = "status,150px";
arrTblDat[3] = "importe,150px";
arrTblDat[4] = "descripcion,300px";
arrTblDat[5] = "fecha,100px";


fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

ctxFeccont = replaceAll(ctxFeccont,' ','');

GI('paramFechaInicio').value = ctxFeccont;
GI('paramFechaFin').value = ctxFeccont;
GI('paramFechaRep').value = ctxFeccont;

Calendar.setup({
  inputField     :    "paramFechaInicio",   // id of the input field
  button         :    "paramFechaInicio",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechas,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

Calendar.setup({
  inputField     :    "paramFechaFin",   // id of the input field
  button         :    "paramFechaFin",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechas,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

Calendar.setup({
  inputField     :    "paramFechaRep",   // id of the input field
  button         :    "paramFechaRep",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechas,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});

// FUNCIONES QUE SE ENCARGAN DE LA GESTION DE LAS FECHAS
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
// -----------------------------------------------------

function limpiar(objForma)
{
  regresar();
}
function regresar()
{
  onButtonClickPestania("Otros.OperacionesRelevantesCreditos.PrincipalOperacionesRelevantes","");
}

/*--CREDITO--*/

function verificacioncredito(txtFiso) 
{
  if(txtFiso.value != "") 
  {
    var validacionAltaCredito = JSON.parse("{\"id\":\"verificaCredito\",\"numCredito\":" + txtFiso.value + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaCredito);
    makeAjaxRequest(url, "HTML", funcionVerificacionCredito, txtFiso);
  }else{
    asignaEtiqueta("nomFideicomiso","");    
  }  
}

function funcionVerificacionCredito(txtFiso,result) {
//alert("2"+result)
  var objResult = JSON.parse(result);
  if(objResult!=null && objResult!=""){  
      if(objResult[0].idCredito == 0)
      {
        alert("El Credito no existe");
        txtFiso.value="";
        asignaEtiqueta("nomFideicomiso","");
      }
  }    
}

/*---------------*/


// OPERACIONES RELEVANTES -----------------------------
function consultaOperacionesRelevantes(btnAceptar)
{
  if(fvCat.checkForm())
  {
    consultar(btnAceptar,frmDatos, false);
    consultaOperacionesRelevantesReporte();
  }
}

function clickTabla(pk)
{
    //alert("entro aki 2")
    //alert(pk.folio)
    //alert(pk.status)
  ejecutaReporteOperacionesRelevantes(pk.folio,pk.status);
}

function clickTablaReporte(pk)
{
    //alert("entro aki")
   // alert(pk.folio)
    //alert(pk.status)
  ejecutaReporteOperacionesRelevantes(pk.folio,pk.status);
}

function ejecutaReporteOperacionesRelevantes(idfolio,cvestatus)
{

  var objRelevantes = JSON.parse("{}");
  objRelevantes.id="ejeFunRepOperacionesRelevantesC";
  objRelevantes.Folio=idfolio;
  objRelevantes.Status=cvestatus;
  
  var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objRelevantes);
//  alert(url)
  makeAjaxRequest(url,"html",ejecutaReporteOperacionesRelevantesRes,null);
  
}

function ejecutaReporteOperacionesRelevantesRes(obj,result)
{
    //alert("1"+result)
  var objResult = JSON.parse(result).RESULTADO;
  //alert(objResult)
  if(isDefinedAndNotNull(objResult))
  {
    //alert("aceptar"+Number(objResult))
    if(Number(objResult)==0)
      GI('cmdAceptar').click();
    else
      alert("Ocurrió un error inesperado");
  }
  else
  {
    alert("Ocurrió un error inesperado");
  }
}

// ----------------------------------------------------

// OPERACIONES RELEVANTES REPORTE -----------------------------
function consultaOperacionesRelevantesReporte()
{
  consultar(GI('cmdAceptarReporte'),frmDatos, false);
}



function  generaReporteOperacionesRelevantes()
{
  if(fvCat.checkForm())
  {
    var objRelevantes = JSON.parse("{}");
    objRelevantes.id="ejeFunGenReporteOperaRelevantes";
    objRelevantes.Fecha=GI('paramFechaInicio').value;
    objRelevantes.Status=GI('paramTipoOperacion').value;
  //  alert(GI("paramChkRep").checked)
    if(GI("paramChkRep").checked)
        objRelevantes.StatusRep="EN FIRME";
    else
        objRelevantes.StatusRep="CONSULTA";    
    objRelevantes.FechaRep=GI('paramFechaRep').value;
    
    var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objRelevantes);
    alert(url)
    makeAjaxRequest(url,"html",generaReporteOperacionesRelevantesRes,null);
  }
}

function generaReporteOperacionesRelevantesRes(obj,result)
{
    //alert("3"+result)
  var res = JSON.parse(result).RESULTADO;
  
  if(isDefinedAndNotNull(res))
  {
    if(res!="ERROR")
      reporteArchivoOperacionesRelevantes(res);
    else
      alert("Ocurrió un error inesperado");
  }
  else
  {
    alert("Ocurrió un error inesperado");
  }
}

function reporteArchivoOperacionesRelevantes(nombreArchivo)
{
    GI("paramNombreRep").value=nombreArchivo;
    alert("Se le sugiere coloque el siguiente nombre " + nombreArchivo + " para el archivo generado!");
    var objRelevantes = JSON.parse("{}");
    
    objRelevantes.colData = "registroReporte";
    objRelevantes.queryId = "qryReporteOperacionesRelevantes";
    objRelevantes.tipoId = 1;
    objRelevantes.fileName = nombreArchivo;//+".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objRelevantes);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Reporte Generado satisfactoriamente!");
    //regresar();
}

// ----------------------------------------------------

ejecutaReporteOperacionesRelevantes(0,''); // limpia reporte al inicio

function  generaReporteOperacionesPLD()
{
  if(fvCat.checkForm())
  {
    var objRelevantes = JSON.parse("{}");
    objRelevantes.id="ejeFunGenReporteOperaPLD";
    if(GI('paramFideicomiso').value!='')
        objRelevantes.Fecha=GI('paramFideicomiso').value;
    else
        objRelevantes.Fecha=0;
    
    var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objRelevantes);
    alert(url)
    makeAjaxRequest(url,"html",generaReporteOperacionesPLDRes,null);
  }
}

function generaReporteOperacionesPLDRes(obj,result)
{
    //alert("3"+result)
  var res = JSON.parse(result).RESULTADO;
  
  if(isDefinedAndNotNull(res))
  {
    if(res!="ERROR")
      reporteArchivoOperacionesPLD(res);
    else
      alert("Ocurrió un error inesperado");
  }
  else
  {
    alert("Ocurrió un error inesperado");
  }
}

function reporteArchivoOperacionesPLD(nombreArchivo)
{
    GI("paramNombreRep").value=nombreArchivo;
    alert("Se le sugiere coloque el siguiente nombre " + nombreArchivo + " para el archivo generado!");
    var objRelevantes = JSON.parse("{}");
    
    objRelevantes.colData = "registroReporte";
    objRelevantes.queryId = "qryReporteOperacionesPLD";
    objRelevantes.tipoId = 1;
    objRelevantes.fileName = nombreArchivo;//+".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objRelevantes);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Reporte Generado satisfactoriamente!");
    //regresar();
}