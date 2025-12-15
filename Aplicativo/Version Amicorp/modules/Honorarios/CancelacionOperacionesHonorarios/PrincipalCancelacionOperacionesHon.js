//PrincipalCancelacionOperacionesHon.js
showWaitLayer();
initForms();
deshabilitaPK("paramAno".split(","));

var arrTblMovDat = new Array();
var fvCatMovimien = new FormValidator();
var fechaContable;
var objAnoMesParam;

arrTblMovDat[0] = "movFecha,80px";
arrTblMovDat[1] = "movHrMin,50px";
arrTblMovDat[2] = "movNumContrato,86px";
arrTblMovDat[3] = "movFolioOpera,70px";
arrTblMovDat[4] = "movNumTransac,50px";
arrTblMovDat[5] = "movDescMovto,250px";
arrTblMovDat[6] = "movImpMovto,100px";
arrTblMovDat[7] = "movCveStMovto,100px";

var fvCat = new FormValidator();
fvCat.setup({
  formName      : "frmDatosMovimientos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function clickTabla(pk){
  showWaitLayer();
  pkInfo = pk;
  var fecha = "\"01/" + GI("paramMes").value  + "/" + GI("paramAno").value + "\"";
  var fideicomiso = pk.movNumContrato;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesAnterior\",\"Fecha\":" + fecha + ",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaFechaMesAnterior, null);
}

function consultaMesAbierto(){
  var mes;
  var ano;
  fechaContable = GI("paramMes").value;
  GI("paramDia").value = fechaContable.split("/")[0];
  GI("paramMes").value = fechaContable.split("/")[1]; //*** quitar el -2
  GI("paramAno").value = fechaContable.split("/")[2];
  mes = eval(GI("paramMes").value);
  ano = eval(GI("paramAno").value);
  if(mes == 1){
    mes = 12;
    ano -= 1;
  }else{
    mes -= 1;
  }
  objAnoMesParam = JSON.parse("{\"Ano\":" + ano + ",\"Mes\":" + mes + "}");
  loadElement(GI("paramAno"));
}

function validaMesActual(mesCapturado) {
  var mesActual;
  fechaContable = GI("paramMes").value;
  fechaContable.split("/")[2];
  mesActual = eval(GI("paramMes").value);
  alert("MES ACTUAL: " + mes);
  alert("MES CAPTURADO: " + mesCapturado.value);
  if (mesActual > 2) {
    if ((mesActual-2) < (mesCapturado.value)) {
      document.frmDatosMovimientosparamMes.paramMes.value = mesActual;
    }
  } else if (mesActual==1) {
    mesActual = 11;
    if (mesActual <= (mesCapturado.value)) {
      document.frmDatosMovimientosparamMes.paramMes.value = mesActual;
    }
  } else if (mesActual==2) {
    mesActual = 12;
    if (mesActual <= (mesCapturado.value)) {
      document.frmDatosMovimientosparamMes.paramMes.value = mesActual;
    }  
  }
}

function validaMesAbierto(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    if(resultado.mesAbierto == 0){
      deshabilitaPK("paramMes,paramAno".split(","));
      asignaEtiqueta("divMesAbierto","El mes anterior se encuentra Cerrado");
    }
  }
  formsLoaded();
}

function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result)[0];
  var confirmar = false;
  switch(resultado){
    case 0:
    case 2:
      showWaitLayer();
      confirmar = confirm("¿Desea Cancelar la Operación?");
      if(confirmar)
        confirmar = confirm("¿Confirmas la Cancelación del folio " + pkInfo.movFolioOpera + "?");
      if(confirmar)
        ejecutaFuncionCancelaOperacion();
      if(!confirmar)
        hideWaitLayer();
    break;
    case 1:
    case -1:
      alert("No es posible cancelar la operación, el mes al que pertenece el movimiento esta cerrado para el Fideicomiso");
    break;
  }
  hideWaitLayer();
}

function ejecutaFuncionCancelaOperacion(){
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeStoCancelaOperacion\",\"Folio\":" + pkInfo.movFolioOpera + ",\"Ano\":" + fechaContable.split("/")[2] + ",\"Mes\":" + fechaContable.split("/")[1] + ",\"Dia\":" + fechaContable.split("/")[0] + ",\"Moneda\":1}";
  makeAjaxRequest(url, "HTML", verificaResultadoStoCancelaOperaion, null);
}

function verificaResultadoStoCancelaOperaion(obj, result){
  var resultado = JSON.parse(result);
  onButtonClick('Honorarios.CancelacionOperacionesHonorarios.PrincipalCancelacionOperacionesHon','')
  hideWaitLayer();
}