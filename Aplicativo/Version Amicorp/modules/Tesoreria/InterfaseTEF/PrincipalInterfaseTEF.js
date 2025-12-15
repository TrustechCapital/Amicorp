showWaitLayer();

var fncInterfaseTEFParam = JSON.parse("{\"id\":\"ejeFunGeneraArchivosTEF\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");
var fvInterfaseTEF = new FormValidator();
var fechaDefault = new Date();

initForms();

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

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

fvInterfaseTEF.setup({
  formName      : "frmDatosInterfaseTEF",
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
  asignaEtiqueta("dvFechaAnterior"," " + resultado + " de las 12:31 a las 23:59 hrs");
  asignaEtiqueta("dvFechaValor"," " + GI("txtFechaValor").value + " de las 00:00 a las 12:30 hrs");
  formsLoaded();
}
function ejecutaStoreInterfaseTEF(){
  if(fvInterfaseTEF.checkForm()){
    showWaitLayer();
    fncInterfaseTEFParam.FechaValor = GI("txtFechaValor").value;
    fncInterfaseTEFParam.Opc1 = eval(GI("chkFechaRecepcion1").checked?1:0);
    fncInterfaseTEFParam.Opc2 = eval(GI("chkFechaRecepcion2").checked?1:0);
    fncInterfaseTEFParam.Opc3 = eval(GI("chkFechaRecepcion3").checked?1:0);
    fncInterfaseTEFParam.TipoInterfase = 1;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfaseTEFParam);
    makeAjaxRequest(url, "HTML", validaStoreInterfaseTEF, null);
  }
}

function validaStoreInterfaseTEF(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParam.tipoId = 1;
        objArchivosPlanosParam.Archivo = "FIDUCIATEF" + GI("txtFechaValor").value.split("/")[2] + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0];
        objArchivosPlanosParam.colData = "arpDescripcion";
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParam);
        makeAjaxRequest(url, "HTML", sugerirNombreArchivoInterfaseTEF, null);    
      break;
      case 1:alert("Existen errores al generar el archivo!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}
function sugerirNombreArchivoInterfaseTEF(obj , result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    alert("Se le sugiere coloque el siguiente nombre " + resultado.arpNomArchivo + ".txt para el archivo generado!");
    delete objArchivosPlanosParam.id;
    objArchivosPlanosParam.queryId = "conArcPla";
    objArchivosPlanosParam.fileName = resultado.arpNomArchivo + ".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    onButtonClick('Tesoreria.InterfaseTEF.PrincipalInterfaseTEF','');
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}