var fechaDefault = new Date();
var arrTblMovFODEGDat = new Array();

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "paramFechaDel",
    button         :    "paramFechaDel",
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
Calendar.setup({
    inputField     :    "paramFechaAl",
    button         :    "paramFechaAl",
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
arrTblMovFODEGDat[0] = "fecha,71";
arrTblMovFODEGDat[1] = "fideicomiso,80";
arrTblMovFODEGDat[2] = "ejercicio,61";
arrTblMovFODEGDat[3] = "eje,31";
arrTblMovFODEGDat[4] = "programa,69";
arrTblMovFODEGDat[5] = "proyecto,63";
arrTblMovFODEGDat[6] = "accion,47";
arrTblMovFODEGDat[7] = "folio,58";
arrTblMovFODEGDat[8] = "acuerdo,192";
arrTblMovFODEGDat[9] = "concepto,242";
arrTblMovFODEGDat[10] = "tipoOperacion,188";
arrTblMovFODEGDat[11] = "importe,100";
arrTblMovFODEGDat[12] = "origen,90";
arrTblMovFODEGDat[13] = "compromiso,84";
arrTblMovFODEGDat[14] = "status,100";

function limpiar(objForma){
  RF(objForma);
}
