var fvGarLiq = new FormValidator();

fvGarLiq.setup({
  formName      : "frmGarLiq",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function verificacionActivo() {
  if(GI("paramFideicomiso").value != "") {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":" + GI("paramFideicomiso").value + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", funcionVerificacionActivo, null);
  }else
    asignaEtiqueta("nomFideicomiso","");
}

function funcionVerificacionActivo(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("paramFideicomiso").value="";
    asignaEtiqueta("nomFideicomiso","");
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
}

var fechaDefault = new Date();

function setFechaCal() {
  //alert("se actualizo la fecha");
}

function isValidDate(date) { 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});                   

function cambiaPantallaGarLiq(obj, result) {
  obj.innerHTML = result;
  SA(GI("paramFecha"), "readonly", "true");
  hideWaitLayer();
}

function fileUploaded() {  
  var objInterface = GI("dvInterface");
  var url = ctxRoot + "/modules/Tesoreria/Interfaces/TasAplicar.do";
  
  GI("frameUpload").onreadystatechange = function() {};
  hide("frameUpload");
  removeFrame("frameUpload");
  
  makeAjaxRequest(url, "HTML", cambiaPantallaGarLiq, objInterface);
}

function frameSubmit(forma) {
  if(fvGarLiq.checkForm())
  {
    //GI("frameUpload").onreadystatechange = fileUploaded;
    
    forma.document.getElementById("fiso").value = GI("paramFideicomiso").value;
    forma.document.getElementById("tipo").value = GI("paramTipo").value;
    forma.document.getElementById("fecha").value = GI("paramFecha").value;
    forma.document.getElementById("separador").value = GI("paramSeparador").value;
    
    if(forma.document.getElementById("fileTest").value!='')
      forma.submit();
    else
      alert("Seleccione Archivo");
    //showWaitLayer();
  }  
}

//displayFrame(containerId, frameId, frameSrc, height, width, parentHeight, parentWidth, top, left) {
function cargaFrame() {
  displayFrame("dvFileUpload", "frameUpload", ctxRoot + "/modules/Administracion/GarantiasLiquidas/CargaMasiva/GarantiasLiquidasUpload.do", 200, 300, 100, 500, -50, -100);
}

function aplicarTas() {
  showWaitLayer();
  GI("paramFechaAnt").value = GI("paramFecha").value;
  var parametrosTAS = getParameters(GI("frmTas"));
  parametrosTAS.id = "exeTAS"
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(parametrosTAS);
  makeAjaxRequest(url, "HTML", imprimeResultado, null);
  setTimeout("VeriificaEstado()", 3000);
}

function VeriificaEstado() {
}

function imprimeResultado(obj, result) {
  alert("Se ha ejecutado la aplicacion de forma correcta!");
  hideWaitLayer();
}

//cargaFrame();