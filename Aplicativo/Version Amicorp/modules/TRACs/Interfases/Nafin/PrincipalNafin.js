// JavaScript Document

var fncInterfase = JSON.parse("{\"id\":\"ejeFunEntradaNafin\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");

var fvInterfase = new FormValidator();

initForms();
fechaTrack(GI("txtFechaValor"));

var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

cal.manageFields("txtFechaValor", "txtFechaValor", "%d/%m/%Y");

fvInterfase.setup({
  formName      : "frmDatosInterfase",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function ejecutaFuncion(){
  if(GI("txtFechaValor").value==""||GI("txtNomArch").value=="")
  {  
    alert("Debe seleccionar la Fecha,Nombre");
  }
  else
  {
    if(fvInterfase.checkForm())
    {
          frameSubmit(document.frameUpload.frmValuacion);
         // ejecutaStoreInterfase();    
    }
  }
}
  

function frameSubmit(forma) {
  //if(fv.checkFrom())
  forma.document.getElementById("Fecha").value = GI("txtFechaValor").value;
  forma.document.getElementById("NombreArchivo").value = GI("txtNomArch").value;
  forma.submit();
  
  //ejecutaStoreInterfase(); /// ejecuta rutina  valuacion
  //document.getElementById("cmdLimpiar").click();
  //showWaitLayer();

}

function ejecutaStoreInterfase(){
    fncInterfase.fecha = GI("txtFechaValor").value;
    fncInterfase.nomArchivo = GI("txtNomArch").value;
    fncInterfase.numUsuario = ctxUser;
    fncInterfase.numOpcion = 0;
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
   showWaitLayer();
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }


function validaStoreInterfase(obj, result){
  var res = JSON.parse(result).RESULTADO;
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
          alert("Operación exitosa")
          document.getElementById("cmdLimpiar").click();
      break;
      case 1:alert("Cargue el archivo correcto antes de al vaciar los Precios!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
  {
     alert("Ocurrió un error inesperado");
  }
  hideWaitLayer();
}


function fileUploaded() {  
 alert("Archivo Cargado correctamente")
 /* 
  var objInterface = GI("dvInterface");
  var url = ctxRoot + "/modules/Interfases/InterfseVauacion/TasAplicar.do";
 
 GI("frameUpload").onreadystatechange = function() {};
  hide("frameUpload");
  hide("frmTas");
  
  removeFrame("frameUpload");
  
  makeAjaxRequest(url, "HTML", cambiaPantallaTAS, objInterface);*/
}
/*

function cambiaPantallaTAS(obj, result) {
  obj.innerHTML = result;
  SA(GI("paramFecha"), "readonly", "true");
  GI("txtMensaje").value=vgDisplay;
  hideWaitLayer();
}*/

//-----------Reporte--------------------


function reporteNafin()
{
    if(fvInterfase.checkForm())
    {
     
        var surl ="\"id\":\"funGeneraReporteNafin\",";
        surl +="\"nomArchivo\":\""+GI('txtNomArch').value+"\",";
        surl +="\"fecha\":\""+GI('txtFechaValor').value+"\",";
        surl +="\"usuario\":"+ctxUser+",";
        surl +="\"opcion\":0"; 
        
        var url = ctxRoot + "/execRefReporte.do?json={"+surl+"}";
        makeAjaxRequest(url,"HTML",reporteNafinResp,null);
                
    }
}
function reporteNafinResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
      var surl ="\"Estructura\":\"1\",";
        surl +="\"sendToJSP\":\"true\",";
        surl +="\"urlReporte\":\"/modules/TRACs/Interfases/Nafin/ReporteNafin.jsp\",";
        surl +="\"id\":\"getRepNaftrac\","
        surl +="\"order\":\"s\"";
    
        var url = ctxRoot + "/imprimirReporte.do?checknaftrac="+GI('chNaftrac').checked+"&json={"+surl+"}";
        var link = GI('linkReporte');
        link.href=url;
        link.click();
        document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
        hideWaitLayer();
      
    break;
    case 1:
      alert("No hay datos para esa fecha!")
    break;
    default:
      alert("ocurrió un error inesperado!")
    break;
  }
}
//-----------Reporte--------------------

//-----------Archivo--------------------

function generaArchivo()
{

}
//-----------Archivo--------------------