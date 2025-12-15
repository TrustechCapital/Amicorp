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

function cambiaPantallaTAS(obj, result) {
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
  
  makeAjaxRequest(url, "HTML", cambiaPantallaTAS, objInterface);
}

function frameSubmit(forma) {
  //if(fv.checkFrom())
  GI("frameUpload").onreadystatechange = fileUploaded;
  forma.document.getElementById("fechaTas").value = GI("paramFecha").value;
  forma.submit();
  showWaitLayer();
}

//displayFrame(containerId, frameId, frameSrc, height, width, parentHeight, parentWidth, top, left) {
function cargaFrame() {
  displayFrame("dvFileUpload", "frameUpload", ctxRoot + "/modules/Tesoreria/Interfaces/TasUpload.do", 200, 300, 100, 500, -50, -100);
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