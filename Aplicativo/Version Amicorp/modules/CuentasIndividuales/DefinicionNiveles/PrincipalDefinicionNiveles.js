showWaitLayer();

var numContrato = GI("paramFideicomiso").value;
var objFideicomisoParam = JSON.parse("{}");
objFideicomisoParam.numFideicomiso = numContrato;
loadElement(GI("cmdNivel1"));

function cargaNiveles(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    for(var i = 0; i < resultado.length; i++){
      eval("GI('cmdNivel" + (i+1) + "').value = resultado[" + i + "].estNombre");
      muestraObj("cmdNivel" + (i+1));
    }
  }
  hideWaitLayer();
}

consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));

function cargaPrincipalCatalogoNivel1(strEtiqueta){
  showWaitLayer();
  var urlCliente = "modules/CuentasIndividuales/DefinicionNivel1/PrincipalCatalogoDefinicionNivel1.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalCatalogoNivel1, strEtiqueta);
}
function cargaPrincipalCatalogoNivel2(strEtiqueta){
  showWaitLayer();
  var urlCliente = "modules/CuentasIndividuales/DefinicionNivel2/PrincipalCatalogoDefinicionNivel2.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalCatalogoNivel2, strEtiqueta);
}
function cargaPrincipalCatalogoNivel3(strEtiqueta){
  showWaitLayer();
  var urlCliente = "modules/CuentasIndividuales/DefinicionNivel3/PrincipalCatalogoDefinicionNivel3.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalCatalogoNivel3, strEtiqueta);
}
function despliegaPantallaPrincipalCatalogoNivel1(obj, result){
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  if(obj.indexOf('Mantenimiento a Catálogo de ') != -1)
    obj = obj.split('Mantenimiento a Catálogo de ')[1];
  if(obj.indexOf('Catálogo de ') != -1)
    obj = obj.split('Catálogo de ')[1];
  asignaEtiqueta("dvNivel","Catálogo de " + obj);
  hideWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/DefinicionNivel1/PrincipalCatalogoDefinicionNivel1.js");
}
function despliegaPantallaPrincipalCatalogoNivel2(obj, result){
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  if(obj.indexOf('Mantenimiento a Catálogo de ') != -1)
    obj = obj.split('Mantenimiento a Catálogo de ')[1];
  if(obj.indexOf('Catálogo de ') != -1)
    obj = obj.split('Catálogo de ')[1];
  asignaEtiqueta("dvNivel","Catálogo de " + obj);
  hideWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/DefinicionNivel2/PrincipalCatalogoDefinicionNivel2.js");
}
function despliegaPantallaPrincipalCatalogoNivel3(obj, result){
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;

  if(obj.indexOf('Mantenimiento a Catálogo de ') != -1)
    obj = obj.split('Mantenimiento a Catálogo de ')[1];
  if(obj.indexOf('Catálogo de ') != -1)
    obj = obj.split('Catálogo de ')[1];
  asignaEtiqueta("dvNivel","Catálogo de " + obj);
  hideWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/DefinicionNivel3/PrincipalCatalogoDefinicionNivel3.js");
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    //nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 

function regresarCtasIndiv()
{
    onButtonClickPestania("CuentasIndividuales.DefinicionNiveles.PrincipalDefinicionNiveles","");
}