var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FiscalSat");

var strIdPK = "fsaNumContrato,fsaAno,fsaMes";
var arrIdPK = strIdPK.split(",");
var fvCat = new FormValidator();
var tblRegDat = new Array();
var modo = 0;
pkInfo = null;

initForms();

tblRegDat[0] = "fsaNumContrato,100";
tblRegDat[1] = "fsaAno,100"; 
tblRegDat[2] = "fsaMes,100";
tblRegDat[3] = "fsaTipo,100"; 
tblRegDat[4] = "fsaImporte,100";

fvCat.setup({
  formName      : "frmDatos2",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FiscalSat");
  pkInfo = null;
}

function cargaMantenimientoCatalogoUtilidadPerdida(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/UtilidadPerdidaFiscalSAT/MantenimientoUtilidadPerdidaFiscalSAT.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoUtilidadPerdidaFiscalSAT, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionUtilidadPerdida();
  }
}

function despliegaPantallaMantenimientoUtilidadPerdidaFiscalSAT(obj, result) {
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos2"));
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
    cat.buscaCatalogoPK(false);
  }
  hideWaitLayer();
}
function ejecutaOperacionUtilidadPerdida(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaUtilidadPerdida();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.setOnUpdate(avisoOperacionCatalogo);
      cat.modificaCatalogo();
      onButtonClickPestania('Contabilidad.UtilidadPerdidaFiscalSAT.PrincipalUtilidadPerdidaFiscalSAT','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    cat.setOnUpdate(avisoOperacionCatalogo);
    cat.bajaCatalogo(false);
    onButtonClickPestania('Contabilidad.UtilidadPerdidaFiscalSAT.PrincipalUtilidadPerdidaFiscalSAT','');
    hideWaitLayer();  
  }
}
function verificaUtilidadPerdida(){
  if(modo == OPER_ALTA){
    var objParam = JSON.parse("{}");
    objParam.id = "verExiUtiPerFisSAT";
    objParam.Fideicomiso = eval(GI("fsaNumContrato").value);
    objParam.Ano = eval(GI("fsaAno").value);
    objParam.Mes = eval(GI("fsaMes").value);
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objParam);
    makeAjaxRequest(url, "HTML", validaUtilidadPerdida, null);
  }
}

function validaUtilidadPerdida(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Registro de Utilidad / Pérdida ya existe!");
  }else{
    cat.setOnUpdate(avisoOperacionCatalogo);
    cat.altaCatalogo();
    onButtonClickPestania('Contabilidad.UtilidadPerdidaFiscalSAT.PrincipalUtilidadPerdidaFiscalSAT','');
  }
  hideWaitLayer();
}