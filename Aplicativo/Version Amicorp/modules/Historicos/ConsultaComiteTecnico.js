showWaitLayer();

var tablaConsComiteTecnicoData = new Array();
tablaConsComiteTecnicoData[0] = "conNumContrato,93";
tablaConsComiteTecnicoData[1] = "conNomComite,140";
tablaConsComiteTecnicoData[2] = "conFinalidComite,141";
tablaConsComiteTecnicoData[3] = "conComComite,310";
tablaConsComiteTecnicoData[4] = "conAnoConst,112";
tablaConsComiteTecnicoData[5] = "conMesConst,112";
tablaConsComiteTecnicoData[6] = "conDiaConst,107";
tablaConsComiteTecnicoData[7] = "conCveStComite,110";

var tablaConsMiembrosComiteTecnicoData = new Array();
tablaConsMiembrosComiteTecnicoData[0] = "comNomMiembro,270";
tablaConsMiembrosComiteTecnicoData[1] = "comRfc,98";
tablaConsMiembrosComiteTecnicoData[2] = "comNomInstituc,318";
tablaConsMiembrosComiteTecnicoData[3] = "comNomPuesto,180";
tablaConsMiembrosComiteTecnicoData[4] = "comCveStMiembro,80";


var numPantalla = 0;
pkInfo = null;

formsLoaded();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaConsultaComiteTecnico() {
  onButtonClickPestania("Historicos.ConsultaComiteTecnico","");
}

function clickTabla(pk) {
  pkInfo = pk;
}


//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaConsultaMiembrosComiteTecnico() {
  if (pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Historicos/ConsultaMiembrosComiteTecnico.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMiembros, null);
  }
}

function despliegaPantallaMiembros(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  GI("paramNumFideicomiso").value=pkInfo.conNumContrato; //Colocando el Número de Fideicomiso como parámetro de consulta
  deshabilitaPK("paramNumFideicomiso".split(",")); //No permitir editar el Número de Fideicomiso:
  consultar(GI("hdMiembrosComiteTecnico"), GI('frmConsultaMiembrosComiteTecnico'), false);
  
  formsLoaded();
}
