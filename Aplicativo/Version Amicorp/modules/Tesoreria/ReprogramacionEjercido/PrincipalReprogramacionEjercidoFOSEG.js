showWaitLayer();

var divNombreFideicomisoParam;
var objSaldoParam;
var objReprogramacionEjercidoParam = JSON.parse("{\"id\":\"ejeFunInvocaFOSEG\"}");
var fvReprogramacionEjercido = new FormValidator();
deshabilitaPK("txtSaldoEjercicioOrigen,txtSaldoEjercicioDestino".split(","));

initForms();

fvReprogramacionEjercido.setup({
  formName      : "frmDatosReprogramacionEjercido",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function calculaSaldoEjercido(opc){
  switch(opc){
    case "Origen":
      if(GI("txtFideicomiso").value != "" && GI("txtEjercicio").value != "" && GI("cmbOrigenRecursos").value != "-1" && GI("txtEjeOrigen").value != "" && GI("txtProgramaOrigen").value != "" && GI("txtProyectoOrigen").value != "" && GI("txtAccionOrigen").value != ""){
        showWaitLayer();
        objSaldoParam = JSON.parse("{" + generaParametros("Fideicomiso,Ejercicio,OrigenRecursos,Eje,Programa,Proyecto,Accion","txtFideicomiso,txtEjercicio,cmbOrigenRecursos,txtEjeOrigen,txtProgramaOrigen,txtProyectoOrigen,txtAccionOrigen") + "}");
        loadElement(GI("txtSaldoEjercicioOrigen"));
      }
    break;
    case "Destino":
      if(GI("txtFideicomiso").value != "" && GI("txtEjercicio").value != "" && GI("cmbOrigenRecursos").value != "" && GI("txtEjeDestino").value != "" && GI("txtProgramaDestino").value != "" && GI("txtProyectoDestino").value != "" && GI("txtAccionDestino").value != ""){
        showWaitLayer();
        objSaldoParam = JSON.parse("{" + generaParametros("Fideicomiso,Ejercicio,OrigenRecursos,Eje,Programa,Proyecto,Accion","txtFideicomiso,txtEjercicio,cmbOrigenRecursos,txtEjeDestino,txtProgramaDestino,txtProyectoDestino,txtAccionDestino") + "}");
        loadElement(GI("txtSaldoEjercicioDestino"));
      }
    break;
  }
}
function auxCalculaSaldoEjercido(){
  calculaSaldoEjercido('Origen');
  calculaSaldoEjercido('Destino');
}
function validaSaldos(){
  if(GI("txtSaldoEjercicioOrigen").value != "" && GI("txtImporteTransferir").value != ""){
    if(eval(GI("txtSaldoEjercicioOrigen").value) < eval(GI("txtImporteTransferir").value)){
      alert("El Importe a Reprogramar es mayor al Recurso Presupuestal Origen!");
      GI("txtImporteTransferir").value = "";
      GI("txtImporteTransferir").focus();
    }
  }
  if(GI("txtSaldoEjercicioOrigen").value == ""){
    GI("txtSaldoEjercicioOrigen").value = "0";
  }
  if(GI("txtSaldoEjercicioDestino").value == ""){
    GI("txtSaldoEjercicioDestino").value = "0";
  }
  if(eval(GI("txtImporteTransferir").value) == 0){
      alert("El Importe a Reprogramar debe ser mayo a 0!");
      GI("txtImporteTransferir").value = "";
      GI("txtImporteTransferir").focus();
  }
  hideWaitLayer();
}
function ejecutaReprogramacionEjercido(){
  validaSaldos();
  if(fvReprogramacionEjercido.checkForm()){
    showWaitLayer();
    objReprogramacionEjercidoParam.CtamOrigen = 7000;
    objReprogramacionEjercidoParam.EjeOrigen = eval(GI("txtEjeOrigen").value);
    objReprogramacionEjercidoParam.ProgramaOrigen = eval(GI("txtProgramaOrigen").value);
    objReprogramacionEjercidoParam.ProyectoOrigen = eval(GI("txtProyectoOrigen").value);
    objReprogramacionEjercidoParam.AccionOrigen = eval(GI("txtAccionOrigen").value);
    objReprogramacionEjercidoParam.Nivel5Origen = 0;
    objReprogramacionEjercidoParam.FideicomisoOrigen = eval(GI("txtFideicomiso").value);
    objReprogramacionEjercidoParam.EjercicioOrigen = eval(GI("txtEjercicio").value);
    objReprogramacionEjercidoParam.OrigenRecursosOrigen = eval(GI("cmbOrigenRecursos").value);
    objReprogramacionEjercidoParam.FechaOrigen = GI("txtFechaContable").value;
    objReprogramacionEjercidoParam.ImporteOrigen = eval(GI("txtImporteTransferir").value);
    objReprogramacionEjercidoParam.TipoImporteOrigen = 2;
    objReprogramacionEjercidoParam.ComprometidoOrigen = "N";
    objReprogramacionEjercidoParam.FolioOrigen = 0;
    objReprogramacionEjercidoParam.StatusOrigen = "ACTIVO";
    objReprogramacionEjercidoParam.AcuerdoOrigen = "";
    objReprogramacionEjercidoParam.ConceptoOrigen = "Reprogramacion Origen";
    objReprogramacionEjercidoParam.UsuarioOrigen = "683";
    objReprogramacionEjercidoParam.CtamDestino = 7000;
    objReprogramacionEjercidoParam.EjeDestino = eval(GI("txtEjeDestino").value);
    objReprogramacionEjercidoParam.ProgramaDestino = eval(GI("txtProgramaDestino").value);
    objReprogramacionEjercidoParam.ProyectoDestino = eval(GI("txtProyectoDestino").value);
    objReprogramacionEjercidoParam.AccionDestino = eval(GI("txtAccionDestino").value);
    objReprogramacionEjercidoParam.Nivel5Destino = 0;
    objReprogramacionEjercidoParam.FideicomisoDestino = eval(GI("txtFideicomiso").value);
    objReprogramacionEjercidoParam.EjercicioDestino = eval(GI("txtEjercicio").value);
    objReprogramacionEjercidoParam.OrigenRecursosDestino = eval(GI("cmbOrigenRecursos").value);
    objReprogramacionEjercidoParam.FechaDestino = GI("txtFechaContable").value;
    objReprogramacionEjercidoParam.ImporteDestino = eval(GI("txtImporteTransferir").value);
    objReprogramacionEjercidoParam.TipoImporteDestino = 2;
    objReprogramacionEjercidoParam.ComprometidoDestino = "N";
    objReprogramacionEjercidoParam.FolioDestino = 0;
    objReprogramacionEjercidoParam.StatusDestino = "ACTIVO";
    objReprogramacionEjercidoParam.AcuerdoDestino = "";
    objReprogramacionEjercidoParam.ConceptoDestino = "Reprogramacion Destino";
    objReprogramacionEjercidoParam.UsuarioDestino = "683";
    objReprogramacionEjercidoParam.Objeto = "REPROGRAMACION";
    objReprogramacionEjercidoParam.TipoCambio = 1;
    objReprogramacionEjercidoParam.Movimiento = 0;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objReprogramacionEjercidoParam);
    makeAjaxRequest(url, "HTML", validaReprogramacionEjercido, null);
  }
}

function validaReprogramacionEjercido(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    switch(eval(resultado)){
      case 0:
        alert("Proceso concluido satisfactoriamente!");
        onButtonClick('Tesoreria.ReprogramacionEjercido.PrincipalReprogramacionEjercidoFOSEG','');
      break;
      default:alert("Ocurrió un error inesperado!");
    }
  }else
    alert("Ocurrió un error inesperado!");
  hideWaitLayer();
}