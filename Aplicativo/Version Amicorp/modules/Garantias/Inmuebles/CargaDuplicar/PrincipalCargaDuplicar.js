showWaitLayer();
initForms();

var fvCargaDuplicar = new FormValidator();
var archivoSeleccionado = false;
//var divNombreFideicomisoParam;
var fechaDefault = new Date();

fvCargaDuplicar.setup({
  formName      : "frmCargaDuplicar",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function showFrame() {
  displayFrame("dvMensajes", "frameUpload", ctxRoot + "/modules/Garantias/Inmuebles/CargaDuplicar/FileUpload.do", 200, 200, 100, 400, 0, 0);  
}

function frameSubmit(forma) {
    //obtenerTipoArchivo();
  if(fvCargaDuplicar.checkForm() && obtenerNombreArchivo(forma.flArchivo)){
    showWaitLayer();
    GI("frameUpload").onreadystatechange = hideFrame;
    forma.NombreArchivo.value = GI("NombreArchivo").value;
    forma.Fecha.value = GI("txtFechaContable").value;
    forma.submit();
    archivoSeleccionado = true;
    deshabilitaObjetos(GI("frmCargaDuplicar"));
    muestraObjs("cmdCargar,cmdLimpiar");
  }else{
    archivoSeleccionado = false;
  }
}

function hideFrame() { 
  GI("frameUpload").onreadystatechange = null;
  removeFrame("frameUpload");
  hideWaitLayer();
}

function obtenerNombreArchivo(objFile){  
  
  if(objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("DUPLICAR") == -1){
    alert("Seleccione un Archivo de Carga correcto!");
    return false;
  }else if(objFile.value == ""){
    alert("Seleccione el Archivo de Carga!");
    return false;
  }
  GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
  return true;
}
  
function ejecutaCargaDuplicar(){
  showWaitLayer();
  var objCargaDuplicarParam = JSON.parse("{\"id\":\"ejeFunCargaClon\"}");
  //objCargaMasivaParam.Tipo = 1;
  objCargaDuplicarParam.TipoMovimiento = eval(GI("rdTipoMovimiento").value);
  objCargaDuplicarParam.Fideicomiso = GI("paramFideicomiso").value;
  objCargaDuplicarParam.NombreArchivo = GI("NombreArchivo").value;
  objCargaDuplicarParam.Fecha = GI("txtFechaContable").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objCargaDuplicarParam);
  alert(url);
  makeAjaxRequest(url, "HTML", validaCargaDuplicar, null);
}


function validaCargaDuplicar(obj, result){
  alert(result);
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado == "CORRECTO"){
      alert("Proceso concluido satisfactoriamente!");
      onButtonClickPestania('Garantias.Inmuebles.CargaDuplicar.PrincipalCargaDuplicar','');
    }else if(resultado == "ERROR NO DATOS")
      alert("No existe información a procesar!");
    else if(resultado == "ERROR NUM COLS")
      alert("Número de columnas invalido!");
    else if(resultado == "ERROR NUM SPD")
      alert("Error de dato númerico que no debería tener punto décimal!");
    else if(resultado == "ERROR NUM CPD")
      alert("Error de dato númerico que maneja punto décimal!");
    else if(resultado == "ERROR PROC. ASIGNADO")
      alert("Error al procesar el rubro de asignado!");
    else if(resultado == "ERROR PROC. COMPROMETIDO")
      alert("Error al procesar el rubro de comprometido!");
    else if(resultado == "ERROR PROC. EJERCIDO")
      alert("Error al procesar el rubro de ejercido!");
    else if(resultado == "ERROR ORACLE")
      alert("Ocurrió un error inesperado (oracle)!");
    if(resultado != "CORRECTO"){
      var objDeleteParam = JSON.parse("{\"id\":\"delArcPla\"}");
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDeleteParam);
      alert(url);
      makeAjaxRequest(url, "HTML", null, null);
    }
  }else
    alert("Ocurrió un error inesperado!");
  hideWaitLayer();
}