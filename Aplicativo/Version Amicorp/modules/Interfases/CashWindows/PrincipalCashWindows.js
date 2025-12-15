// JavaScript Document

var fncInterfaseRetiro = JSON.parse("{\"id\":\"storeGenArchInterfazCashRetiro\"}");
var objArchivosPlanosParamRetiro = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");


var fncInterfaseDeposito = JSON.parse("{\"id\":\"storeGenArchInterfazCashDeposito\"}");
var objArchivosPlanosParamDeposito = JSON.parse("{\"id\":\"conArcPla\"}");

var fvInterfase = new FormValidator();
var fechaDefault = new Date();

var clavesCombo1 = JSON.parse("{\"chido\":81}");
var clavesCombo2 = JSON.parse("{\"chido\":74}");

loadElement(GI("cmbTipoLiq"));
loadElement(GI("cmbTipoDep"));

initForms();

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

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

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

function ejecutaFuncion(){
  if(GI("txtFechaValor").value==""||GI("txtNomArch").value=="")
  {  
    alert("Debe seleccionar la Fecha,Nombre");
  }
  else{
    if(fvInterfase.checkForm()){
      
      if(GI("chk1").checked)
      {
        if(GI('cmbTipoDep').selectedIndex!=0||document.frameUpload.frmCash.fileTest.value=="")
        {
           //insertar funcion que acomoda datos y llena archivos planos,luego:
         //ejecutaStoreInterfaseDeposito();
          frameSubmit(document.frameUpload.frmCash);
        }
        else
        {
           alert('Seleccione el Tipo de Deposito y el Archivo')
        }
      }
      else
      {
        if(GI('cmbTipoLiq').selectedIndex!=0)
        {
          ejecutaStoreInterfaseRetiro();
        }
        else
        {
          alert('Seleccione el Tipo de Liquidacion')
        }
      }
    }
  }
  

}

function muestra_oculta(num)
{
  if(num==0){
  GI('frameUpload').style.visibility='hidden';
  GI('cmbTipoDep').style.visibility='hidden';
  GI('eti2').style.visibility='hidden';  
  GI('eti1').style.visibility='visible';
  GI('cmbTipoLiq').style.visibility='visible';
  }
  else{
  GI('frameUpload').style.visibility='visible';
  GI('cmbTipoDep').style.visibility='visible';
  GI('eti1').style.visibility='hidden';
  GI('eti2').style.visibility='visible';
  GI('cmbTipoLiq').style.visibility='hidden';
  }
}
// CODIGO DEPOSITOS--------------------------------------------------------------------------------------


function frameSubmit(forma) {
  //if(fv.checkFrom())
  forma.document.getElementById("fechaCash").value = GI("txtFechaValor").value;
  forma.document.getElementById("nombreCash").value = GI("txtNomArch").value;
  forma.submit();
  
  ejecutaStoreInterfaseDeposito(); /// ejecuta rutina sabado
  //document.getElementById("cmdLimpiar").click();
  //showWaitLayer();
}



function ejecutaStoreInterfaseDeposito(){
    fncInterfaseDeposito.FechaValor = GI("txtFechaValor").value;
    fncInterfaseDeposito.NomArch = GI("txtNomArch").value;
    fncInterfaseDeposito.Opc = eval(GI("cmbTipoDep").value);
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfaseDeposito);
   // alert(url)
    makeAjaxRequest(url, "HTML", validaStoreInterfaseDeposito, null);
  }


function validaStoreInterfaseDeposito(obj, result){
  var res = JSON.parse(result).RESULTADO;
 // alert(res)
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParamDeposito.tipoId = 1;
        objArchivosPlanosParamDeposito.Archivo = "CASHWINDOWS" + GI("txtFechaValor").value.split("/")[2] + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0];
        objArchivosPlanosParamDeposito.colData = "arpDescripcion"; // descripcion
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParamDeposito);
        makeAjaxRequest(url, "HTML", terminaStoreInterfaseDeposito, null);    
      break;
      case 1:alert("Existen errores al generar el archivo!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}

function terminaStoreInterfaseDeposito(obj , result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    //alert(resultado);
    alert("Operación exitosa")
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}


// CODIGO RETIROS----------------------------------------------------------------------------------



function ejecutaStoreInterfaseRetiro(){
    fncInterfaseRetiro.FechaValor = GI("txtFechaValor").value;
    fncInterfaseRetiro.NomArch = GI("txtNomArch").value;
    fncInterfaseRetiro.Opc = eval(GI("cmbTipoLiq").value);
    
    if(GI("bancomer").checked)
    {
      fncInterfaseRetiro.bancomer = 1;
      fncInterfaseRetiro.NomArch = GI("txtNomArch").value+"_bancomer";
    }
    else
      fncInterfaseRetiro.bancomer = 0;
      
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfaseRetiro);
    makeAjaxRequest(url, "HTML", validaStoreInterfaseRetiro, null);
  }


function validaStoreInterfaseRetiro(obj, result){
  var res = JSON.parse(result).RESULTADO;
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
        showWaitLayer();
        objArchivosPlanosParamRetiro.tipoId = 1;
        objArchivosPlanosParamRetiro.Archivo = "CASHWINDOWS" + GI("txtFechaValor").value.split("/")[2] + GI("txtFechaValor").value.split("/")[1] + GI("txtFechaValor").value.split("/")[0];
        objArchivosPlanosParamRetiro.colData = "arpDescripcion"; // descripcion
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objArchivosPlanosParamRetiro);
        makeAjaxRequest(url, "HTML", sugerirNombreArchivoInterfaseRetiro, null);    
      break;
      case 1:alert("Existen errores al generar el archivo!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}
function sugerirNombreArchivoInterfaseRetiro(obj , result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    alert("Se le sugiere coloque el siguiente nombre " + resultado.arpNomArchivo + ".txt para el archivo generado!");
    delete objArchivosPlanosParamRetiro.id;
    objArchivosPlanosParamRetiro.queryId = "conArcPla";
    objArchivosPlanosParamRetiro.fileName = resultado.arpNomArchivo + ".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParamRetiro);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    onButtonClickPestania('Interfases.CashWindows.PrincipalCashWindows','');
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}
