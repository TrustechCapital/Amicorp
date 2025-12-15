var catInstrume = new Catalogo("mx.com.inscitech.fiducia.domain.Instrume");
showWaitLayer();

var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbClasificacionParam = JSON.parse("{\"chido\":12}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var strIdPK = "insCveTipoMerca,insNumInstrume";
var arrIdPK = strIdPK.split(",");
var fvCatInstrume = new FormValidator();
var arrTblInsDat = new Array();
var modo = 0;
pkInfo = null;

initForms();

arrTblInsDat[0] = "insCveTipoMerca,83";
arrTblInsDat[1] = "insNumInstrume,76";
arrTblInsDat[2] = "insNomInstrume,234";
arrTblInsDat[3] = "insMnemoInstrume,120";
arrTblInsDat[4] = "insCveStInstrum,100";

fvCatInstrume.setup({
  formName      : "frmMantenimientoInstrumentos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catInstrume.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catInstrume = new Catalogo("mx.com.inscitech.fiducia.domain.Instrume");
  pkInfo = null;
}

function cargaMantenimientoInstrumentos(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/Instrumentos/MantenimientoCatalogoInstrumentos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoInstrumentos, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionInstrumento();
  }
}

function despliegaPantallaMantenimientoCatalogoInstrumentos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoInstrumentos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catInstrume.setOnUpdate(formsLoaded);
    catInstrume.buscaCatalogoPK(false);
  }else
    formsLoaded();
}

function asignaSecuencialInstrumento(objCmbMercado){
  if(objCmbMercado.value != -1){
    showWaitLayer();
    var objSecuencial = GI("insNumInstrume");
    var mercado = objCmbMercado.value;
    var url = ctxRoot + "/getRef.do?json={\"id\":\"asiValSecIns\",\"Mercado\":" + mercado + "}";
    makeAjaxRequest(url, "HTML", asignaValorSecuencialInstrumento, objSecuencial);
  }else
    GI("insNumInstrume").value="";
}

function asignaValorSecuencialInstrumento(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  hideWaitLayer();
}

function ejecutaOperacionInstrumento(){
  if(modo == OPER_ALTA){
    if(fvCatInstrume.checkForm()){
      showWaitLayer();
      verificaInstrumento();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatInstrume.checkForm()){
      showWaitLayer();
      catInstrume.setOnUpdate(avisoOperacionCatalogo);
      catInstrume.modificaCatalogo();
      onButtonClickPestania('Tesoreria.Instrumentos.PrincipalCatalogoInstrumentos','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    catInstrume.setOnUpdate(avisoOperacionCatalogo);
    catInstrume.bajaCatalogo(false);
    onButtonClickPestania('Tesoreria.Instrumentos.PrincipalCatalogoInstrumentos','');
    hideWaitLayer();
  }
}
function verificaInstrumento(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiIns\",\"Mercado\":\"" + GI("insCveTipoMerca").value + "\",\"NumInstrumento\":\"" + GI("insNumInstrume").value + "\"}";
    makeAjaxRequest(url, "HTML", validaInstrumento, null);
  }
}

function validaInstrumento(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("Este Instrumento ya existe!");
    hideWaitLayer();
  }else{
    catInstrume.setOnUpdate(avisoOperacionCatalogo);
    catInstrume.altaCatalogo();
    onButtonClickPestania('Tesoreria.Instrumentos.PrincipalCatalogoInstrumentos','');
    hideWaitLayer();
  }
}