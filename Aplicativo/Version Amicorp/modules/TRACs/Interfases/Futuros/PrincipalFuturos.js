// JavaScript Document

var fncInterfase = JSON.parse("{\"id\":\"ejeFunInterfaseFuturos\"}");
var fncFuturos = JSON.parse("{\"id\":\"ejeFunFuturos\"}");

var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");


pkInfo=null;

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

var fvInterfase = new FormValidator();
var fechaDefault = new Date();

initForms();

Calendar.setup({
    inputField     :    "txtFechaValor",
    button         :    "txtFechaValor",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

fvInterfase.setup({
  formName      : "frmDatosInterfase",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function asignaFechaValor(){
  dvFechaParam.Fecha = GI("txtFechaValor").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(dvFechaParam);
  makeAjaxRequest(url, "HTML", asignaEtiquetas, null);
}
function asignaEtiquetas(obj, result){
  var resultado = JSON.parse(result)[0];
  formsLoaded();
}

function ejecutaFuncion(){
  if(GI("txtFechaValor").value==""||GI("txtNomArch").value=="")
  {  
    alert("Debe seleccionar la Fecha,Nombre");
  }
  else
  {
    if(fvInterfase.checkForm())
    {
          frameSubmit(document.frameUpload.frmUpload);
         // ejecutaStoreInterfase();    
    }
  }
}
  

function frameSubmit(forma) {
  //if(fv.checkFrom())
  forma.document.getElementById("Fecha").value = GI("txtFechaValor").value;
  forma.document.getElementById("NombreArchivo").value = GI("txtNomArch").value;
  
  showWaitLayer();
  GI("frameUpload").onreadystatechange = function() { readyFrameUpload();/*hideWaitLayer();*/};
  
  forma.submit();
  
  //ejecutaStoreInterfase(); /// ejecuta rutina  valuacion
  //document.getElementById("cmdLimpiar").click();
  //showWaitLayer();

}


var onceFut = true;
function readyFrameUpload()
{
  if(onceFut)
  {
    GI("frameUpload").style.visibility = "hidden";
    ejecutaStoreInterfase();
    onceFut = false;
  }
}

function ejecutaStoreInterfase(){
    fncInterfase.fecha = GI("txtFechaValor").value;
    fncInterfase.nombreArchivo = GI("txtNomArch").value;
    fncInterfase.numUsuario = ctxUser;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
   // alert(url)
   //showWaitLayer();
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }


function validaStoreInterfase(obj, result){
   var res = JSON.parse(result).RESULTADO;

  if(isDefinedAndNotNull(res))
  {
    switch(eval(res)){
      case 0:
          fileUploaded(); 
          consultaInterfaseFuturos();
      break;
      case 1:alert("Archivo sin Datos");break;
      break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
  {
     alert("Ocurrió un error inesperado");
  }
  hideWaitLayer();
}

function fileUploaded() {  
 alert("Archivo cargado correctamente");
}

// movimientos futuros

function consultaInterfaseFuturos()
{
  var objIntFuturos =  JSON.parse("{}");
  objIntFuturos.id = "qryInterfaseFuturosTrack";
  objIntFuturos.order = "s";
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objIntFuturos); 
  
  makeAjaxRequest(url,"html",consultaInterfaseFuturosRes,null);
}

var movtosFuturo; // arreglo de movimientos
var indexMov = 0; // indica ultima operación a aplica 

function  consultaInterfaseFuturosRes(obj,result)
{
  indexMov = 0;
  movtosFuturo = JSON.parse(result);
  
  if(movtosFuturo.length>0)
  {
    var strFuturos = '<table class="texto" style="width:750px;font-size:14px;color:white;" cellpadding="2" cellspacing="0">';
    strFuturos += '<tr>';
    strFuturos += '<td style="font-weight:bold;" align="center">Fecha</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Fiso</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">SCta</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Cto Inv</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Sec</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Pizarra</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Ctos</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">IPC</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Val Nom</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Cve Movto</td>';
    strFuturos += '<td style="font-weight:bold;" align="center">Status</td>';
    strFuturos += '</tr>';
  
    for(i=0;i<movtosFuturo.length;i++)
    {
      //F_INTERFAE_FUTUROS-----
      strFuturos += '<tr>';
      strFuturos += '<td>'+movtosFuturo[i].fifIdFecha+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifIdFideicomiso+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifIdSubcta+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifIdCtoinver+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifIdSecuencial+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifPizarra+'</td>';
      strFuturos += '<td align="right">'+movtosFuturo[i].fifCtosFuturo+'</td>';
      strFuturos += '<td align="right">'+movtosFuturo[i].fifIpc+'</td>';
      strFuturos += '<td align="right">'+movtosFuturo[i].fifValNominal+'</td>';
      strFuturos += '<td>'+movtosFuturo[i].fifCveOperacion+'</td>';
      strFuturos += '<td><b>'+movtosFuturo[i].fifCveStatus+'</b></td>';
      strFuturos += '</tr>';
      
      //F_FUTUROS-----
      var bventa14 = (movtosFuturo[i].fifCveOperacion=='VENTA'&&movtosFuturo[i].fifIdFideicomiso==14);
      var bcompra15 = (movtosFuturo[i].fifCveOperacion=='COMPRA'&&movtosFuturo[i].fifIdFideicomiso==15);
      
      if(bventa14||bcompra15)//VENTA
      {
        var vSecFuturo = movtosFuturo[i].fifSecFuturos;
        if(vSecFuturo!=0&&isDefinedAndNotNull(vSecFuturo))
        {
            strFuturos += '<tr style="background-color:#dee5d6;color:#5A694A;">';
            strFuturos += '<td>'+movtosFuturo[i].defIdFecCompra+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defIdFideicomiso+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defIdSubcuenta+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defIdCtoInversion+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defIdSecuencial+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defIdPizarra+'</td>';
            strFuturos += '<td align="right">'+movtosFuturo[i].defNumContratos+'</td>';
            strFuturos += '<td align="right">'+movtosFuturo[i].defIpc+'</td>';
            strFuturos += '<td align="right">'+movtosFuturo[i].defValNominal+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defCveOperacion+'</td>';
            strFuturos += '<td>'+movtosFuturo[i].defStatus+'</td>';
            strFuturos += '</tr>';
        }
        else
        {
            strFuturos += '<tr style="background-color:#dee5d6;color:#5A694A;">';
            strFuturos += '<td colspan=11 align="center"><b>Seleccione Secuencial de Futuros!</b></td>';
            strFuturos += '</tr>';
        }
      }
      
      if(movtosFuturo[i].fifCveStatus == 'PROCESADA')
        indexMov++;
    }
    strFuturos += '</table>';
    
    GI('dvMovtosFuturo').innerHTML = strFuturos;
    GI('cmdVaciar').style.visibility="visible";
  }

}


function ejecutaStoreFuturos() // PROCESO F_FUTUROS
{
    if(indexMov<movtosFuturo.length)// aun hay operaciones sin procesar
    {

      fncFuturos.fideicomiso = movtosFuturo[indexMov].fifIdFideicomiso;
      fncFuturos.sCta = movtosFuturo[indexMov].fifIdSubcta;
      fncFuturos.ctoInver = movtosFuturo[indexMov].fifIdCtoinver;
      
      var ffiso = movtosFuturo[indexMov].fifIdFideicomiso;
      var fcve = movtosFuturo[indexMov].fifCveOperacion;
      
      if((ffiso==14&&fcve=="COMPRA")||(ffiso==15&&fcve=="VENTA"))
        fncFuturos.idSecuencial = 0;
      else
      {
        if((ffiso==14&&fcve=="VENTA")||(ffiso==15&&fcve=="COMPRA"))
        {
          if(pkInfo!=null)
          {
            if(movtosFuturo[indexMov].fifSecFuturos>0)
            {
              fncFuturos.idSecuencial = movtosFuturo[indexMov].fifSecFuturos;
            }
            else
            {
              fncFuturos.idSecuencial = pkInfo.defIdSecuencial;
              //limpia posición
              pkInfo = null;
              consultaVacioPosicionFuturos();
            }
          }
          else
          {
            if(movtosFuturo[indexMov].fifSecFuturos>0)
            {
              fncFuturos.idSecuencial = movtosFuturo[indexMov].fifSecFuturos;
            }
            else
            {
              consultaPosicionFuturos();
              return;
            }
          }
        }  
      }
      
      fncFuturos.pizarra = movtosFuturo[indexMov].fifPizarra;
      fncFuturos.serie = movtosFuturo[indexMov].fifSerie;
      fncFuturos.cupon = movtosFuturo[indexMov].fifCupon;
      fncFuturos.ctosFut = movtosFuturo[indexMov].fifCtosFuturo;
      fncFuturos.valNom = replaceAll(movtosFuturo[indexMov].fifValNominal,',','');
      fncFuturos.IPC = replaceAll(movtosFuturo[indexMov].fifIpc,',','');
      fncFuturos.fecha = movtosFuturo[indexMov].fifIdFecha;
      fncFuturos.opcion = (movtosFuturo[indexMov].fifCveOperacion=="COMPRA"?"1":"2");
      fncFuturos.usuario = movtosFuturo[indexMov].fifNumUsuario;
      
      
      
      var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncFuturos);
      //alert(url)
      showWaitLayer();
      makeAjaxRequest(url, "HTML", validaStoreFuturos, indexMov);
    
    }
    else
      alert("Proceso concluido")
    
  }


function validaStoreFuturos(iMov, result){
  //alert(result)
   var res = JSON.parse(result).RESULTADO;

  if(isDefinedAndNotNull(res))
  {
    switch(eval(res)){
      case 0:
          actualizaOperacionFuturo(iMov);
      break;
      case 2:alert("Operación no válida");break;
      break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
  {
     alert("Ocurrió un error inesperado");
  }
  hideWaitLayer();
}

function actualizaOperacionFuturo(iMov)// cambia de ACTIVO a PROCESADA
{
  var objUpdFuturo = JSON.parse("{}");
  objUpdFuturo.id = "updStaIntFut";
  objUpdFuturo.Fideicomiso = movtosFuturo[iMov].fifIdFideicomiso;
  objUpdFuturo.SCta = movtosFuturo[iMov].fifIdSubcta;
  objUpdFuturo.CtoInver = movtosFuturo[iMov].fifIdCtoinver;
  objUpdFuturo.Secuencial = movtosFuturo[iMov].fifIdSecuencial;
  objUpdFuturo.Fecha = movtosFuturo[iMov].fifIdFecha;
  
  var url = ctxRoot+"/doRef.do?json="+JSON.stringify(objUpdFuturo);
  
  makeAjaxRequest(url,"html",actualizaOperacionFuturoRes,null);
}

function actualizaOperacionFuturoRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res)){
    if(res.tipoError == "SUCCESS")
    {
      consultaInterfaseFuturos();
      setTimeout('ejecutaStoreFuturos()',1000);
    }else
      alert("No fue posible realizar la operación");
  }
}


function consultaPosicionFuturos()// tiene que seleccionar un registro de la tabla de posicion de futuros
{
  alert("Seleccione registro de posición de futuros");
  
  GI('paramFideicomiso').value = movtosFuturo[indexMov].fifIdFideicomiso;
  GI('paramPizarra').value = movtosFuturo[indexMov].fifPizarra;
  GI('paramSerie').value = movtosFuturo[indexMov].fifSerie;
  GI('paramCupon').value = movtosFuturo[indexMov].fifCupon;
  GI('paramSCta').value = movtosFuturo[indexMov].fifIdSubcta;
  GI('paramCtoInver').value = movtosFuturo[indexMov].fifIdCtoinver;
  
  GI('cmdConsultar').click();
}


function consultaVacioPosicionFuturos()// tiene que seleccionar un registro de la tabla de posicion de futuros
{
  GI('paramFideicomiso').value = "0";
  GI('paramPizarra').value = "0";
  GI('paramSerie').value = "X";
  GI('paramCupon').value = "X";
  GI('paramSCta').value ="0";
  GI('paramCtoInver').value = "0";
  
  GI('cmdConsultar').click();
}

function clickTabla(pk) {
  pkInfo = pk;
}

consultaInterfaseFuturos();