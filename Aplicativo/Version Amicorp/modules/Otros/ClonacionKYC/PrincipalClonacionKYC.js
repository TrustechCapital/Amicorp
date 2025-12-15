
var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");
var clavesCombo702  = JSON.parse("{\"llaveClave\":702,\"orderDescripcion\":\"s\"}");

var fvCat = new FormValidator();
var strIdPK = "contrato";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
var pkInfoClon = null;

var fechas = new Date();

var arrTblDat = new Array();
arrTblDat[0] = "contrato,100px";
arrTblDat[1] = "nomTipoPersona,150px";
arrTblDat[2] = "numPersona,150px";
arrTblDat[3] = "nomPersona,200px";
arrTblDat[4] = "idPersona,100px";


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

function limpiar(objForma)
{
  regresar();
}
function regresar()
{
  onButtonClickPestania("Otros.ClonacionKYC.PrincipalClonacionKYC","");
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


// Clonacion KYC -----------------------------
function consultaClonacionKyc(btnAceptar)
{
  if(fvCat.checkForm())
  {
    consultar(btnAceptar,frmDatos, false);
    
    GI('paramIdPersona').value = '';
    consultaClonacionKycClon();
  }
}

function clickTabla(pk)
{
  pkInfo = pk;
  
  // consulta
  GI('paramIdPersona').value = pkInfo.idPersona;
  GI('cmdAceptarClon').click();
}

function clickTablaClon(pk)
{
  pkInfoClon = pk;
}

// ----------------------------------------------------

// OPERACIONES RELEVANTES REPORTE -----------------------------
function consultaClonacionKycClon()
{
  consultar(GI('cmdAceptarClon'),frmDatos, false);
}



function  generaClonacionKyc()
{
  if(isDefinedAndNotNull(pkInfo),isDefinedAndNotNull(pkInfoClon))
  {
    if(pkInfo.contrato == pkInfoClon.contrato && pkInfo.tipoPersona == pkInfoClon.tipoPersona && pkInfo.numPersona == pkInfoClon.numPersona)
    {
      alert("Seleccione Registros Diferentes!");
      return;
    }
  
    var objClonacion = JSON.parse("{}");
    objClonacion.id="ejeFunClonacionKYC";
    objClonacion.Fideicomiso = pkInfo.contrato;
    objClonacion.TipoPersona = pkInfo.tipoPersona;
    objClonacion.NumPersona = pkInfo.numPersona;
    objClonacion.FideicomisoClon = pkInfoClon.contrato;
    objClonacion.TipoPersonaClon = pkInfoClon.tipoPersona;
    objClonacion.NumPersonaClon = pkInfoClon.numPersona;
    
    var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objClonacion);
    
    makeAjaxRequest(url,"html",generaClonacionKycRes,null);
  }
  else
  {
    alert("Seleccione registros Original y Clon");
  }
}

function generaClonacionKycRes(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  
  if(isDefinedAndNotNull(res))
  {
    if(res==0)
    {
      alert("Proceso concluido correctamente");
      regresar();
    }
    else
      alert("Ocurrió un error inesperado");
  }
  else
  {
    alert("Ocurrió un error inesperado");
  }
}
// ----------------------------------------------------
