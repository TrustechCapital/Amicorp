var catOblfisc = new Catalogo("mx.com.inscitech.fiducia.domain.Oblfisc");

var arrTblOblFisDat = new Array();
arrTblOblFisDat[0] = "oblTipoImp,150";
arrTblOblFisDat[1] = "obfDescripcion,167";
arrTblOblFisDat[2] = "obfNumDeclar,122";
arrTblOblFisDat[3] = "obfPeriodo,55";
arrTblOblFisDat[4] = "obfPlazPres,154";
arrTblOblFisDat[5] = "obfLugarPres,168";
arrTblOblFisDat[6] = "obfFormato,100";

var fvCatOblfisc = new FormValidator();
var strIdPK = "obfCveObligfisc,oblTipoImp";
var arrIdPK = strIdPK.split(",");
var validaExistaRegistro = JSON.parse("{\"id\":\"verificarExistenciaRegistroClave\",\"numClave\":-1}");
var modo = 0;
pkInfo = null;

fvCatOblfisc.setup({
  formName      : "frmMantenimientoObligacionesFiscales",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catOblfisc.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catOblfisc = new Catalogo("mx.com.inscitech.fiducia.domain.Oblfisc");
  pkInfo = null;
}

function cargaMantenimientoObligacionesFiscales(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/ObligacionesFiscales/MantenimientoObligacionesFiscalesRegimenFiscal.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoObligacionesFiscales, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionObligacionesFiscales();
  }
}

function despliegaPantallaMantenimientoObligacionesFiscales(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK("obfCveObligfisc".split(","));
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoObligacionesFiscales"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
   // asignaValues2ObjHTML();    
    var Secuencial = JSON.parse("{\"id\":\"numSecClave\"}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(Secuencial);
    makeAjaxRequest(url, "HTML", verificarSecuencial, null);
}

function verificarSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("obfCveObligfisc").value=objResult[0].secNumClave;
  asignaValues2ObjHTML();  
  //hideWaitLayer();
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catOblfisc.buscaCatalogoPK(false);
    formsLoaded();
  }else{
    formsLoaded();
  }
}

function ejecutaOperacionObligacionesFiscales(){
  if(modo == OPER_ALTA){
    if(fvCatOblfisc.checkForm()){
      showWaitLayer();
      verificaObligacionFiscal();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatOblfisc.checkForm()){
      showWaitLayer();
      catOblfisc.setOnUpdate(avisoOperacionCatalogo);
      catOblfisc.modificaCatalogo();
      onButtonClickPestania("Contabilidad.ObligacionesFiscales.PrincipalObligacionesFiscalesRegimenFiscal","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    catOblfisc.setOnUpdate(avisoOperacionCatalogo);
    catOblfisc.bajaCatalogo(false);
    onButtonClickPestania("Contabilidad.ObligacionesFiscales.PrincipalObligacionesFiscalesRegimenFiscal","");
    hideWaitLayer();
  }
}

function verificaExistaClave() {
  if(GI("obfCveObligfisc").value!="")
  {
    validaExistaRegistro.numClave=GI("obfCveObligfisc").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaExistaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistaClave, null);
  }
}

function verificacionExistaClave(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La clave ya existe");
    GI("obfCveObligfisc").value="";
  }
}

function verificaObligacionFiscal(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiOblFis\",\"Clave\":\"" + GI("obfCveObligfisc").value + "\",\"TipoImpuesto\":\"" + GI("oblTipoImp").value + "\"}";
    makeAjaxRequest(url, "HTML", validaObligacionFiscal, null);
  }
}

function validaObligacionFiscal(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("Esta Obligación Fiscal ya existe!");
     hideWaitLayer();
  }else{
    catOblfisc.setOnUpdate(avisoOperacionCatalogo);
    catOblfisc.altaCatalogo();
    onButtonClickPestania("Contabilidad.ObligacionesFiscales.PrincipalObligacionesFiscalesRegimenFiscal","");
    hideWaitLayer();
  }
}