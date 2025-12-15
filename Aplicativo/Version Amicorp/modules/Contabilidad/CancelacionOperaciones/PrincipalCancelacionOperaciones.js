//PrincipalCancelacionOperaciones.js
showWaitLayer();
initForms();

var arrTblMovDat = new Array();
var fvCatMovimien = new FormValidator();
var fechaContable;
var objAnoMesParam;

var esFolioInternet=false;
var esfolioHonorarios=false;
var esfolioHonorarios2=false;
var anoConta = 0;
var mesConta = 0;

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
  validaFolios1();
  validaFolios2();
  validaFolios3();
  if(esFolioInternet||esfolioHonorarios||esfolioHonorarios2){
    alert("No se pueden eliminar los folios");
    hideWaitLayer();
  }
  else{
    var fecha = "\"01/" + GI("paramMes").value  + "/" + GI("paramAno").value + "\"";
    var fideicomiso = pk.movNumContrato;
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesAnterior\",\"Fecha\":" + fecha + ",\"Fideicomiso\":" + fideicomiso + "}";
    makeAjaxRequest(url, "HTML", validaFechaMesAnterior, null);
  }  
}

function consultaMesAbierto(){
  var mes;
  var ano;
  fechaContable = GI("paramMes").value;
  GI("paramDia").value = fechaContable.split("/")[0];
  GI("paramMes").value = fechaContable.split("/")[1]; //*** quitar el -2
  GI("paramAno").value = fechaContable.split("/")[2];
  anoConta = eval(GI("paramAno").value);
  mesConta = eval(GI("paramMes").value);
  mes = eval(GI("paramMes").value);
  GI("mesconta").value=mes;
  ano = eval(GI("paramAno").value);
  
  if(mes == 1){
    mes = 12;
    ano = ano-1;
  }else{
    mes =mes- 1;
  }
  objAnoMesParam = JSON.parse("{\"Ano\":" + ano + ",\"Mes\":" + mes + "}");
  loadElement(GI("paramAno"));
}

function validaMesActual(mesCapturado) {
  var mesActual;
  //fechaContable = GI("paramMes").value;
  //mes=fechaContable.split("/")[2];
  mesActual = eval(GI("mesconta").value);
  document.frmDatosMovimientos.paramMes.value = mesCapturado.value;
  
  if (mesActual > 2) {
    if (mesCapturado.value >= (mesActual-2) ) {
      document.frmDatosMovimientos.paramMes.value = mesActual;
    }
  } else if (mesActual==1) {
    mesActual = 11;
    if (mesActual <= (mesCapturado.value)) {
      document.frmDatosMovimientos.paramMes.value = mesActual;
    }
  } else if (mesActual==2) {
    mesActual = 12;
    if (mesActual <= (mesCapturado.value)) {
      document.frmDatosMovimientos.paramMes.value = mesActual;
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
   
  var s_mes = ((GI('paramMes').value!="")?",\"Mes\":"+eval(GI('paramMes').value):"");
  var s_dia = ((GI('paramDia').value!="")?",\"Dia\":" + eval(GI('paramDia').value):"");
  
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeStoCancelaOperacion\",\"flag\":0,\"Folio\":" + pkInfo.movFolioOpera + ",\"Ano\":" + eval(GI('paramAno').value)+s_mes+s_dia+",\"Moneda\":1}";
  
  makeAjaxRequest(url, "HTML", verificaResultadoStoCancelaOperaion, null);
}

function verificaResultadoStoCancelaOperaion(obj, result){
  var resultado = JSON.parse(result);
  onButtonClickPestania('Contabilidad.CancelacionOperaciones.PrincipalCancelacionOperaciones','')
  hideWaitLayer();
}

function validaFolios1(){
      var validFInt = JSON.parse("{\"id\":\"determinaFoliosInternet\",\"Folio\":"+ pkInfo.movFolioOpera + "}");
      var url = ctxRoot + "/getRef.do?json="+JSON.stringify(validFInt);
      makeAjaxRequest(url, "HTML", validaFolioInternet, null);
}

function validaFolioInternet(obj, result){
     //alert(result);
     var objResult = JSON.parse(result);
     if(objResult[0].valor != 0){
       esFolioInternet=true;
     }
}

function validaFolios2(){
      var validFInt = JSON.parse("{\"id\":\"determinaFoliosHonorarios1\",\"Folio\":"+ pkInfo.movFolioOpera + "}");
      var url = ctxRoot + "/getRef.do?json="+JSON.stringify(validFInt);
      makeAjaxRequest(url, "HTML", validaFolioHon, null);
}

function validaFolioHon(obj, result){
     //alert(result);
     var objResult = JSON.parse(result);
     if(objResult[0].valor2 != 0){
       esfolioHonorarios=true;
     }
}

function validaFolios3(){
      var validFInt = JSON.parse("{\"id\":\"determinaFoliosHonorarios2\",\"Folio\":"+ pkInfo.movFolioOpera + "}");
      var url = ctxRoot + "/getRef.do?json="+JSON.stringify(validFInt);
      makeAjaxRequest(url, "HTML", validaFolioHon2, null);
}

function validaFolioHon2(obj, result){
     //alert(result);
     var objResult = JSON.parse(result);
     if(objResult[0].valor3 != 0){
       esfolioHonorarios2=true;
     }
}

function valMesAnt(obj)
{
  if(eval(GI('mesconta').value)==1&&(anoConta-1)==eval(GI('paramAno').value))// enero
    mesConta =13;
  else
    mesConta = eval(GI('mesconta').value);
    
  if(mesConta != eval(obj.value)&&(mesConta-1) != eval(obj.value))
  {
    obj.value = eval(GI('mesconta').value);
  }
}