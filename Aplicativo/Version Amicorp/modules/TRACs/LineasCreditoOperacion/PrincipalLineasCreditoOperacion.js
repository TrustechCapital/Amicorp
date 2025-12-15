//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbCtaCheques = JSON.parse("{\"fideso\":0}");
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbLineasCredito = JSON.parse("{\"fiso\":0}");

var opcPaquete = 0; // variable opcion en llamado al paquete lineas de credito

var tablaData = new Array();
tablaData[0] = "temIdFolio,50px";
tablaData[1] = "temFecMovto,80px";
tablaData[2] = "temIdSerie,80px";
tablaData[3] = "temIdPizarra,80px";
tablaData[4] = "temCerCirculacion,100px";
tablaData[5] = "temCerCreados,100px";
tablaData[6] = "temCerRedimidos,100px";
tablaData[7] = "temPrecioTeorico,80px";
tablaData[8] = "temValorCanasta,100px";
tablaData[9] = "temValorActivos,100px";
tablaData[10] = "temNumUnidad,100px";
tablaData[11] = "temCuentaGastos,80px";


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

cal.manageFields("paramFecha","paramFecha", "%d/%m/%Y");
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



function limpiar(objForma){
  RF(objForma);
  //catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FCartera");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  //cloneObject(pk,cat.getCatalogo());
}

function cargaCmbLineas(objCmb)
{
   cmbLineasCredito = JSON.parse("{\"fiso\":"+objCmb.value+"}");
    cmbCtaCheques = JSON.parse("{\"fideso\":"+objCmb.value+"}");
    loadElement(GI("paramctaCheques"));
     loadElement(GI("paramLinea"));
}

function getSubcuenta()
{
  var url = ctxRoot+"/getRef.do?json={\"id\":\"qryLineasCreditoTrack\",\"Fideicomiso\":"+GI("paramFideicomiso").value+",\"Linea\":"+GI("paramLinea").value+"}";
  makeAjaxRequest(url,"HTML",getSubcuentaRes,null);
}

function getSubcuentaRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res))
  {
    GI("paramsCta").value = res[0].lcrScta;
    var url = ctxRoot+"/getRef.do?json={\"id\":\"conPriSubCuentas\",\"SubCuenta\":"+GI("paramsCta").value+"}";    
    makeAjaxRequest(url,"HTML",escribeSubCta,null);
  }
  else
  {
    GI("dvSubCuenta").innerHTML = "...";  
  }
} 
function escribeSubCta(obj,result)
{
  var res = JSON.parse(result)[0];
  GI("dvSubCuenta").innerHTML = GI("paramsCta").value + " - "+res.fsctNombreSubCuenta;  
}

function clickPestaniaLineas(obj,cadotras,titulo)
{
  pesSelected = true;
  obj.siSeleccionada= "SI";
  var otraspes = cadotras.split(",");
  
  GI("tituloLineasCred").innerHTML = titulo; // cambia el titulo
  
  
  for(s=0;s<otraspes.length;s++)//deselecciona las demas pestañas
  {
      GI("gar_"+otraspes[s]).siSeleccionada = "NO";
      var claseOriginal = GA(GI("gar_"+otraspes[s]), "claseOriginal")
      GI("gar_"+otraspes[s]).className = claseOriginal;
  }
  var opc_gar = eval(obj.id.replace("gar_",""));//pestaña seleccionada
  
  switch(opc_gar)//se asigna valor a la variable de opcion del paquete (2,3,4,5)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      //opcPaquete = opc_gar+2;
      opcPaquete = opc_gar+1;
    break;
    default:
      alert(eval(obj.id.replace("gar_","")));
      break;
  }
  
}

// llamadas a paquete ------
function funcionLineasCredito()
{
  if(fvMantenimiento.checkForm())
  {
    if(opcPaquete!=0)//seleccionó pestaña
    {
      var surl = "\"id\":\"ejeFunLineasCredito\",";
      surl += "\"fideicomiso\":"+GI("paramFideicomiso").value+",";
      surl += "\"linea\":"+GI("paramLinea").value+",";
      surl += "\"subCta\":"+GI("paramsCta").value+",";
      surl += "\"ctaCheques\":"+GI("paramctaCheques").value+",";
      surl += "\"fecha\":\""+GI("paramFecha").value+"\",";
      surl += "\"importe\":"+GI("paramImporte").value+",";
      surl += "\"opcion\":"+opcPaquete+",";
      surl += "\"usuario\":"+ctxUser;
      var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
      
      showWaitLayer();
      makeAjaxRequest(url,"HTML",funcionLineasCreditoResp,opcPaquete);
       
    }
    else
    {
      alert("Seleccione Opción");
    }
  }
}

function funcionLineasCreditoResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
      alert("Operación Exitosa");
      limpiar();
      break;
    case 1:
      alert("Error en el Paquete");
      break;
    case 4:
      alert("El importe de Disposición supera al importe otorgado en la Línea de Crédito");
      break;
    case 5:
      alert("El importe del pago supera al importe disponible");
      break;
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
  
  hideWaitLayer();
}

function limpiar()
{
  onButtonClickPestania('TRACs.LineasCreditoOperacion.PrincipalLineasCreditoOperacion','');
} 
// llamadas a paquete ------
