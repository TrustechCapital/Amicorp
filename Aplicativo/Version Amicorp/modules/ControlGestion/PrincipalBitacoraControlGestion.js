var catBitacora = new Catalogo("mx.com.inscitech.fiducia.domain.Bitacora");

showWaitLayer();

var tablaDatosBitacoraData = new Array();
tablaDatosBitacoraData[0] = "bitFecha,110px";
tablaDatosBitacoraData[1] = "usuNumUsuario,90px";
tablaDatosBitacoraData[2] = "bitFolio,100px";
tablaDatosBitacoraData[3] = "bitIp,100px";
tablaDatosBitacoraData[4] = "ffunNomMenu,120px";
tablaDatosBitacoraData[5] = "bitNumSerieCd,100px";
tablaDatosBitacoraData[6] = "bitNumSecuenciaCd,100px";
tablaDatosBitacoraData[7] = "bitDetalle,300px";

pkInfo = null;
var fechaInicio = new Date();

//Agregando la funcionalidad para la Fecha Inicio Bitacora
  Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaInicio,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });

formsLoaded();

//Funciones para la funcionalidad de la Fecha Inicio Bitacora
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}

