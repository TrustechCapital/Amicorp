showWaitLayer();

var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var fvInterfase = new FormValidator();
var nombreArchivo;
initForms();
formsLoaded();



//consultaProcedimiento(4043);//procedimiento

fvInterfase.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//--calendario
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

cal.manageFields("fecha", "fecha", "%d/%m/%Y");

fechaTrack(GI("fecha"));

//--calendario


function ejecutaStoreInterfase(){
  if(fvInterfase.checkForm()){
    showWaitLayer();
      
        var fncCustodio = JSON.parse("{\"id\":\"ejeFunOperacionCustodio\"}");
        fncCustodio.fiso = 0;
        fncCustodio.pizarra = '';
        fncCustodio.serie = '';
        fncCustodio.cupon = 0;
        fncCustodio.precioCer = 0;
        fncCustodio.precioNaf = 0;
        fncCustodio.fecha = GI("fecha").value;
        fncCustodio.archivo = GI('nombre').value;
        var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncCustodio);
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }
}

function validaStoreInterfase(obj, result){
   var res = JSON.parse(result).RESULTADO;
    switch(eval(res)){
      case 0:
        abreArchivo();
      break;
      case 1:
        alert('¡Error en generar archivo!'); 
        break;
      default:
        alert("Ocurrió un error inesperado");
        break;
    }

  hideWaitLayer();
}

function abreArchivo(){
  
    objArchivosPlanosParam.queryId = "conArcPla";
    objArchivosPlanosParam.colData = "arpDescripcion";
    objArchivosPlanosParam.tipoId = 1;
    objArchivosPlanosParam.Fecha = GI("fecha").value;
    objArchivosPlanosParam.Nombre = GI("nombre").value;
    objArchivosPlanosParam.Archivo =GI("nombre").value;
    objArchivosPlanosParam.fileName = GI("nombre").value+".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    onButtonClickPestania('TRACs.OperacionesCustodio.PrincipalOperacionesCustodio','');

  hideWaitLayer();
}
