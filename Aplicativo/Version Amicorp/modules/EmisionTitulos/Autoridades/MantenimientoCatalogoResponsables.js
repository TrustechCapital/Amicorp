var arrTblDat2 = new Array();
arrTblDat2[0] = "eareIdResponsable,80";
arrTblDat2[1] = "eareNomResponsable,300";
arrTblDat2[2] = "eareNomPuestRespo,300";
arrTblDat2[3] = "eareStAutrespon,100";

var strIdPK2 = "eareIdAutoridad,eareIdResponsable";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;
pkInfo2 = null;

function clickTabla2(pk) {
  cloneObject(pk,cat2.getCatalogo());
  pkInfo2 = pk;
}

function cargaMantenimientoCatalogoResponsables(Modo) {
  modo2 = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Autoridades/MantenimientoCatalogoResponsables.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalCatalogoResponsables, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionResponsable();
  }
}

function despliegaPantallaPrincipalCatalogoResponsables(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK("eautIdAutoridad,eautNomAutoridad".split(","));
  initForms();
  if(modo2 == OPER_CONSULTAR || modo2 == OPER_MODIFICAR){ 
    deshabilitaPK(arrIdPK2);
    if(modo2 == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo2 == OPER_ALTA || modo2 == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}
function asignaValues2ObjHTML2(){
  asignaValues2ObjHTML();
  GI("eareIdAutoridad").value = pkInfo.eautIdAutoridad;
  if(isDefinedAndNotNull(pkInfo2) && modo2 != OPER_ALTA){
    cat2.setOnUpdate(formsLoaded);
    cat2.buscaCatalogoPK(false);
  }else{
    asignaSecuencial();
  }
}

function asignaSecuencial(){
  var objSecuencial = GI("eareIdResponsable");
  var autoridad = pkInfo.eautIdAutoridad;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"asiETValSecRes\",\"Autoridad\":" + autoridad + "}";
  makeAjaxRequest(url, "HTML", asignaValorSecuencial, objSecuencial);
}

function asignaValorSecuencial(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  formsLoaded();
}
function ejecutaOperacionResponsable(){
  cat2.setOnUpdate(avisoOperacionCatalogo);
  showWaitLayer();
  switch(modo2){
    case OPER_ALTA:
    case OPER_MODIFICAR:
      if(fvCat.checkForm()){
        if(modo2 == OPER_ALTA){
          showWaitLayer();
          verificaOperacionResponsable();
        }else{
          cat2.modificaCatalogo();
          cargaMantenimientoCatalogoAutoridades(modo);
        }
      }
    break;
    case OPER_BAJA:
      cat2.bajaCatalogo(false);
      cargaMantenimientoCatalogoAutoridades(modo);
    break;
  }
  hideWaitLayer();
}
function verificaOperacionResponsable(){
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiRes\",\"Autoridad\":" + GI("eareIdAutoridad").value + ",\"Responsable\":" + GI("eareIdResponsable").value + "}";
  makeAjaxRequest(url, "HTML", validaOperacionResponsable, null);
}

function validaOperacionResponsable(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Registro ya existe!");
  }else{
    cat2.altaCatalogo();
    cargaMantenimientoCatalogoAutoridades(modo);
  }
  hideWaitLayer();
}