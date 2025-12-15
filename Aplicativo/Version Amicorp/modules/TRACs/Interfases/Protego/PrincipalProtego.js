// JavaScript Document

var fncInterfase = JSON.parse("{\"id\":\"storeGenArchInterfazValuacion\"}");
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
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
   // alert(url)
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