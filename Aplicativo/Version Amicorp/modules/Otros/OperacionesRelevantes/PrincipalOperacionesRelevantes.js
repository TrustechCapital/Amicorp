showWaitLayer();

var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");
var clavesCombo702  = JSON.parse("{\"llaveClave\":705,\"orderDescripcion\":\"s\"}");

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
  onButtonClickPestania("Otros.OperacionesRelevantes.PrincipalOperacionesRelevantes","");
}

/*--FIDEICOMISO--*/

function verificacionActivo(txtFiso) 
{
  if(txtFiso.value != "") 
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":" + txtFiso.value + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", funcionVerificacionActivo, txtFiso);
  }else
    asignaEtiqueta("nomFideicomiso","");
}

function funcionVerificacionActivo(txtFiso,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    txtFiso.value="";
    asignaEtiqueta("nomFideicomiso","");
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",txtFiso);
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
  ejecutaReporteOperacionesRelevantes(pk.folio,pk.status);
}

function clickTablaReporte(pk)
{
  ejecutaReporteOperacionesRelevantes(pk.folio,pk.status);
}

function ejecutaReporteOperacionesRelevantes(idfolio,cvestatus)
{

  var objRelevantes = JSON.parse("{}");
  objRelevantes.id="ejeFunRepOperacionesRelevantes";
  objRelevantes.Folio=idfolio;
  objRelevantes.Status=cvestatus;
  
  var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objRelevantes);
  makeAjaxRequest(url,"html",ejecutaReporteOperacionesRelevantesRes,null);
  
}

function ejecutaReporteOperacionesRelevantesRes(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  
  if(isDefinedAndNotNull(res))
  {
    if(Number(res)==0)
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
    //alert(GI("paramChkRep").checked)
    if(GI("paramChkRep").checked)
        objRelevantes.StatusRep="EN FIRME";
    else
        objRelevantes.StatusRep="CONSULTA";    
    objRelevantes.FechaRep=GI('paramFechaRep').value;
    
    var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objRelevantes);
    makeAjaxRequest(url,"html",generaReporteOperacionesRelevantesRes,null);
  }
}

function generaReporteOperacionesRelevantesRes(obj,result)
{
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