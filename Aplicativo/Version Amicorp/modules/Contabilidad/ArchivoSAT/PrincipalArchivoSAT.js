showWaitLayer();
var fncArchivoSAT = JSON.parse("{\"id\":\"ejeFunGeneraArchivoSAT\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var cmbEjercicioParam = JSON.parse("{}");

var fvCat = new FormValidator();

initForms();

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function asignaAnoMovimiento(obj, result){
  var resultado = JSON.parse(result)[0];
  fncArchivoSAT.Fecha = resultado.fecha;
  obj.value = resultado.fecha.split("/")[2];
  cmbEjercicioParam.Ano = obj.value;
  SA(GI("cmbEjercicio"),"ref","conEjeArcSAT");
  loadElement(GI("cmbEjercicio"));
  formsLoaded();
}
function asignaValueRadio2MasterX(strRadioMaster,objRadioActual){
  asignaValueRadio2Master(strRadioMaster,objRadioActual);
  RA(GI("txtSeparador"),"required");
  limpiaTxts("txtSeparador");
  ocultaObj("txtSeparador");
}
function ejecutaOperacionArchivoSAT(){
  if(fvCat.checkForm()){
    showWaitLayer();
    fncArchivoSAT.Ejercicio = eval(GI("cmbEjercicio").value);
    fncArchivoSAT.Tipo = eval(GI("rdTipoArchivo").value);
    fncArchivoSAT.Separador = GI("rdSeparador").value;
    fncArchivoSAT.NombreArchivo = "ARCHIVO_SAT_" + fncArchivoSAT.Fecha;
    fncArchivoSAT.Fecha = fncArchivoSAT.Fecha;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncArchivoSAT);
    makeAjaxRequest(url, "HTML", validaOperacionArchivoSAT, fncArchivoSAT.NombreArchivo);
  }
}

function validaOperacionArchivoSAT(obj, result){
  var objResultado = JSON.parse(result);
  if(isDefinedAndNotNull(objResultado.resultado)){
    switch(eval(objResultado.resultado)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParam.fileName = fncArchivoSAT.NombreArchivo + ".txt";
        objArchivosPlanosParam.tipoId = 1;
        objArchivosPlanosParam.queryId = "conArcPla";
        objArchivosPlanosParam.colData = "arpDescripcion";
        objArchivosPlanosParam.nomArchivo = obj; 
        var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
        var liga = GI("ligaArchivo");
        liga.href = url;
        liga.click();
        alert("Proceso concluido satisfactoriamente!");
        onButtonClickPestania('Contabilidad.ArchivoSAT.PrincipalArchivoSAT','');
      break;
      default:alert("Ocurrió un error inesperado (oracle)!");
    }
  }else
    alert("Ocurrió un error inesperado!");
  hideWaitLayer();
}