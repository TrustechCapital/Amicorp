//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbScta = JSON.parse("{\"Fideicomiso\":0}");
var cmbCtoInver = JSON.parse("{\"Fideicomiso\":0}");
var cmbPizarra = JSON.parse("{\"fiso\":0}");
var cmbTercero = JSON.parse("{\"Fideicomiso\":-1}");
    
var sPizarra = "";
var sSerie = "";
var sCupon = 0;

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
});

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
fechaTrack(GI("paramFecha"));
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

function cargaCmbSembrado(objCmb)// onchange combo Fideicomiso
{
 
      cmbScta = JSON.parse("{\"Fideicomiso\":"+objCmb.value+"}");
      cmbTercero = JSON.parse("{\"Fideicomiso\":"+objCmb.value+"}");
      
      loadElement(GI("paramSCta"));
      cargaCmbSembrado2(GI("paramSCta"));
      loadElement(GI("paramTercero"));
      
  if(opcPaquete!=2&&opcPaquete!=3)// no es pestaña de NAFTRAC
  {  
      if(objCmb.value!=-1)// selecciono algún fideicomiso ( carga PIZARRA SERIE CUPON)
      {
        var url = ctxRoot+"/getRef.do?json={\"id\":\"qryEmiFideicomisoTrack\",\"Fideicomiso\":"+objCmb.value+"}";
        makeAjaxRequest(url,"HTML",cargaPiSeCu,null);
      }
      else
      {
        GI("paramPizarra").innerHTML = "...";
        GI("paramSerie").innerHTML = "...";
        GI("paramCupon").innerHTML = "...";
        
        sPizarra = "";
        sSerie = "";
        sCupon = 0;
      }
  }
}

function cargaCmbSembrado2(objCmb)// onchange combo Subcuentas
{
  
  cmbCtoInver = JSON.parse("{\"Fideicomiso\":"+GI("paramFideicomiso").value+",\"SubCuenta\":"+objCmb.value+"}");
  loadElement(GI("paramCtoInver"));
}

function cargaPiSeCu(obj,result)// se cargan pizarra,serie,cupón
{
  var res = JSON.parse(result)[0];
  if(res!='undefined')
  {
    GI("paramPizarra").innerHTML = res.femiPizarra;
    GI("paramSerie").innerHTML = res.femiSerie;
    GI("paramCupon").innerHTML = res.femiCupon;
    
    sPizarra = res.femiPizarra;
    sSerie = res.femiSerie;
    sCupon = res.femiCupon;
  }
  else
  {
    GI("paramPizarra").innerHTML = "...";
    GI("paramSerie").innerHTML = "...";
    GI("paramCupon").innerHTML = "...";
    
    sPizarra = "";
    sSerie = "";
    sCupon = 0;
  }
  
}

function clickPestaniaSembrado(obj,cadotras,titulo)
{
  pesSelected = true;
  obj.siSeleccionada= "SI";
  var otraspes = cadotras.split(",");
  
  
  GI("tituloSembrado").innerHTML = titulo; // cambia el titulo
  
  for(s=0;s<otraspes.length;s++)//deselecciona las demas pestañas
  {
      GI("gar_"+otraspes[s]).siSeleccionada = "NO";
      var claseOriginal = GA(GI("gar_"+otraspes[s]), "claseOriginal")
      GI("gar_"+otraspes[s]).className = claseOriginal;
  }
  var opc_gar = eval(obj.id.replace("gar_",""));//pestaña seleccionada
  
  switch(opc_gar)//se asigna valor a la variable de opcion del paquete (1,2,3,4)
  {
    case 1:
    case 2: // PIZARRA NAFTRAC
      GI("paramPizarra").innerHTML = "NAFTRAC";
      GI("paramSerie").innerHTML = "02";
      GI("paramCupon").innerHTML = "0";
      
      sPizarra = "NAFTRAC";
      sSerie = "02";
      sCupon = 0;
      opcPaquete = opc_gar+1;
    break;
    
    case 0:
    case 3://PIZARRA EMISION
      
      var url = ctxRoot+"/getRef.do?json={\"id\":\"qryEmiFideicomisoTrack\",\"Fideicomiso\":"+GI("paramFideicomiso").value+"}";
      makeAjaxRequest(url,"HTML",cargaPiSeCu,null);
      
      opcPaquete = opc_gar+1;
    break;
    default:
      alert(eval(obj.id.replace("gar_","")));
      break;
  }
}

// llamadas a paquete ------
function funcionSembrado()
{
  if(fvMantenimiento.checkForm())
  {
    if(opcPaquete!=0)//seleccionó pestaña
    {
      var surl = "\"id\":\"ejeFunSembrado\",";
      surl += "\"fideicomiso\":"+GI("paramFideicomiso").value+",";
      surl += "\"sCta\":"+GI("paramSCta").value+",";
      surl += "\"ctoInver\":"+GI("paramCtoInver").value+",";
      surl += "\"tercero\":"+GI("paramTercero").value+",";
      surl += "\"pizarra\":\""+sPizarra+"\",";
      surl += "\"serie\":\""+sSerie+"\",";
      surl += "\"cupon\":"+sCupon+",";
      surl += "\"unidades\":"+GI("paramUnidades").value+",";
      surl += "\"importe\":"+GI("paramImporte").value+",";
      surl += "\"fecha\":\""+GI("paramFecha").value+"\",";
      surl += "\"opcion\":"+opcPaquete+",";
      surl += "\"usuario\":"+ctxUser;
      var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
      showWaitLayer();
      makeAjaxRequest(url,"HTML",funcionSembradoResp,opcPaquete);
       
    }
    else
    {
      alert("Seleccione Opción");
    }
  }
}

function funcionSembradoResp(obj,result)
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
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
  
  hideWaitLayer();
}

function limpiar()
{ 
  onButtonClickPestania('TRACs.Sembrado.PrincipalSembrado','');
}

// llamadas a paquete ------
