//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbParam651 = JSON.parse("{\"Indice\":651,\"orderDescripcion\":\"S\"}");
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbParam661 = JSON.parse("{\"Indice\":661,\"orderDescripcion\":\"S\"}");

var tablaData = new Array();
tablaData[0] = "traIdFolio,50px";
tablaData[1] = "traIdPizarra,50px";
tablaData[2] = "traCveOperacion,80px";
tablaData[3] = "traNumIntermediario,200px";
tablaData[4] = "traNumAcreditado,200px";
tablaData[5] = "traHoraRecepcion,50px";
tablaData[6] = "traFecOpera,80px";
tablaData[7] = "traFecLiq,80px";
tablaData[8] = "traNumUnidadesSol,80px";
tablaData[9] = "traNumUnidadesAsi,80px";
tablaData[10] = "traNumTracs,80px";
tablaData[11] = "traCtaIndevalInt,80px";
tablaData[12] = "traCtaIndevalCas,80px";
tablaData[13] = "traStatus,80px";

GI("paramfechaOpe").value = fecTrac;

//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("paramfechaOpe","paramfechaOpe", "%d/%m/%Y");
cal.manageFields("paramfechaLiq","paramfechaLiq", "%d/%m/%Y");

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
formsLoaded();

var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
}

function consultarMovimientos(obj)
{
  if(fvMantenimiento.checkForm())
  {
    consultar(obj, GI('frmDatos'), false);
    GI('fichaConfirm').style.visibility='hidden';
    
    consultaUnidades();
  }
}

function consultaUnidades()// consulta total de unidades 1-creaciones 2-redenciones
{
    for(i=1;i<3;i++)
    {
      var surl = "\"id\":\"qryTotalUnidades\",";
      surl += "\"fiso\":"+GI('paramfiso').value+",";
      surl += "\"cveOperacion\":"+i+",";
      surl += "\"fechaOpe\":\""+GI('paramfechaOpe').value+"\"";
      var url = ctxRoot+'/getRef.do?json={'+surl+'}';
      makeAjaxRequest(url,"HTML",consultaUnidadesResp,(i==1?'creacion':'redencion'))
    }
    GI('totalUnidades').style.visibility='visible';
}

function consultaUnidadesResp(obj,result)
{
  var res = JSON.parse(result)[0];

  GI(obj+"US").innerHTML = "<b>"+res.solicitadas+"</b>";
  GI(obj+"UA").innerHTML = "<b>"+res.asignadas+"</b>";
}

var fic;
function clickTabla(pk) {
  pkInfo = pk;
  fic = new ficha(GI("paramfiso").options[GI("paramfiso").selectedIndex].text,pkInfo.traCveOperacion,'FIDUCIA',20,50,10,pkInfo.traNumIntermediario,5,10,5,pkInfo.traNumUnidadesSol,0);
  llenaFicha(fic);
  GI('totalUnidades').style.visibility='hidden';
}

function ficha(fid,ope,cap,uxd,uxcb,ud,cb,uacb,udd,udcb,us,ua)
{
  this.fid=fid;
  this.ope=ope;
  this.cap=cap;
  this.uxd=uxd;
  this.uxcb=uxcb;
  this.ud=ud;
  this.cb=cb;
  this.uacb=uacb;
  this.udd=udd;
  this.udcb=udcb;
  this.us=us;
  this.ua=ua;
  return this;
}

function llenaFicha(fic)
{
  GI('ficFiso').innerHTML = "<b>"+fic.fid+"</b>"; 
  GI('ficCaptura').innerHTML = "<b>"+fic.ope+" Capturada por "+fic.cap+"</b>"; 
  GI('ficUDD').innerHTML = "<b>---</b>&nbsp;&nbsp;&nbsp"; 
  GI('ficSUDCB').innerHTML = "Unidades Disponibles <b>"+fic.cb+":</b>"; 
  GI('ficUDCB').innerHTML = "<b>---</b>"; 
  GI("ficSUDCB").style.color="black";
  GI("ficUDCB").style.color="black";
  GI("msgError").innerHTML="";
  
  
  GI('ficUS').innerHTML = "<b>"+fic.us+"</b>"; 
  GI('ficUA').value = fic.us; 
  
  GI('fichaConfirm').style.visibility='visible';
}