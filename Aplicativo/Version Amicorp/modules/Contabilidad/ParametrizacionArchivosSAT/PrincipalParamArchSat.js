var catParArch = new Catalogo("mx.com.inscitech.fiducia.domain.FArchivoSat");
var catEstrParArch = new Catalogo("mx.com.inscitech.fiducia.domain.FDatoArchivoSat");

//showWaitLayer();
initForms();

var arrTblParamArchDat = new Array();
arrTblParamArchDat[0] = "fastIdentificadorArchivo,150px";
arrTblParamArchDat[1] = "fastNombre,500px";


var fvcatParArch = new FormValidator();
var strIdPK = "fastIdentificadorArchivo";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var modo2 = 0;
var pkInfo2 = null;
pkInfo = null;

fvcatParArch.setup({
  formName      : "frmMantenimientoParamArch",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  cloneObject(pk,catParArch.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  catParArch = new Catalogo("mx.com.inscitech.fiducia.domain.FArchivoSat");
  var catEstrParArch = new Catalogo("mx.com.inscitech.fiducia.domain.FDatoArchivoSat");
  pkInfo = null;
}

function cargaMantoParArchSat(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    //showWaitLayer();
    var urlCliente = "modules/Contabilidad/ParametrizacionArchivosSAT/MantenimientoParamArchSat.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoParamArchSat, null);
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/ParametrizacionArchivosSAT/EstructuraParamArchSat.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionArchivo();
  }
  else alert("No has seleccionado ningun elemento");
}

function despliegaPantallaMantenimientoParamArchSat(obj, result) {
  GI("dvPantalla").innerHTML = result;//pestaña
  //GI("dvContenido").innerHTML = result;
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoParamArch"));
      muestraObjs("cmdAlta,cmdModificar,cmdBaja,cmdConsultar");
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
    if(modo == OPER_ALTA){
      var url = ctxRoot + "/getRef.do?json={\"id\":\"cuentaSecuenArch\"}";
        makeAjaxRequest(url, "HTML", validaSecuencialArch, null);
    }
  asignaValues2ObjHTML();
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
   catParArch.setOnUpdate(cargaComplemento);
    catParArch.buscaCatalogoPK(false);
    
  }else{
    hideWaitLayer();
  }
}
function cargaComplemento(){
  catParArch.setOnUpdate(avisoOperacionCatalogo);
  GI("paramIdArchivo").value= GI("fastIdentificadorArchivo").value;
    GI("paramNombre").value= GI("fastNombre").value;
  if(modo2 == 0){
    //GI("paramIdArchivoEst").value = GI("fastIdentificadorArchivo").value;
    
    var botonTemp = GI("cmdCancelar");
    SA(botonTemp,"ref","conEstrctParamArch");
    SA(botonTemp,"fun","loadTableElement");
    SA(botonTemp,"tabla","tblRegPriEstArchSat");
    if(modo != OPER_CONSULTAR)
      GI("cmdConsultar").onclick = "";
    consultar(botonTemp, GI("frmMantenimientoParamArch"), false);
    formsLoaded();
  }
}

//***************************************************MANEJADOR DE EVENTOS**************************************

function ejecutaOperacionArchivo(){
  if(modo == OPER_ALTA){
    if(fvcatParArch.checkForm()){
      showWaitLayer();
      verificaArchivo();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvcatParArch.checkForm()){
      //showWaitLayer();
      catParArch.setOnUpdate(avisoOperacionCatalogo);
      catParArch.modificaCatalogo();
      onButtonClickPestania("Contabilidad.ParametrizacionArchivosSAT.PrincipalParamArchSat","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    //showWaitLayer();
    verificaArchivo();
  }
}
function verificaArchivo(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExisteArchivo\",\"IdArch\":"+GI("fastIdentificadorArchivo").value+"}";
    makeAjaxRequest(url, "HTML", validaOperacionArchivo, 1);
  }
  if(modo == OPER_BAJA){
    var texto=catParArch.getCatalogo().fastIdentificadorArchivo;
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExisteDato\",\"fastIde\":"+catParArch.getCatalogo().fastIdentificadorArchivo+"}";
    makeAjaxRequest(url, "HTML", validaOperacionArchivo, 2);
  }
}

function validaOperacionArchivo(obj, result){
  resultado = JSON.parse(result)[0];
  switch(obj){
    case 1:
      if(resultado.existeArchivo != 0){
        alert("El Registro ya existe!");
        hideWaitLayer();
      }else{
        catParArch.setOnUpdate(avisoOperacionCatalogo);
        catParArch.altaCatalogo();
        onButtonClickPestania("Contabilidad.ParametrizacionArchivosSAT.PrincipalParamArchSat","");
        hideWaitLayer();
      }
    break;
    case 2:
      if(resultado.existeDato != 0){
        alert("No se puede dar de baja un archivo que contenga parametros");
        hideWaitLayer();
      }else{
        //var texto=catEstrParArch.getCatalogo().fastIdentificadorArchivo;
        var texto = pkInfo.fastNombre;
        var url = ctxRoot + "/doRef.do?json={\"id\":\"deleteArchivo\",\"NombreArchivoDat\":\"texto\",\"IdArch\":"+catParArch.getCatalogo().fastIdentificadorArchivo+"}";
        makeAjaxRequest(url, "HTML", validaOperacionArchivo , 3);
      }
    break;
    case 3:
      catParArch.setOnUpdate(avisoOperacionCatalogo);
      catParArch.bajaCatalogo(false);
      onButtonClickPestania("Contabilidad.ParametrizacionArchivosSAT.PrincipalParamArchSat","");
      hideWaitLayer();
    break;
  }
}

function validaSecuencialArch(obj, result){
    resultado = JSON.parse(result)[0];
    GI("fastIdentificadorArchivo").value=resultado.sec
}	