//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbScta = JSON.parse("{\"Fideicomiso\":0}");
var cmbCtoInverO = JSON.parse("{\"Fideicomiso\":0}");//Cto Inver Origen
var cmbCtoInverD = JSON.parse("{\"Fideicomiso\":0}");//Cto Inver Destino
var cmbMercadoParam = JSON.parse("{\"chido\":45}");

var sSerie = "";
var sCupon = 0;

var opcPaquete = 0; // variable opcion en llamado al paquete lineas de credito

var tablaData = new Array();
tablaData[0] = "posNomPizarra,200px";
tablaData[1] = "posNumSerEmis,80px";
tablaData[2] = "posNumCuponVig,80px";
tablaData[3] = "posPosicActual,100px";

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

cal.manageFields("tFecha","tFecha", "%d/%m/%Y");
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
fechaTrack(GI("tFecha"));
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

function cargaCmbTraspaso(objCmb)// onchange combo Fideicomiso
{
  
  cmbScta = JSON.parse("{\"Fideicomiso\":"+objCmb.value+"}");
  loadElement(GI("SCtaD"));
  loadElement(GI("SCtaO"));
}

function cargaCmbTraspaso2(objCmb,car)// onchange combo Subcuentas
{
  
  if(car=="O") //subcuenta origen
  {
    cmbCtoInverO = JSON.parse("{\"Fideicomiso\":"+GI("paramNumFideicomiso").value+",\"SubCuenta\":"+objCmb.value+"}");
    loadElement(GI("paramNumContratoInversion"));
  }
  else if(car=="D") //subcuenta destino
  {
    cmbCtoInverD = JSON.parse("{\"Fideicomiso\":"+GI("paramNumFideicomiso").value+",\"SubCuenta\":"+objCmb.value+"}");
    loadElement(GI("CtoInverD"));
  }
  
}

function consultaPosicionTraspaso(obj)
{
  consultar(obj, GI('frmDatos'), false);
  pkInfo = null;
}

function clickPestaniaTraspaso(obj,cadotras)
{
  pesSelected = true;
  obj.siSeleccionada= "SI";
  var otraspes = cadotras.split(",");
  
  for(s=0;s<otraspes.length;s++)//deselecciona las demas pestañas
  {
      GI("gar_"+otraspes[s]).siSeleccionada = "NO";
      var claseOriginal = GA(GI("gar_"+otraspes[s]), "claseOriginal")
      GI("gar_"+otraspes[s]).className = claseOriginal;
  }
  var opc_gar = eval(obj.id.replace("gar_",""));//pestaña seleccionada
  
  switch(opc_gar)//se asigna valor a la variable de opcion del paquete (1,2,3,4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      opcPaquete = opc_gar+1;
    break;
    default:
      alert(eval(obj.id.replace("gar_","")));
      break;
  }
}

// llamadas a paquete ------
function funcionTraspaso()
{
  if(fvMantenimiento.checkForm())
  {
    if(pkInfo!=null)//seleccionó pestaña
    {
      var surl = "\"id\":\"ejeFunTraspasoTrack\",";
      surl += "\"fideicomiso\":"+GI("paramNumFideicomiso").value+",";
      surl += "\"sCtaO\":"+GI("SCtaO").value+",";
      surl += "\"ctoInverO\":"+GI("paramNumContratoInversion").value+",";
      surl += "\"sCtaD\":"+GI("SCtaD").value+",";
      surl += "\"ctoInverD\":"+GI("CtoInverD").value+",";
      surl += "\"pizarra\":\""+pkInfo.posNomPizarra+"\",";
      surl += "\"serie\":\""+pkInfo.posNumSerEmis+"\",";
      surl += "\"cupon\":"+pkInfo.posNumCuponVig+",";
      surl += "\"nTitulos\":"+GI("numTitulos").value+",";
      surl += "\"importe\":"+GI("importe").value+",";
      surl += "\"fecha\":\""+GI("tFecha").value+"\",";
      surl += "\"usuario\":"+ctxUser;
      var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
      showWaitLayer();
      makeAjaxRequest(url,"HTML",funcionTraspasoResp,null);
    }
    else
    {
      alert("Seleccione Pizarra,Serie,Cupón");
    }
  }
}

function funcionTraspasoResp(obj,result)
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
    case 2:
      alert("Operación de Traspaso no existe");
      break;
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
  
  hideWaitLayer();
}

function limpiar()
{
  onButtonClickPestania('TRACs.TraspasoTitulos.PrincipalTraspasoTitulos','');
}
// llamadas a paquete ------
