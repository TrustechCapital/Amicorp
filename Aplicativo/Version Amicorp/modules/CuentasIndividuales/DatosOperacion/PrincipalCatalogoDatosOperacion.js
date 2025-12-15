var cat = new Catalogo("mx.com.inscitech.fiducia.domain.Datoscalculo");

var strIdPK = "datEntClave";
var arrIdPK = strIdPK.split(",");
var fvCat = new FormValidator();
var tblRegDat = new Array();
var modo = 0;
var divNombreFideicomisoParam;
var fechaDefault = new Date();
var cmbStatusParam = JSON.parse("{\"chido\":31}");
pkInfo = null;
var modifica = JSON.parse("{\"id\":\"modCatDatosOpe\",\"clave\":\"0\"}");
var objParametros = JSON.parse("{\"id\":\"ejefundiasinhabiles\"}");
var numContrato = GI("paramFideicomiso").value;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

tblRegDat[0] = "datFecha,110";
tblRegDat[1] = "datTasa,115"; 
tblRegDat[2] = "datCveRetIsr,100";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

function cargaMantenimientoCatalogoDatosOperacion(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/CuentasIndividuales/DatosOperacion/MantenimientoCatalogoDatosOperacion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDatosOperacion, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDatosOperacion();
  }
}

function despliegaPantallaMantenimientoCatalogoDatosOperacion(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
  //GI("dvContenido").innerHTML = result;

  setCalendario();
  initForms();
  deshabilitaPK(arrIdPK);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK("datFecha".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
      ocultaObj("cmdAceptar");
      //GI("cmdAceptar").disabled = true;
    }
  }
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cat.setOnUpdate(cargaComplemento);
    cat.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    GI("datEntClave").value = numContrato;
    
    var objTasaISR = JSON.parse("{\"id\":\"conDatOpeTasISR\",\"Fideicomiso\":" + numContrato + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objTasaISR);
    makeAjaxRequest(url, "HTML", validaTasaISR, GI("datTasaIsr"));
    consultaNombreFideicomiso("nomFideicomiso",GI("datEntClave"));
  }
}
function cargaComplemento(){
  cat.setOnUpdate(avisoOperacionCatalogo);
  consultaNombreFideicomiso("nomFideicomiso",GI("datEntClave"));
}

function validaTasaISR(obj, result) {
  resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado[0].pafTasaIsr)){
    obj.value = resultado[0].pafTasaIsr;
    if(resultado[0].pafTasaIsr!=0)
        GI("datCveRetIsrChk").checked=true;
  }
  consultaNombreFideicomiso("nomFideicomiso",GI("datEntClave"));
}

function ejecutaOperacionDatosOperacion(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaDatosOperacion();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.setOnUpdate(avisoOperacionCatalogo);
      cat.modificaCatalogo();
      onButtonClickPestania('CuentasIndividuales.DatosOperacion.PrincipalCatalogoDatosOperacion','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    if(confirm("Al eliminar este registro, eliminará cualquier otro Nivel que dependa de éste. ¿Desea eliminar el registro?")){
      eval("objParametros.Opcion=2");
      eval("objParametros.Fecha='" + pkInfo.datFecha+"'");
      eval("objParametros.Tasa=0");        
      eval("objParametros.Fideicomiso=" + pkInfo.datEntClave); 
      eval("objParametros.CveRetIsr=0"); 
      eval("objParametros.TasaIsr=0"); 
      
      var urlFuncCierre = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
      makeAjaxRequest(urlFuncCierre, "HTML", respuestaFuncionBaja, null); 
    }
  }  //
    hideWaitLayer();
}

function respuestaFuncionBaja(obj, result){
  var res=JSON.parse(result).result;
  switch(res){
   case 0:     
    cat.setOnUpdate(nothing);
    //for(var i = eval(pkInfo.estNivel); i <= 3; i++){
    //  cat.getCatalogo().estNivel = i;
    eliminaCatalogo(cat);
    //cat.bajaCatalogo(false);
    onButtonClickPestania('CuentasIndividuales.DatosOperacion.PrincipalCatalogoDatosOperacion','');    
    alert("Proceso exitoso"); 
    break;
   default: alert("Ocurrió un error");
  }  
  hideWaitLayer();
}

function ejecutaCambio(obj, result){
  var objResult = JSON.parse(result);
  
  eval("objParametros.Opcion=1");
  eval("objParametros.Fecha='" + GI("datFecha").value+"'");
  eval("objParametros.Tasa=" + GI("datTasa").value); 
  eval("objParametros.Fideicomiso=" + numContrato); 
  //alert("la clave de retencion es "+GI("datCveRetIsrChk").checked);
  if (GI("datCveRetIsrChk").checked==true)
    eval("objParametros.CveRetIsr=1"); 
  else
    eval("objParametros.CveRetIsr=0"); 
  eval("objParametros.TasaIsr="+ GI("datTasaIsr").value); 
  
  var urlFuncCierre = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(urlFuncCierre, "HTML", respuestaFuncionAlta, null);  

  }

function respuestaFuncionAlta(obj, result){
  var res=JSON.parse(result).result;
  switch(res){
   case 0:    
    cat.setOnUpdate(avisoOperacionCatalogo);
    cat.altaCatalogo();   
    onButtonClickPestania('CuentasIndividuales.DatosOperacion.PrincipalCatalogoDatosOperacion','');
    //alert("Proceso exitoso"); 
    break;
   default: alert("Ocurrió un error");
  }  
  hideWaitLayer();
}

function verificaDatosOperacion(){
  var objExisteDatos = JSON.parse("{}");
  objExisteDatos.id = "verExiDatOpe";
  objExisteDatos.Fideicomiso =  eval(GI("datEntClave").value);
  objExisteDatos.Fecha = GI("datFecha").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteDatos);
  makeAjaxRequest(url, "HTML", validaDatosOperacion, null);
}

function validaDatosOperacion(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("Los Datos de Operación ya existen!");
  }else{
    verificaFechaMesAnteriorFideicomiso();
  }
 hideWaitLayer();
}

function nothing(){}

Calendar.setup({
      inputField     :    "paramFechaInicio",
      button         :    "paramFechaInicio",
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    null,
      disableFunc    :    isValidDate,
      date           :    fechaDefault,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
});
Calendar.setup({
      inputField     :    "paramFechaFin",
      button         :    "paramFechaFin",
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    null,
      disableFunc    :    isValidDate,
      date           :    fechaDefault,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
});  

function isValidDate(date){
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}


function setCalendario(){
  Calendar.setup({
        inputField     :    "datFecha",
        button         :    "datFecha",
        ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
        showsTime      :    false,
        timeFormat     :    "24",
        onUpdate       :    null,
        disableFunc    :    isValidDate,
        date           :    fechaDefault,
        weekNumbers    :    false,
        cache          :    true,
        step           :    1
    });
}

function verificaFechaMesAnteriorFideicomiso(){
  var fecha = GI("datFecha").value;
  var fideicomiso = GI("datEntClave").value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesMovCtaIndDatOper\",\"Fecha\":\"" + fecha + "\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaFechaMesAnterior, GI("datFecha"));
}
function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado.result)){
    switch(resultado.result){
      case 0:
        modifica.clave=GI("datEntClave").value;
        var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(modifica);
        makeAjaxRequest(url, "HTML", ejecutaCambio, null);        
        break;
      case 2:
        alert("El Mes se encuentra Capitalizado");
        obj.focus();
        break;      
      case 1:
      case -1:
        alert("No es posible introducir movimientos a esta Fecha");
        obj.focus();
        break;
    }
  }  
  hideWaitLayer();
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 