var catTerceros = new Catalogo("mx.com.inscitech.fiducia.domain.Terceros");

showWaitLayer();
var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo16 = JSON.parse("{\"llaveClave\":16}");
var clavesCombo23 = JSON.parse("{\"llaveClave\":23}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");

initForms();

var contenedor = new Object();

var tablaTercerosData = new Array();
tablaTercerosData[0] = "terNumContrato,110px";
tablaTercerosData[1] = "terNumTercero,80px";
tablaTercerosData[2] = "terNomTercero,300px";
tablaTercerosData[3] = "terCveStTercero,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoTerceros = new FormValidator();

fvMantenimientoTerceros.setup({
  formName      : "frmDatosTercerosConsulta",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

///////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalTerceros() {
  onButtonClickPestania("Administracion.PrincipalTerceros","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catTerceros.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catTerceros = new Catalogo("mx.com.inscitech.fiducia.domain.Terceros");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalTerceros();
  hideWaitLayer();
}

function operacionExitosaKYC() {
  alert("La operación se realizó correctamente");
  //cargaPrincipalTerceros();

  ocultaObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
  SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  deshabilitaObjetos(GI("frmDatosMantenimientoTerceros"));    
  cargaCheckList();
  hideWaitLayer();
}

function verificacionActivo() {
  if(GI("paramFideicomiso").value != "") {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":" + GI("paramFideicomiso").value + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", funcionVerificacionActivo, null);
  }else
    asignaEtiqueta("nomFideicomiso","");
}

function funcionVerificacionActivo(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("paramFideicomiso").value="";
    asignaEtiqueta("nomFideicomiso","");
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
}


function consultaDatos(){
  if(GI("paramFideicomiso").value=="" && GI("paramNombre").value=="")
    SA(GI("paramFideicomiso"), "required", "");
  
  if(fvMantenimientoTerceros.checkForm())
    consultar(GI("cmdAceptar"), GI("frmDatosTercerosConsulta"), false);
  
  RA(GI("paramFideicomiso"), "required");
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoTerceros(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoTerceros.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoTerceros, null);
  }
}

function despliegaPantallaMantenimientoTerceros(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoTerceros.setup({
    formName      : "frmDatosMantenimientoTerceros",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  deshabilitaPK("tserNumTercero".split(","));

}

function loadCatalogo(){

  catTerceros.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catTerceros.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("terNumContrato,terNumTercero".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoTerceros"));    
    //muestraObjs("cmdKYC");
    cargaCheckList();
    //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  consultaNombreFideicomiso("nomFideicomiso",GI("terNumContrato"));
  formsLoaded();
  
   
}

function AltaOModificaInfo() {
  catTerceros.setOnUpdate(operacionExitosaKYC);
  if(operacion==ALTA && fvMantenimientoTerceros.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catTerceros.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoTerceros.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catTerceros.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catTerceros.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catTerceros);
  }
}

///////////////////////
function validarPkAlta(objeto) {
  if(GI("terNumContrato").value!="")
  {
    var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
    validacionAlta.numContrato = GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, objeto);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("terNumContrato").value="";
    GI("terNumTercero").value="";
    obj.focus();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("terNumContrato").value="";
    GI("terNumTercero").value="";
    obj.focus();
  }
  else
  {
    consultaNombreFideicomiso("nomFideicomiso",GI("terNumContrato"));
    
    //Agregar el número del Tercero (Incremental)
    var SecNumTercero = JSON.parse("{\"id\":\"numSecNumTercero\",\"NumFiso\":0}");
    SecNumTercero.NumFiso=GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumTercero);
    makeAjaxRequest(url, "HTML", agregarTercero, null);
  }
}

function agregarTercero(obj, result) {
  var objResult = JSON.parse(result);
  GI("terNumTercero").value=objResult[0].secNumTercero;
}

/// enlace CHECKLIST-----------------
function cargaCheckList()
{
  contenedor.Fideicomiso = GI("terNumContrato").value;
  contenedor.NumPersona = GI("terNumTercero").value;
  contenedor.NomPersona = GI("terNomTercero").value;
  contenedor.TPersona = "P"+GI("terCveTipoPers").value.substring(0,1)+((GI("terNomNacional").value=="MEXICANA")?"NAC":"EXT");
  var url = ctxRoot + "/modules/KYC/PrincipalCheckList.do";
  makeAjaxRequest(url, "HTML", cargaParametros, contenedor);
  loadDynamicJS(ctxRoot + "/modules/KYC/PrincipalCheckList.js");
}


function cargaParametros(obj,result)
{

  GI("cargaCheck").innerHTML = result;  
 // initForms(); Hace lenta la consulta
  GI("paramProyecto").value= obj.Fideicomiso;
  GI("paramTPersona").value= obj.TPersona;
  GI("paramNumPersona").value= obj.NumPersona;
  GI("paramNomPersona").value= obj.NomPersona;
  GI("idRegresar").value = 3;
  GI("paramTipo").value =3;
  
  
 var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunCargaConceptosKYC\",\"TPersona\":\"" + obj.TPersona + "\",\"Fideicomiso\":" + obj.Fideicomiso + ",\"Tipo\":" + 3 + ",\"NumPersona\":" + obj.NumPersona + "}";
 makeAjaxRequest(url, "HTML",cargaConceptosKYC,null);
 
}

function cargaConceptosKYC(obj,result){
  var resultado = JSON.parse(result).result;
  switch(resultado){
    case 0:
          consultar(GI("cmdCargar"), GI('frmCheckList'), false);
    break;
    case 1:
      alert("No hay Conceptos para esta Persona");
    break;
  }
  hideWaitLayer();
  GI('ContenedorKYC').style.visibility='visible';
  GI('cargaConceptos').innerHTML='<div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div>';
}
