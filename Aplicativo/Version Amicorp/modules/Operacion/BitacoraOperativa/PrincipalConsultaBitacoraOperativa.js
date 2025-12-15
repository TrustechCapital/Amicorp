showWaitLayer();
initForms();

var tblRegBitDat = new Array();
var fechaDefault = new Date();

tblRegBitDat[0] = "errIdError,60";
tblRegBitDat[1] = "errFolioError,60";
tblRegBitDat[2] = "errTipoClave,70";
tblRegBitDat[3] = "errModuloRutina,100";
tblRegBitDat[4] = "errNombreRutina,150";
tblRegBitDat[5] = "errOraError,300";
tblRegBitDat[6] = "errOraDescrip,300";
tblRegBitDat[7] = "errFecha,60";

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "paramFecha",
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
}); 
