showWaitLayer();
initForms();
var txtFolioParam = JSON.parse("{\"Folio\":0}");

function cancelaInstruccionInternet(obj, result){
  alert("status "+datos);
  var datos = JSON.parse(result)[0];
  var mesAbierto = 1;
  if(isDefinedAndNotNull(datos)){
    showWaitLayer();
    alert("status "+datos.statusContabilidad);
    switch(datos.statusContabilidad){
      case "CANCELADO":
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", ya se encuentra cancelada");
      break;
      case "ESPERA":
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", se encuentra en espera de autorización por el cliente");
      break;
      case "ACTIVO": 
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", no ha sido aceptada por Tesoreria");
      break;
      case "PENDIENTE":
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", no ha sido contabilizada");
      break;
      case "RECHAZADA":
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", ha sido rechazada");
      break;
      case "ACEPTADA":
        showWaitLayer();
        if((datos.fechaContable.split("/")[1] < GI("txtFechaContable").value.split("/")[1]) && mesAbierto == 0)
          alert("No es posible cancelar instrucciones del " + GI("txtFechaContable").value + ", el mes al que pertenece la instrucción esta cerrado para el Fideicomiso " + datos.numContrato);
        else{
          if(confirm("Es necesario se encuentre cancelada la poliza manual involucrada con la instrucción de " + datos.tipoInstruccion + " del Fideicomiso " + datos.numContrato + ", con Folio: " + txtFolioParam.Folio + ". ¿Estas seguro de cambiar el estatus de contabilidad a ¡CANCELADO!?")){
            showWaitLayer();
            var url = ctxRoot + "/doRef.do?json={\"id\":\"updStaInsInt\",\"Folio\":" + txtFolioParam.Folio + "}";
            makeAjaxRequest(url, "HTML", validaUpdateStatusInstruccion, null);
          }
        }
        hideWaitLayer();
      break;
      default:
        alert("La instrucción con Folio: " + txtFolioParam.Folio + ", no fue aceptada por poliza");
    }
    hideWaitLayer();
  }
}


function validaUpdateStatusInstruccion(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado.tipo == "SUCCESS")
      alert("La instrucción con Folio: " + txtFolioParam.Folio + ", fue cancelada");
    else
      alert("No fue posible cambiar el estatus de contabilidad de la instrucción con Folio: " + txtFolioParam.Folio + "  a ¡CANCELADO!");
  }
  hideWaitLayer();
}