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
  cargaPrincipalCatalogoNivel2(GI("dvNivel").innerHTML);
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
  SA(GI("paramParentNivel"), "message", GI("dvNivel1").innerHTML + " es un campo obligatorio");
  loadElementDo(GI("paramParentNivel"));
}

function cargaMantenimientoCatalogoDefinicionNivel2(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/CuentasIndividuales/DefinicionNivel2/MantenimientoCatalogoDefinicionNivel2.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDefinicionNivel2, GI("dvNivel").innerHTML);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDefinicionNivel2();
  }
}

function despliegaPantallaMantenimientoCatalogoDefinicionNivel2(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  asignaEtiqueta("dvNivel","Mantenimiento a " + obj);
  deshabilitaPK(arrIdPK);
  GI("datContrato").value = numContrato;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK("datClave,datParentId".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
      ocultaObj("cmdAceptar");
      //GI("cmdAceptar").disabled = true;
    }
  }
}

function cargaComplementoDefinicionNivel(){
  GI("datLongitudNivel").value = objDatosNivelesParam[1].lonNivel;
  GI("datLongitudMaxima").value = lonMaxima;
  SA(GI("datParentId"),"ref","conRegNiv");
  consultaNombreFideicomiso("nomFideicomiso",GI("datContrato"));
}

function cargaComboDo(){
  asignaEtiqueta("dvNivel1",objDatosNivelesParam[0].nomNivel);
  loadElementDo(GI("datParentId"));
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
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
    GI("datClave").value = GI("datClave").value.substring(objDatosNivelesParam[0].lonNivel,objDatosNivelesParam[0].lonNivel + eval(GI("datLongitudNivel").value));
  formsLoaded();
}

function ejecutaOperacionDefinicionNivel2(){
  if(modo == OPER_ALTA){
    SA(GI("datParentId"), "message", GI("dvNivel1").innerHTML + " es un campo obligatorio");
    if(fvCat.checkForm()){
      showWaitLayer();
      verificaDefinicionNivel2();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      var parentNivelDigitos = formatString(GI("datParentId").value,"0",eval(GI("datLongitudMaxima").value),"Izquierda").substring(0,objDatosNivelesParam[0].lonNivel);
      GI("datClave").value =  formatString(parentNivelDigitos + GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");  
      cat.setOnUpdate(avisoOperacionCatalogo);
      cat.modificaCatalogo();
      cargaPrincipalCatalogoNivel2(GI("dvNivel").innerHTML);
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaDefinicionNivel2();
  }
}
function verificaDefinicionNivel2(){
  objExisteRegistro.id = "verExiDefNivFid";
  if(modo == OPER_ALTA){
    objExisteRegistro.Fideicomiso =  eval(GI("datContrato").value);
    var parentNivelDigitos = formatString(GI("datParentId").value,"0",eval(GI("datLongitudMaxima").value),"Izquierda").substring(0,objDatosNivelesParam[0].lonNivel);  
    objExisteRegistro.Clave = formatString(parentNivelDigitos + GI("datClave").value,"0",eval(GI("datLongitudMaxima").value),"Derecha");  
  }else if(modo == OPER_BAJA){
    objExisteRegistro.Fideicomiso =  eval(pkInfo.datContrato);
    objExisteRegistro.Parent = pkInfo.datClave;
  }
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistro);
  makeAjaxRequest(url, "HTML", validaDefinicionNivel2, modo);
}

function validaDefinicionNivel2(obj, result){
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
        cargaPrincipalCatalogoNivel2(GI("dvNivel").innerHTML);
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja un Registro que mantenga Niveles dependientes!");
        hideWaitLayer();
      }else{
        cat.setOnUpdate(avisoOperacionCatalogo);
        cat.bajaCatalogo(false);
        cargaPrincipalCatalogoNivel2(GI("dvNivel").innerHTML);
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