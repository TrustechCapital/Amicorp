showWaitLayer();
deshabilitaPK("txtFechaAnterior,txtFechaContable".split(","));
var fncArchivosParam = JSON.parse("{\"id\":\"ejeFunGeneraArchivosDepLiq\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");

var fvArchivo = new FormValidator();

initForms();

fvArchivo.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
function asignaFechaValor(){
  dvFechaParam.Fecha = GI("txtFechaContable").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(dvFechaParam);
  makeAjaxRequest(url, "HTML", asignaFechaAnterior, null);
}
function asignaFechaAnterior(obj, result){
  var resultado = JSON.parse(result)[0];
  GI("txtFechaAnterior").value = resultado;
  formsLoaded();
}
function validaHora(objTxtHoraMinuto){
  if(objTxtHoraMinuto.value != ""){
    if(objTxtHoraMinuto.value.split(":").length < 2 || objTxtHoraMinuto.value.split(":")[0] == "" || objTxtHoraMinuto.value.split(":")[1] == ""){
      alert("El formato de la Hora debe ser hh24:mm59!");
      objTxtHoraMinuto.focus();
      return;
    }
    var hora = eval(objTxtHoraMinuto.value.split(":")[0]);
    var minuto = eval(objTxtHoraMinuto.value.split(":")[1]);
    if(hora > 24){
      alert("El formato de la Hora debe ser hh24!");
      objTxtHoraMinuto.focus();
      return;
    }
    if(minuto > 59){
      alert("El formato de los minutos debe ser mm59!");
      objTxtHoraMinuto.focus();
      return;
    }
  }
}
function validaHoras(){
  var a11 = (GI("txtDeFechaAnterior").value.split(":")[0].length<2?"0":"") + GI("txtDeFechaAnterior").value.split(":")[0];
  var a12 = (GI("txtDeFechaAnterior").value.split(":")[1].length<2?"0":"") + GI("txtDeFechaAnterior").value.split(":")[1];
  var a21 = (GI("txtAFechaAnterior").value.split(":")[0].length<2?"0":"") + GI("txtAFechaAnterior").value.split(":")[0];
  var a22 = (GI("txtAFechaAnterior").value.split(":")[1].length<2?"0":"") + GI("txtAFechaAnterior").value.split(":")[1];
  var b11 = (GI("txtDeFechaContable").value.split(":")[0].length<2?"0":"") + GI("txtDeFechaContable").value.split(":")[0];
  var b12 = (GI("txtDeFechaContable").value.split(":")[1].length<2?"0":"") + GI("txtDeFechaContable").value.split(":")[1];
  var b21 = (GI("txtAFechaContable").value.split(":")[0].length<2?"0":"") + GI("txtAFechaContable").value.split(":")[0];
  var b22 = (GI("txtAFechaContable").value.split(":")[1].length<2?"0":"") + GI("txtAFechaContable").value.split(":")[1];
  var hora1De = eval("\"" + a11 + a12 + "\"");
  var hora1A =  eval("\"" + a21 + a22 + "\"");
  var hora2De = eval("\"" + b11 + b12 + "\"");
  var hora2A = eval("\"" + b21 + b22 + "\"");
  if(hora1De  >  hora1A){
    alert("Verifique las horas!");
    GI("txtDeFechaAnterior").focus();
    return false;
  }
  if(hora2De  >  hora2A){
    alert("Verifique las horas!");
    GI("txtDeFechaContable").focus();
    return false;
  }
  if(hora1De == hora1A){
    alert("Verifique las horas!");
    GI("txtDeFechaAnterior").focus();
    return false;
  }
  if(hora2De == hora2A){
    alert("Verifique las horas!");
    GI("txtAFechaContable").focus();
    return false;
  }
  return true;
}
function ejecutaFuncionArchivosRetiros(){
  if(fvArchivo.checkForm() && validaHoras()){
    showWaitLayer();
    fncArchivosParam.Fecha = GI("txtFechaContable").value;
    fncArchivosParam.Opc1 = GI("rdArchivo1").checked?1:0;
    fncArchivosParam.Opc2 = GI("rdArchivo2").checked?1:0;
    fncArchivosParam.Opc3 = GI("rdArchivo3").checked?1:0;
    fncArchivosParam.Opc4 = GI("rdArchivo4").checked?1:0;
    fncArchivosParam.Opc5 = GI("rdArchivo5").checked?1:0;
    fncArchivosParam.TipoArchivo = 2;
    fncArchivosParam.Estado = eval(GI("rdEstadoDeposito1").value);
    fncArchivosParam.HoraInicioAnterior = GI("txtDeFechaAnterior").value;
    fncArchivosParam.HoraFinAnterior = GI("txtAFechaAnterior").value;
    fncArchivosParam.HoraInicioActual = GI("txtDeFechaContable").value;
    fncArchivosParam.HoraFinActual = GI("txtAFechaContable").value;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncArchivosParam);
    makeAjaxRequest(url, "HTML", validaFuncionArchivosRetiros, null);
    hideWaitLayer();
  }
}

function validaFuncionArchivosRetiros(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParam.tipoId = 1;
        objArchivosPlanosParam.Archivo = "FIDUCIATEF" + GI("txtFechaContable").value.split("/")[2] + GI("txtFechaContable").value.split("/")[1] + GI("txtFechaContable").value.split("/")[0];
        objArchivosPlanosParam.colData = "arpDescripcion";
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParam);
        makeAjaxRequest(url, "HTML", sugerirNombreArchivo, null);
      break;
      case 1:alert("Existen errores al generar el archivo!");break;
      default:alert("Ocurrió un error inesperado (oracle)!");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}
function sugerirNombreArchivo(obj , result){
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
    onButtonClickPestania('Tesoreria.ArchivosRetiros.PrincipalArchivosRetiros','');
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}