//showWaitLayer();
var objArchivosPlanosParam = JSON.parse("{\"id\":\"muestradatosErrorCtasIndiv\"}");
deshabilitaPK("paramFideicomiso".split(","));

var fvCargaMasiva = new FormValidator();
var fechaDefault = new Date();
var archivoSeleccionado = false;
var divNombreFideicomisoParam;
fvCargaMasiva.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


var numContrato = GI("paramFideicomiso").value;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));


function asignaValueRadio2MasterX(strRadioMaster,objRadioActual){
  asignaValueRadio2Master(strRadioMaster,objRadioActual);
  RA(GI("txtSeparador"),"required");
  limpiaTxts("txtSeparador");
  ocultaObj("txtSeparador");
}

function obtenerNombreArchivo(objFile){
  /*
  if(objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("CARGA_FOSEG") == -1){
    alert("Seleccione un Archivo de Carga correcto!");
    return false;
  }else 
  */
  if(objFile.value == ""){
    alert("Seleccione el Archivo de Carga!");
    return false;
  }
  GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
  return true;
}

function ejecutaCargaMasiva(){
  showWaitLayer();
  var objCargaMasivaParam = JSON.parse("{\"id\":\"ejeFunCargaMasivaCuentasIndividuales\"}");
  objCargaMasivaParam.Tipo = 1;
  objCargaMasivaParam.Separador = GI("rdSeparador").value;
  objCargaMasivaParam.TipoMovimiento = GI("rdTipoMovimiento").value;
  objCargaMasivaParam.FechaMovimientos = GI("txtFechaMovimientos").value;
  objCargaMasivaParam.Fideicomiso = numContrato;
  objCargaMasivaParam.NombreArchivo = GI("NombreArchivo").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objCargaMasivaParam);
  makeAjaxRequest(url, "HTML", validaCargaMasiva, null);
}

function validaCargaMasiva(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado.respuesta)){
    switch(resultado.respuesta){
    case 0:
      alert("Proceso concluido satisfactoriamente!");
      onButtonClickPestania('CuentasIndividuales.CargaMasivaMovimientos.PrincipalCargaMasivaMovimientos','');
    break;
    case 1:alert("El Archivo ya existe!");break;
    case 2:alert("No se encontro el Delimitador de algunas cadenas!");break;
    case 3:alert("Existen mas columnas de las necesarias para realizar la carga!");break;
    case 4:alert("Clave Inversionista - El Inversionista (Clave Inversionista) no existe, proceda a crearlo!");break;
    case 5:alert("No existe Tasa de Operación para la fecha de carga!");break;
    case 6:alert("Clave Inversionista - No existe Saldo suficiente para realizar el retiro del Inversionista (Clave Inversionista!");break;
    default:
      alert("Ocurrió un error inesperado (oracle)!");
      var objDeleteParam = JSON.parse("{\"id\":\"delArcPla\"}");
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDeleteParam);
      makeAjaxRequest(url, "HTML", null, null);
    }
     procesoArchivoPlanoError();
  }else
    alert("Ocurrió un error inesperado!");
  GI("archivo").style.visibility = "hidden";  
  hideWaitLayer();
}

function showFrame() {
  displayFrame("dvMensajes", "frameUpload", ctxRoot + "/modules/CuentasIndividuales/CargaMasivaMovimientos/FileUpload.do", 200, 200, 100, 400, 0, 0);  
}

function frameSubmit(forma) {
  if(fvCargaMasiva.checkForm() && obtenerNombreArchivo(forma.flArchivo)){
    showWaitLayer();
    GI("frameUpload").onreadystatechange = hideFrame;
    forma.NombreArchivo.value = GI("NombreArchivo").value;
    forma.Fecha.value = GI("txtFechaContable").value;
    forma.submit();
    archivoSeleccionado = true;
    deshabilitaObjetos(GI("frmDatos"));
    GI("archivo").style.visibility = "visible";
    GI("archivo").value = GI("NombreArchivo").value;
    muestraObjs("cmdCargar,cmdLimpiar,divArchivo");
  }else{
    archivoSeleccionado = false;
  }
}

function hideFrame() { 
  GI("frameUpload").onreadystatechange = null;
  removeFrame("frameUpload");
  hideWaitLayer();
}


function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "txtFechaMovimientos",
    button         :    "txtFechaMovimientos",
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


function ejecutaborrartabla(){
  var objBorraCargaMasivaParam = JSON.parse("{\"id\":\"delCargaMasiva\"}");
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objBorraCargaMasivaParam);
    makeAjaxRequest(url, "HTML", null, null);
    borraTablaRepErrCuentasIndiv();
}

function cargaPantalla(){
 ejecutaborrartabla();
 onButtonClickPestania('CuentasIndividuales.CargaMasivaMovimientos.PrincipalCargaMasivaMovimientos','');
}


function procesoArchivoPlanoError() {
   //VERIFICAR SI EXISTEN REGISTROS EN LA TABLA REP_ERR_CUENTASINDIV
   var objQuerySelectCount = JSON.parse("{\"id\":\"verExistenDatosTbCtasInd\"}");
   var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objQuerySelectCount);
   //alert(url);
   makeAjaxRequest(url, "HTML", verificarRegistrosErrCtasIndiv, null);
}

function verificarRegistrosErrCtasIndiv(obj, result){
   //alert(result);
   var numRegistros=JSON.parse(result)[0]
   //INICIA LA VERIFICACION
   if(numRegistros.numreg!=0) {//si la tabla REP_ERR_CUENTASINDIV contiene registros, generar un archivo plano
    var nomArchivo= GI("NombreArchivo").value+"_ERROR";
    objArchivosPlanosParam.tipoId = 1;
    objArchivosPlanosParam.Archivo = nomArchivo;
    objArchivosPlanosParam.colData = "cadena";      
    delete objArchivosPlanosParam.id;
    objArchivosPlanosParam.queryId = "muestradatosErrorCtasIndiv";      
    objArchivosPlanosParam.fileName = nomArchivo;
    
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    hideWaitLayer();
   //borraTablaRepErrCuentasIndiv();
    //onButtonClickPestania('CuentasIndividuales.CargaMasivaMovimientos.PrincipalCargaMasivaMovimientos','');
   }
}

function borraTablaRepErrCuentasIndiv() {
    var objBorraRepErrCuentasIndiv = JSON.parse("{\"id\":\"delObjRepErrCuentasIndiv\"}");
    //alert(url);
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objBorraRepErrCuentasIndiv);
    makeAjaxRequest(url, "HTML", null, null);

}


//---------------------------------- FUNCIONOES PARA EL REEDIRECCIONAMIENTO --------------------------------------------------

function siguienteFuncionDiv(){
   alert("siguienteFuncionDiv");
   nextDivFunction(GI("invocaDiv2"));
}

function reedireccionar(){
   alert("reedireccionar");
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 
