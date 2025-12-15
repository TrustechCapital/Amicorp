var catEmision = new Catalogo("mx.com.inscitech.fiducia.domain.Emision");

showWaitLayer();

var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbInstrumentoParam = JSON.parse("{\"tipoMercado\":-1}");
var strIdPK = "emiNumSecEmis,emiCveTipoMerca,emiNumInstrume";
var arrIdPK = strIdPK.split(",");
var fvCatEmisiones = new FormValidator();
var arrTblEmiDat = new Array();
var modo = 0;
pkInfo = null;

initForms();

arrTblEmiDat[0] = "cveDescClave,141";
arrTblEmiDat[1] = "insNomInstrume,218";
arrTblEmiDat[2] = "emiNumSecEmis,68";
arrTblEmiDat[3] = "emiNomPizarra,97";
arrTblEmiDat[4] = "emiNumSerEmis,98";
arrTblEmiDat[5] = "emiNumCuponVig,76";
arrTblEmiDat[6] = "emiCveStEmision,100";

fvCatEmisiones.setup({
  formName      : "frmMantenimientoEmisiones",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catEmision.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catEmision = new Catalogo("mx.com.inscitech.fiducia.domain.Emision");
  pkInfo = null;
}

function cargaMantenimientoEmisiones(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/Emisiones/MantenimientoCatalogoEmisiones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoEmisiones, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionEmision();
  }
}

function despliegaPantallaMantenimientoCatalogoEmisiones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoEmisiones"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValue2TipoMercado(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cmbInstrumentoParam.tipoMercado = catEmision.getCatalogo().emiCveTipoMerca;
    loadElement(GI("emiNumInstrume"));
    asignaValues2ObjHTML();
  }else
    formsLoaded();
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catEmision.setOnUpdate(formsLoaded);
    catEmision.buscaCatalogoPK(false);
  }
}
function asignaSecuencialEmision(objCmbMercado,objCmbInstrumento){
  if(objCmbMercado.value != -1 && objCmbInstrumento.value != -1){
    showWaitLayer();
    var objSecuencial = GI("emiNumSecEmis");
    var mercado = objCmbMercado.value;
    var instrumento = objCmbInstrumento.value;
    var url = ctxRoot + "/getRef.do?json={\"id\":\"asiValSecEmi\",\"Mercado\":" + mercado + ",\"Instrumento\":" + instrumento + "}";
    makeAjaxRequest(url, "HTML", asignaValorSecuencialEmision, objSecuencial);
  }else
    GI("emiNumSecEmis").value="";
}

function asignaValorSecuencialEmision(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  hideWaitLayer();
}
function asignaVariablesEmision(cmbMercado){
  limpiaCombos("emiNumInstrume");
  cmbInstrumentoParam.tipoMercado = cmbMercado.value; 
  loadElement(GI('emiNumInstrume')); 
  asignaSecuencialEmision(cmbMercado,GI('emiNumInstrume'));  
}

function ejecutaOperacionEmision(){
  if(modo == OPER_ALTA){
    if(fvCatEmisiones.checkForm()){
      showWaitLayer();
      verificaEmision();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatEmisiones.checkForm()){
      showWaitLayer();
      catEmision.setOnUpdate(avisoOperacionCatalogo);
      catEmision.modificaCatalogo();
      onButtonClickPestania('Tesoreria.Emisiones.PrincipalCatalogoEmisiones','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaEmision();
  }
}
function verificaEmision(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiEmi\",\"Emision\":" + GI("emiNumSecEmis").value + ",\"TipoMercado\":" + GI("emiCveTipoMerca").value + ",\"Instrumento\":" + GI("emiNumInstrume").value + "}";
    makeAjaxRequest(url, "HTML", validaEmision, OPER_ALTA);
  }else if(modo == OPER_BAJA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiEmiAsiPos\",\"Emisora\":\"" + pkInfo.emiNomPizarra + "\",\"Serie\":\"" + pkInfo.emiNumSerEmis + "\",\"Cupon\":" + pkInfo.emiNumCuponVig + "}";
    makeAjaxRequest(url, "HTML", validaEmision, OPER_BAJA);
  }
}

function validaEmision(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("La Emisión ya existe!");
      }else{
        catEmision.setOnUpdate(avisoOperacionCatalogo);
        catEmision.altaCatalogo();
        onButtonClickPestania('Tesoreria.Emisiones.PrincipalCatalogoEmisiones','');
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja una Emisión que se encuentre asignada a una Posición!");
        hideWaitLayer();
      }else{
        catEmision.setOnUpdate(avisoOperacionCatalogo);
        catEmision.bajaCatalogo(false);
        onButtonClickPestania('Tesoreria.Emisiones.PrincipalCatalogoEmisiones','');
      }
    break;
  }
  hideWaitLayer();
}