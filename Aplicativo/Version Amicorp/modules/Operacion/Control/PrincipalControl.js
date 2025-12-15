
showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbParam651 = JSON.parse("{\"Indice\":651,\"orderDescripcion\":\"S\"}");
var clavesCombo26 = JSON.parse("{\"llaveClave\":26}");
var cmbFideicomiso = JSON.parse("{}");

var tablaData = new Array();
tablaData[0] = "ctrlIdMovto,50px";
tablaData[1] = "ctrlIdTipoMovto,100px";
tablaData[2] = "ctrlCtaCheques,100px";
tablaData[3] = "ctrlNomSubcta,150px";
tablaData[4] = "ctrlCtaChequesDestino,100px";
tablaData[5] = "ctrlNomSubctaDestino,150px";
tablaData[6] = "ctrlImporte,100px";
tablaData[7] = "ctrlDescripcion,200px";
tablaData[8] = "ctrlStatus,100px";

var tablaDataExtra = new Array();
tablaDataExtra[0] = "asiFolioOpera,50px";
tablaDataExtra[1] = "asiNumOperacion,100px";
tablaDataExtra[2] = "asiTransaccion,50px";
tablaDataExtra[3] = "asiFechaAltaReg,100px";
tablaDataExtra[4] = "asiNumCtam,50px";
tablaDataExtra[5] = "asiNumScta,50px";
tablaDataExtra[6] = "asiNumSscta,50px";
tablaDataExtra[7] = "asiNumSsscta,50px";
tablaDataExtra[8] = "asiNumSssscta,50px";
tablaDataExtra[9] = "asiNumSsssscta,50px";
tablaDataExtra[10] = "asiNumAux1,50px";
tablaDataExtra[11] = "asiNumAux2,50px";
tablaDataExtra[12] = "asiNumAux3,100px";
tablaDataExtra[13] = "asiCveCarAbo,50px";
tablaDataExtra[14] = "asiImpMovimiento,100px";
tablaDataExtra[15] = "asiNomCta,200px";
tablaDataExtra[16] = "asiCveStMovim,50px";


var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;

//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("paramfecha","paramfecha", "%d/%m/%Y");

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
formsLoaded();


function generaControl()
{
  if(fvMantenimiento.checkForm())
  {
    var surl = "\"id\":\"ejeFunGeneraControl\",";
    surl += "\"fideicomiso\":"+GI("paramfideicomiso").value+",";
    surl += "\"fecha\":\""+GI("paramfecha").value+"\"";
    
    var url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    showWaitLayer();
    makeAjaxRequest(url,"HTML",generaControlResp,null)
  }
}

function generaControlResp(obj, result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0 : // generó control del fideicomiso y fecha
    case 1 : // no hay datos
      consultaControl(GI('cmdConsultar'));
      break;
    default : 
      alert("Ocurrió un error inesperado");
      break;
  }
  hideWaitLayer();
}

function consultaControl(btn)
{
    if(fvMantenimiento.checkForm())
    {
        
        GI('paramFolio').value = "";
        GI('paramOrder').value = "";
        GI('tdAsientos').style.visibility = "hidden";
        consultar(btn, GI('frmDatos'), false);
    }
}


function consultaAsientosControl(btn)
{
    if(fvMantenimiento.checkForm())
    {        
        GI('paramFolio').value = pkInfo.ctrlIdMovto;
        GI('paramOrder').value = "s";
        GI('tdAsientos').style.visibility = "visible";
        consultar(btn, GI('frmDatos'), false);
    }
}


function limpiar(objForma){
  onButtonClickPestania("Operacion.Control.PrincipalControl","");
}

function clickTabla(pk) 
{
  pkInfo = pk;
  consultaAsientosControl(GI('cmdConsultarAsientos'));
}
