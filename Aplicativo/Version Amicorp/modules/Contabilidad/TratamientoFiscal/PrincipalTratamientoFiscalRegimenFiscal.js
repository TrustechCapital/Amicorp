var catTratfisc = new Catalogo("mx.com.inscitech.fiducia.domain.Tratfisc");

var arrTblTraFisDat = new Array();
arrTblTraFisDat[0] = "trfCveTratfisc,70";
arrTblTraFisDat[1] = "trfClasific,500";

var fvCatTratfisc = new FormValidator();
var strIdPK = "trfCveTratfisc";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

fvCatTratfisc.setup({
  formName      : "frmMantenimientoTratamientoFiscal",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catTratfisc.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catTratfisc = new Catalogo("mx.com.inscitech.fiducia.domain.Tratfisc");
  pkInfo = null;
}

function cargaMantenimientoTratamientoFiscal(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/TratamientoFiscal/MantenimientoTratamientoFiscalRegimenFiscal.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoTratamientoFiscal, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionTratamientoFiscal();
  }
}

function despliegaPantallaMantenimientoTratamientoFiscal(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK(arrIdPK);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoTratamientoFiscal"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
  asignaValues2ObjHTML();
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catTratfisc.buscaCatalogoPK(false);
    formsLoaded();
  }else{
    loadElement(GI("trfCveTratfisc"));
  }
}

function ejecutaOperacionTratamientoFiscal(){
  if(modo == OPER_ALTA){
    if(fvCatTratfisc.checkForm()){
      showWaitLayer();
      catTratfisc.setOnUpdate(avisoOperacionCatalogo);
      catTratfisc.altaCatalogo();
      onButtonClickPestania("Contabilidad.TratamientoFiscal.PrincipalTratamientoFiscalRegimenFiscal","");
      hideWaitLayer();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatTratfisc.checkForm()){
      showWaitLayer();
      catTratfisc.setOnUpdate(avisoOperacionCatalogo);
      catTratfisc.modificaCatalogo();
      onButtonClickPestania("Contabilidad.TratamientoFiscal.PrincipalTratamientoFiscalRegimenFiscal","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    catTratfisc.setOnUpdate(avisoOperacionCatalogo);
    catTratfisc.bajaCatalogo(false);
    onButtonClickPestania("Contabilidad.TratamientoFiscal.PrincipalTratamientoFiscalRegimenFiscal","");
    hideWaitLayer();
  }
}