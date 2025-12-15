var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmpresa");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbParam660 = JSON.parse("{\"Indice\":660,\"orderDescripcion\":\"s\"}");
var cmbEmpresas = JSON.parse("{}");

var tablaData = new Array();
tablaData[0] = "empNumEmpresa,50px";
tablaData[1] = "empNomEmpresa,300px";
tablaData[2] = "empNomArea,200px";
tablaData[3] = "empNomAutoriza,200px";
tablaData[4] = "empNomFirma,200px";
tablaData[5] = "empProcedimiento,80px";

var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;
initForms();
formsLoaded();

function limpiar(objForma){
  RF(objForma);
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmpresa");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla

var operacion = 0;

function cargaMantenimiento(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/ParametrosContrasena/MantenimientoParametrosContrasena.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}


function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
  initForms();
  loadCatalogo();
  
  //Agregando la funcionalidad del required
  fvMantenimiento.setup({
    formName      : "frmDatosMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true,
    showErrors    : true
  });
}

function loadCatalogo() {
  cat.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    cat.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("empNumEmpresa".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  //alert("Operacion: " + operacion);
  cat.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimiento.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    cat.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimiento.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    cat.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    cat.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(cat);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipal();
  hideWaitLayer();
}

function cargaPrincipal() {
  onButtonClickPestania("ControlGestion.ParametrosEmpresa.PrincipalParametrosEmpresa","");
}