showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAutoridad");
var cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FAutrespon");
var fvCat = new FormValidator();
var strIdPK = "eautIdAutoridad";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var pkInfo2 = null;
pkInfo = null;

var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "eautIdAutoridad,60px";
arrTblDat[1] = "eautNomAutoridad,300px";
arrTblDat[2] = "eautDirAutoridad,300px";
arrTblDat[3] = "eautStAutoridad,100px";

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
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FAutoridad");
  cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FAutrespon");
  pkInfo = null;
  pkInfo2 = null;
}

function cargaMantenimientoCatalogoAutoridades(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Autoridades/MantenimientoCatalogoAutoridades.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoAutoridades, null);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/Autoridades/MantenimientoCatalogoResponsables.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionAutoridad();
  }
}

function despliegaPantallaMantenimientoCatalogoAutoridades(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      muestraObjs("cmdAlta,cmdModificar,cmdBaja,cmdConsultar");
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cat.setOnUpdate(cargaComplementoAutoridad);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}
function cargaComplementoAutoridad(){
  cat.setOnUpdate(avisoOperacionCatalogo);
  if(modo2 == 0){
    GI("paramNumAutoridad").value = GI("eautIdAutoridad").value;
    var botonTemp = GI("cmdCancelar");
    SA(botonTemp,"ref","conETPriCatRes");
    SA(botonTemp,"fun","loadTableElement");
    SA(botonTemp,"tabla","tblReg");
    if(modo != OPER_CONSULTAR)
      GI("cmdConsultar").onclick = "";
    consultar(botonTemp, GI("frmDatos"), false);
    formsLoaded();
  }
}

function ejecutaOperacionAutoridad(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      verificaAutoridad();
    }
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    if(fvCat.checkForm()){
      cat.modificaCatalogo();
      onButtonClickPestania("EmisionTitulos.Autoridades.PrincipalCatalogoAutoridades","");
    }
    hideWaitLayer();
  }else if(modo == OPER_BAJA){
    verificaAutoridad();
  }
}
function verificaAutoridad(){
  showWaitLayer();
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiAut\",\"Autoridad\":" + GI("eautIdAutoridad").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionAutoridad, modo);
  }
  if(modo == OPER_BAJA){  
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETAutVSRes\",\"Autoridad\":" + pkInfo.eautIdAutoridad + "}";
    makeAjaxRequest(url, "HTML", validaOperacionAutoridad, modo);
  }
}

function validaOperacionAutoridad(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Registro ya existe!");
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.altaCatalogo();
        onButtonClickPestania("EmisionTitulos.Autoridades.PrincipalCatalogoAutoridades","");
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja una Autoridad que mantenga Responsables dependientes!");
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.bajaCatalogo(false);
        onButtonClickPestania("EmisionTitulos.Autoridades.PrincipalCatalogoAutoridades","");
      }
    break;
  }
  hideWaitLayer();
}