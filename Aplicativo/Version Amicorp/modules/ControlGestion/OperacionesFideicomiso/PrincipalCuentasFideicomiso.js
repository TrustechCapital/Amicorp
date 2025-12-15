var catCtasNafin = new Catalogo("mx.com.inscitech.fiducia.domain.Ctasnafin");

var tblRegCueNafFid = new Array();
var fvCtasNafin = new FormValidator();
var strIdPK = "ctnNumContrato";
var arrIdPK = strIdPK.split(",");
var divNombreFideicomisoParam;
var pkInfo = null;

tblRegCueNafFid[0] = "ctnNumContrato,100";
tblRegCueNafFid[1] = "cveDescClave,300";

fvCtasNafin.setup({
  formName      : "frmMantenimiento",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  RF(objForma);
  catCtasNafin = new Catalogo("mx.com.inscitech.fiducia.domain.Ctasnafin");
  pkInfo = null;
}
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catCtasNafin.getCatalogo());
}
function cargaMantenimientoCuentasFideicomiso(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/MantenimientoCuentasFideicomiso.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCuentasFideicomiso, GI("paramFideicomiso"));
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionCuentasFideicomiso();
  }
}

function despliegaPantallaMantenimientoCuentasFideicomiso(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK(arrIdPK);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    catCtasNafin.setOnUpdate(cargaComplementoCuentas);
    catCtasNafin.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    GI("ctnNumContrato").value = obj.value;
    cargaComplementoCuentas();
  }
}
function cargaComplementoCuentas(){
  GI("paramFideicomiso").value = GI("ctnNumContrato").value;
  var cmbBancoCuentaParam = JSON.parse("{\"id\":\"ejeFunObtenerCuentasBancos\"}");
  cmbBancoCuentaParam.Fideicomiso = eval(GI("ctnNumContrato").value);
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(cmbBancoCuentaParam);
  makeAjaxRequest(url, "HTML", cargaBancosCuentas, GI("ctnCuenta"));
}

function cargaBancosCuentas(obj, result){
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
  }else
    alert("Error al cargar los(as) Bancos / Cuentas!");
  consultaNombreFideicomiso('nomFideicomiso',GI("ctnNumContrato"));
  hideWaitLayer();
}
function ejecutaOperacionCuentasFideicomiso(){
  if(modo == OPER_ALTA){
    if(fvCtasNafin.checkForm()){
      showWaitLayer();
      verificaCuentaFideicomiso();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCtasNafin.checkForm()){
      showWaitLayer();
      var objUpdateParam = JSON.parse("{\"id\":\"updCueNafFid\"}");
      objUpdateParam.Cuenta = GI("ctnCuenta").value;
      objUpdateParam.Fideicomiso = eval(GI("ctnNumContrato").value);
      objUpdateParam.CuentaAnterior = catCtasNafin.getCatalogo().ctnCuenta;
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objUpdateParam);
      makeAjaxRequest(url, "HTML", cargaPrincipalCuentasFideicomiso,null);
      alert("Operación realizada exitosamente!");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catCtasNafin.setOnUpdate(avisoOperacionCatalogo);
    catCtasNafin.bajaCatalogo(false);
    cargaPrincipalCuentasFideicomiso();
    hideWaitLayer();
  }
}
function verificaCuentaFideicomiso(){
  if(modo == OPER_ALTA){
    var objCuentaParam = JSON.parse("{}");
    objCuentaParam.id = "verExiCueNafFid";
    objCuentaParam.Fideicomiso = GI("ctnNumContrato").value;
    objCuentaParam.Cuenta = GI("ctnCuenta").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCuentaParam);
    makeAjaxRequest(url, "HTML", validaCuentaFideicomiso, modo);
  }
}

function validaCuentaFideicomiso(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("La Cuenta se encuentra asignada al Fideicomiso!");
  }else{
    catCtasNafin.setOnUpdate(avisoOperacionCatalogo);
    catCtasNafin.altaCatalogo();
    cargaPrincipalCuentasFideicomiso();
  }
  hideWaitLayer();
}