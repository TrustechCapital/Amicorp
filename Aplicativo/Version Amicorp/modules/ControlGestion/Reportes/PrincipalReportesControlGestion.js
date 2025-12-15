//var numContrato = GI("Fideicomiso").value;
var clavesCombo27 = JSON.parse("{\"llaveClave\":27}");

var deotra = "hola tu"

var fvRepCtasInd = new FormValidator();
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato1\",\"numContrato\":0}");
formsLoaded();

//Agregando funcionalidad para los parámetros de búsqueda obligatorios
fvRepCtasInd.setup({
  formName      : "frmReportes",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
////////////////////////////////////////////////////////////////////
//boton Aceptar de la pantalla Principal
function imprimirReporte() {
  if(fvRepCtasInd.checkForm())
  {
    showWaitLayer();
    var parametros = getParameters(GI("frmReportes"));
    eval("parametros.Tipo = " + GI("rdCtaspStatus").value);
    
    eval("parametros.Status = '" + GI("cmbStatus").value + "'");
    eval("parametros.Banco = '" + GI("cmbBanco").value + "'");
    eval("parametros.Fideicomiso = '" + GI("paramNumFideicomiso").value + "'");
    eval("parametros.Cuenta = '" + GI("paramCuenta").value + "'");
    
    //Determinar el reporte que va a imprimirse
    switch(parametros.Tipo) {
      case 1: case 2: case 3: case 4: eval("parametros.urlReporte = '/jsp/Reportes/ControlGestion/Cuentas.jsp'"); break;
      default: eval("parametros.urlReporte = '/jsp/Reportes/ControlGestion/Cuentas.jsp'"); break;
    }
    
    if(!isDefinedAndNotNull(parametros.sendToJSP) && isDefinedAndNotNull(GI("urlReporte"))) {
      var url = GI("urlReporte").value;
      for(k in parametros) {
        url += k + "=" + parametros[k] + "&";
      }
      url += "web=0";
     alert("parametros "+url); 
      var link = GI("linkReporteNew");
      link.href=url;
      link.click();    
      return;
    }
    if(isDefinedAndNotNull(GI("template"))) parametros.template = GI("template").value;
    if(isDefinedAndNotNull(GI("nombreReporte"))) parametros.nombreReporte = GI("nombreReporte").value;
    if(isDefinedAndNotNull(GI("refSP"))) {
      parametros.id = GI("refSP").value;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
      makeAjaxRequest(url, "HTML", validaImprimirReporte, parametros);
    } else {
      validaImprimirReporte(parametros, "{\"RESULTADO\":0}");
    }
    //showWaitLayer();
  //  makeAjaxRequest(url, "HTML", validaImprimirReporte, parametros);    
  }
}

function validaImprimirReporte(obj, result) {
  // TODO: Dejar el mensaje de espera hasta que se despliegue el guardar como
  var objResult = JSON.parse(result);
  if(objResult.RESULTADO == 0) { // Ejecucion OK
    var idLink = "linkReporte"; 
    idLink = "linkReporteNew"; 
    obj.id = GI("refQry").value;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI(idLink);
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  } 
  else if(objResult.RESULTADO == 1){ // Error
  }
  
  hideWaitLayer();
}
////////////////////////////////////////////////////////////////////
//Funcion para mostrar los objetos de acuerdo al combo seleccionado
function muestraObjetos(cad,obj) {
  asignaValueRadio2Master(cad,obj);
  
  //Ocultar todos los objetos
  GI("dvFideicomiso").style.visibility = "hidden";
  GI("paramNumFideicomiso").style.visibility = "hidden";
  GI("dvCuenta").style.visibility = "hidden";
  GI("paramCuenta").style.visibility = "hidden";
  GI("dvStatus").style.visibility = "hidden";
  GI("cmbStatus").style.visibility = "hidden";
  GI("dvBanco").style.visibility = "hidden";
  GI("cmbBanco").style.visibility = "hidden";
  GI("nomFideicomiso").style.visibility = "hidden";
  //Quitar el atributo required a los objetos
  RA(GI("paramNumFideicomiso"),"required");
  RA(GI("paramCuenta"),"required");
  RA(GI("cmbStatus"),"required");
  RA(GI("cmbBanco"),"required");
  
  //Colocar los objetos sin datos
  GI("dvFideicomiso").value = "";
  GI("dvCuenta").value = "";
  limpiaCombos("cmbBanco");
  limpiaCombos("cmbStatus");
  
  if(obj.id == "rdCtaspStatus") { //Consulta por Status
    GI("dvStatus").style.visibility = "visible";
    GI("cmbStatus").style.visibility = "visible";
    SA(GI("cmbStatus"),"required","true");
  }
  else if(obj.id == "rdCtaspBanco") { //Consulta por Banco
  
    //invocar la funcion que llena la lista de cmbBanco
    loadElement(eval("GI('cmbBanco')"));
    GI("dvBanco").style.visibility = "visible";
    GI("cmbBanco").style.visibility = "visible";
    SA(GI("cmbBanco"),"required","true");
  }
  else if(obj.id == "rdFideicomisospCta") { //Consulta por Cuenta
    GI("dvCuenta").style.visibility = "visible";
    GI("paramCuenta").style.visibility = "visible";
    SA(GI("paramCuenta"),"required","true");
  }
  else if(obj.id == "rdCtaspFideicomiso") { //Consulta por Fideicomiso
    GI("dvFideicomiso").style.visibility = "visible";
    GI("paramNumFideicomiso").style.visibility = "visible";
    SA(GI("paramNumFideicomiso"),"required","true");
  }
}

function verificaExistenciaRegistro() {
  if(GI("paramNumFideicomiso").value!="")
  {
    showWaitLayer();
    validacionAlta.numContrato = GI("paramNumFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato== 0)
  {
    alert("El Fideicomiso no existe, verifique");
    GI("paramNumFideicomiso").value="";
    GI("nomFideicomiso").style.visibility = "hidden";
  }
  else{
    GI("nomFideicomiso").style.visibility = "visible";
    consultaNombreFideicomiso("nomFideicomiso",GI("paramNumFideicomiso"));
  }  

  hideWaitLayer();
}