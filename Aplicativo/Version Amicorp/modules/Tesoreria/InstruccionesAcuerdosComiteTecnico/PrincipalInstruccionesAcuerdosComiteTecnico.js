showWaitLayer();
initForms();

var objAcuerdoComiteParam = JSON.parse("{\"id\":\"X\"}");
var cmbAcuerdosParam = JSON.parse("{\"NumFideicomiso\":-1,\"order\":\"s\"}");
var fvInstruccionesAcuerdos = new FormValidator();

fvInstruccionesAcuerdos.setup({
  formName      : "frmDatosInstruccionesAcuerdos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  RF(objForma);
  borraCombos("cmbNoAcuerdo");
}
function cargaComboAcuerdos(objComboAcuerdo){
  if(objComboAcuerdo.selectedIndex != 0){
    showWaitLayer();
    cmbAcuerdosParam.NumFideicomiso = objComboAcuerdo.value;
    loadElement(GI("cmbNoAcuerdo"));
  }
}
function asignaMontoAutorizadoDisponible(objCmbAcuerdo){
  if(objCmbAcuerdo.value != -1){
    GI("txtMontoAutorizado").value = objCmbAcuerdo.value.split("-")[0];
    GI("txtMontoDisponible").value = objCmbAcuerdo.value.split("-")[1];
  }else{
    GI("txtMontoAutorizado").value = "0";
    GI("txtMontoDisponible").value = "0";
  }
}
function verificaImporte(objImporte){
  if(eval(objImporte.value) == 0){
    alert("Introduzca un Importe mayor a 0");
    objImporte.focus();
  }else{
    if(objImporte.value != "" && objImporte > GI("txtMontoDisponible").value){
      alert("Introduzca un Importe no mayor al Importe Disponible");
      objImporte.focus();
    }
  }
}

function ejecutaInstruccionAcuerdo(){
  if(fvInstruccionesAcuerdos.checkForm()){
    if(GI("txtContrasena").value != ""){
      showWaitLayer();
      loadElement(GI("txtContrasena"));
    }else{
      alert("Introduzca una Contraseña valida");
      GI("txtContrasena").focus();
    }
  }
}
function verificaContrasena(obj, result){
  var resultado = JSON.parse(result)[0];
  var opc = eval(GI("rdTipoInstruccion").value);
  if(isDefinedAndNotNull(resultado)){
    if(resultado.pwd == GI("txtContrasena").value){
      switch(opc){
        case 1: //Reembolso
          objAcuerdoComiteParam.id = "updInsAcuComRee";
          objAcuerdoComiteParam.Importe = eval(GI("txtImporte").value);
          objAcuerdoComiteParam.NumFideicomiso = eval(GI("cmbFideicomiso").value);
          objAcuerdoComiteParam.Fecha = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(0,10);
          objAcuerdoComiteParam.Tipo = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(12,13);
          objAcuerdoComiteParam.Id = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(14,GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.length);
        break;
        case 2: //Retiro
          objAcuerdoComiteParam.id = "updInsAcuComRet";
          objAcuerdoComiteParam.Importe = eval(GI("txtImporte").value);
          objAcuerdoComiteParam.NumFideicomiso = eval(GI("cmbFideicomiso").value);
          objAcuerdoComiteParam.Fecha = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(0,10);
          objAcuerdoComiteParam.Tipo = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(12,13);
          objAcuerdoComiteParam.Id = GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.substring(14,GI("cmbNoAcuerdo").options[GI("cmbNoAcuerdo").selectedIndex].text.length);
        break;
      }
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objAcuerdoComiteParam);
      makeAjaxRequest(url, "HTML", validaResultadoUpdate, opc);
    }else{
      alert("Contraseña Invalida!");
      obj.value = "";
      hideWaitLayer();
    }
  }else{
    alert("Ocurrio un error al verificar la Contraseña!");
    obj.value = "";
    hideWaitLayer();
  }
}
function validaResultadoUpdate(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado.tipoError == "SUCCESS"){
      switch(obj){
        case 1:
        case 2:
          if(obj == 1)
            alert("La operación de Reembolso fue aplicada exitosamente!");
          else
            alert("La operación de Retiro fue aplicada exitosamente (los retiros solo se aplican si el acuerdo tiene saldo disponible!");
          delete objAcuerdoComiteParam.Importe;
          objAcuerdoComiteParam.id = "updInsAcuCom1";
          var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objAcuerdoComiteParam);
          makeAjaxRequest(url, "HTML", validaResultadoUpdate, 3);
        break;
        case 3:
          objAcuerdoComiteParam.id = "updInsAcuCom2";
          var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objAcuerdoComiteParam);
          makeAjaxRequest(url, "HTML", validaResultadoUpdate, 4);
        break;
        case 4:
          objAcuerdoComiteParam.id = "updInsAcuCom3";
          var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objAcuerdoComiteParam);
          makeAjaxRequest(url, "HTML", validaResultadoUpdate, 10);
        break;
        case 10:
          hideWaitLayer();
          GI("cmbFideicomiso").focus();
          limpiar(GI("frmDatosInstruccionesAcuerdos"));
        break;
        default:
          hideWaitLayer();
          GI("cmbFideicomiso").focus();
      }
    }else{
      alert("Ocurrio un error al realizar la operación!");
      hideWaitLayer();
    }
  }else{
    alert("Ocurrio un error al realizar la operación c!");
    hideWaitLayer();
  }
}