showWaitLayer();
initForms();

var mesAnt;
var anoAnt;
var mesAbierto;
var objAnoMesParam;
var existeRegistroMesFideicomiso = true;
var fvCierre = new FormValidator();

fvCierre.setup({
  formName      : "frmDatosCierre",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function consultaMesAbierto(){
  mesAnt = eval(GI("txtFechaContable").value.split("/")[1]);
  anoAnt = eval(GI("txtFechaContable").value.split("/")[2]);
  if(mesAnt == 1){
    mesAnt = 12;
    anoAnt -= 1;
  }else{
    mesAnt -= 1;
  }
  objAnoMesParam = JSON.parse("{\"Ano\":" + anoAnt + ",\"Mes\":" + mesAnt + "}");
  SA(GI("txtFechaContable"),"ref","conStaMesCon");
  SA(GI("txtFechaContable"),"fun","validaMesAbierto");
  SA(GI("txtFechaContable"),"param","objAnoMesParam");
  loadElement(GI("txtFechaContable"));
}

function validaMesAbierto(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    if(resultado.mesAbierto == 0){
      asignaEtiqueta("divMesAbierto","El mes anterior se encuentra Cerrado");
      GI("cmdModificar").disabled = true;
    }
  }
  formsLoaded();
}

function consultaStatusMesContableFideicomiso(objCombo){
  alert(objCombo);
  if(objCombo.selectedIndex != 0){
    showWaitLayer();
    mesAnt = eval(GI("txtFechaContable").value.split("/")[1]);
      anoAnt = eval(GI("txtFechaContable").value.split("/")[2]);
      if(mesAnt == 1){
        mesAnt = 12;
        anoAnt -= 1;
      }else{
        mesAnt -= 1;
      }    
    objAnoMesParam.Fideicomiso = eval(objCombo.value);
    objAnoMesParam.Ano=anoAnt;
    objAnoMesParam.Mes=mesAnt;
    SA(GI("txtFechaContable"),"ref","conStaMesConFid");
    SA(GI("txtFechaContable"),"fun","validaMesAbiertoFideicomiso");
    SA(GI("txtFechaContable"),"param","objAnoMesParam");
    loadElement(GI("txtFechaContable"));
  }
}

function validaMesAbiertoFideicomiso(obj, result){
alert("resultado:"+result);
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    if(resultado.mesAbierto == 0){
      GI("rdStatusAbierto").checked = true;
      GI("rdStatusAbierto").value = 1;
    }else{
      GI("rdStatusCerrado").checked = true;
      GI("rdStatusAbierto").value = 0;
    }
    existeRegistroMesFideicomiso = true;
  }else{
    GI("rdStatusAbierto").checked = false;
    GI("rdStatusCerrado").checked = false;
    existeRegistroMesFideicomiso = false
  }
  SA(GI("rdStatusAbierto"),"required","true");
  formsLoaded();
}
function activaCampos(){
  GI("rdStatusAbierto").disabled = false;
  GI("rdStatusCerrado").disabled = false;
  muestraObj("cmdAceptar");
}



function cierreContableMesAnterior(){
  if(fvCierre.checkForm()){
    showWaitLayer();
    mesAbierto = GI("rdStatusAbierto").value;
    var fechaUltMod = "\"" + GI("txtFechaContable").value + "\"";
    var fideicomiso = GI("cmbFideicomiso").value;
    if(existeRegistroMesFideicomiso){
      var url = ctxRoot + "/doRef.do?json={\"id\":\"updCieMesAntFid\",\"MesAbierto\":" + mesAbierto + ",\"FechaUltMod\":" + fechaUltMod + ",\"AnoAnt\":" + anoAnt + ",\"MesAnt\":" + mesAnt + ",\"Fideicomiso\":" + fideicomiso +"}";
      makeAjaxRequest(url, "HTML", validaCierreContable, null);
    }else{
      var url = ctxRoot + "/doRef.do?json={\"id\":\"insCieMesAntFid\",\"Fideicomiso\":" + fideicomiso + ",\"MesAnt\":" + mesAnt + ",\"AnoAnt\":" + anoAnt + ",\"MesAbierto\":" + mesAbierto + ",\"FechaAlta\":" + fechaUltMod + ",\"FechaUltMod\":" + fechaUltMod + "}";
      makeAjaxRequest(url, "HTML", validaCierreContable, null);
    }
  }
}

function validaCierreContable(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado.tipo == "SUCCESS"){
      if(mesAbierto == 1)
        alert("Se bloquearón los permisos del mes anterior para el fideicomiso " + GI("cmbFideicomiso").value);
      else
        alert("Se habilitarón los permisos del mes anterior para el fideicomiso " + GI("cmbFideicomiso").value);
    }else
      alert("No fue posible realizar la operación");
  }
  onButtonClickPestania('Contabilidad.CierreContableMesAnterior.PrincipalCierreContableMesAnteriorFideicomiso','');
  hideWaitLayer();
}