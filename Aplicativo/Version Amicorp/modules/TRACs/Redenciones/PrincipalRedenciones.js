//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

// combos
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo26 = JSON.parse("{}");
var cmbCtaIndeval = JSON.parse("{\"cb\":-1}");
var cmbAcreditados = JSON.parse("{\"cb\":-1}");
var cmbFideicomisoTrac = JSON.parse("{}");

function cargaCombos(valorcb)
{
  cmbCtaIndeval = JSON.parse("{\"cb\":"+eval(valorcb)+"}");
  cmbAcreditados = JSON.parse("{\"cb\":"+eval(valorcb)+"}");

  loadElement(GI("numAcreditado"));
  loadElement(GI("ctaIndevalIntermediario"));

}

//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("fecRedencion","fecRedencion", "%d/%m/%Y");
cal.manageFields("fecLiquidacion","fecLiquidacion", "%d/%m/%Y");
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
fechaTrack(GI("fecRedencion"));

// Pantalla
var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;

//formsLoaded();


function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
}

//botones

function consultaParamTrack()
{
  if(fvMantenimiento.checkForm())
  {
    var surl = "\"id\":\"qryParamTrack\",";
    surl += "\"fiso\":"+GI("numFideicomiso").value;
    var url = ctxRoot+"/getRef.do?json={"+surl+"}";
    
    makeAjaxRequest(url,"HTML",funGeneraRedencion,null);
  }
}

function funGeneraRedencion(obj,result)
{
  var res = JSON.parse(result)[0];
  var hrInicio = res.patHoraInicio;
  var hrFin = res.patHoraFin;
  
    var statusRedencion = "ACEPTADA";
    var comentarioRedencion = "";
    var horaRedencion = GI("fecHora").value.replace(':','.');
    
    if(GI("numAcreditado").value==-1)
    {  
      statusRedencion = "RECHAZADA";
      comentarioRedencion = "El Acreditado "+GI("textAcreditado").value+" no esta Registrado";
    }
    if(horaRedencion<hrInicio.replace(':','.')||horaRedencion>hrFin.replace(':','.'))
    {  
      statusRedencion = "RECHAZADA";
      comentarioRedencion = "La hora de Redención no esta dentro del horario permitido "+hrInicio+"-"+hrFin;
    }
    
    var sparametros = "";
    sparametros += "\"id\":\"ejeFunGeneraRedenciones\"";
    sparametros += ",\"numFideicomiso\":"+GI("numFideicomiso").value+"";
    sparametros += ",\"fecRedencion\":\""+GI("fecRedencion").value+"\"";
    sparametros += ",\"fecLiquidacion\":\""+GI("fecLiquidacion").value+"\"";
    sparametros += ",\"numIntermediario\":"+GI("numInstitucion").value+"";
    sparametros += ",\"numAcreditado\":"+GI("numAcreditado").value+"";
    sparametros += ",\"numUnidades\":"+GI("numUnidades").value+"";
    sparametros += ",\"ctaIndevalIntermediario\":\""+GI("ctaIndevalIntermediario").value+"\"";
    sparametros += ",\"fecHora\":"+horaRedencion+"";
    sparametros += ",\"fecTrac\":\""+fecTrac+"\"";
    sparametros += ",\"numUsuario\":"+ctxUser+"";
    sparametros += ",\"status\":\""+statusRedencion+"\"";
    sparametros += ",\"comentario\":\""+comentarioRedencion+"\"";
    
    
    var url = ctxRoot + "/executeRef.do?json={"+sparametros+"}";
    if(statusRedencion=="RECHAZADA")
    {
      if(confirm("La Redención será dada de alta como RECHAZADA debido a que "+comentarioRedencion+",¿Desea Continuar?"))
        makeAjaxRequest(url,"HTML",funGeneraRedencionResp,null);
    }
    else
    {
      makeAjaxRequest(url,"HTML",funGeneraRedencionResp,null);
    }
}

function funGeneraRedencionResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
          alert("¡Operación Exitósa!");
          RF(GI("frmDatos"));
          fechaTrack(GI("fecRedencion"));
          break;
    default:
          alert("¡Ocurrió un Error inesperado!");
          break;
  }
}

//consultaProcedimiento(4042);//procedimiento