showWaitLayer();

var cmbLoadParam520 = JSON.parse("{\"Indice\":520,\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FFormula");
//var cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FAutrespon");
var fvCat = new FormValidator();
var strIdPK = "efrmIdFormula,efrmIdClasific";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var pkInfo2 = null;
pkInfo = null;

var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "efrmIdFormula,90px";
arrTblDat[1] = "eindDescripcion,150px";
arrTblDat[2] = "efrmNomFormula,200px";
arrTblDat[3] = "efrmDescripcion,200px";
arrTblDat[4] = "efrmStFormula,100px";

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
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FFormula");
  //cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FAutrespon");
  pkInfo = null;
  pkInfo2 = null;
}

function cargaMantenimientoFormulas(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Formulas/MantenimientoFormulas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFormulas, null);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/Formulas/MantenimientoEstructuraFormulas.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionFormula();
  }
}

function despliegaPantallaMantenimientoFormulas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObjs("cmdCancelar,cmdMantenimiento");
      habilitaPK("txtFormula".split(","));
      GI("txtFormula").disabled = true;
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    //alert("asignaValues2ObjHTML");
    cat.setOnUpdate(consultaComponentesFormula);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function consultaComponentesFormula() {
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conETForDet\",\"NoFormula\":" + eval(GI("efrmIdFormula").value) + ",\"TipoFormula\":" + eval(GI("efrmIdClasific").value) + ",\"order\": \"s\" }";
  makeAjaxRequest(url, "HTML", validaConsultaComponentesFormula, null);
}

function validaConsultaComponentesFormula(obj, result) {
 
  resultado = JSON.parse(result);
  
  if(isDefinedAndNotNull(resultado))
    for(i in resultado)
    {
      if(GI("txtFormula").value == "")
        GI("txtFormula").value = resultado[i].efrdNomTermino;
      else
        GI("txtFormula").value = GI("txtFormula").value + " " + resultado[i].efrdNomTermino;
    }
  
  formsLoaded();
}

function ejecutaOperacionFormula(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaFormula();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaFormula();
  }
}
function verificaFormula(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiFor\",\"NumFormula\":" + GI("efrmIdFormula").value + ",\"NumClasificacion\":" + GI("efrmIdClasific").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionFormula, modo);
  }
  if(modo == OPER_BAJA){  
    var url = ctxRoot + "/doRef.do?json={\"id\":\"delETForDetFormula\",\"TipoFormula\":" + pkInfo.efrmIdClasific + ",\"NoFormula\":" + pkInfo.efrmIdFormula + "}";
    makeAjaxRequest(url, "HTML", validaOperacionFormula, modo);
  }
}

function validaOperacionFormula(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Registro ya existe!");
        hideWaitLayer();
      }else{
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.altaCatalogo();
      }
    break;
    case OPER_BAJA:
        cat.setOnUpdate(validaAvisoOperacionCatalogo);
        cat.bajaCatalogo(false);
    break;
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.Formulas.PrincipalFormulas","");
  hideWaitLayer();
}