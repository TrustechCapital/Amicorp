showWaitLayer();

var fvPresupuestoInicial = new FormValidator();
var objCuentaFOSEGParam = JSON.parse("{\"id\":\"conNomCueFOSEG\"}");
var catMovimifoseg = JSON.parse("{\"id\":\"insMovFOSEG\"}");
deshabilitaPK("Ano".split(","));
initForms();

fvPresupuestoInicial.setup({
  formName      : "frmDatosPresupuestoInicialFOSEG",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  RF(objForma);
}
function asignaAnoPresupuestal(){
  GI("Ano").value = GI("txtFechaContable").value.split("/")[2];
  formsLoaded();
}
function verificaCuentaFOSEG(objTxt){
  if(eval(objTxt.value) == 0){
    alert("Introduzca un valor mayor a 0!");
    objTxt.value = "";
    objTxt.focus();
  }
  if(GI("Eje").value != "" && GI("Programa").value != "" && GI("Proyecto").value != "" && GI("Accion").value != ""){
    showWaitLayer();
    objCuentaFOSEGParam.Eje = eval(GI("Eje").value);
    objCuentaFOSEGParam.Programa = eval(GI("Programa").value);
    objCuentaFOSEGParam.Proyecto = eval(GI("Proyecto").value);
    objCuentaFOSEGParam.Accion = eval(GI("Accion").value);
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCuentaFOSEGParam);
    makeAjaxRequest(url, "HTML", asignaValor2DivCuentaFOSEG, GI("nomCuenta"));
  }
}

function asignaValor2DivCuentaFOSEG(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.innerHTML = objeto.nombre;
  }else{
    alert("Verifique el Eje,Programa,Proyecto ó Acción!");
    GI("Eje").value = "";
    GI("Programa").value = "";
    GI("Proyecto").value = "";
    GI("Accion").value = "";
    obj.innerHTML = "";
    GI("Eje").focus();
  }
  hideWaitLayer();
}
function verificaImporte(objTxt){
  if(eval(objTxt.value) == 0){
    alert("Introduzca un Importe mayor a 0!");
    objTxt.value = "";
    objTxt.focus();
  }
}
function validaRegistroPresupuestal(){
  if(fvPresupuestoInicial.checkForm()){
    obtenSecuencialFolio(10,ejecutaRegistroPresupuestal);
  }
}

function obtenSecuencialFolio(tipo,funcionMantenimiento){
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunAsignaFolio\",\"TipoFolio\":" + tipo + "}";
  for(i = 1; i <= 3 ; i++){
    if(GI("ImporteEstatal").value != "" && i == 1){
      showWaitLayer();
      makeAjaxRequest(url, "HTML", funcionMantenimiento, 1);
    }
    if(GI("ImporteFederal").value != "" && i == 2){
      showWaitLayer();
      makeAjaxRequest(url, "HTML", funcionMantenimiento, 2);
    }
    if(GI("ImporteRendimientos").value != "" && i == 3){
      showWaitLayer();
      makeAjaxRequest(url, "HTML", funcionMantenimiento, 3);
    }
  }
}
function ejecutaRegistroPresupuestal(obj, result){
  var folio = JSON.parse(result)[0];
  catMovimifoseg.Ctam = 7000;
  catMovimifoseg.Scta = eval(GI("Eje").value);
  catMovimifoseg.Sscta = eval(GI("Programa").value);
  catMovimifoseg.Ssscta = eval(GI("Proyecto").value);
  catMovimifoseg.Sssscta = eval(GI("Accion").value);
  catMovimifoseg.Ssssscta = 0;
  catMovimifoseg.Aux1 = eval(GI("Fideicomiso").value);
  catMovimifoseg.Aux2 = eval(GI("Ano").value);
  catMovimifoseg.Aux3 = 2;
  catMovimifoseg.Folio = folio;
  catMovimifoseg.Fecha = GI("txtFechaContable").value;
  if(GI("ImporteEstatal").value != "" && obj == 1)
    catMovimifoseg.Importe = eval(GI("ImporteEstatal").value);
  if(GI("ImporteFederal").value != "" && obj == 2)
    catMovimifoseg.Importe = eval(GI("ImporteFederal").value);
  if(GI("ImporteRendimientos").value != "" && obj == 3)
    catMovimifoseg.Importe = eval(GI("ImporteRendimientos").value);
  catMovimifoseg.TipoOperacion = GI("rdTipo").value;
  catMovimifoseg.Comprometido = "N";
  catMovimifoseg.FolioDetliqui = 0;
  catMovimifoseg.Acuerdo = "";
  catMovimifoseg.Concepto = "";
  catMovimifoseg.AnoAlta = GI("txtFechaContable").value.split("/")[2];
  catMovimifoseg.MesAlta = GI("txtFechaContable").value.split("/")[1];
  catMovimifoseg.DiaAlta = GI("txtFechaContable").value.split("/")[0];
  catMovimifoseg.AnoMod = GI("txtFechaContable").value.split("/")[2];
  catMovimifoseg.MesMod = GI("txtFechaContable").value.split("/")[1];
  catMovimifoseg.DiaMod = GI("txtFechaContable").value.split("/")[0];
  catMovimifoseg.Status = "ACTIVO";
  if(GI("ImporteEstatal").value != "" && obj == 1)
    insertaMovimifoseg(catMovimifoseg,1);
  if(GI("ImporteFederal").value != "" && obj == 2)
    insertaMovimifoseg(catMovimifoseg,2);
  if(GI("ImporteRendimientos").value != "" && obj == 3)
    insertaMovimifoseg(catMovimifoseg,3);
}

function insertaMovimifoseg(catMovimifosegParam,index){
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(catMovimifosegParam);
  makeAjaxRequest(url, "HTML", null, null);
  hideWaitLayer();
  if(index == 3)
    alert("Operación realizada exitosamente!");
}