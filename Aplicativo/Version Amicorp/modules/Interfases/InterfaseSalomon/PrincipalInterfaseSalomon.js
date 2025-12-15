showWaitLayer();

var fncInterfase = JSON.parse("{\"id\":\"storeGenArchInterfazContable\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPlaConta\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");
var clavesCombo800 = JSON.parse("{\"llaveClave\":800,\"orderDescripcion\":\"s\"}");
var fvInterfase = new FormValidator();
var fechaDefault = new Date();

initForms();

loadElement(GI('cmbInterfase'));

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

deshabilitaCampos('txtFechaInicio,txtFechaFin');

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
Calendar.setup({
    inputField     :    "txtFechaInicio",
    button         :    "txtFechaInicio",
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
Calendar.setup({
    inputField     :    "txtFechaFin",
    button         :    "txtFechaFin",
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
function ejecutaStoreInterfase(){
   var valProceso = 0;;
  //if(fvInterfase.checkForm()){
    showWaitLayer();
    
    /*var valOpc;
    if(GI("chkDiario").checked)
       valOpc=1;
    if(GI("chkMensual").checked)
       valOpc=2;
     
    if(GI("chkFideicomisos").checked)
       valProceso=1;
    if(GI("chkHonorarios").checked)
       valProceso=2;
    */
    
    fncInterfase.Interfase = GI("cmbInterfase").value;
    fncInterfase.FechaValor = GI("txtFechaValor").value;
    fncInterfase.NomArch = "FI"+GI("txtFechaValor").value.split("/")[1]+GI("txtFechaValor").value.split("/")[0]+GI("txtFechaValor").value.split("/")[2]; //GI("txtNomArch").value;
    //fncInterfase.Opc = valOpc;
    fncInterfase.Proceso = valProceso;
    fncInterfase.Folio = GI('txtFolioPoliza').value;
    
    fncInterfase.FechaInicio = GI("txtFechaInicio").value;
    fncInterfase.FechaFin = GI("txtFechaFin").value;
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
    
    if(fncInterfase.Interfase==1)// 
      makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
    else 
      makeAjaxRequest(url, "HTML", generaArchivoIngresosEgresos, null);
  //}
}

function validaStoreInterfase(obj, result)
{

  var res = JSON.parse(result).RESULTADO;
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParam.tipoId = 1;
        //objArchivosPlanosParam.Archivo = "FIDUCIATEF" + GI("txtFechaValor").value.split("/")[2] + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0];
        objArchivosPlanosParam.nomArchivo = "FI" + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0] + GI("txtFechaValor").value.split("/")[2];
        objArchivosPlanosParam.colData = "arpDescripcion";
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParam);
        
        makeAjaxRequest(url, "HTML", sugerirNombreArchivoInterfase, null);    
      break;
      case 1:alert("Existen errores al generar el archivo!");break;
      case 5:alert("No Existen movimientos!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}
function sugerirNombreArchivoInterfase(obj , result){
  
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    alert("Se le sugiere coloque el siguiente nombre " + GI("txtNomArch").value + ".txt para el archivo generado!");
    delete objArchivosPlanosParam.id;
    objArchivosPlanosParam.queryId = "conArcPlaConta";
    //objArchivosPlanosParam.Fecha = GI("txtFechaValor").value;
    objArchivosPlanosParam.order = "\"s\"";
    objArchivosPlanosParam.fileName = "FI"+GI("txtFechaValor").value.split("/")[1]+GI("txtFechaValor").value.split("/")[0]+GI("txtFechaValor").value.split("/")[2];//resultado.arpNomArchivo + ".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    //ObtenReporte();
    onButtonClickPestania('Interfases.InterfaseSalomon.PrincipalInterfaseSalomon','');
    
  }else
    alert("No se ha generado ningún registro");
  hideWaitLayer();
}

function ponerNombreArchivo(){
    GI("txtNomArch").value="FI"+GI("txtFechaValor").value.split("/")[1]+GI("txtFechaValor").value.split("/")[0]+GI("txtFechaValor").value.split("/")[2]; 
}



//-------------------------------------------------codigo para nuevos reportes

function ObtenReporte() {
 
 
    var cadenota='{"Estructura":"1","sendToJSP":"true","urlReporte":"/modules/Interfases/InterfaseSalomon/ReportePolizaSalomon.jsp","Order":"s","id":"getRepPosicionSalomon"}'
    var url = ctxRoot + "/imprimirReporte.do?json=" + cadenota;
    var link = GI('linkReporteNew');
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();
  
}


// ARCHIVOS INGRESOS Y EGRESOS

var fecNomArchivo = "";
var countArchivo = 0;

function generaArchivoIngresosEgresos(obj, result)
{
  var res = JSON.parse(result).RESULTADO;
  if(isDefinedAndNotNull(res))
  {
    switch(eval(res))
    {
      case 0:
        fecNomArchivo = GI("txtFechaValor").value.split("/")[2] + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0];
        countArchivo = 0;
        
        generaArchivo('INGRESOS');
        break;
      case 5:alert("No Existen movimientos!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}

function generaArchivo(cveArchivo)
{
  showWaitLayer();
  
  objArchivosPlanosParam.tipoId = 1;
  objArchivosPlanosParam.id = "conArcPlaConta";
  
  objArchivosPlanosParam.nomArchivo = cveArchivo + fecNomArchivo;
  objArchivosPlanosParam.colData = "arpDescripcion";
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParam);
  
  makeAjaxRequest(url, "HTML", generaArchivoRes, cveArchivo);         
}

function generaArchivoRes(cveArchivo , result)
{
  var resultado = JSON.parse(result)[0];
  var bresultado = isDefinedAndNotNull(resultado);
  
  if(bresultado)
  {
    alert("Se le sugiere coloque el siguiente nombre " + objArchivosPlanosParam.nomArchivo + ".txt para el archivo generado!");
    delete objArchivosPlanosParam.id;
    objArchivosPlanosParam.queryId = "conArcPlaConta";
    objArchivosPlanosParam.order = "\"s\"";
    objArchivosPlanosParam.fileName = cveArchivo + fecNomArchivo;
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    
    var liga = GI("linkReporte"+cveArchivo);
    liga.href = url;
    liga.click();
    countArchivo++;
  }
  
  if(cveArchivo=='EGRESOS') 
  {
    if(countArchivo==0)
      alert("No se ha generado ningún registro");
    else
      onButtonClickPestania('Interfases.InterfaseSalomon.PrincipalInterfaseSalomon','');
  }
  else
  {
    generaArchivo('EGRESOS');
  }
    
  hideWaitLayer();
}


// periodo honorarios

function habilitaPeriodo(chkHono)
{
  if(chkHono.checked)
  {
    habilitaCampos('txtFechaInicio,txtFechaFin');
  }
  else
  {
    deshabilitaCampos('txtFechaInicio,txtFechaFin');
  }
  
}