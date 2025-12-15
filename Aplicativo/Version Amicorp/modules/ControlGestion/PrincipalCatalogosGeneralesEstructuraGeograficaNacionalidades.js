var catNacionalidades = new Catalogo("mx.com.inscitech.fiducia.domain.Nacional");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroNacionalidad\",\"numPais\":0}");
var validacionExistenciaNacionalidad = JSON.parse("{\"id\":\"verificaExistenciaNombreNacionalidad\",\"nacionalidad\":0}");
var validacionBaja1 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad1\",\"nomNacionalidad\":0}");
var validacionBaja2 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad2\",\"nomNacionalidad\":0}");
var validacionBaja3 = JSON.parse("{\"id\":\"verificaDependenciaNacionalidad3\",\"nomNacionalidad\":0}");

initForms();

var tablaDatosNacionalidadesData = new Array();
tablaDatosNacionalidadesData[0] = "paiNomPais,150px";
tablaDatosNacionalidadesData[1] = "nacNomNacional,200px";
tablaDatosNacionalidadesData[2] = "nacAbrNacional,130px";
tablaDatosNacionalidadesData[3] = "nacCveStNaciona,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoNacionalidades = new FormValidator();
var CONSULTAR = 3;

function cargaPrincipalCatalogosGeneralEstructuraGeograficaNacionalidades() {
  onButtonClick("ControlGestion.PrincipalCatalogosGeneralesEstructuraGeograficaNacionalidades","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catNacionalidades.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades)
function cargaMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoNacionalidades.setup({
    formName      : "frmMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

///////////////////////////
function loadCatalogo() {
  catNacionalidades.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catNacionalidades.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("nacNumPais".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catNacionalidades.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoNacionalidades.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catNacionalidades.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoNacionalidades.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catNacionalidades.modificaCatalogo();
  }
}


///////////////////////////////////////////////////////////////////
function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    validacionBaja1.nomNacionalidad=pkInfo.nacNomNacional;
    var url1 = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja1);
    makeAjaxRequest(url1, "HTML", verificacionBaja1, null);
  }
}

function verificacionBaja1(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeDependencia > 0)
  {
    alert("El registro no puede ser eliminado, tiene una dependencia con algún Fideicomiso");
    hideWaitLayer();
  }
  else
  {
    validacionBaja2.nomNacionalidad=pkInfo.nacNomNacional;
    var url2 = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja2);
    makeAjaxRequest(url2, "HTML", verificacionBaja2, null);
  }
}

function verificacionBaja2(obj, result) {
   var objResult = JSON.parse(result);
    if(objResult[0].existeDependencia > 0)
    {
      alert("El registro no puede ser eliminado, tiene una dependencia con algún Beneficiario");
      hideWaitLayer();
    }
    else
    {
      validacionBaja3.nomNacionalidad=pkInfo.nacNomNacional;
      var url3 = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja3);
      makeAjaxRequest(url3, "HTML", verificacionBaja3, null);
    }
}

function verificacionBaja3(obj, result) {
  var objResult = JSON.parse(result);
   if(objResult[0].existeDependencia > 0)
   {
      alert("El registro no puede ser eliminado, tiene una dependencia con algún Tercero");
      hideWaitLayer();
   }
  else
  {
    catNacionalidades.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catNacionalidades);
  }
}

//////////////////////////////////////////////////////////////////////
function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralEstructuraGeograficaNacionalidades();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("nacNumPais").value!=-1)
  {
    showWaitLayer();
    validacionAlta.numPais = GI("nacNumPais").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Ya existe un registro para ese país, verifique");
    GI("nacNumPais").selectedIndex=0;
  }
  hideWaitLayer();
}

//Verificar que la nacionalidad aún no exista
function verificaExistenciaNacionalidad() {
  if(GI("nacNomNacional").value!="")
  {
    showWaitLayer();
    validacionExistenciaNacionalidad.nacionalidad=GI("nacNomNacional").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaNacionalidad);
    makeAjaxRequest(url, "HTML", verificacionExistenciaNombreNacionalidad, null);
  }
}

function verificacionExistenciaNombreNacionalidad(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeNombreNacionalidad > 0)
  {
    alert("Ya existe esa Nacionalidad, verifique");
    GI("nacNomNacional").value="";
  }
  hideWaitLayer();
}
