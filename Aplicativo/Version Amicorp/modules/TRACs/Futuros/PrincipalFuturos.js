//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbScta = JSON.parse("{\"Fideicomiso\":0}");
var cmbCtoInver = JSON.parse("{\"Fideicomiso\":0}");
var cmbEmision = JSON.parse("{\"Mercado\":8}");
var inverso = false;

var sSerie = "";
var sCupon = 0;

var opcPaquete = 0; // variable opcion en llamado al paquete lineas de credito

var tablaData = new Array();
tablaData[0] = "defIdFideicomiso,50px";
tablaData[1] = "defIdSubcuenta,50px";
tablaData[2] = "defIdCtoInversion,80px";
tablaData[3] = "defIdSecuencial,80px";
tablaData[4] = "defIdFecCompra,100px";
tablaData[5] = "defIdPizarra,80px";
tablaData[6] = "defIdSerie,50px";
tablaData[7] = "defIdCupon,50px";
tablaData[8] = "defNumContratos,80px";
tablaData[9] = "defValNominal,100px";
tablaData[10] = "defIpc,80px";


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

cal.manageFields("fFecha","fFecha", "%d/%m/%Y");
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
fechaTrack(GI("fFecha"));
formsLoaded();

function limpiar(objForma){
  RF(objForma);
  //catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FCartera");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  GI("IPC").value = replaceAll(pkInfo.defIpc,',','');
  GI("CtosFut").value = pkInfo.defNumContratos;
}

function cargaCmbFuturos(objCmb)// onchange combo Fideicomiso
{
  if(objCmb.value==15)// pendiente
    inverso = true;
  else
    inverso = false;
    
  cmbScta = JSON.parse("{\"Fideicomiso\":"+objCmb.value+"}");
  loadElement(GI("paramSCta"));
  cmbCtoInver = JSON.parse("{\"Fideicomiso\":"+GI("paramFideicomiso").value+",\"SubCuenta\":0}");
  loadElement(GI("paramCtoInver"));
  GI("paramSCta").selectedIndex = 0;
  GI("paramCtoInver").selectedIndex = 0;
  transPosicionFuturos(); // aparece o no posicion
}

function cargaCmbFuturos2(objCmb)// onchange combo Subcuentas
{
  
  cmbCtoInver = JSON.parse("{\"Fideicomiso\":"+GI("paramFideicomiso").value+",\"SubCuenta\":"+objCmb.value+"}");
  loadElement(GI("paramCtoInver"));
}

function cargaSeCu(objCmb)//carga Serie y Cupon de la pizarra
{
  if(objCmb.value!=-1)// selecciono algúna Pizarra
  {
    var url = ctxRoot+"/getRef.do?json={\"id\":\"conPriEmi\",\"Mercado\":8,\"Emisora\":\""+objCmb.value+"\"}";
    makeAjaxRequest(url,"HTML",cargaPiSeCu,null);
  }
  else
  {
      GI("paramSerie").innerHTML = "...";
      GI("paramCupon").innerHTML = "...";
      
      sSerie = "";
      sCupon = 0;
  }
}

function cargaPiSeCu(obj,result)// se cargan pizarra,serie,cupón
{
  var res = JSON.parse(result)[0];
  if(res!='undefined')
  {
    GI("paramSerie").innerHTML = res.emiNumSerEmis;
    GI("paramCupon").innerHTML = res.emiNumCuponVig;
    GI("paramSerie").value = res.emiNumSerEmis;
    GI("paramCupon").value = res.emiNumCuponVig;
    
    sSerie = res.emiNumSerEmis;
    sCupon = res.emiNumCuponVig;
  }
  else
  {
      GI("paramSerie").innerHTML = "...";
      GI("paramCupon").innerHTML = "...";
      
      sSerie = "";
      sCupon = 0;
      
    GI("paramSerie").value = "";
    GI("paramCupon").value = "";

  }
  
}

function clickPestaniaFuturos(obj,cadotras,titulo)
{
  pesSelected = true;
  obj.siSeleccionada= "SI";
  var otraspes = cadotras.split(",");
  
  GI("tituloFuturos").innerHTML = titulo; // cambia el titulo
  
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
  
  transPosicionFuturos();
}

function transPosicionFuturos()
{
  
  if((opcPaquete==2&&!inverso)||(opcPaquete==1&&inverso))// COMPRAS(inverso) Y VENTAS
  {
    GI("posFuturos").style.visibility = 'visible';
  }
  else
  {
    GI("posFuturos").style.visibility = 'hidden';
    pkInfo = null;
  }
} 

// llamadas a paquete ------
function funcionFuturos()
{
  if(fvMantenimiento.checkForm())
  {
    if(opcPaquete!=0)//seleccionó pestaña
    {
      var idSecuencial = 0; // se le asigna valor en caso de venta o compra, en los demas casos es ignorado
      
      
      if(opcPaquete==1||opcPaquete==2)// COMPRAS Y VENTAS
      {      
          if(pkInfo!=null)// seleccionó un existente
          {
              if(eval(GI("CtosFut").value)>eval(pkInfo.defNumContratos))// se quieren comprar o vender mas ctos que los disponibles 
              {
                alert("El número de Contratos de Futuro seleccionado es mayor al número de Contratos de Futuro disponibles");
                return;
              }
              else
              {
                  idSecuencial = pkInfo.defIdSecuencial; 
              }
          }
          else // nuevo registro
          {
            idSecuencial = 0;
          }
      }
    
      var surl = "\"id\":\"ejeFunFuturos\",";
      surl += "\"fideicomiso\":"+GI("paramFideicomiso").value+",";
      surl += "\"sCta\":"+GI("paramSCta").value+",";
      surl += "\"ctoInver\":"+GI("paramCtoInver").value+",";
      surl += "\"idSecuencial\":"+idSecuencial+",";
      surl += "\"pizarra\":\""+GI("paramPizarra").value+"\",";
      surl += "\"serie\":\""+sSerie+"\",";
      surl += "\"cupon\":"+sCupon+",";
      surl += "\"ctosFut\":"+GI("CtosFut").value+",";
      surl += "\"valNom\":"+(GI("CtosFut").value*GI("IPC").value*10)+",";
      surl += "\"IPC\":"+GI("IPC").value+",";
      surl += "\"fecha\":\""+GI("fFecha").value+"\",";
      surl += "\"opcion\":"+opcPaquete+",";
      surl += "\"usuario\":"+ctxUser;
      var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
      showWaitLayer();
      makeAjaxRequest(url,"HTML",funcionFuturosResp,opcPaquete);
       
    }
    else
    {
      alert("Seleccione Opción");
    }
  }
}
function funcionFuturosResp(obj,result)
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
      alert("Operación no válida, Seleccione Registro de posición de Futuros");
      break;
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
  
  hideWaitLayer();
}


function consultaPosicionFuturos(obj)
{
  if(opcPaquete==1||opcPaquete==2)// COMPRAS Y VENTAS
  {
    consultar(obj, GI('frmDatos'), false);
    pkInfo = null;
  }
}

function limpiar()
{
  onButtonClickPestania('TRACs.Futuros.PrincipalFuturos','');
}
// llamadas a paquete ------
