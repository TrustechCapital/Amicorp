showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FProgfid");
var fvCat = new FormValidator();
var strIdPK = "efidIdPrograma,efidIdFideicomiso";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var comboDestino = null;

var arrTblDat = new Array();
arrTblDat[0] = "efidIdPrograma,70px";
arrTblDat[1] = "eproNomPrograma,300px";
arrTblDat[2] = "efidIdFideicomiso,70px";
arrTblDat[3] = "ctoNomContrato,300px";
arrTblDat[4] = "efidStProgfid,100px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function clickTabla(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FProgfid");
  pkInfo = null;
  borraCombos("paramNumFiso");
}

function cargaMantenimientoFideicomisosProgramas(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/FideicomisosPrograma/MantenimientoFideicomisosPrograma.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisosPrograma, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoFideicomisosPrograma(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else
      muestraObjs("cmdAceptar,cmdCancelar");
  }else if(modo == OPER_ALTA  )
    muestraObjs("cmdAceptar,cmdCancelar");
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cat.setOnUpdate(formsLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaIndice();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaIndice();
  }
}
function verificaIndice(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiFisosProg\",\"NumPrograma\":" + GI("efidIdPrograma").value + ",\"NumFiso\":" + GI("efidIdFideicomiso").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionPrograma, modo);
  }
  if(modo == OPER_BAJA){
    cat.setOnUpdate(validaAvisoOperacionCatalogo);
    cat.bajaCatalogo(false);
  }
}

function validaOperacionPrograma(obj, result){
  resultado = JSON.parse(result);
  
  if(resultado[0].existeRegistro != 0){
    alert("El Resgistro ya existe!");
    hideWaitLayer();
  }else{
    cat.setOnUpdate(validaAvisoOperacionCatalogo);
    cat.altaCatalogo();
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.FideicomisosPrograma.PrincipalFideicomisosPrograma","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funcion para cargar el combo Fideicomisos luego de haber elegido alguna opción del combo Programa en la pantalla Principal
function cargaComboFideicomiso(objComboOrigen){
  borraCombos("paramNumFiso");
  paramCmbProg = JSON.parse("{\"NumPrograma\": " + objComboOrigen.value + ",\"order\":\"s\"}");
  loadElement(GI("paramNumFiso"));
}
