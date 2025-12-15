var catPuestos = new Catalogo("mx.com.inscitech.fiducia.domain.FPerfil");

showWaitLayer();

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroPerfil\",\"numPuesto\":0}");

var tablaPuestosData = new Array();
tablaPuestosData[0] = "fperIdPerfil,100px";
tablaPuestosData[1] = "fperNombrePerfil,500px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoPuestos = new FormValidator();
var CONSULTAR = 3;

hideWaitLayer();

function cargaPrincipalSeguridadPuestos() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadPuestos","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catPuestos.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catPuestos.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catPuestos);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadPuestos();
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoSeguridadPuestos)
function cargaMantenimientoSeguridadPuestos(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadPuestos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoPuestos.setup({
    formName      : "frmMantenimientoSeguridadPuestos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}

function loadCatalogo() {
  catPuestos.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catPuestos.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    obtieneIdPerfil();
  }
}


function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    deshabilitaPK("fperIdPerfil".split(","));
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoSeguridadPuestos"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catPuestos.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoPuestos.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catPuestos.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoPuestos.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catPuestos.modificaCatalogo();
  }
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("fperIdPerfil").value!="")
  {
    validacionAlta.numPuesto = GI("fperIdPerfil").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Puesto ya existe, verifique");
    GI("fperIdPerfil").value="";
  }
}

//Funciones para colocar un Id Perfil en forma automática
function obtieneIdPerfil() {
  var secuencialIdPerfil = JSON.parse("{\"id\":\"conCGIncIdPer\" }");
  
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(secuencialIdPerfil);
  makeAjaxRequest(url, "HTML", ingresaIdPerfil, null);
}

function ingresaIdPerfil(obj,result) {
  var objResult = JSON.parse(result);
  GI("fperIdPerfil").value = objResult[0].fperIdPerfil;
  formsLoaded();
}

function cargaPrincipalSeguridadFuncionesXPuesto() {
  //numPantalla = 0;
  //showWaitLayer();
  var urlCliente = ctxRoot + "/modules/ControlGestion/PrincipalSeguridadFuncionesXPuesto.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaSiguientePantalla, null);
  loadDynamicJS(ctxRoot + "/modules/ControlGestion/PrincipalSeguridadFuncionesXPuesto.js");
}

function despliegaSiguientePantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
}