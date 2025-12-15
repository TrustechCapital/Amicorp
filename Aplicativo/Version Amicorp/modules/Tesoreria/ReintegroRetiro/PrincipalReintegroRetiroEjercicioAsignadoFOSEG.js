showWaitLayer();

var objSaldoParam;
var objReintegroRetiroParam = JSON.parse("{\"id\":\"ejeFunInvocaFOSEG\"}");
var fvReintegroRetiro = new FormValidator();
deshabilitaPK("txtSaldoEjercidoOrigen".split(","));

initForms();

fvReintegroRetiro.setup({
  formName      : "frmDatosReintegroRetiro",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function calculaSaldoEjercido(objRadio){
  if(isDefinedAndNotNull(objRadio)){
    asignaValueRadio2Master("rdAfectaSaldo",objRadio);
  }
  switch(GI("rdAfectaSaldo").value){
    case "2"://Ejercido
      SA(GI("txtSaldoEjercidoOrigen"),"ref","conSalRepEje");
    break
    case "1"://Asignado
      SA(GI("txtSaldoEjercidoOrigen"),"ref","conSalRepAsi");
    break;
    case "3"://Comprometido
      SA(GI("txtSaldoEjercidoOrigen"),"ref","conSalRepCom");
    break;
  }
  if(GI("cmbFideicomiso").value != "-1" && GI("txtEjercicio").value != "" && GI("cmbOrigenRecursos").value != "-1" && GI("rdAfectaSaldo").value != "" && GI("txtEjeOrigen").value != "" && GI("txtProgramaOrigen").value != "" && GI("txtProyectoOrigen").value != "" && GI("txtAccionOrigen").value != ""){
    showWaitLayer();
    objSaldoParam = JSON.parse("{" + generaParametros("Fideicomiso,Ejercicio,OrigenRecursos,Eje,Programa,Proyecto,Accion","cmbFideicomiso,txtEjercicio,cmbOrigenRecursos,txtEjeOrigen,txtProgramaOrigen,txtProyectoOrigen,txtAccionOrigen") + "}");
    loadElement(GI("txtSaldoEjercidoOrigen"));
  }
  if(GI("txtEjercicio").value != ""){
    if(eval(GI("txtEjercicio").value) < 1998 || eval(GI("txtEjercicio").value) > eval(GI("txtFechaContable").value.split("/")[2])){
      alert("Ejercicio Invalido!");
      GI("txtEjercicio").value = "";
      GI("txtEjercicio").focus();
    }
  }
}

function validaSaldos(){
  if(GI("txtSaldoEjercidoOrigen").value != "" && GI("txtImporte").value != ""){
    if(eval(GI("txtSaldoEjercidoOrigen").value) - eval(GI("txtImporte").value) < 0){
      alert("El Importe no debe ser mayor al Recurso Presupuestal " + ((GI("rdAfectaSaldo").value == 1)?"Asignado":((GI("rdAfectaSaldo").value == 2)?"Ejercido":"Comprometido")) + "!");
      GI("txtImporte").value = "";
      GI("txtImporte").focus();
    }
  }
  if(GI("txtSaldoEjercidoOrigen").value == ""){
    GI("txtSaldoEjercidoOrigen").value = "0";
  }
  if(eval(GI("txtImporte").value) == 0){
      alert("El Importe debe ser mayo a 0!");
      GI("txtImporte").value = "";
      GI("txtImporte").focus();
  }
  hideWaitLayer();
}
function ejecutaReintegroRetiro(){
  validaSaldos();
  if(fvReintegroRetiro.checkForm()){
    showWaitLayer();
    objReintegroRetiroParam.CtamOrigen = 7000;
    objReintegroRetiroParam.EjeOrigen = eval(GI("txtEjeOrigen").value);
    objReintegroRetiroParam.ProgramaOrigen = eval(GI("txtProgramaOrigen").value);
    objReintegroRetiroParam.ProyectoOrigen = eval(GI("txtProyectoOrigen").value);
    objReintegroRetiroParam.AccionOrigen = eval(GI("txtAccionOrigen").value);
    objReintegroRetiroParam.Nivel5Origen = 0;
    objReintegroRetiroParam.FideicomisoOrigen = eval(GI("cmbFideicomiso").value);
    objReintegroRetiroParam.EjercicioOrigen = eval(GI("txtEjercicio").value);
    objReintegroRetiroParam.OrigenRecursosOrigen = eval(GI("cmbOrigenRecursos").value);
    objReintegroRetiroParam.FechaOrigen = GI("txtFechaContable").value;
    objReintegroRetiroParam.ImporteOrigen = eval(GI("txtImporte").value);
    objReintegroRetiroParam.TipoImporteOrigen = eval(GI("rdAfectaSaldo").value);
    objReintegroRetiroParam.ComprometidoOrigen = "N";
    objReintegroRetiroParam.FolioOrigen = 0;
    objReintegroRetiroParam.StatusOrigen = "";
    objReintegroRetiroParam.AcuerdoOrigen = GI("txtConcepto").value;
    objReintegroRetiroParam.ConceptoOrigen = "Reintegro desde Tesoreria";
    objReintegroRetiroParam.UsuarioOrigen = "683";
    objReintegroRetiroParam.CtamDestino = 0;
    objReintegroRetiroParam.EjeDestino = 0;
    objReintegroRetiroParam.ProgramaDestino = 0;
    objReintegroRetiroParam.ProyectoDestino = 0;
    objReintegroRetiroParam.AccionDestino = 0;
    objReintegroRetiroParam.Nivel5Destino = 0;
    objReintegroRetiroParam.FideicomisoDestino = 0;
    objReintegroRetiroParam.EjercicioDestino = 0;
    objReintegroRetiroParam.OrigenRecursosDestino = 0;
    objReintegroRetiroParam.FechaDestino = "";
    objReintegroRetiroParam.ImporteDestino = 0;
    objReintegroRetiroParam.TipoImporteDestino = "";
    objReintegroRetiroParam.ComprometidoDestino = "";
    objReintegroRetiroParam.FolioDestino = 0;
    objReintegroRetiroParam.StatusDestino = "";
    objReintegroRetiroParam.AcuerdoDestino = "";
    objReintegroRetiroParam.ConceptoDestino = "";
    objReintegroRetiroParam.UsuarioDestino = "";
    objReintegroRetiroParam.Objeto = "REINTEGRO";
    objReintegroRetiroParam.TipoCambio = 1;
    objReintegroRetiroParam.Movimiento = 0;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objReintegroRetiroParam);
    makeAjaxRequest(url, "HTML", validaReintegroRetiro, null);
  }
}

function validaReintegroRetiro(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        alert("Proceso concluido satisfactoriamente!");
        onButtonClick("Tesoreria.ReintegroRetiro.PrincipalReintegroRetiroEjercicioAsignadoFOSEG","");
      break;
      default:alert("Ocurrió un error inesperado!");
    }
  }else
    alert("Ocurrió un error inesperado!");
  hideWaitLayer();
}