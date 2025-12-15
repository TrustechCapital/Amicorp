showWaitLayer();
var catPaises = new Catalogo("mx.com.inscitech.fiducia.domain.Paises");

consultaPaises();

var fechaDefault = new Date();

function buscaPais() {
  catPaises.getCatalogo().paiNumPais = 1;
  alert("catPaises.getCatalogo().paiNumPais: " + catPaises.getCatalogo().paiNumPais);
  catPaises.buscaCatalogoPK(false);
}

function setFechaCal() {
  //alert("se actualizo la fecha");
}

function isValidDate(date)
{ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "txtCal",   // id of the input field
    button         :    "txtCal",
    ifFormat       :    "%Y/%m/%d", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});                   


function consultaPaises() {
  makeAjaxRequest(ctxRoot + "/consultaPasies.do", "HTML", loadCombos, null);
}

function loadCombos(obj, result) {
  arrPaises = JSON.parse(result);
  loadCombo(GI("ejCombo"), arrPaises, "paiNumPais", "paiNomPais");
}

function consultar() {
  var url = ctxRoot + "/consultaAdv.do?json=" + JSON.stringify(getParameters(GI("frmTest")));
  makeAjaxRequest(url, "HTML", imprimeResultado, null);
}

function imprimeResultado(obj, result) {
  arrPaises = JSON.parse(result);
  //loadTable(GI("tablaDatosPais"), arrPaises, "paiNumPais", "clickTabla");
  arWidth = new Array();
  //arWidth[0] = "paiNumPais,50";
  arWidth[0] = "paiNomPais,50";
  arWidth[1] = "paiAbrPais,50";
  arWidth[2] = "paiCveStPais,50";
  loadTable(GI("tablaDatosPais"), arrPaises, arWidth, "paiNumPais,paiNomPais", "clickTabla", true);
  //loadTable(GI("tablaDatosPais"), arrPaises, arWidth, "paiNumPais", "clickTabla");
}

function clickTabla(pk) {
  var pkInfo = JSON.parse("{"+pk+"}");
  alert("numero de pais: " + pkInfo.paiNumPais + " Nombre: " + pkInfo.paiNomPais);
}

hideWaitLayer();