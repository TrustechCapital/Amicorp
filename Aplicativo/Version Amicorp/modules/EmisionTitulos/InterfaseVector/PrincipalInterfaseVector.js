// JavaScript Document

var fncInterfase = JSON.parse("{\"id\":\"storeGenArchInterfazVector\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");


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
          frameSubmit(document.frameUpload.frmValuacion);
         // ejecutaStoreInterfase();    
    }
  }
}
  

function frameSubmit(forma) {
  //if(fv.checkFrom())
  forma.document.getElementById("fechaValuacion").value = GI("txtFechaValor").value;
  forma.document.getElementById("nombreValuacion").value = GI("txtNomArch").value;
  
  showWaitLayer();
  GI("frameUpload").onreadystatechange = function() {hideWaitLayer();};
  
  forma.submit();
  
  //ejecutaStoreInterfase(); /// ejecuta rutina  valuacion
  //document.getElementById("cmdLimpiar").click();
  //showWaitLayer();

}

function ejecutaStoreInterfase(){
    fncInterfase.fecha = GI("txtFechaValor").value;
    fncInterfase.nomArchivo = GI("txtNomArch").value;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
   // alert(url)
   showWaitLayer();
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }


function validaStoreInterfase(obj, result){
   var res = JSON.parse(result).RESULTADO;

  if(isDefinedAndNotNull(res))
  {
  
    switch(eval(res)){
      case 0:
          alert("Operación exitosa");   
         document.getElementById("cmdLimpiar").click();
      break;
      case 1:alert("Cargue el archivo correcto antes de vaciar los Precios!");break;
      case 2:
          if(confirm("Existen diferencias entre el vector de precios y los precios anteriormente cargados, Se enviará una notificación vía Email"))
            formaCadenaEmail();
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
 alert("Archivo Cargado correctamente")
}

// ---------------- ENVIO DE CORREO-------

  
  function formaCadenaEmail()
  {
      var objConsulta = JSON.parse("{}"); 
       objConsulta.id = "ejeFunCadenaEmailVector";
       objConsulta.numUsuario = ctxUser;
       
       var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objConsulta);
       showWaitLayer
      makeAjaxRequest(url, "HTML", formaCadenaEmailRes, null);
  }
  
  function formaCadenaEmailRes(obj,result)
  {
   var res = JSON.parse(result).RESULTADO;

  if(isDefinedAndNotNull(res))
  {
    switch(res){
      case 'VACIO':
          alert("De de alta a los Destinatarios de la Notificación electrónica en Indices (539)");   
      break;
      case 'ERROR':alert("Cargue el archivo correcto antes de vaciar los Precios!");
      break;
      default:
            enviaCorreo(res);
      break;
    }
  }else
  {
     alert("Ocurrió un error inesperado");
  }
  hideWaitLayer();
  }
  
        
  //envia correo
  function enviaCorreo(ecorreos)
  {    
     var idLink = "linkReporteNew"; 
    var parametrosUrl = new Object;
    
     parametrosUrl.sendToJSP="true";
     parametrosUrl.urlReporte= "/modules/EmisionTitulos/InterfaseVector/EnviarCorreo.jsp";
     
    parametrosUrl.id = "emision.qryVectorDiferente";
    parametrosUrl.nomArchivo = GI("txtNomArch").value;
    parametrosUrl.fechaArchivo = GI("txtFechaValor").value;
       
     var url = ctxRoot + "/imprimirReporte.do?correos='"+ecorreos+"'&json=" + JSON.stringify(parametrosUrl);
     idLink.href=url;
     window.open(url,GI("linkReporteNew").value,"width=450,height=205,scrollbars=NO");        
      document.getElementById("cmdLimpiar").click();
  }
  