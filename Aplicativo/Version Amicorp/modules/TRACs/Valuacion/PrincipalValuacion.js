
// Pantalla
var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("fechaVal","fechaVal", "%d/%m/%Y");
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}


initForms();

fechaTrack(GI("fechaVal"));
formsLoaded();


function limpiar(objForma){
  RF(objForma);
  fechaTrack(GI("fechaVal"));
}

//botones

function funValuacion()
{
  
  if(fvMantenimiento.checkForm())
  {
    var surl = "\"id\":\"ejeFunValuacionTrack\",";
    surl += "\"fecha\":\""+GI('fechaVal').value+"\",";
    surl += "\"preNaf\":"+GI('preNaf').value+",";
    surl += "\"usuario\":"+ctxUser+"";
    
    url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    
    makeAjaxRequest(url,"HTML",funValuacionResp,null);
  }
}

function funValuacionResp(obj,result)
{
  
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
          alert("¡Operación Exitósa!");
          limpiar(frmDatos);
          break;
    case 1:
          alert("¡Error al Valuar!");
          limpiar(frmDatos);
          break;
    default:
          alert("¡Ocurrió un Error inesperado!");
          break;
  }
}
