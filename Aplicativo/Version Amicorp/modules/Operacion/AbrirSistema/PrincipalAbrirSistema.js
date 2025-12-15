showWaitLayer();
initForms();

function ejecutaAbrirCerrarSistema(){
  showWaitLayer();
  var objExisteRegistroParam = JSON.parse("{\"id\":\"verExiAbrCerSis\"}");
  objExisteRegistroParam.Dia = GI("txtFechaContable").value.split("/")[0];
  objExisteRegistroParam.Mes = GI("txtFechaContable").value.split("/")[1];
  objExisteRegistroParam.Ano = GI("txtFechaContable").value.split("/")[2];
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistroParam);
  makeAjaxRequest(url, "HTML", validaAbrirCerrarSistema, null);
}

function validaAbrirCerrarSistema(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    var objAbrirCerrarSistemaParam = JSON.parse("{\"id\":\"updAbrCerSis\"}");
    objAbrirCerrarSistemaParam.FinInicio = 1;
    objAbrirCerrarSistemaParam.FinCierre = 0;
    objAbrirCerrarSistemaParam.Ano = GI("txtFechaContable").value.split("/")[2];
    objAbrirCerrarSistemaParam.Mes = GI("txtFechaContable").value.split("/")[1];
    objAbrirCerrarSistemaParam.Dia = GI("txtFechaContable").value.split("/")[0];
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objAbrirCerrarSistemaParam);
    makeAjaxRequest(url, "HTML", recargaLeyendaAbrirCerrarSistema, null);
  }else{
    alert("No existe registro de control para el día!");
  }
  hideWaitLayer();
}
function recargaLeyendaAbrirCerrarSistema(obj, result){
  alert("Operación realizada exitosamente!");
  asignaEtiqueta("dvLeyenda","Día " + GI("txtFechaContable").value + " abierto");  
}