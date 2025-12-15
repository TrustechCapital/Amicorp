var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FidDatosEstCtas");

var strIdPK = "datContrato";
var arrIdPK = strIdPK.split(",");
var fvCat = new FormValidator();
var tblRegDat = new Array();
var modo = 0;
var divNombreFideicomisoParam;
var objDatosNivelesParam = JSON.parse("{}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbNivel1Param = JSON.parse("{}");
var cmbNivel2Param = JSON.parse("{}");
var objExisteRegistro = JSON.parse("{}");
var lonMaxima = 0;

pkInfo = null;

showWaitLayer();
var numContrato = GI("paramFideicomiso").value;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

tblRegDat[0] = "datClave,300";
tblRegDat[1] = "datDato,300"; 
tblRegDat[2] = "datEstatus,100";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  cargaPrincipalCatalogoNivel3(GI("dvNivel").innerHTML);
}
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

function cargaLongitudNiveles(){
  objDatosNivelesParam.id = "con3NumNivNomNivLogNivFid";
  objDatosNivelesParam.Fideicomiso = eval(GI("paramFideicomiso").value);
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosNivelesParam);
  makeAjaxRequest(url, "HTML", longitudNiveles, null);
}
function longitudNiveles(obj, result){
  objDatosNivelesParam = JSON.parse(result);
  lonMaxima = GI("datLongitudMaxima").value;
  cmbNivel1Param.inicioNivel = 1;
  cmbNivel1Param.longitudNivel = objDatosNivelesParam[0].lonNivel;
  cmbNivel1Param.Fideicomiso = eval(GI("paramFideicomiso").value);
  cmbNivel1Param.Nivel = 1;
  cmbNivel1Param.parentNivel = 0;
  asignaEtiqueta("dvNivel1",objDatosNivelesParam[0].nomNivel);
  asignaEtiqueta("dvNivel2",objDatosNivelesParam[1].nomNivel);
  SA(GI("cmbParentNivel1"), "message", GI("dvNivel1").innerHTML + " es un campo obligatorio");
  loadElementDo(GI("cmbParentNivel1"));
}
function loadComboNivel2(){
  if(GI("cmbParentNivel1").value != -1){
    showWaitLayer();
    cmbNivel2Param.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel;
    cmbNivel2Param.longitudNivel = objDatosNivelesParam[1].lonNivel;
    cmbNivel2Param.Fideicomiso = eval(GI("paramFideicomiso").value);
    cmbNivel2Param.Nivel = 2;
    cmbNivel2Param.parentNivel = GI("cmbParentNivel1").value;
     /*var ver=JSON.stringify(cmbNivel2Param)
    alert(ver);*/
    loadElementDo(GI("cmbParentNivel2"));
  }else
    borraCombos("cmbParentNivel2");
  limpiaCombos("cmbParentNivel2");
  generaParentId(GI("cmbParentNivel1"),1);
}
function generaParentId(objComboNivel,idNivel){
  switch(idNivel){
    case 1:
      if(objComboNivel.value != -1)
        GI("paramParentNivel").value = objComboNivel.value;
      else
        limpiaTxts("paramParentNivel");
    break;
    case 2:
      if(objComboNivel.value != -1)
        GI("paramParentNivel").value = objComboNivel.value;
      else
        GI("paramParentNivel").value = GI("cmbParentNivel1").value;
    break;
  }
}
function loadComboNivel2Mantenimiento(){
  try{
  limpiaCombos("cmbParentNivel2");
  if(GI("cmbParentNivel1").value != -1){
    showWaitLayer();
    cmbNivel2Param.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel;
    //cmbNivel2Param.longitudNivel = objDatosNivelesParam[2].lonNivel;
    cmbNivel2Param.longitudNivel = objDatosNivelesParam[1].lonNivel;
    cmbNivel2Param.Fideicomiso = eval(GI("datContrato").value);
    cmbNivel2Param.Nivel = 2;
    cmbNivel2Param.parentNivel = GI("cmbParentNivel1").value;
     /*var ver=JSON.stringify(cmbNivel2Param)
    alert(ver);*/
    loadElementDo(GI("cmbParentNivel2"));
  }else
    borraCombos("cmbParentNivel2");
  }catch(e){alert(JSON.stringify(e))};
}
function asignaParentId(objComboNivel){
  GI("datParentId").value = objComboNivel.value;
}
function cargaMantenimientoCatalogoDefinicionNivel3(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/CuentasIndividuales/DefinicionNivel3/MantenimientoCatalogoDefinicionNivel3.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDefinicionNivel3, GI("dvNivel").innerHTML);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDefinicionNivel3();
  }
}

function despliegaPantallaMantenimientoCatalogoDefinicionNivel3(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  asignaEtiqueta("dvNivel","Mantenimiento a " + obj);
  deshabilitaPK(arrIdPK);
  GI("datContrato").value = numContrato;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK("datClave,cmbParentNivel1,cmbParentNivel2".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
      ocultaObj("cmdAceptar");
      //GI("cmdAceptar").disabled = true;
    }
  }
}

function cargaComplementoDefinicionNivel(){
  GI("datLongitudNivel").value = objDatosNivelesParam[2].lonNivel;
  GI("datLongitudMaxima").value = lonMaxima;
  SA(GI("cmbParentNivel1"),"ref","conRegNiv");
  SA(GI("cmbParentNivel2"),"ref","conRegNiv");
  consultaNombreFideicomiso("nomFideicomiso",GI("datContrato"));
}

function cargaComboDo(){
  asignaEtiqueta("dvNivel1",objDatosNivelesParam[0].nomNivel);
  asignaEtiqueta("dvNivel2",objDatosNivelesParam[1].nomNivel);
  loadElementDo(GI("cmbParentNivel1"));
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    cat.setOnUpdate(asignaMaximaLongitudClave);
    cat.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    GI("datContrato").value = numContrato;
    asignaMaximaLongitudClave();
  }
}

function asignaMaximaLongitudClave(){
  GI("datClave").maxLength = eval(GI("datLongitudNivel").value);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    GI("datClave").value = GI("datClave").value.substring(objDatosNivelesParam[0].lonNivel + objDatosNivelesParam[1].lonNivel,lonMaxima);
    var parentNivelDigitos = formatString(GI("datParentId").value,"0",eval(GI("datLongitudMaxima").value),"Izquierda").substring(0,objDatosNivelesParam[0].lonNivel);
    GI("cmbParentNivel1").value = formatString(eval(parentNivelDigitos) + "","0",eval(GI("datParentId").value.length),"Derecha");
    SA(GI("cmbParentNivel2"),"next","asignaValueComboNivel2");
    loadComboNivel2Mantenimiento();
  }
  formsLoaded();
}
function asignaValueComboNivel2(){
  SA(GI("cmbParentNivel2"),"next","hideWaitLayer");
  GI("cmbParentNivel2").value = GI("datParentId").value;
  formsLoaded();
}

function ejecutaOperacionDefinicionNivel3(){
  if(modo == OPER_ALTA){
    SA(GI("cmbParentNivel1"), "message", GI("dvNivel1").innerHTML + " es un campo obligatorio");
    SA(GI("cmbParentNivel2"), "message", GI("dvNivel2").innerHTML + " es un campo obligatorio");
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaDefinicionNivel3();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      var parentNivelDigitos = formatString(GI("cmbParentNivel2").value,"0",eval(GI("datLongitudMaxima").value),"Izquierda").substring(0,objDatosNivelesParam[0].lonNivel + objDatosNivelesParam[1].lonNivel);
      GI("datClave").value = parentNivelDigitos + GI("datClave").value;
      cat.setOnUpdate(avisoOperacionCatalogo);
      cat.modificaCatalogo();
      cargaPrincipalCatalogoNivel3(GI("dvNivel").innerHTML);
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaDefinicionNivel3();
  }
}
function verificaDefinicionNivel3(){
  if(modo == OPER_ALTA){
    objExisteRegistro.id = "verExiDefNivFid";
    objExisteRegistro.Fideicomiso =  eval(GI("datContrato").value);
    var parentNivelDigitos = formatString(GI("cmbParentNivel2").value,"0",eval(GI("datLongitudMaxima").value),"Izquierda").substring(0,objDatosNivelesParam[0].lonNivel + objDatosNivelesParam[1].lonNivel);
    objExisteRegistro.Clave = parentNivelDigitos + GI("datClave").value;
  }else if(modo == OPER_BAJA){
    objExisteRegistro.id = "verExiMovNivFid";
    objExisteRegistro.Fideicomiso =  eval(pkInfo.datContrato);
    objExisteRegistro.Clave = pkInfo.datClave;
  }
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistro);
  makeAjaxRequest(url, "HTML", validaDefinicionNivel3, modo);
}

function validaDefinicionNivel3(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Registro ya existe!");
      }else{
        GI("datClave").value = objExisteRegistro.Clave;
        GI("datId").value = GI("datClave").value;
        cat.setOnUpdate(avisoOperacionCatalogo);        
        cat.altaCatalogo();
        cargaPrincipalCatalogoNivel3(GI("dvNivel").innerHTML);
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja un Registro que mantenga Movimientos dependientes!");
        hideWaitLayer();
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.bajaCatalogo(false);
        cargaPrincipalCatalogoNivel3(GI("dvNivel").innerHTML);
      }
    break;
  }
  hideWaitLayer();
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 