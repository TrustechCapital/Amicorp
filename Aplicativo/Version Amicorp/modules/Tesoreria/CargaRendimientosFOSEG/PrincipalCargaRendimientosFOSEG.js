showWaitLayer();

var catRendimiFoseg = new Catalogo("mx.com.inscitech.fiducia.domain.RendimiFoseg");

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var strIdPK = "renNumFid,renNumContrato,renEjercicio";
var arrIdPK = strIdPK.split(",");
var fvCatRendimiFoseg = new FormValidator();
var tblRegPriCarRenFOSEGDat = new Array();
var cmbContratoInversionParam = JSON.parse("{\"Fideicomiso\":-1}");
var modo = 0;
pkInfo = null;

initForms();

tblRegPriCarRenFOSEGDat[0] = "renNumFid,79";
tblRegPriCarRenFOSEGDat[1] = "renNumContrato,147"; 
tblRegPriCarRenFOSEGDat[2] = "renEjercicio,73";
tblRegPriCarRenFOSEGDat[3] = "renImpXAsignar,170";

fvCatRendimiFoseg.setup({
  formName      : "frmMantenimientoCargaRendimientos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catRendimiFoseg.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catRendimiFoseg = new Catalogo("mx.com.inscitech.fiducia.domain.RendimiFoseg");
  pkInfo = null;
}

function cargaMantenimientoCargaRendimientos(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/CargaRendimientosFOSEG/MantenimientoCargaRendimientosFOSEG.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCargaRendimientos, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionCargaRendimientos();
  }
}

function despliegaPantallaMantenimientoCargaRendimientos(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoCargaRendimientos"));
      GI("cmdAceptar").disabled = true;
    }
  }else if(modo == OPER_ALTA)
    deshabilitaPK("renNumContrato".split(","));
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catRendimiFoseg.buscaCatalogoPK(false);
  }
  formsLoaded();
}

function ejecutaOperacionCargaRendimientos(){
  if(modo == OPER_ALTA){
    if(fvCatRendimiFoseg.checkForm()){
      showWaitLayer();
      verificaRendimiFoseg();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatRendimiFoseg.checkForm()){
      showWaitLayer();
      catRendimiFoseg.setOnUpdate(avisoOperacionCatalogo);
      catRendimiFoseg.modificaCatalogo();
      onButtonClick('Tesoreria.CargaRendimientosFOSEG.PrincipalCargaRendimientosFOSEG','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    if(confirm("¿Esta seguro que desea eliminar el Concepto?")){
      catRendimiFoseg.setOnUpdate(avisoOperacionCatalogo);
      catRendimiFoseg.bajaCatalogo(false);
      onButtonClick('Tesoreria.CargaRendimientosFOSEG.PrincipalCargaRendimientosFOSEG','');
    }
    hideWaitLayer();
  }
}

function verificaRendimiFoseg(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiRenFOSEG\"," + generaParametros("Fideicomiso,ContratoInversion,Ejercicio","renNumFid,renNumContrato,renEjercicio") + "}";
    makeAjaxRequest(url, "HTML", validaRendimiFoseg, null);
  }
}

function validaRendimiFoseg(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Rendimiento ya existe!");
  }else{
    catRendimiFoseg.setOnUpdate(avisoOperacionCatalogo);
    catRendimiFoseg.altaCatalogo();
    onButtonClick('Tesoreria.CargaRendimientosFOSEG.PrincipalCargaRendimientosFOSEG','');
  }
  hideWaitLayer();
}