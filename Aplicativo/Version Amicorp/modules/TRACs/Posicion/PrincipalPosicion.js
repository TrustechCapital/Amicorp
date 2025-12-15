//var catTracs = new Catalogo("mx.com.inscitech.fiducia.domain.FPosicion");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var tablaPosicionData = new Array();
tablaPosicionData[0] = "temIdFolio,100px";
tablaPosicionData[1] = "temFecMovto,100px";
tablaPosicionData[2] = "temIdSerie,100px";
tablaPosicionData[3] = "temIdPizarra,100px";
tablaPosicionData[4] = "temCerCirculacion,100px";


var fvMantenimientoTRACs = new FormValidator();

fvMantenimientoTRACs.setup({
  formName      : "frmDatosTRACs",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;

formsLoaded();


function limpiar(objForma){
  RF(objForma);
  //catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FPosicion");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  //cloneObject(pk,catTracs.getCatalogo());
}