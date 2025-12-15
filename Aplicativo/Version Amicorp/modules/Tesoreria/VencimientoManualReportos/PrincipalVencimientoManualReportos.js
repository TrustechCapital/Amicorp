showWaitLayer();

var fncVencimientoManualReportosParam = JSON.parse("{\"id\":\"ejeFunVencimientoManualReportos\"}");
var fvVencimientoManualReportos = new FormValidator();

initForms();

fvVencimientoManualReportos.setup({
  formName      : "frmVencimientoManualReportos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function consultaMesAbierto(){
  verificaFecha(GI("txtFechaContable"));
  hideWaitLayer();
}
function ejecutaVencimientoManualReportos(){
  if(fvVencimientoManualReportos.checkForm()){
    showWaitLayer();
    var numUsuario = 683; //ALERTA: SE PUSIERON DE ESTA FORMA EN EL CODIGO YA QUE LOS PARAMETROS PARA FUNCIONES Y STORES DEBEN IR UNO A UNO ORDENADOS(NO ES COMO LOS QUERYS)
    fncVencimientoManualReportosParam.numFolio = eval(GI("txtFolio").value);
    fncVencimientoManualReportosParam.banContabiliza = (GI("chkNoAfectarContabilidad").checked)?0:1;
    fncVencimientoManualReportosParam.numUsuario = numUsuario;
    fncVencimientoManualReportosParam.banMesAbierto = eval(GI("txtMesAbierto").value);
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncVencimientoManualReportosParam);
    makeAjaxRequest(url, "HTML", validaVencimientoManualReportos, null);
  }
}

function validaVencimientoManualReportos(obj, result){
  var resultado = JSON.parse(result)[0];
  var folio = resultado;
  var numOperacion = 0;
  
  if(resultado.substring(0,2) == 10){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  else if(resultado.substring(0,1) == 0){
    numOperacion = resultado.split("-")[1];
    resultado = resultado.split("-")[0];
  }
  
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        alert("Proceso concluido satisfactoriamente con folio de operación: "+folio.substring(2,folio.length));
        onButtonClickPestania("Tesoreria.VencimientoManualReportos.PrincipalVencimientoManualReportos","");
      break;
      case 1:alert("Plazo erroneo!");break;
      case 2:alert("Plazo erroneo!");break;
      case 3:alert("Fecha de vencimiento feriada!");break;
      case 4:alert("No se grabó DATOVAL!");break;
      case 5:alert("No se grabó DETVALOR!");break;
      case 6:alert("No se contabilizó!");break;
      case 7:alert("El Reporto no se encuentra para el vencimiento!");break;
      case 8:alert("No se grabo DATOVAL en el vencimiento!");break;
      case 9:alert("No se grabó DETVALOR en el vencimiento!");break;
      case 10:alert("No existe la Operación " + numOperacion + " ó la Operación no tiene asignada Estructura Contable!");break;
      case 11:alert("No existe el Reporto!");break;
      default:alert("Ocurrió un error inesperado!");
    }
  }else
    alert("Ocurrió un error inesperado!");
  hideWaitLayer();
}