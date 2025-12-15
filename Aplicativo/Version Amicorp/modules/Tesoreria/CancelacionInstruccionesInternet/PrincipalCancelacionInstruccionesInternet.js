showWaitLayer();

var fvCancelacionInstruccionesInternet = new FormValidator();

//Agregando la funcionalidad del required
fvCancelacionInstruccionesInternet.setup({
formName      : "frmPrincipalCancelacionInstruccionesInternet",
tipoAlert     : 1,
alertFunction : BaloonAlert,
sendObjToAlert: true
});

//Valor de la afirmacion
var afirmacion=0;

hideWaitLayer();


function botonAceptar() {
  if(fvCancelacionInstruccionesInternet.checkForm())
    ejecutaFuncionCancelaInternet();
}

function ejecutaFuncionCancelaInternet() {
  var objParametros = JSON.parse("{\"id\":\"funcionCancelacionInstruccionesInternet\"}");
  
  eval("objParametros.Folio=" + GI("txtFolio").value);
  eval("objParametros.Usuario=300");
  eval("objParametros.Afirmacion="+ afirmacion);
  
  showWaitLayer();
  var urlFuncCancelInternet = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(urlFuncCancelInternet, "HTML", respuestaFuncionCancelInternet, null);
}

function respuestaFuncionCancelInternet(obj, result){
  var res=JSON.parse(result).resultado;
  
  if(afirmacion==1)
    afirmacion=0;
      
  switch(res)
  {
    case 0: alert("Cancelación satisfactoria"); break;
    case 1: alert("No existe la instrucción para este folio"); break;
    case 2: alert("La instrucción ya ha sido cancelada"); break;
    case 3: alert("La instrucción se encuentra en espera de autorización"); break;
    case 4: 
            if(confirm("¿Está seguro de cancelar la instrucción?")==true)
            {
              afirmacion=1;
              ejecutaFuncionCancelaInternet();
              break;
            }
            else
              break;
            
    case 5: alert("No es posible cancelar una instrucción contabilizada"); break;
    case 6: alert("No es posible cancelar instrucciones con fechas donde el fideicomiso haya sido cerrado contablemente"); break;
    case 7: alert("Esta instrucción fue contabilizada por póliza manual, para poder cancelar la FUOF es necesario solicitar a contabilidad que realice su cancelación"); break;
    case 8: alert("Error en el proceso de cancelación de esta instrucción"); break;
    case 9: alert("La instrucción presupuestal ya ha sido cancelada"); break;
    case 10: alert("No es posible cancelar esta instrucción, ya que el folio pertenece al movimiento presupuestal de una instrucción de retiro"); break;
    case -1: alert("Ocurrió un error de Oracle"); break;
    default: break;
  }
  
  hideWaitLayer();
}
