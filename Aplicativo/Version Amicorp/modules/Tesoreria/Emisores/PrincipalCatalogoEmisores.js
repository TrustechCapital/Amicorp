var catEmisor = new Catalogo("mx.com.inscitech.fiducia.domain.Emisor");

showWaitLayer();

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbInstrumentoParam = JSON.parse("{\"tipoMercado\":-1}");
var strIdPK = "emsNumEmisor";
var arrIdPK = strIdPK.split(",");
var fvCatEmisor = new FormValidator();
var arrTblEmiDat = new Array();
var actNomRama;
var modo = 0;
pkInfo = null;

initForms();

arrTblEmiDat[0] = "emsNumEmisor,76";
arrTblEmiDat[1] = "actNomRama,303";
arrTblEmiDat[2] = "emsNomEmisor,201";
arrTblEmiDat[3] = "emsNomPaisOrig,188";
arrTblEmiDat[4] = "emsCveStEmisor,100";

fvCatEmisor.setup({
  formName      : "frmMantenimientoEmisores",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  actNomRama = pk.actNomRama;
  delete pk.actNomRama;
  pkInfo = pk;
  cloneObject(pk,catEmisor.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catEmisor = new Catalogo("mx.com.inscitech.fiducia.domain.Emisor");
  pkInfo = null;
}

function cargaMantenimientoEmisores(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/Emisores/MantenimientoCatalogoEmisores.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoEmisores, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionEmisor();
  }
}

function despliegaPantallaMantenimientoCatalogoEmisores(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoEmisores"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catEmisor.setOnUpdate(formsLoaded);
    catEmisor.buscaCatalogoPK(false);
    GI("actNomRama").value = actNomRama;
  }else
    asignaSecuencialEmisor();
}

function asignaSecuencialEmisor(){
  var objSecuencial = GI("emsNumEmisor");
  var url = ctxRoot + "/getRef.do?json={\"id\":\"asiValSecEmisor\"}";
  makeAjaxRequest(url, "HTML", asignaValorSecuencialEmisor, objSecuencial);
}

function asignaValorSecuencialEmisor(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  formsLoaded();
}

function consultaNumRamaNumSramaActividad(cmbActividad){
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conNumRamaNumSrama\",\"NomRama\":\"" + cmbActividad.value + "\"}";
  makeAjaxRequest(url, "HTML", asignaNumRamaNumSramaActividad, null);
}
function asignaNumRamaNumSramaActividad(obj, result){
  resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    catEmisor.getCatalogo().emsNumRama = resultado.actNumRama;
    catEmisor.getCatalogo().emsNumSrama = resultado.actNumSrama;
  }
  hideWaitLayer();
}
function ejecutaOperacionEmisor(){
  if(modo == OPER_ALTA){
    if(fvCatEmisor.checkForm()){
      showWaitLayer();
      verificaEmisor();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatEmisor.checkForm()){
      showWaitLayer();
      catEmisor.setOnUpdate(avisoOperacionCatalogo);
      catEmisor.modificaCatalogo();
      onButtonClickPestania('Tesoreria.Emisores.PrincipalCatalogoEmisores','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catEmisor.setOnUpdate(avisoOperacionCatalogo);
    catEmisor.bajaCatalogo(false);
    onButtonClickPestania('Tesoreria.Emisores.PrincipalCatalogoEmisores','');
    hideWaitLayer();
  }
}
function verificaEmisor(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiEmisor\",\"NumEmisor\":" + GI("emsNumEmisor").value + "}";
    makeAjaxRequest(url, "HTML", validaEmisor, null);
  }
}

function validaEmisor(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Emisor ya existe!");
  }else{
    catEmisor.setOnUpdate(avisoOperacionCatalogo);
    catEmisor.altaCatalogo();
    onButtonClickPestania('Tesoreria.Emisores.PrincipalCatalogoEmisores','');
  }
  hideWaitLayer();
}