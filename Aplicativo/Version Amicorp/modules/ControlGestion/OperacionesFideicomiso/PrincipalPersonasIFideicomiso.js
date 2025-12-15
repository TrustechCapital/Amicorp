var catPersonasinternet = new Catalogo("mx.com.inscitech.fiducia.domain.Personasinternet");

var cmbTipoPersonaParam = JSON.parse("{\"chido\":166}");
var tblRegPerIntDat = new Array();
var fvCtasNafin = new FormValidator();
var strIdPK = "pinNumContrato";
var arrIdPK = strIdPK.split(",");
var divNombreFideicomisoParam;
var pkInfo = null;
var opcion = 0;

tblRegPerIntDat[0] = "pinTipoPers,100";
tblRegPerIntDat[1] = "persona,150";
tblRegPerIntDat[2] = "formaLiquidacion,300";
tblRegPerIntDat[3] = "pinTipoOperacion,100";

fvCtasNafin.setup({
  formName      : "frmMantenimiento",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catPersonasinternet.getCatalogo());
  opcion = 1;
}
function cargaMantenimientoPersonasIFideicomiso(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/MantenimientoPersonasIFideicomiso.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoPersonasIFideicomiso, GI("paramFideicomiso"));
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionPersonasIFideicomiso();
  }
}

function despliegaPantallaMantenimientoPersonasIFideicomiso(obj, result) {
  GI("dvPantalla").innerHTML = result;
  GI("pinNumContrato").value = obj.value;
  GI("paramFideicomiso").value = obj.value;
  initForms();
  deshabilitaPK(arrIdPK);
}
function asignaValues2ObjHTML(){
  if(modo == OPER_MODIFICAR){
    catPersonasinternet.buscaCatalogoPK(false);
    if(pkInfo.pinTipoOperacion =="DEPOSITO"){
      ocultaObjs("pinFormaLiq");
      GI("pinTipoOperacion").value = pkInfo.pinTipoOperacion;
      RA(GI("pinFormaLiq"),"required","true");
      RA(GI("pinTipoOperacion"),"required","true");
    }else{
      GI("pinTipoOperacion").value = pkInfo.pinTipoOperacion;
      SA(GI("pinFormaLiq"),"required","true");
      RA(GI("pinTipoOperacion"),"required","true");
    }
    ocultaObjs("pinTipoOperacion,pinTipoOperacion1,dvDeposito,dvRetiro");
  }
  formsLoaded();
}
function decideCargaPersona(){
  if(modo != OPER_ALTA){
    cargaPersona(1);
  }else
    hideWaitLayer();
}
function cargaPersona(opc){
  limpiaCombos("pinNumPersona");
  borraCombos("pinNumPersona");
  var cmbConsultasParam = JSON.parse("{\"id\":\"ejeFunDevuelveInfo\"}");
  if(opc == 1)
    cmbConsultasParam.Tipo = (pkInfo.pinTipoPers=="TERCERO")?10:11;
  if(opc == 2){
    cmbConsultasParam.Tipo = (GI("pinTipoPers").value=="TERCERO")?10:11;
    showWaitLayer();
  }
  cmbConsultasParam.Fideicomiso = eval(GI("pinNumContrato").value);
  cmbConsultasParam.Ano = 0;
  cmbConsultasParam.Mes = 0;
  cmbConsultasParam.Opcion = (modo == OPER_MODIFICAR)?1:0;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(cmbConsultasParam);
  makeAjaxRequest(url, "HTML", cargaComboPersona, GI("pinNumPersona"));
}

function cargaComboPersona(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    resultado = resultado.substring(1,resultado.length);
    var auxArreglo = new Array;
    var arrDatos = resultado.split(";");
    for(i=0; i < arrDatos.length; i++){
      auxArreglo[i] = new Object();
      auxArreglo[i].id = arrDatos[i].split("-")[0];
      auxArreglo[i].descripcion = arrDatos[i].split("-")[1];
    }
    loadCombo(obj,auxArreglo,GA(obj,"keyValue"),GA(obj,"theValue"));
    cargaFormaLiquidacion();
  }else{
    alert("No existen Personas disponibles!");
    hideWaitLayer();
  }
}
function cargaFormaLiquidacion(){
  var cmbConsultasParam = JSON.parse("{\"id\":\"ejeFunDevuelveInfo\"}");
  cmbConsultasParam.Tipo = 13;
  cmbConsultasParam.Fideicomiso = eval(GI("pinNumContrato").value);
  cmbConsultasParam.Ano = 0;
  cmbConsultasParam.Mes = 0;
  cmbConsultasParam.Opcion = (modo == OPER_MODIFICAR)?1:0;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(cmbConsultasParam);
  makeAjaxRequest(url, "HTML", cargaComboFormaLiquidacion, GI("pinFormaLiq"));
}

function cargaComboFormaLiquidacion(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    resultado = resultado.substring(1,resultado.length);
    var auxArreglo = new Array;
    var arrDatos = resultado.split(";");
    for(i=0; i < arrDatos.length; i++){
      auxArreglo[i] = new Object();
      auxArreglo[i].id = arrDatos[i].split("-")[0];
      auxArreglo[i].descripcion = arrDatos[i].split("-")[1];
    }
    loadCombo(obj,auxArreglo,GA(obj,"keyValue"),GA(obj,"theValue"));
  }else{
    alert("No Existen Formas de Liquidación disponibles!");
    hideWaitLayer();
  }
  asignaValues2ObjHTML();
  hideWaitLayer();
}
function ejecutaOperacionPersonasIFideicomiso(){
  if(modo == OPER_ALTA){
    if(fvCtasNafin.checkForm()){
      showWaitLayer();
      verificaPersonaIFideicomiso();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCtasNafin.checkForm()){
      showWaitLayer();
      var objUpdateParam = JSON.parse("{\"id\":\"updPerIntFid\"}");
      objUpdateParam.NumPersona = eval(GI("pinNumPersona").value);
      objUpdateParam.TipoPersona = GI("pinTipoPers").value;
      objUpdateParam.Forma = GI("pinTipoOperacion").value!="DEPOSITO"?eval(GI("pinFormaLiq").value):0;
      objUpdateParam.TipoOperacion = GI("pinTipoOperacion").value;
      objUpdateParam.Fideicomiso = GI("pinNumContrato").value;
      objUpdateParam.NumPersonaAnt = eval(catPersonasinternet.getCatalogo().pinNumPersona);
      objUpdateParam.TipoPersonaAnt = catPersonasinternet.getCatalogo().pinTipoPers;
      objUpdateParam.TipoOperacionAnt = catPersonasinternet.getCatalogo().pinTipoOperacion;
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objUpdateParam);
      makeAjaxRequest(url, "HTML", cargaPrincipalPersonasIFideicomiso,null);
      alert("Operación realizada exitosamente!");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catPersonasinternet.setOnUpdate(avisoOperacionCatalogo);
    catPersonasinternet.bajaCatalogo(false);
    cargaPrincipalPersonasIFideicomiso();
    hideWaitLayer();
  }
}
function verificaPersonaIFideicomiso(){
  if(modo == OPER_ALTA){
    var objPersonaParam = JSON.parse("{}");
    objPersonaParam.id = "verExiPerIntFid";
    objPersonaParam.Fideicomiso = GI("pinNumContrato").value;
    objPersonaParam.NumPersona = GI("pinNumPersona").value;
    objPersonaParam.TipoPersona = GI("pinTipoPers").value;
    objPersonaParam.Forma = GI("pinFormaLiq").value;
    objPersonaParam.TipoOperacion = GI("pinTipoOperacion").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objPersonaParam);
    makeAjaxRequest(url, "HTML", validaPersonaIFideicomiso, 1);
  }
}

function validaPersonaIFideicomiso(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El registro ya existe!");
  }else{
    switch(obj){
      case 1:
        if(modo == OPER_ALTA){
          showWaitLayer();
          var objPersonaParam = null;
          var objPersonaParam = JSON.parse("{}");
          objPersonaParam.id = "verExiPerIntFid2";
          objPersonaParam.Fideicomiso = GI("pinNumContrato").value;
          objPersonaParam.TipoPersona = GI("pinTipoPers").value;
          objPersonaParam.NumPersona = GI("pinNumPersona").value;
          var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objPersonaParam);
          makeAjaxRequest(url, "HTML", validaPersonaIFideicomiso, 2);
        }
      case 2:
        if(modo == OPER_ALTA && obj == 2){
          catPersonasinternet.setOnUpdate(avisoOperacionCatalogo);
          catPersonasinternet.altaCatalogo();
          cargaPrincipalPersonasIFideicomiso(); 
        }
      break;
    }
  }
  hideWaitLayer();
}