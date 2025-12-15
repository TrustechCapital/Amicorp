var catEstructura = new Catalogo("mx.com.inscitech.fiducia.domain.FidEstrucCtasInd");

var strIdPK = "estContrato,estNivel,estArbol";
var arrIdPK = strIdPK.split(",");
var fvCatEstructura = new FormValidator();
var tblRegDat = new Array();
var modo = 0;
var divNombreFideicomisoParam;
pkInfo = null;

var numContrato = GI("paramFideicomiso").value;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

tblRegDat[0] = "estContrato,100";
tblRegDat[1] = "estNivel,40"; 
tblRegDat[2] = "estNombre,200";
tblRegDat[3] = "estDescripcion,300";
tblRegDat[4] = "estLongId,100";

fvCatEstructura.setup({
  formName      : "frmDatosM",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


var validacionAlta = JSON.parse("{\"id\":\"verificaNivelesEstructura\",\"numNivel\":0}");

function validarPkAlta(objeto) {
  if(GI("estContrato").value!="")
  {
    validacionAlta.numNivel = GI("estContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, objeto);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].Nivel == 3)
  {  
    alert("La Estructura solo puede tener 3 Niveles, verifique");
    GI("estContrato").value="";
    obj.focus();
  }
}
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catEstructura.getCatalogo());
}

function consultaAutomatica(){
  if(eval(GI("numNiveles").value) > 3)
    GI("cmdAlta").disabled = true;
  GI("paramorder").click();
}

function cargaMantenimientoCatalogoDefinicionEstructura(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/CuentasIndividuales/DefinicionEstructura/MantenimientoCatalogoDefinicionEstructura.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDefinicionEstructura, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDefinicionEstructura();
  }
}

function despliegaPantallaMantenimientoCatalogoDefinicionEstructura(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
  //GI("dvContenido").innerHTML = result;

  initForms();
  deshabilitaPK(arrIdPK);
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
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
    catEstructura.setOnUpdate(cargaComplemento);
    catEstructura.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    GI("estContrato").value = numContrato;
    consultaNombreFideicomiso("nomFideicomiso",GI("estContrato"));
    loadElement(GI("estNivel"));
       obtenNivelActual(1);
  }
}
function cargaComplemento(){
  catEstructura.setOnUpdate(avisoOperacionCatalogo);
  SA(GI("estArbol"),"ref","conNumNivNomNivFid");
  SA(GI("nomFideicomiso"),"next","estArbol");
  consultaNombreFideicomiso("nomFideicomiso",GI("estContrato"));
     obtenNivelActual(2);
}
function cargaArbol(obj, result){
  resultado = JSON.parse(result);
  var strAux = "Fideicomiso " + GI("estContrato").value;
  var indice = 1;
  if(isDefinedAndNotNull(resultado)){
    for(i in resultado){
      strAux += "\n";
      for(var j = 1; j <= indice; j++)
        strAux += "   ";
      strAux += " .... "
      strAux += resultado[i].estNombre;
      indice++;
    }
    obj.value = strAux;
  }
  formsLoaded();
}
function ejecutaOperacionDefinicionEstructura(){
  if(modo == OPER_ALTA){
    if(fvCatEstructura.checkForm()){
      showWaitLayer();
      catEstructura.setOnUpdate(avisoOperacionCatalogo);
      catEstructura.altaCatalogo();
      onButtonClickPestania('CuentasIndividuales.DefinicionEstructura.PrincipalCatalogoDefinicionEstructura','');
      hideWaitLayer();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatEstructura.checkForm()){
      showWaitLayer();
      catEstructura.setOnUpdate(avisoOperacionCatalogo);
      catEstructura.modificaCatalogo();
      onButtonClickPestania('CuentasIndividuales.DefinicionEstructura.PrincipalCatalogoDefinicionEstructura','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    if(confirm("Al eliminar este registro, eliminará cualquier otro Nivel que dependa de éste. ¿Desea eliminar el registro?")){
      catEstructura.setOnUpdate(nothing);
      for(var i = eval(pkInfo.estNivel); i <= 3; i++){
        catEstructura.getCatalogo().estNivel = i;
        catEstructura.bajaCatalogo(false);
      }
      onButtonClickPestania('CuentasIndividuales.DefinicionEstructura.PrincipalCatalogoDefinicionEstructura','');
      alert("Operacion realizada exitosamente!");
    }
    hideWaitLayer();
  }
}
function nothing(){}

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

function obtenNivelActual(op){
   var objNivAct = JSON.parse("{\"id\":\"obtenNivelAct\"}");
   objNivAct.Fideicomiso=GI("estContrato").value;
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objNivAct);
   //alert(url)
  makeAjaxRequest(url, "HTML", mostrarNivel, op);
}

function mostrarNivel(obj,result){
  //alert(result);
  var res = JSON.parse(result)[0];
  if(obj==1)
    GI("txtNumNivel").value=res.nivelActual+1;
  else
    GI("txtNumNivel").value=res.nivelActual;
}