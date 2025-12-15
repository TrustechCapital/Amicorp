showWaitLayer();

var objArchivosPlanosParam = JSON.parse("{\"id\":\"conInterminds\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");
var fvInterfase = new FormValidator();
var fechaDefault = new Date();
var nombreArchivo;
initForms();


var tablaConceptosData = new Array();
tablaConceptosData[0] = "tipoPersona,200px";
tablaConceptosData[1] = "idPersona,100px";
tablaConceptosData[2] = "numContrato,100px";
tablaConceptosData[3] = "nomCampo,150px";


function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "txtFechaValor",
    button         :    "txtFechaValor",
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

fvInterfase.setup({
  formName      : "frmDatosInterfase",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function asignaFechaValor(){
  dvFechaParam.Fecha = GI("txtFechaValor").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(dvFechaParam);
  makeAjaxRequest(url, "HTML", asignaEtiquetas, null);
}
function asignaEtiquetas(obj, result){
  var resultado = JSON.parse(result)[0];
  formsLoaded();
}
function ejecutaStoreInterfase(){
  if(fvInterfase.checkForm()){
    showWaitLayer();
        var fncInterfaseKyc = new Object();
        fncInterfaseKyc.id = "generaInterfasesMindsKyc";
        fncInterfaseKyc.Fecha = GI("txtFechaValor").value;
        fncInterfaseKyc.Interfase = GI('interfase').value;
        var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfaseKyc);
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }
}

function validaStoreInterfase(obj, result){
   var res = JSON.parse(result).RESULTADO;
    switch(eval(res)){
      case 0:
        showWaitLayer();        
        
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParam);
        makeAjaxRequest(url, "HTML", sugerirNombreArchivoInterfase, null);    
      break;
      case 1:
      case 3:
      alert("Existen conceptos obligatorios MINDS por capturar");GI('cmdConsultaConceptosPendientes').click();break;
      case 2:alert("¡No hay movimientos registrados en este día!");break;
      
      default:alert("Ocurrió un error inesperado");
    }

  hideWaitLayer();
}

function sugerirNombreArchivoInterfase(obj , result){
 
  var resultado = JSON.parse(result)[0];
  
    delete objArchivosPlanosParam.id;
    delete objArchivosPlanosParam.Fecha;
    objArchivosPlanosParam.queryId = "conInterminds";
        objArchivosPlanosParam.colData = "arpDescripcion";
        objArchivosPlanosParam.tipoId = 1;
        objArchivosPlanosParam.Fecha = GI("txtFechaValor").value;
 objArchivosPlanosParam.Archivo =resultado.arpNomArchivo;
    objArchivosPlanosParam.fileName = resultado.arpNomArchivo+".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);

    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    onButtonClickPestania('Interfases.InterfaseMains.PrincipalInterfaseMains','');

  hideWaitLayer();
}
