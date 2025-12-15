var arrTblDat2 = new Array();
arrTblDat2[0] = "eindIdIndice,80";
arrTblDat2[1] = "eindIdSubindice,80";
arrTblDat2[2] = "eindDescripcion,300";
arrTblDat2[3] = "eindFormaEmp,300";
arrTblDat2[4] = "eindStIndices,100";

var strIdPK2 = "eindIdIndice,eindIdSubindice";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;
pkInfo2 = null;

function clickTabla2(pk) {
  cloneObject(pk,cat2.getCatalogo());
  pkInfo2 = pk;
}

function cargaMantenimientoEstructuraIndices(Modo) {
  modo2 = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Indices/MantenimientoEstructuraCatalogoIndices.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalEstructuraIndices, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionEstructura();
  }
}

function despliegaPantallaPrincipalEstructuraIndices(obj, result) {
  //GI("dvPantalla").innerHTML = result;
  GI("dvContenido").innerHTML = result;
  deshabilitaPK("ecinIdIndice,ecinDescripcion".split(","));
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
  GI("eindIdIndice").value = pkInfo.ecinIdIndice;
  if(isDefinedAndNotNull(pkInfo2) && modo2 != OPER_ALTA){
    cat2.setOnUpdate(formsLoaded);
    cat2.buscaCatalogoPK(false);
  }else{
    asignaSecuencial();
  }
}

function asignaSecuencial(){
  var objSecuencial = GI("eindIdSubindice");
  var indice = pkInfo.ecinIdIndice;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"asiETValSecEstInd\",\"Indice\":" + indice + "}";
  makeAjaxRequest(url, "HTML", asignaValorSecuencial, objSecuencial);
}

function asignaValorSecuencial(obj, result){
  resultado = JSON.parse(result);
  obj.value = resultado[0].numSecuencial;
  formsLoaded();
}
function ejecutaOperacionEstructura(){
  cat2.setOnUpdate(avisoOperacionCatalogo);
  showWaitLayer();
  switch(modo2){
    case OPER_ALTA:
    case OPER_MODIFICAR:
      if(fvCat.checkForm()){
        if(modo2 == OPER_ALTA){
          showWaitLayer();
          verificaEstructuraIndice();
        }else{
          cat2.modificaCatalogo();
          cargaMantenimientoCatalogoIndices(modo);
        }
      }
    break;
    case OPER_BAJA:
      cat2.bajaCatalogo(false);
      cargaMantenimientoCatalogoIndices(modo);
    break;
  }
  hideWaitLayer();
}
function verificaEstructuraIndice(){
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiEstInd\",\"Indice\":" + GI("eindIdIndice").value + ",\"SubIndice\":" + GI("eindIdSubindice").value + "}";
  makeAjaxRequest(url, "HTML", validaOperacionEstructuraIndice, null);
}

function validaOperacionEstructuraIndice(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Registro ya existe!");
  }else{
    cat2.altaCatalogo();
    cargaMantenimientoCatalogoIndices(modo);
  }
  hideWaitLayer();
}