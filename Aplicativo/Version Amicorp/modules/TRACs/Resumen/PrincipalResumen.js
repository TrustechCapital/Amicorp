//var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var nomFideicomiso = JSON.parse("{}");

var tablaData = new Array();
tablaData[0] = "temIdFolio,50px";
tablaData[1] = "temFecMovto,80px";
tablaData[2] = "temIdSerie,80px";
tablaData[3] = "temIdPizarra,80px";
tablaData[4] = "temCerCirculacion,100px";
tablaData[5] = "temCerCreados,100px";
tablaData[6] = "temCerRedimidos,100px";
tablaData[7] = "temPrecioTeorico,80px";
tablaData[8] = "temValorCanasta,100px";
tablaData[9] = "temValorActivos,100px";
tablaData[10] = "temNumUnidad,100px";
tablaData[11] = "temCuentaGastos,80px";


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
  //catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FCartera");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  //cloneObject(pk,cat.getCatalogo());
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
    var urlCliente = ctxRoot + "/modules/TRACs/Confirmaciones/MantenimientoConfirmaciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}


function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimiento.setup({
    formName      : "frmDatosMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true,
    showErrors    : true
  });
}