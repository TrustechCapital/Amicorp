showWaitLayer();

var strIdPK = "banco,cuenta,titular,rfc,statusCta,fechaCaptura,claveBanco";
var strIdPK1 = "titular";
var arrIdPK1= strIdPK1.split(",");
var arrIdPK = strIdPK.split(",");
var fvAdministracionCuentas = new FormValidator();
var fvRep = new FormValidator();
var fvMantenimientoAdministracionCuentas = new FormValidator();
var tblRegAdmCueDat = new Array();
var divClaveBancoParam = JSON.parse("{\"claveBanco\":-1}");
var fideicomiso, cuenta,claveCta;
var fncActCuenta = JSON.parse("{\"id\":\"ejefncActCuenta\"}");  
pkInfo = null;

var motivoDelRechazo;

ocultaObjs("paramStatus,paramCuenta,cmdModificar,cmdAceptar,cmdCancelar,cmdRechazar,paramFecha,dvFecha");

SA(GI("frmDatos"),"onload","cargaDynamic()");
initForms();

tblRegAdmCueDat[0] = "fideicomiso,83";
tblRegAdmCueDat[1] = "titular,200"; 
tblRegAdmCueDat[2] = "cuenta,120";
tblRegAdmCueDat[3] = "claveCta,70";
tblRegAdmCueDat[4] = "fechaCaptura,102";
tblRegAdmCueDat[5] = "tipoCuenta,150";
tblRegAdmCueDat[6] = "status,100";
tblRegAdmCueDat[7] = "statusCta,100";

var fechaInicio = new Date();

function ocultaObj2(strObj){
  GI(strObj).style.visibility = "hidden";
}

function limpiaObj(){
 GI("paramFecha").value = "";
}


//Agregando la funcionalidad para la Fecha Inicio Bitacora
  Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaInicio,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });

formsLoaded();

//Funciones para la funcionalidad de la Fecha Inicio Bitacora
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}
fvAdministracionCuentas.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
fvMantenimientoAdministracionCuentas.setup({
  formName      : "frmMantenimiento",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  verificaStatusCuenta();
}

function limpiar(objForma){
  RF(objForma);
  catTipocamb = new Catalogo("mx.com.inscitech.fiducia.domain.Tipocamb");
  ocultaObjs("paramStatus,paramCuenta,paramFecha,dvFecha");
  GI("dvFecha").value = "";
  GI("paramFecha").value = "";
  pkInfo = null;
}
function verificaStatusCuenta(){
  if(pkInfo.status == "RECHAZADA" || pkInfo.statusCta == "RECHAZADA" || pkInfo.status == "CANCELADA" || pkInfo.statusCta == "CANCELADA"){
      
    alert("El registro seleccionado no se puede modificar!");
    pkInfo = null;
  }else{
    if(pkInfo.status == "PENDIENTE")
      muestraObj("cmdAceptar");
    else
      ocultaObj("cmdAceptar");
    if(pkInfo.status == "PENDIENTE" && pkInfo.statusCta == "PENDIENTE"){
      //muestraObj("dvMotRechazo");
      //muestraObj("paramMotRechazo");
      muestraObj("cmdRechazar");
    }  
    else{
      //ocultaObj("dvMotRechazo");
      //ocultaObj("paramMotRechazo");    
      ocultaObj("cmdRechazar");
    }
    if(pkInfo.status == "PENDIENTE" && ((pkInfo.statusCta == "PENDIENTE")||(pkInfo.statusCta == "ACEPTADA"))){
      muestraObj("cmdCancelar");
      muestraObj("cmdRechazar");
    }
    else {
      ocultaObj("cmdCancelar");
      ocultaObj("cmdRechazar");
    }
    if(pkInfo.status == "CAPTURADA" && eval("20" + pkInfo.fechaCaptura.split("/")[2] + pkInfo.fechaCaptura.split("/")[1])  < 200703){
      //muestraObj("dvMotRechazo");
      //muestraObj("paramMotRechazo");    
      muestraObj("cmdRechazar");
    }  
    if(pkInfo.status == "CAPTURADA")
      ocultaObj("cmdModificar");
    else
      muestraObj("cmdModificar");
  }
}

function cargaPrincipalAdministracionCuentas() {
  onButtonClickPestania("ControlGestion.AdministracionCuentas.PrincipalAdministracionCuentas","");
}

function cargaMantenimientoAdministracionCuentas(Modo){
  modo = Modo;
  alert(modo);
  if(isDefinedAndNotNull(pkInfo) && Modo == OPER_MODIFICAR){
    //showWaitLayer();
    var urlCliente = "modules/ControlGestion/AdministracionCuentas/MantenimientoAdministracionCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAdministracionCuentas, null);
  }else if(isDefinedAndNotNull(pkInfo)){
    ejecutaOperacionAdministracionCuentas();
  }
}



function despliegaPantallaMantenimientoAdministracionCuentas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK(arrIdPK);
  habilitaPK(arrIdPK1);
  //habilitaObjs("titular".split(","));
  asignaValues2ObjHTML();
}


function asignaValues2ObjHTML(){
  for(i = 0;i < arrIdPK.length; i++){
    eval("GI('" + arrIdPK[i] + "').value = pkInfo." + arrIdPK[i]);
  }
  GI("banco").innerHTML = pkInfo.banco;
  formsLoaded();
}

function asignaValor2DivNombreBanco(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.innerHTML = objeto.nombre;
  }else{
    alert("Verifique la clave del Banco!");
    obj.innerHTML = "";
    GI("claveBanco").value = "";
    GI("claveBanco").focus();
  }
  hideWaitLayer();
}

function ejecutaOperacionAdministracionCuentas(){
  if(modo == 5){//Aceptar
  //var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeStoPolPreContabilizaCuenta\",\"Fideicomiso\":" + pkInfo.fideicomiso + ",\"Cuenta\":" + pkInfo.cuenta + ",\"Clave\":" + pkInfo.claveCta + "}";
  //makeAjaxRequest(url, "HTML", validaStorePreContabilizaCuenta, null);
  //alert(url);
  //alert("Fideicomiso"+pkInfo.fideicomiso);
    if(confirm("¿Esta seguro que desea Aceptar la Cuenta?")){
      showWaitLayer();
      actualizaCuenta("ACEPTADA");      
    }
  }else if(modo == 6){//Cancelar
    if(confirm("¿Esta seguro que desea Cancelar la Cuenta?")){
    showWaitLayer();
    actualizaCuenta("CANCELADA");
    }
  }else if(modo == 7){//Rechazar
    
    if(confirm("¿Esta seguro que desea Rechazar la Cuenta?")){
      motivoDelRechazo=prompt("MOTIVO POR EL CUAL VA A RECHAZAR LA CUENTA","");
      while(motivoDelRechazo==""||motivoDelRechazo==null||motivoDelRechazo.length<5){
          alert("Por favor escriba el motivo por el cual está rechazando la cuenta");
          motivoDelRechazo=prompt("MOTIVO DEL RECHAZO DE LA CUENTA LA CUENTA","");
     }
      GI("paramMotRechazo").value=motivoDelRechazo;
      showWaitLayer();
      actualizaCuenta("RECHAZADA");
      
      var parametros = getParameters(GI("frmDatos"));
      eval("parametros.Clave = " + pkInfo.claveCta);      
      eval("parametros.Fideicomiso = " + pkInfo.fideicomiso);
      
      if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("urlReporte"))) {
        var url = GI("urlReporte").value;
        for(k in parametros) {
          url += k + "=" + parametros[k] + "&";
        }
        url += "web=0";
        var link = GI("linkReporteNew");
        //link.href=url;
        //link.click();    
        return;
      }
      if(isDefinedAndNotNull(GI("template"))) parametros.template = GI("template").value;
      if(isDefinedAndNotNull(GI("nombreReporte"))) parametros.nombreReporte = GI("nombreReporte").value;
      if(isDefinedAndNotNull(GI("refSP"))) {      
        parametros.id = GI("refSP").value;

        var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
        makeAjaxRequest(url, "HTML", enviarCorreo, parametros);
      }  
      else {
      enviarCorreo(parametros, "{\"RESULTADO\":0}");
      }
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvMantenimientoAdministracionCuentas.checkForm()){
      //showWaitLayer();
      var url = ctxRoot + "/doRef.do?json={\"id\":\"updTitAdmCue\",\"Titular\":\"" + GI("titular").value +  "\",\"ClaveCta\":" + pkInfo.claveCta + "}";
      makeAjaxRequest(url, "HTML", null, null);
      alert("Operación realizada exitosamente!");
      hideWaitLayer();
     //onButtonClickPestania('ControlGestion.AdministracionCuentas.PrincipalAdministracionCuentas','');
      //GI(objButtonConsultar).click();
    }
  }
      fncActCuenta.Fideicomiso = pkInfo.fideicomiso;
      fncActCuenta.Cuenta = pkInfo.cuenta;
      fncActCuenta.Clave = pkInfo.claveCta;
      
      var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncActCuenta);
      makeAjaxRequest(url, "HTML", validaActualizaCuenta, null);      
}

function validaActualizaCuenta(obj, result) {
  var resultado = JSON.parse(result)[0];
  //onButtonClickPestania('ControlGestion.AdministracionCuentas.PrincipalAdministracionCuentas','');    
  GI(objButtonConsultar).click();
  formsLoaded();
}
function verificaResultadoStoAceptaCuenta(obj, result){
 var resultado = JSON.parse(result);
 //alert(resultado);
 hideWaitLayer(); 
}
 
function actualizaCuenta(strStatus){
  var objActualizaCuentaParam = JSON.parse("{\"id\":\"updStaAdmCue\"}");
  var objActualizaCuenta2Param = JSON.parse("{\"id\":\"updStaAdmCue3\"}");
  var objActualizaCuentaMotRechazo = JSON.parse("{\"id\":\"updStaAdmCueMotRechazo\"}");
  objActualizaCuentaParam.Status = strStatus;
  objActualizaCuentaParam.ClaveCta = pkInfo.claveCta;
  if(strStatus == "CANCELADA" || strStatus == "RECHAZADA")
    objActualizaCuentaParam.id = "updStaAdmCue2";
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objActualizaCuentaParam);
  makeAjaxRequest(url, "HTML", null, null);
  
  if(strStatus == "RECHAZADA"){
    objActualizaCuentaMotRechazo.Motivo = GI("paramMotRechazo").value;
    objActualizaCuentaMotRechazo.Folio = pkInfo.folio;
    objActualizaCuentaMotRechazo.ClaveCta = pkInfo.claveCta;
    objActualizaCuentaMotRechazo.Fideicomiso = pkInfo.fideicomiso;
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objActualizaCuentaMotRechazo);
    makeAjaxRequest(url, "HTML", null, null);
  }
  
  objActualizaCuenta2Param.Status = strStatus;
  objActualizaCuenta2Param.Fecha = GI("FechaContable").value;
  objActualizaCuenta2Param.Folio = pkInfo.folio;
  objActualizaCuenta2Param.ClaveCta = pkInfo.claveCta;
  objActualizaCuenta2Param.Fideicomiso = pkInfo.fideicomiso;
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objActualizaCuenta2Param);
  makeAjaxRequest(url, "HTML", null, null);
  consultar(GI("cmdAceptarC"),GI("frmDatos"),false);
  hideWaitLayer();
}

function enviarCorreo(obj, result){
    var objResult = JSON.parse(result);
    var idLink = "linkReporte"; 
    idLink = "linkReporteNew"; 
    obj.id = GI("refQry").value;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI(idLink);
    link.href=url;
    window.open(url,GI("linkReporteNew").value,"width=450,height=205,scrollbars=NO");   
    //link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }  
}

function consultarYOcultarBotones(btn, frm, reqParam) {
      
      ocultaObj("cmdAceptar");
      ocultaObj("cmdCancelar");
      ocultaObj("cmdRechazar");
      ocultaObj("cmdModificar");
  var parametros = getParameters(frm);
  if(reqParam && JSON.stringify(parametros) == "{}") {
    // TODO: Cambiar de alert a el mensaje de la aplicacion
    alert("Se requiere que almenos se especifique un parametro");
    return;
  }
  eval("parametros.id=\"" + GA(btn, "ref") + "\"")
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(parametros);
  var m = GA(btn, "fun"); // Nombre de la funcion a ejecutar
  var fun = isDefinedAndNotNull(m) ? eval(m) : null;
  showWaitLayer();
  makeAjaxRequest(url, "HTML", fun, GI(GA(btn, "tabla")));
}


function desplegarPantallaReporte() {
       
  showWaitLayer();
  var urlCliente = "modules/ControlGestion/Reportes/PrincipalReportesControlGestion.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaReporte, null);          
}


function despliegaPantallaReporte(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/ControlGestion/Reportes/PrincipalReportesControlGestion.js");
}

