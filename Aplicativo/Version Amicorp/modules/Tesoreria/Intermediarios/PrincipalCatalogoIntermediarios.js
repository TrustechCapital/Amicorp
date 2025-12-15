var catIntermed = new Catalogo("mx.com.inscitech.fiducia.domain.Intermed");

showWaitLayer();

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var strIdPK = "intEntidadFin";
var arrIdPK = strIdPK.split(",");
var fvCatIntermed = new FormValidator();
var arrTblIntDat = new Array();
var modo = 0;
pkInfo = null;

initForms();

arrTblIntDat[0] = "intEntidadFin,90";
arrTblIntDat[1] = "intIntermediario,326";
arrTblIntDat[2] = "intRfc,137";
arrTblIntDat[3] = "intCveStInterme,100";

fvCatIntermed.setup({
  formName      : "frmMantenimientoIntermediarios",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catIntermed.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catIntermed = new Catalogo("mx.com.inscitech.fiducia.domain.Intermed");
  pkInfo = null;
}

function cargaMantenimientoIntermediarios(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/Intermediarios/MantenimientoCatalogoIntermediarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoIntermediarios, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIntermediario();
  }
}

function despliegaPantallaMantenimientoCatalogoIntermediarios(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoIntermediarios"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catIntermed.setOnUpdate(formsLoaded);
    catIntermed.buscaCatalogoPK(false);
  }else
    asignaSecuencialIntermediario();
}

function asignaSecuencialIntermediario(){
  var objSecuencial = GI("intEntidadFin");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"asiValSecInt\"}";
  makeAjaxRequest(url, "HTML", asignaValorSecuencialIntermediario, objSecuencial);
}

function asignaValorSecuencialIntermediario(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  formsLoaded();
}

function ejecutaOperacionIntermediario(){
  if(modo == OPER_ALTA){
    if(fvCatIntermed.checkForm()){
      showWaitLayer();
      verificaIntermediario();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatIntermed.checkForm()){
      showWaitLayer();
      catIntermed.setOnUpdate(avisoOperacionCatalogo);
      catIntermed.modificaCatalogo();
      onButtonClickPestania('Tesoreria.Intermediarios.PrincipalCatalogoIntermediarios','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catIntermed.setOnUpdate(avisoOperacionCatalogo);
    catIntermed.bajaCatalogo(false);
    onButtonClickPestania('Tesoreria.Intermediarios.PrincipalCatalogoIntermediarios','');
    hideWaitLayer();
  }
}
function verificaIntermediario(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiInt\",\"NumIntermediario\":" + GI("intEntidadFin").value + "}";
    makeAjaxRequest(url, "HTML", validaIntermediario, null);
  }
}

function validaIntermediario(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Intermediario ya existe!");
  }else{
    catIntermed.setOnUpdate(avisoOperacionCatalogo);
    catIntermed.altaCatalogo();
    onButtonClickPestania('Tesoreria.Intermediarios.PrincipalCatalogoIntermediarios','');
  }
  hideWaitLayer();
}