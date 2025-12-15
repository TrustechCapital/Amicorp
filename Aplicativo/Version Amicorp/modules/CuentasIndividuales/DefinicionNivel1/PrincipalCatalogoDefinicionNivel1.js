var catDefinicionNivel = new Catalogo("mx.com.inscitech.fiducia.domain.FidDatosEstCtas");
var catParticipacion = new Catalogo("mx.com.inscitech.fiducia.domain.FidParticipacion");

var strIdPK = "datContrato";
var arrIdPK = strIdPK.split(",");
var fvCatDefinicionNivel = new FormValidator();
var tblRegDat = new Array();
var modo = 0;
var modo2 = 0;
var divNombreFideicomisoParam;
var objNivelParam = JSON.parse("{}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
pkInfo = null;

var numContrato = GI("paramFideicomiso").value;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

tblRegDat[0] = "datClave,300";
tblRegDat[1] = "datDato,300"; 
tblRegDat[2] = "datEstatus,100";

fvCatDefinicionNivel.setup({
  formName      : "frmDatosM",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  cargaPrincipalCatalogoNivel1(GI("dvNivel").innerHTML);
}
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catDefinicionNivel.getCatalogo());
}

function cargaMantenimientoCatalogoDefinicionNivel1(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/CuentasIndividuales/DefinicionNivel1/MantenimientoCatalogoDefinicionNivel1.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDefinicionNivel1, GI("dvNivel").innerHTML);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDefinicionNivel1();
  }
}

function despliegaPantallaMantenimientoCatalogoDefinicionNivel1(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  asignaEtiqueta("dvNivel","Mantenimiento a " + obj);
  deshabilitaPK(arrIdPK);
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK("datClave".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatosM"));
      SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
      ocultaObj("cmdAceptar");
      //GI("cmdAceptar").disabled = true;
    }
  }
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catDefinicionNivel.setOnUpdate(cargaComplementoDefinicionNivel);
    catDefinicionNivel.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    GI("datContrato").value = numContrato;
    cargaComplementoDefinicionNivel();
  }
}
function cargaComplementoDefinicionNivel(){
  catDefinicionNivel.setOnUpdate(avisoOperacionCatalogo);
  objNivelParam.numFideicomiso = GI("datContrato").value;
  objNivelParam.numNivel = GI("datNivel").value;
  SA(GI("datLongitudMaxima"),"ref","conLonMaxLonNivFid");
  SA(GI("datLongitudNivel"),"ref","conLonNivFid");
  SA(GI("datLongitudNivel"),"param","objNivelParam");
  consultaNombreFideicomiso("nomFideicomiso",GI("datContrato"));
}
function asignaMaximaLongitudClave(){
  GI("datClave").maxLength = eval(GI("datLongitudNivel").value);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    GI("datClave").value = GI("datClave").value.substring(0,eval(GI("datLongitudNivel").value));
    var objExisteParticipacion = JSON.parse("{}");
    objExisteParticipacion.id = "verExiParNivFid";
    objExisteParticipacion.Fideicomiso = eval(GI("datContrato").value);
    objExisteParticipacion.Clave = formatString(GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteParticipacion);
    makeAjaxRequest(url, "HTML", cargaCheckAcumula, null);
  }else
    formsLoaded();
}
function cargaCheckAcumula(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0)
    GI("datAcumula").checked = true;
  formsLoaded();
}
function ejecutaOperacionDefinicionNivel1(){
  if(modo == OPER_ALTA){
    if(fvCatDefinicionNivel.checkForm()){
      showWaitLayer();
      verificaDefinicionNivel1();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatDefinicionNivel.checkForm()){
      showWaitLayer();
      GI("datClave").value = formatString(GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");
      if(GI("datAcumula").checked)
        modo2 = OPER_ALTA;
      else
        modo2 = OPER_BAJA;
      catDefinicionNivel.setOnUpdate(operacionParticipacion);
      catDefinicionNivel.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaDefinicionNivel1();
  }
}
function verificaDefinicionNivel1(){
  var objExisteRegistro = JSON.parse("{}");
  objExisteRegistro.id = "verExiDefNivFid";
  if(modo == OPER_ALTA){
    objExisteRegistro.Fideicomiso =  eval(GI("datContrato").value);
    objExisteRegistro.Clave = formatString(GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistro);
    makeAjaxRequest(url, "HTML", validaDefinicionNivel1, modo);
  }else if(modo == OPER_BAJA){
    objExisteRegistro.Fideicomiso =  eval(catDefinicionNivel.getCatalogo().datContrato);
    objExisteRegistro.Parent = pkInfo.datClave;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistro);
    makeAjaxRequest(url, "HTML", validaDefinicionNivel1, modo);
  }
}

function validaDefinicionNivel1(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Registro ya existe!");
      }else{
        GI("datClave").value = formatString(GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");
        GI("datId").value = GI("datClave").value;
        if(GI("datAcumula").checked)
          modo2 = OPER_ALTA;
        else
          modo2 = OPER_BAJA;
        catDefinicionNivel.setOnUpdate(operacionParticipacion);
        catDefinicionNivel.altaCatalogo();
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja un Registro que mantenga Niveles dependientes!");
        hideWaitLayer();
      }else{
        modo2 = OPER_BAJA;
        catParticipacion.getCatalogo().parContrato = catDefinicionNivel.getCatalogo().datContrato;
        catParticipacion.getCatalogo().parClave = catDefinicionNivel.getCatalogo().datClave;
        catParticipacion.setOnUpdate(bajaDefinicionNivel);
        catParticipacion.bajaCatalogo(false);
      }
    break;
  }
}
function operacionParticipacion(){
  catParticipacion.getCatalogo().parContrato = catDefinicionNivel.getCatalogo().datContrato;
	catParticipacion.getCatalogo().parClave = catDefinicionNivel.getCatalogo().datClave;
  if(modo2 == OPER_ALTA){
    catParticipacion.setOnUpdate(altaParticipacion);
    catParticipacion.bajaCatalogo(false);
  }if(modo2 == OPER_BAJA){
    catParticipacion.setOnUpdate(avisoOperacionCatalogo);
    catParticipacion.bajaCatalogo(false);
    cargaPrincipalCatalogoNivel1(GI("dvNivel").innerHTML);
    hideWaitLayer();
  }
}
function altaParticipacion(){
  catParticipacion.getCatalogo().parNivel = catDefinicionNivel.getCatalogo().datNivel;
  catParticipacion.getCatalogo().parFecAlta = catDefinicionNivel.getCatalogo().datFecAlta;
  catParticipacion.getCatalogo().parFecUltMod = catDefinicionNivel.getCatalogo().datFecUltMod;
  catParticipacion.getCatalogo().parEstatus = catDefinicionNivel.getCatalogo().datEstatus;
  catParticipacion.setOnUpdate(avisoOperacionCatalogo);
  catParticipacion.altaCatalogo(false);
  cargaPrincipalCatalogoNivel1(GI("dvNivel").innerHTML);
  hideWaitLayer();
}
function bajaDefinicionNivel(){
  catDefinicionNivel.setOnUpdate(avisoOperacionCatalogo);
  catDefinicionNivel.bajaCatalogo(false);
  cargaPrincipalCatalogoNivel1(GI("dvNivel").innerHTML);
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