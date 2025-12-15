showWaitLayer();
initForms();
var mesAnt;
var anoAnt;
var mesAbierto;
var validaBloqueoOperaciones = JSON.parse("{\"id\":\"validaBloOpe\",\"anoAnt\":0,\"mesAnt\":0}");
//var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaFideicomisarioAdmon\",\"numContrato\":0,\"beneficiario\":0}");
function asignaMesAnoAnt(){
  mesAnt = eval(GI("txtFechaContable").value.split("/")[1]);
  anoAnt = eval(GI("txtFechaContable").value.split("/")[2]);
  if(mesAnt == 1){
    mesAnt = 12;
    anoAnt -= 1;
  }else{
    mesAnt -= 1;
  }
  validaBloqueoOperaciones.anoAnt=anoAnt;
  validaBloqueoOperaciones.mesAnt=mesAnt;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaBloqueoOperaciones);
  makeAjaxRequest(url, "HTML", habilitaDeshabilita, null);
  
  formsLoaded();
}

function habilitaDeshabilita(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].mesAbierto1==0)
    GI("chkBloqueoOperaciones").checked=1;
  else  
    GI("chkBloqueoOperaciones").checked=0;
}  

function bloqueoOperacionesMesAnterior(){
  showWaitLayer();
  mesAbierto = (GI("chkBloqueoOperaciones").checked)?0:1;
  var url = ctxRoot + "/doRef.do?json={\"id\":\"updBloOpeMesAnt\",\"MesAbierto\":" + mesAbierto + ",\"Ano\":" + eval(GI("txtFechaContable").value.split("/")[2]) + ",\"Mes\":" + eval(GI("txtFechaContable").value.split("/")[1]) + ",\"Dia\":" + eval(GI("txtFechaContable").value.split("/")[0]) + ",\"AnoAnt\":" + anoAnt + ",\"MesAnt\":" + mesAnt + "}";
  makeAjaxRequest(url, "HTML", validaBloqueoOperacionesMesAnterior, null);
}

function validaBloqueoOperacionesMesAnterior(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
      if(mesAbierto == 0)
        alert("Se bloquearón los permisos del mes anterior");
      else
        alert("Se habilitarón los permisos del mes anterior");
  }
  else
    alert("No se pudo efectuar la operación");
  hideWaitLayer();
}