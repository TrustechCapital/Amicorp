showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FCatindic");
var cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FIndices");
var fvCat = new FormValidator();
var strIdPK = "ecinIdIndice";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var pkInfo2 = null;
pkInfo = null;

cmbStatusParam = JSON.parse("{\"Indice\":500,\"orderDescripcion\":\"S\"}");

var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "ecinIdIndice,100px";
arrTblDat[1] = "ecinDescripcion,300px";
arrTblDat[2] = "ecinFormaEmp,300px";
arrTblDat[3] = "ecinStCatindic,100px";

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
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FCatindic");
  cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FIndices");
  pkInfo = null;
  pkInfo2 = null;
}

function cargaMantenimientoCatalogoIndices(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/Indices/MantenimientoCatalogoIndices.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoIndices, null);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/Indices/MantenimientoEstructuraCatalogoIndices.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoCatalogoIndices(obj, result) {
  //GI("dvPantalla").innerHTML = result;
  GI("dvContenido").innerHTML = result;
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
    cat.setOnUpdate(cargaComplementoIndice);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}
function cargaComplementoIndice(){
  cat.setOnUpdate(avisoOperacionCatalogo);
  if(modo2 == 0){
    GI("paramNumIndice").value = GI("ecinIdIndice").value;
    var botonTemp = GI("cmdCancelar");
    SA(botonTemp,"ref","conETPriEstCatInd");
      SA(botonTemp,"fun","loadTableElement");
    if(modo != OPER_CONSULTAR)
      GI("cmdConsultar").onclick = "";
    SA(botonTemp,"tabla","tblReg");
    consultar(botonTemp, GI("frmDatos"), false);
    formsLoaded();
  }
}

function ejecutaOperacionIndice(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      verificaIndice();
    }
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    if(fvCat.checkForm()){
      cat.modificaCatalogo();
      //onButtonClickPestania("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
      onButtonClick("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
    }
    hideWaitLayer();
  }else if(modo == OPER_BAJA){
    verificaIndice();
  }
}
function verificaIndice(){
  showWaitLayer();
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETExiInd\",\"Indice\":" + GI("ecinIdIndice").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionIndice, modo);
  }
  if(modo == OPER_BAJA){  
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verETCatIndVSInd\",\"Indice\":" + pkInfo.ecinIdIndice + "}";
    makeAjaxRequest(url, "HTML", validaOperacionIndice, modo);
  }
}

function validaOperacionIndice(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Resgistro ya existe!");
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.altaCatalogo();
        //onButtonClickPestania("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
        onButtonClick("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja un Índice que mantenga Estructura dependiente!");
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.bajaCatalogo(false);
        //onButtonClickPestania("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
        onButtonClick("EmisionTitulos.Indices.PrincipalCatalogoIndices","");
      }
    break;
  }
  hideWaitLayer();
}