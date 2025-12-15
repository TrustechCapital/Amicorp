showWaitLayer();
var cmbStatusParam = JSON.parse("{\"chido\":31}");
initForms();

var arrTblCatGuiDat = new Array();
arrTblCatGuiDat = new Array();
arrTblCatGuiDat[0] = "gunNumGuia,53px";
arrTblCatGuiDat[1] = "gunNomGuia,503px";
arrTblCatGuiDat[2] = "gunCveStGuiano,103px";
  
var catGuianom = new Catalogo("mx.com.inscitech.fiducia.domain.Guianom");
var catGuiacont = new Catalogo("mx.com.inscitech.fiducia.domain.Guiacont");
var fvCatGuianom = new FormValidator();
var strIdPK = "gunNumGuia";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var modo2 = 0;
var pkInfo2 = null;
pkInfo = null;

fvCatGuianom.setup({
  formName      : "frmMantenimientoCatalogoGuias",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  cloneObject(pk,catGuianom.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  catGuianom = new Catalogo("mx.com.inscitech.fiducia.domain.Guianom");
  catGuiacont = new Catalogo("mx.com.inscitech.fiducia.domain.Guiacont");
  pkInfo = null;
}

function cargaMantenimientoCatalogoGuias(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Guias/MantenimientoCatalogoGuias.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoGuias, null);
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Guias/MantenimientoEstructuraCatalogoGuias.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionGuia();
  }
  
  
}

function despliegaPantallaMantenimientoCatalogoGuias(obj, result) {
  
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoCatalogoGuias"));
      muestraObjs("cmdAlta,cmdModificar,cmdBaja,cmdConsultar");
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
    catGuianom.setOnUpdate(cargaComplementoGuia);
    catGuianom.buscaCatalogoPK(false);
  }else{
    var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "asiValSecGui";
    asignaSecuencial(GI("gunNumGuia"),objSecuencialParam);
    hideWaitLayer();
  }
}
function cargaComplementoGuia(){
  catGuianom.setOnUpdate(avisoOperacionCatalogo);
  if(modo2 == 0){
    GI("paramNumGuia").value = GI("gunNumGuia").value;
    var botonTemp = GI("cmdCancelar");
    SA(botonTemp,"ref","conPriCatGuiCon");
    SA(botonTemp,"fun","loadTableElement");
    SA(botonTemp,"tabla","tblRegPriEstGui");
    if(modo != OPER_CONSULTAR)
      GI("cmdConsultar").onclick = "";
    consultar(botonTemp, GI("frmMantenimientoCatalogoGuias"), false);
    formsLoaded();
  }
}

function ejecutaOperacionGuia(){
  if(modo == OPER_ALTA){
    if(fvCatGuianom.checkForm()){
      showWaitLayer();
      verificaGuia();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatGuianom.checkForm()){
      showWaitLayer();
      catGuianom.setOnUpdate(avisoOperacionCatalogo);
      catGuianom.modificaCatalogo();
      onButtonClickPestania("Contabilidad.Guias.PrincipalCatalogoGuias","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaGuia();
  }
  tiempo("transaccDatotran(1,'"+((modo == OPER_ALTA)?GI("gunNumGuia").value:catGuianom.getCatalogo().gunNumGuia)+"')");
  
}
function verificaGuia(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiGui\",\"NumGuia\":" + GI("gunNumGuia").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionGuia, 1);
  }
  if(modo == OPER_BAJA){  
     var url = ctxRoot + "/getRef.do?json={\"id\":\"verTraEmpOpe\",\"transaccion\":" + catGuianom.getCatalogo().gunNumGuia + ",\"modulo\":2}";
    //var url = ctxRoot + "/getRef.do?json={\"id\":\"verGuiVSTra\",\"NumGuia\":" + catGuianom.getCatalogo().gunNumGuia + "}";
    makeAjaxRequest(url, "HTML", validaOperacionGuia, 2);
  }
}

function validaOperacionGuia(obj, result){
  resultado = JSON.parse(result)[0];
  switch(obj){
    case 1:
      if(resultado.existeGuia != 0){
        alert("El Registro ya existe!");
        hideWaitLayer();
      }else{
        catGuianom.setOnUpdate(avisoOperacionCatalogo);
        catGuianom.altaCatalogo();
        onButtonClickPestania("Contabilidad.Guias.PrincipalCatalogoGuias","");
        hideWaitLayer();
      }
    break;
    case 2:
      if(resultado.existenRegistros > 0){
      //if(resultado.numTransacciones != 0){
        alert("No se puede dar de baja una Guía que mantenga Operaciones dependientes!");
        //alert("No se puede dar de baja una Guía que mantenga Transacciones dependientes!");
        hideWaitLayer();
      }else{
        var url = ctxRoot + "/doRef.do?json={\"id\":\"delEstGui\",\"NumGuia\":" + catGuianom.getCatalogo().gunNumGuia + "}";
        makeAjaxRequest(url, "HTML", validaOperacionGuia , 3);
      }
    break;
    case 3:
      catGuianom.setOnUpdate(avisoOperacionCatalogo);
      catGuianom.bajaCatalogo(false);
      onButtonClickPestania("Contabilidad.Guias.PrincipalCatalogoGuias","");
      hideWaitLayer();
    break;
  }
}

// TRANSACC_DATOTRAN

function transaccDatotran(tabla,numGuia)
{
// tabla  -1 transacc   -2 datotran

    var url = ctxRoot + "/executeRef.do?json={\"id\":\"funcionTransaccDatotran\",\"numGuia\":"+eval(numGuia)+",\"tabla\":"+eval(tabla)+"}";
    makeAjaxRequest(url,"HTML",resTransaccDatotran,null);
}

function resTransaccDatotran(obj,result)
{
  var resp = JSON.parse(result).resultado; 
}

function tiempo(cadena)
{

  setTimeout(cadena,1000);

}