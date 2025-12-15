var catCuentaco = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var strIdPK = "cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta";
var arrIdPK = strIdPK.split(",");
var fvCatCuentaco = new FormValidator();
var tblRegPriCatConFOSEG = new Array();
var objConceptoParam = JSON.parse("{\"id\":\"verExiConFOSEG\"}");
var modo = 0;
pkInfo = null;

tblRegPriCatConFOSEG[0] = "cueNumScta,80";
tblRegPriCatConFOSEG[1] = "cueNumSscta,80"; 
tblRegPriCatConFOSEG[2] = "cueNumSsscta,80";
tblRegPriCatConFOSEG[3] = "cueNumSssscta,80";
tblRegPriCatConFOSEG[4] = "cueNomCta,500";

fvCatCuentaco.setup({
  formName      : "frmMantenimientoCatalogoConceptosFOSEG",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catCuentaco.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catCuentaco = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");
  pkInfo = null;
}

function cargaMantenimientoCatalogoConceptosFOSEG(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/ConceptosFOSEG/MantenimientoCatalogoConceptosFOSEG.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoConceptosFOSEG, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionCatalogoConceptosFOSEG();
  }
}

function despliegaPantallaMantenimientoCatalogoConceptosFOSEG(obj, result) {
  GI("dvContenido").innerHTML = result;
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    catCuentaco.buscaCatalogoPK(false);
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoCatalogoConceptosFOSEG"));
      GI("cmdAceptar").disabled = true;
    }
  }
  formsLoaded();
}

function ejecutaOperacionCatalogoConceptosFOSEG(){
  if(modo == OPER_ALTA){
    if(fvCatCuentaco.checkForm()){
      showWaitLayer();
      verificaConceptoFOSEG();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatCuentaco.checkForm()){
      showWaitLayer();
      catCuentaco.setOnUpdate(avisoOperacionCatalogo);
      catCuentaco.modificaCatalogo();
      onButtonClick('Tesoreria.ConceptosFOSEG.PrincipalCatalogoConceptosFOSEG','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catCuentaco.setOnUpdate(avisoOperacionCatalogo);
    catCuentaco.bajaCatalogo(false);
    onButtonClick('Tesoreria.ConceptosFOSEG.PrincipalCatalogoConceptosFOSEG','');
    hideWaitLayer();
  }
}

function verificaConceptoFOSEG(){
  if(modo == OPER_ALTA){
    objConceptoParam.NumCtam = 7000
    objConceptoParam.NumEje = eval(GI("cueNumScta").value);
    objConceptoParam.NumPrograma = eval(GI("cueNumSscta").value);
    objConceptoParam.NumProyecto = eval(GI("cueNumSsscta").value);
    objConceptoParam.NumAccion = eval(GI("cueNumSssscta").value);
    objConceptoParam.NumNivel5 = 0;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objConceptoParam);
    makeAjaxRequest(url, "HTML", validaConceptoFOSEG, null);
  }
}

function validaConceptoFOSEG(obj, result){
  resultado = JSON.parse(result)[0];
  if(resultado.existeRegistro != 0){
    alert("Este Concepto FOSEG ya existe!");
    hideWaitLayer();
  }else{
    catCuentaco.setOnUpdate(avisoOperacionCatalogo);
    catCuentaco.altaCatalogo();
    onButtonClick('Tesoreria.ConceptosFOSEG.PrincipalCatalogoConceptosFOSEG','');
    hideWaitLayer();
  }
}