showWaitLayer();

var objReestructuracionSaldosParam = JSON.parse("{\"id\":\"ejeStoReestructuraSaldosFOSEG\"}");
var fvReestructuracionSaldos = new FormValidator();

initForms();

fvReestructuracionSaldos.setup({
  formName      : "frmDatosReestructuracionSaldos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function ejecutaReestructuracionSaldos(){
  if(fvReestructuracionSaldos.checkForm()){
    showWaitLayer();
    objReestructuracionSaldosParam.FideicomisoOrigen = eval(GI("cmbFideicomiso").value);
    objReestructuracionSaldosParam.EjercicioOrigen = eval(GI("txtEjercicio").value);
    objReestructuracionSaldosParam.UsuarioOrigen = 683;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objReestructuracionSaldosParam);
    makeAjaxRequest(url, "HTML", validaReestructuracionSaldos, null);
  }
}

function validaReestructuracionSaldos(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    alert("Ocurrió un error inesperado!");
  }else{
    alert("Proceso concluido satisfactoriamente!");
    onButtonClick('Tesoreria.ReestructuracionSaldos.PrincipalReestructuracionSaldosFOSEG','');
  }
  hideWaitLayer();
}