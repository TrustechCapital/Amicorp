showWaitLayer();
initForms();

var fvCargaMasiva = new FormValidator();
var archivoSeleccionado = false;
//var divNombreFideicomisoParam;
var fechaDefault = new Date();

fvCargaMasiva.setup({
  formName      : "frmCargaMasiva",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function showFrame() {
  displayFrame("dvMensajes", "frameUpload", ctxRoot + "/modules/Garantias/Inmuebles/CargaMasiva/FileUpload.do", 200, 200, 100, 400, 0, 0);  
}

function frameSubmit(forma) {
    //obtenerTipoArchivo();
  if(fvCargaMasiva.checkForm() && obtenerNombreArchivo(forma.flArchivo)){
    showWaitLayer();
    GI("frameUpload").onreadystatechange = hideFrame;

//alert("Nombre Archivo"+GI("NombreArchivo").value);
    
  forma.document.getElementById("Fecha").value = GI("txtFechaContable").value;
  forma.document.getElementById("NombreArchivo").value = GI("NombreArchivo").value;
  forma.submit();
  
    archivoSeleccionado = true;
    deshabilitaObjetos(GI("frmCargaMasiva"));
    muestraObjs("cmdCargar,cmdLimpiar");
  }else{
    archivoSeleccionado = false;
  }
}

function hideFrame() { 
  GI("frameUpload").onreadystatechange = null;
  removeFrame("frameUpload");
  hideWaitLayer();
  
  consultaFisoInmuebles();
}

function consultaFisoInmuebles()
{
  var objCargaMasivaParam = JSON.parse("{\"id\":\"conArcPla\"}");
  objCargaMasivaParam.nomArchivo = GI("NombreArchivo").value;
  objCargaMasivaParam.Fecha = GI("txtFechaContable").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCargaMasivaParam);

  makeAjaxRequest(url, "HTML", consultaFisoInmueblesRes, null);
}


function consultaFisoInmueblesRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res))
  {
  
    if(res.length>0)
    {
      var sline = res[0].arpDescripcion;
      var sfiso = sline.split(";")[0];
      alert(sfiso)
      if(sfiso!=GI("paramFideicomiso").value)
      {
        alert("El no. de Fideicomiso contenido en el archivo no coincide con el no. digitado en el campo Fideicomiso");
        
        borraArchivoInmuebles();
      }
      
    }
  }
}

function borraArchivoInmuebles()
{
  var objCargaMasivaParam = JSON.parse("{\"id\":\"borraArcPla\"}");
  objCargaMasivaParam.Archivo = GI("NombreArchivo").value;
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objCargaMasivaParam);
  makeAjaxRequest(url, "HTML", borraArchivoInmueblesRes, null);
}

function borraArchivoInmueblesRes(obj,result)
{
  
  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res))
  {
    if(res.tipoError=="SUCCESS")
    {
      limpiar();
    }
  }
}


function obtenerNombreArchivo(objFile){  
  var numTipo = GI("rdTipoMovimiento").value;
  var tipoOperacion = eval(numTipo);
  switch(tipoOperacion){
    case 1://Individualización Inmuebles
         if(false&&objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("INMUEBLES") == -1){
         alert("Seleccione un Archivo de Carga correcto!");
         return false;
         }else if(objFile.value == ""){
            alert("Seleccione el Archivo de Carga!");
            return false;
	}else 
      {
       GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
        return true;
      }
    break;
    case 2://Individualización Inmuebles
         if(false&&objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("ADQUIRENTES") == -1){
         alert("Seleccione un Archivo de Carga correcto!");
         return false;
         }else if(objFile.value == ""){
            alert("Seleccione el Archivo de Carga!");
            return false;
      }else 
      {
       GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
        return true;
      }
    break;
    case 3://Individualización Inmuebles
         if(false&&objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("PAGOS") == -1){
         alert("Seleccione un Archivo de Carga correcto!");
         return false;
         }else if(objFile.value == ""){
            alert("Seleccione el Archivo de Carga!");
            return false;
	}else 
      {
       GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
        return true;
      }
    break;
   default:
      alert("error"); 
      }

  if(false&&objFile.value != "" && objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0].indexOf("ADQUIRENTES") == -1){
    alert("Seleccione un Archivo de Carga correcto!");
    return false;
  }else if(objFile.value == ""){
    alert("Seleccione el Archivo de Carga!");
    return false;
  }
  GI("NombreArchivo").value = objFile.value.split("\\")[objFile.value.split("\\").length-1].split(".")[0];
  return true;
}

function ejecutaCargaMasiva(){
  showWaitLayer();
  var objCargaMasivaParam = JSON.parse("{\"id\":\"ejeFunCargaMasivaInmuebles\"}");
  //objCargaMasivaParam.Tipo = 1;
  objCargaMasivaParam.TipoMovimiento = eval(GI("rdTipoMovimiento").value);
//  objCargaMasivaParam.Fideicomiso = GI("paramFideicomiso").value;
  objCargaMasivaParam.NombreArchivo = GI("NombreArchivo").value;
  objCargaMasivaParam.Fecha = GI("txtFechaContable").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objCargaMasivaParam);
  makeAjaxRequest(url, "HTML", validaCargaMasiva, null);
}


function validaCargaMasiva(obj, result){
  var resultado = JSON.parse(result);
  if(isDefinedAndNotNull(resultado)){
    if(resultado == "CORRECTO"||resultado == "0"){
      alert("Proceso concluido satisfactoriamente!");
      onButtonClickPestania('Garantias.Inmuebles.CargaMasiva.PrincipalCargaMasiva','');
    }else if(resultado == "ERROR NO DATOS")
      alert("No existe información a procesar!");
    else if(resultado == "ERROR NUM COLS")
      alert("Número de columnas invalido!");
    else if(resultado == "ERROR NUM SPD")
      alert("Error de dato númerico que no debería tener punto décimal!");
    else if(resultado == "ERROR NUM CPD")
      alert("Error de dato númerico que maneja punto décimal!");
    else if(resultado == "ERROR PROC. ASIGNADO")
      alert("Error al procesar el rubro de asignado!");
    else if(resultado == "ERROR PROC. COMPROMETIDO")
      alert("Error al procesar el rubro de comprometido!");
    else if(resultado == "ERROR PROC. EJERCIDO")
      alert("Error al procesar el rubro de ejercido!");
    else if(resultado == "ERROR ORACLE")
      alert("Ocurrió un error inesperado (oracle)!");
    if(resultado != "CORRECTO"){
      var objDeleteParam = JSON.parse("{\"id\":\"delArcPla\"}");
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDeleteParam);
      //alert(url);
      makeAjaxRequest(url, "HTML", null, null);
    }
  }else
    alert("Ocurrió un error inesperado!"+resultado);
  hideWaitLayer();
}

// limpiar

function limpiar()
{
  onButtonClickPestania('Garantias.Inmuebles.CargaMasiva.PrincipalCargaMasiva','');
}

// validacion garantias

function consultaDatosFideicomiso(txtFideicomiso)
{
  consultaNombreFideicomiso('nomFideicomiso',txtFideicomiso);
  
  var vFideicomiso = txtFideicomiso.value;
  
  if(vFideicomiso.length>0)
  {
    var objFisoGar = JSON.parse("{}");
    objFisoGar.id = "consultarBienesGar";
    objFisoGar.Fiso = vFideicomiso;
    
    var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objFisoGar);
    
    makeAjaxRequest(url,"html",consultaDatosFideicomisoRes,txtFideicomiso);
  }
}

function consultaDatosFideicomisoRes(txtFideicomiso,result)
{
  var res = JSON.parse(result);
  
  if(res.length==0)
  {
    alert("Fideicomiso no tiene Garantias registradas");
    txtFideicomiso.value="";
    txtFideicomiso.focus();
  }
  
}