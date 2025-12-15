//var cmbDatoParam = JSON.parse("{\"chido\":3}");

initForms();


var arrTblRubDat = new Array();
arrTblRubDat[0] = "facoIdAgrupacion,116";
arrTblRubDat[1] = "froaAgrupaHija,116";
arrTblRubDat[2] = "froaTipoOperacion,100";

var fvCatOperRub  = new FormValidator();
var strIdPK3 = "facoIdAgrupacion,froaAgrupaHija";
var strIdPK3 = strIdPK3.split(",");
var modo3 = 0;
pkInfo3 = null;

fvCatOperRub.setup({
  formName      : "frmAgrupaAgrupacion",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla4(pk) {
  cloneObject(pk,catOperRub.getCatalogo());
  pkInfo3 = pk;
}


//***************************************************DESPLIEGA TERCER PANTALLA***************************************************************

function cargaAgrupaAgrupacion(Modo) {
  modo3 = Modo;
  if((isDefinedAndNotNull(pkInfo3) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    //showWaitLayer();
    var urlCliente = "modules/Contabilidad/Agrupaciones/AgrupaAgrupacion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaAgrupaAgrupacion, null);
  }else if(isDefinedAndNotNull(pkInfo3) && Modo == OPER_BAJA){
    eliminarRegistro();
  }
  else
    alert("No has seleccionado campo alguno de la tabla");
}

function despliegaPantallaAgrupaAgrupacion(obj, result) {
  GI("dvPantalla").innerHTML = result;   
  initForms();
  if(modo3 == OPER_CONSULTAR || modo3 == OPER_MODIFICAR){
     deshabilitaPK(strIdPK3);
    if(modo3 == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmAgrupaAgrupacion"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo3 == OPER_ALTA || modo3 == OPER_MODIFICAR){
    if(modo3 == OPER_ALTA){
        GI("facoIdAgrupacion").value=pkInfo.facoIdAgrupacion;
        //alert(catParArch.getCatalogo().fastIdentificadorArchivo);
        //var url = ctxRoot + "/getRef.do?json={\"id\":\"cuentaSecuen\",\"IdArch\":"+GI("fastIdentificadorArchivo").value+"}";
        //makeAjaxRequest(url, "HTML", validaSecuencial, null);
    }
    muestraObjs("cmdAceptar,cmdCancelar");
  } 
    asignaValues2ObjHTML3(); 
}


function asignaValues2ObjHTML3(){
  /*asignaValues2ObjHTML();*/
  catOperRub.setOnUpdate(catLoaded);
  if(isDefinedAndNotNull(pkInfo3) && (modo3 == OPER_CONSULTAR || modo3 == OPER_MODIFICAR)){
    catOperRub.buscaCatalogoPK(false);
  }else{
    hideWaitLayer();
  }
}

function catLoaded() {
    cargaRadiosConMaster("froaTipoOperacion","froaTipoOperacion2,froaTipoOperacion3,froaTipoOperacion4");
    
}

//*********************************FUNCIONALIDAD DE LOS BOTONES************************************************



function AltaOModificaInfo() {
  catOperRub.setOnUpdate(operacionExitosa);
  if(modo3==OPER_ALTA && fvCatOperRub.checkForm())//Se trata de una alta
  {
    //showWaitLayer();
    catOperRub.altaCatalogo();
  }
  else if(modo3==OPER_MODIFICAR && fvCatOperRub.checkForm())//Se trata de una modificación
  {
    //showWaitLayer();
    catOperRub.modificaCatalogo();
  }
}

function eliminarRegistro() {
    catOperRub.setOnUpdate(operacionExitosa);
    //showWaitLayer();
    catOperRub.bajaCatalogo(false);
    //eliminaCatalogo(catOperRub);
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaMantenimiento(modo);
}

//******************************************** funciones genericas *******************************************
/*function agregaSecuencial(){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"cuentaSecuen\",\"IdArch\":"+GI("fastIdentificadorArchivo").value+",\"IdDat\":"+GI("fdatIdentificadorDato").value+"}";
    makeAjaxRequest(url, "HTML", validaSecuencial, null);
}*/

/*function validaSecuencial(obj, result){
    resultado = JSON.parse(result)[0];
    GI("fdatIdentificadorDato").value=resultado.sec
}	*/