var catDetExtincion = new Catalogo("mx.com.inscitech.fiducia.domain.CtoRev");

showWaitLayer();

var tablaDetalleExtincionData = new Array();
tablaDetalleExtincionData[0] = "ctrContrato,79";
tablaDetalleExtincionData[1] = "ctrMotivo,176";
tablaDetalleExtincionData[2] = "ctrComentario,503";
tablaDetalleExtincionData[3] = "ctrFecha,116";
tablaDetalleExtincionData[4] = "ctrUsuario,144";
tablaDetalleExtincionData[5] = "ctrFiducSust,146";
tablaDetalleExtincionData[6] = "ctrFecSust,100";

var numPantalla = 0;
pkInfo = null;

formsLoaded();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaDetalleExtincion() {
  onButtonClickPestania("Historicos.DetalleExtincion","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catDetExtincion.getCatalogo());
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoDetalleExtincion() {
  if (pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Historicos/MantenimientoDetalleExtincion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}

function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  loadCatalogo();
}

function loadCatalogo() {
  catDetExtincion.setOnUpdate(catLoaded);
  catDetExtincion.buscaCatalogoPK(false);
}

function catLoaded() {
  deshabilitaObjetos(GI("frmMantenimientoDetalleExtincion"));                  //Deshabilita objetos
  formsLoaded();
}