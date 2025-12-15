


initForms();

var arrTblEstParamArchDat = new Array();
arrTblEstParamArchDat[0] = "fastIdentificadorArchivo,50";
arrTblEstParamArchDat[1] = "fdatIdentificadorDato,50";
arrTblEstParamArchDat[2] = "fdatOrden,50";
arrTblEstParamArchDat[3] = "fdatCaracterRelleno,40";
arrTblEstParamArchDat[4] = "fdatRellenoIzDe,140";
arrTblEstParamArchDat[5] = "fdatLongitud,90";
arrTblEstParamArchDat[6] = "fdatGrabaArchivo,90";
arrTblEstParamArchDat[7] = "fdatValorFijo,100";
arrTblEstParamArchDat[8] = "fdatValorReferencia,200";


var fvCatEstruct  = new FormValidator();
var strIdPK2 = "fastIdentificadorArchivo,fdatIdentificadorDato";
var arrIdPK2 = strIdPK2.split(",");
var modo2 = 0;
pkInfo2 = null;

fvCatEstruct.setup({
  formName      : "frmEstructuraParamArchSat",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla2(pk) {
  cloneObject(pk,catEstrParArch.getCatalogo());
  pkInfo2 = pk;
}


//***************************************************DESPLIEGA TERCER PANTALLA***************************************************************

function cargaEstructParamArchSat(Modo) {
  modo2 = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    //showWaitLayer();
    var urlCliente = "modules/Contabilidad/ParametrizacionArchivosSAT/EstructuraParamArchSat.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaEstructuraParamArchSat, null);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    eliminarRegistro();
  }
  else
    alert("No has seleccionado campo alguno de la tabla");
}

function despliegaPantallaEstructuraParamArchSat(obj, result) {
  GI("dvPantalla").innerHTML = result;// pestania
  //GI("dvContenido").innerHTML = result;   
  initForms();
  if(modo2 == OPER_CONSULTAR || modo2 == OPER_MODIFICAR){
     deshabilitaPK(arrIdPK2);
    if(modo2 == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmEstructuraParamArchSat"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo2 == OPER_ALTA || modo2 == OPER_MODIFICAR){
    if(modo2 == OPER_ALTA){
        GI("fastIdentificadorArchivo").value=pkInfo.fastIdentificadorArchivo;
        //alert(catParArch.getCatalogo().fastIdentificadorArchivo);
        var url = ctxRoot + "/getRef.do?json={\"id\":\"cuentaSecuen\",\"IdArch\":"+GI("fastIdentificadorArchivo").value+"}";
        makeAjaxRequest(url, "HTML", validaSecuencial, null);
    }
    muestraObjs("cmdAceptar,cmdCancelar");
  } 
    asignaValues2ObjHTML2(); 
}


function asignaValues2ObjHTML2(){
  /*asignaValues2ObjHTML();*/
  catEstrParArch.setOnUpdate(catLoaded);
  if(isDefinedAndNotNull(pkInfo2) && (modo2 == OPER_CONSULTAR || modo2 == OPER_MODIFICAR)){
    catEstrParArch.buscaCatalogoPK(false);
  }else{
    hideWaitLayer();
  }
}

function catLoaded() {
    cargaRadiosConMaster("fdatRellenoIzDe","fdatRellenoIzDe2");
    cargaRadiosConMaster("fdatGrabaArchivo","fdatGrabaArchivo2");
    cargaRadiosConMaster("fdatValorFijo","fdatValorFijo2");
}

//*********************************FUNCIONALIDAD DE LOS BOTONES************************************************



function AltaOModificaInfo() {
  catEstrParArch.setOnUpdate(operacionExitosa);
  if(modo2==OPER_ALTA && fvCatEstruct.checkForm())//Se trata de una alta
  {
    //showWaitLayer();
    catEstrParArch.altaCatalogo();
  }
  else if(modo2==OPER_MODIFICAR && fvCatEstruct.checkForm())//Se trata de una modificación
  {
    //showWaitLayer();
    catEstrParArch.modificaCatalogo();
  }
}

function eliminarRegistro() {
    catEstrParArch.setOnUpdate(operacionExitosa);
    //showWaitLayer();
    catEstrParArch.bajaCatalogo(false);
    //eliminaCatalogo(catEstrParArch);
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaMantoParArchSat(modo)
}

//******************************************** funciones genericas *******************************************
/*function agregaSecuencial(){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"cuentaSecuen\",\"IdArch\":"+GI("fastIdentificadorArchivo").value+",\"IdDat\":"+GI("fdatIdentificadorDato").value+"}";
    makeAjaxRequest(url, "HTML", validaSecuencial, null);
}*/

function validaSecuencial(obj, result){
    resultado = JSON.parse(result)[0];
    GI("fdatIdentificadorDato").value=resultado.sec
}	