//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbParam651 = JSON.parse("{\"Indice\":651,\"orderDescripcion\":\"S\"}");
var cmbFideicomisoTrac = JSON.parse("{}");

var activo = false;


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
GI("paramusuario").value = ctxUser;

function consultaParamConfirmacion()
{
  if(fvMantenimiento.checkForm())
  {
    var surl = "\"id\":\"qryParamTrack\",";
    surl += "\"fiso\":"+GI("paramfiso").value;
    
    var url = ctxRoot+"/getRef.do?json={"+surl+"}";
    
    makeAjaxRequest(url,'HTML',consultaConfirmacion,null);
  }
}

function consultaConfirmacion(obj,result)
{
  var res = JSON.parse(result)[0].patAsignacionAutomatica;
  
  if(res==1)
  {
    GI("cmdAutomatico").style.visibility= "visible";
    activo = true;
  }
  else
  {
    
    GI("cmdAutomatico").style.visibility= "hidden";
  activo = false;
  }
  consultar(GI('cmdConsultar'), GI('frmDatos'), false);
  GI('fichaConfirm').style.visibility='hidden';
  
}

function confirmacionAutomatica()
{
   var surl = "\"id\":\"ejeFunConfirmaAutomatico\",";
    surl += "\"fiso\":"+GI("paramfiso").value+",";
    surl += "\"folio\":0,";
    surl += "\"asignadas\":0,";
    surl += "\"fecha\":\""+GI("paramfechaOpe").value+"\",";
    surl += "\"usuario\":"+GI("paramusuario").value+",";
    surl += "\"comentario\":\"Automatico\"";
    var url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    makeAjaxRequest(url,"HTML",confirmacionAutomaticaResp,null);
}

function confirmacionAutomaticaResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  
  switch(res)
  {
    case 0:
      alert("Operación Exitosa");
      break;
    case 1:
      alert("No hay operaciónes para la Fecha y Fideicomiso selecionado");
      break;
    default:
      alert("Ocurrió un error inesperado");
      break;
  }
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

cal.manageFields("paramfechaOpe","paramfechaOpe", "%d/%m/%Y");
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
var fic;
function clickTabla(pk) {
  pkInfo = pk;
  
  
  if(!activo)
  {
    // se saca el primer registro a confirmar
    var surl = "\"id\":\"consultaOpeTrack\","
    surl += "\"fiso\":"+GI('paramfiso').value+","
    surl += "\"fechaOpe\":\""+GI('paramfechaOpe').value+"\","
    surl += "\"status\":\""+GI('paramstatus').value+"\","
    surl += "\"order\":\"s\""
    var url = ctxRoot+"/getRef.do?json={"+surl+"}"; 
    makeAjaxRequest(url,"HTML",clickTablaResp,null);
  }
} 

function clickTablaResp(obj,result)//consulta parametros track
{
  var res = JSON.parse(result)[0].traIdFolio;
  
  if(res==pkInfo.traIdFolio)//si es el primer registro muestra la ficha
  {
    if(pkInfo.traCveOperacion=="CREACION")//ficha creacion
    {
      var url = ctxRoot+"/getRef.do?json={\"id\":\"qryParamTrack\",\"fiso\":"+GI('paramfiso').value+"}";
    }
    else
    {
      var url = ctxRoot+"/getRef.do?json={\"id\":\"consultaCarteraTRACs\",\"fiso\":"+GI('paramfiso').value+",\"fecha\":\""+GI('paramfechaOpe').value+"\"}";
    }
      showWaitLayer();
    makeAjaxRequest(url,"HTML",parametrosFicha,null);
  }
  else
  {
    GI('fichaConfirm').style.visibility='hidden';
    alert("Existe un movimiento con un folio anterior sin autorizar, seleccione el primer renglón")
  }
}

function parametrosFicha(obj,result) // se llena la ficha de parametros tracks
{
  var res = JSON.parse(result)[0];
  if(pkInfo.traCveOperacion=="CREACION")//creacion
  {
    fic = new ficha
    (
      GI("paramfiso").options[GI("paramfiso").selectedIndex].text,// fideicomiso
      pkInfo.traCveOperacion,// operacion
      'USUARIO',// usuario que capturo
      res.patMaxCreaciones,// unidades maximas por dia
      res.patMaxCreacionesFin,// % unidades maximas por dia casa de bolsa
      res.patDispoCreacionesFin,// unidades maximas por dia casa de bolsa
      null,// unidades que van autorizadas en el dia
      pkInfo.traNumIntermediario,// casa de bolsa
      null,// unidades autorizadas casa de bolsa
      pkInfo.traNumUnidadesSol// unidades solicitadas
    );
  } 
  else
  {
    fic = new ficha
    (
      GI("paramfiso").options[GI("paramfiso").selectedIndex].text,// fideicomiso
      pkInfo.traCveOperacion,// operacion
      'USUARIO',// usuario que capturo
      0,// unidades maximas por dia
      0,// % unidades maximas por dia casa de bolsa
      0,// unidades maximas por dia casa de bolsa
      res.temNumUnidades,// unidades que van autorizadas en el dia
      pkInfo.traNumIntermediario,// casa de bolsa
      0,// unidades autorizadas casa de bolsa
      pkInfo.traNumUnidadesSol// unidades solicitadas
    );
  }
  
  var url = ctxRoot+"/getRef.do?json={\"id\":\"claves\",\"llaveClave\":26,\"descClave\":\""+pkInfo.traNumIntermediario+"\"}";
  makeAjaxRequest(url,"HTML",fichaCB,null);
}
function fichaCB(obj,result)//se busca las unidades del dia de la casa de bolsa
{
  var res = JSON.parse(result)[0].cveNumSecClave;
  
      var surl = "\"id\":\"qryTotalUnidades\",";
      surl += "\"fiso\":"+GI('paramfiso').value+",";
      surl += "\"cveOperacion\":1,";
      surl += "\"casaBolsa\":"+res+",";
      surl += "\"fechaOpe\":\""+GI('paramfechaOpe').value+"\"";
      var url = ctxRoot+'/getRef.do?json={'+surl+'}';
      
  makeAjaxRequest(url,"HTML",fichaCB2,null);
} 

function fichaCB2(obj,result)//se buscan las unidades del dia en general
{
  var res = JSON.parse(result)[0].asignadas;
  fic.uacb = res;
  
  var surl = "\"id\":\"qryTotalUnidades\",";
  surl += "\"fiso\":"+GI('paramfiso').value+",";
  surl += "\"cveOperacion\":1,";
  surl += "\"fechaOpe\":\""+GI('paramfechaOpe').value+"\"";
  var url = ctxRoot+'/getRef.do?json={'+surl+'}';
      
  makeAjaxRequest(url,"HTML",fichaUsuario,null);
} 

function fichaUsuario(obj,result)//se pregunta por el usuario que capturo
{
  var res = JSON.parse(result)[0].asignadas;
  fic.ud = res;
  
  var surl = "\"id\":\"qryUsuarioTrack\",";
  surl += "\"fiso\":"+GI('paramfiso').value+",";
  surl += "\"folio\":"+pkInfo.traIdFolio+"";
  var url = ctxRoot+'/getRef.do?json={'+surl+'}';
  fic.ud = res;
      
  makeAjaxRequest(url,"HTML",fichaLlenaFicha,null);
  
}

function fichaLlenaFicha(obj,result)
{
  var res = JSON.parse(result)[0];
  fic.cap = res.usuNomUsuario;
  fic.usu = res.usuNumUsuario;
  
  fic = actualizaFicha(fic);
  llenaFicha(fic); 
  hideWaitLayer();
}

//fin llenado de la ficha-----------------------------------------------------------------------------------

function validaConfirmacion(tipoOperacion)
{
  if(tipoOperacion=="CREACION")
  {
    if(fic.udcb<GI("ficUA").value)
    {
    
      GI("ficSUDCB").style.color="red";
      GI("ficUDCB").style.color="red";
      GI("msgError").innerHTML="<b>*Sólo hay "+fic.udcb+" Unidades Disponibles<br>para "+fic.cb+"</b>";
      
      fic.com = "Sólo hay "+fic.udcb+" Unidades Disponibles para "+fic.cb;
      if(fic.udcb==0)
      {
          GI('cmdAceptar').className = "boton_x";
          GI('cmdAceptar').value = "Rechazar";
          GI('cmdAceptar').onclick = function() {rechazaOperacion();};
          GI('ficUA').disabled = true;
      }
      else
      {
        GI('cmdAceptar').className = "boton";
        GI('cmdAceptar').value = "Confirmar";
        GI('cmdAceptar').onclick = function() {confirmaOperacion();};
        GI('ficUA').disabled = false;
      }
      return false;
    }
    else
    {
      GI("ficSUDCB").style.color="black";
      GI("ficUDCB").style.color="black";
      
      GI("msgError").innerHTML="";
      fic.com = "";
    }
  }
  else
  {
    if(fic.udcb<GI("ficUA").value)
    {
    
      GI("ficSUDCB").style.color="red";
      GI("ficUDCB").style.color="red";
      GI("msgError").innerHTML="<b>*La redención es mayor a </br> las Unidades en Circulación</b>";
      
      fic.com = "La redención es mayor a las Unidades en Circulación";
      if(fic.udcb==0)
      {
          GI('cmdAceptar').className = "boton_x";
          GI('cmdAceptar').value = "Rechazar";
          GI('cmdAceptar').onclick = function() {rechazaOperacion();};
          GI('ficUA').disabled = true;
      }
      return false;
    }
    else
    {
      GI("ficSUDCB").style.color="black";
      GI("ficUDCB").style.color="black";
      
      GI("msgError").innerHTML="";
      fic.com = "";
    }
  }
  
  if(fic.us<GI("ficUA").value)
  {
    alert("Las Unidades Asignadas no pueden ser mayor a las Unidades Solicitadas");
    return false;
  }
  return true;
}
//confirma operación--------------------------------
function confirmaOperacion() {
  if (pkInfo==null)
  {
    alert("No ha seleccionado campo alguno de la tabla");
  }
  else if(validaConfirmacion(pkInfo.traCveOperacion))
  {
    
    var ejefun = fic.ope=="CREACION"?"ejeFunConfirmaCreaciones":"ejeFunConfirmaRedenciones";
    
    var surl = "\"id\":\""+ejefun+"\",";
    surl += "\"fiso\":"+GI("paramfiso").value+",";
    surl += "\"folio\":"+pkInfo.traIdFolio+",";
    surl += "\"asignadas\":"+GI("ficUA").value+",";
    surl += "\"fecha\":\""+pkInfo.traFecOpera+"\",";
    surl += "\"usuario\":"+fic.usu+",";
    surl += "\"comentario\":\""+fic.com+"\"";
    
    var url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    makeAjaxRequest(url,"HTML",confirmaOperacionResp,null);
    
  }
}

function confirmaOperacionResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
          alert("¡Operación Exitósa!");
          GI("cmdConsultar").click();
          break;
    default:
          alert("¡Ocurrió un Error inesperado!");
          break;
  }
}
//rechaza operación-----------------------------------

function rechazaOperacion() {
  
    var ejefun = fic.ope=="CREACION"?"ejeFunRechazaCreaciones":"ejeFunRechazaRedenciones";
    
    var surl = "\"id\":\""+ejefun+"\",";
    surl += "\"fiso\":"+GI("paramfiso").value+",";
    surl += "\"folio\":"+pkInfo.traIdFolio+",";
    surl += "\"fecha\":\""+pkInfo.traFecOpera+"\",";
    surl += "\"usuario\":"+fic.usu+",";
    surl += "\"comentario\":\""+fic.com+"\"";
    
    var url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    makeAjaxRequest(url,"HTML",rechazaOperacionResp,null);
    
}

function rechazaOperacionResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
          alert("¡Operación Exitósa!");
          GI("cmdConsultar").click();
          break;
    default:
          alert("¡Ocurrió un Error inesperado!");
          break;
  }
}

//Ficha Confirmacion------------------------------------------------------------------------------------------------

function ficha(fid,ope,cap,uxd,uxcb,nuxcb,ud,cb,uacb,us)
{
  this.fid=fid; // fideicomiso
  this.ope=ope; // operacion
  this.cap=cap; // usuario que capturo
  this.usu=null; // no. usuario que capturo  
  this.uxd=uxd; // unidades maximas por dia
  this.uxcb=uxcb; // % unidades maximas por dia casa de bolsa
  this.nuxcb=nuxcb; // unidades maximas por dia casa de bolsa
  this.ud=ud; // unidades que van en el dia
  this.cb=cb; // casa de bolsa
  this.uacb = uacb; // unidades autorizadas casa de bolsa
  
  if(this.ope=="CREACION")
  {
    this.udd= uxd - ud; // unidades disponibles del dia 
    this.udcb=nuxcb - uacb; // unidades disponibles casa de bolsa
    
    if(this.udcb>this.udd)// si hay menos unidades disponibles en el dia que disponibles para 
      this.udcb= this.udd; 
  }  
  else
  {
     this.udd= ud; // unidades disponibles del dia 
     this.udcb=ud; // unidades disponibles casa de bolsa 
  }
  
  this.us=us; // unidades solicitadas
  this.ua=us; // unidades asignadas
  
  this.com=''; // unidades asignadas
  return this;
}

function actualizaFicha(obj)
{
  if(obj.ope=="CREACION")
  {
    obj.udd= obj.uxd - obj.ud; // unidades disponibles del dia 
    obj.udcb= obj.nuxcb - obj.uacb; // unidades disponibles casa de bolsa
    
    if(obj.udcb>obj.udd)// si hay menos unidades disponibles en el dia que disponibles para 
      obj.udcb= obj.udd;
  }
  
  return obj;
}

function llenaFicha(fic)
{
  GI('ficFiso').innerHTML = "<b>"+fic.fid+"</b>"; 
  GI('ficCaptura').innerHTML = "<b>"+fic.ope+" Capturada por "+fic.cap+"</b>"; 
  
  if(fic.ope=="CREACION")
  {
    GI('ficUXD').innerHTML = "<b>"+fic.uxd+"</b>&nbsp;&nbsp;&nbsp"; 
    GI('ficUXCB').innerHTML = "<b>"+fic.uxcb+"%</b>"; 
    
    GI('ficUD').innerHTML = "<b>"+fic.ud+"</b>&nbsp;&nbsp;&nbsp"; 
    GI('ficSUACB').innerHTML = "Unidades Autorizadas <b>"+fic.cb+":</b>"; 
    GI('ficUACB').innerHTML = "<b>"+fic.uacb+"</b>"; 
    
    GI('ficUDD').innerHTML = "<b>"+fic.udd+"</b>&nbsp;&nbsp;&nbsp"; 
  }
  else
  {
    GI('ficUXD').innerHTML = "<b>---</b>&nbsp;&nbsp;&nbsp"; 
    GI('ficUXCB').innerHTML = "<b>---</b>"; 
    
    GI('ficUD').innerHTML = "<b>---</b>&nbsp;&nbsp;&nbsp"; 
    GI('ficSUACB').innerHTML = "Unidades Autorizadas <b>"+fic.cb+":</b>"; 
    GI('ficUACB').innerHTML = "<b>--</b>"; 
    
    GI('ficUDD').innerHTML = "<b>---</b>&nbsp;&nbsp;&nbsp"; 
  }
  
  GI('ficSUDCB').innerHTML = "Unidades Disponibles <b>"+fic.cb+":</b>"; 
  GI('ficUDCB').innerHTML = "<b>"+fic.udcb+"</b>"; 
  GI("ficSUDCB").style.color="black";
  GI("ficUDCB").style.color="black";
  GI("msgError").innerHTML="";
  
  
  GI('ficUS').innerHTML = "<b>"+fic.us+"</b>"; 
  GI('ficUA').value = fic.ua; 
  
  GI('fichaConfirm').style.visibility='visible';
  
  validaConfirmacion(fic.ope);
}

//consultaProcedimiento(4032);//procedimiento