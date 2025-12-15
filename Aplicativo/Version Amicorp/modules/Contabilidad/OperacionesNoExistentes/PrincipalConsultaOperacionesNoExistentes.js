showWaitLayer();
initForms();

var fechaDefault = new Date();
var arrTblOpeNoExiDat = new Array();

arrTblOpeNoExiDat = new Array();
arrTblOpeNoExiDat[0] = "errFolioError,100";
arrTblOpeNoExiDat[1] = "errOraDescrip,300";
arrTblOpeNoExiDat[2] = "errOraError,400";

function setFechaCal() {
  //alert("se actualizo la fecha");
}

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