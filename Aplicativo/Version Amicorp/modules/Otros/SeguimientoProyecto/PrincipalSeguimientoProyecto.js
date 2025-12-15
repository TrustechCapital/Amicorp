var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");

var fvCat = new FormValidator();
var strIdPK = "fspNumPro,fspSeguimiento";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var fechas = new Date();

var arrTblDat = new Array();
arrTblDat[0] = "fspNumProspecto,50px";
arrTblDat[1] = "fspNomProspecto,300px";
arrTblDat[2] = "fspFechaFormatted,100px";
arrTblDat[3] = "fspNomUsuario,200px";
arrTblDat[4] = "fspSeguimiento,150px";


fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();


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

function clickTabla(pk)
{

}

function limpiar(objForma)
{
  regresar();
}
function regresar()
{
  onButtonClickPestania("Otros.SeguimientoProyecto.PrincipalSeguimientoProyecto","");
}

function consultaSeguimieto(btnAceptar)
{
  if(fvCat.checkForm())
  {
    consultar(btnAceptar,frmDatos, false);
  }
}

function generarReporteSeguimiento() 
{ 
  if(fvCat.checkForm())
  {
    var idQry = "getRepSeguimientoProy";
    var numProspecto = GI("paramNumProspecto").value;
    
    var objReporte = JSON.parse("{}")
    objReporte.Estructura = "1";
    objReporte.sendToJSP = "true";
    objReporte.urlReporte = "/modules/Otros/SeguimientoProyecto/ReporteSeguimientoProyecto.jsp";
    objReporte.id = idQry;
    objReporte.numProspecto = numProspecto;
    
    
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(objReporte);
    var link = GI('linkReporte');
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();  
  }
}