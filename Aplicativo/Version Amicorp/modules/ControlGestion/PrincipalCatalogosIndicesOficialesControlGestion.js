var catIndices = new Catalogo("mx.com.inscitech.fiducia.domain.Indices");

showWaitLayer();

var clavesCombo14 = JSON.parse("{\"llaveClave\":14}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroIndice\",\"indice\":0,\"diaIndice\":0,\"mesIndice\":0,\"anoIndice\":0}");

initForms();

var tablaDatosIndicesOficialesData = new Array();
tablaDatosIndicesOficialesData[0] = "indCveIndice,150px";
tablaDatosIndicesOficialesData[1] = "indAnoIndice,60px";
tablaDatosIndicesOficialesData[2] = "indMesIndice,60px";
tablaDatosIndicesOficialesData[3] = "indDiaIndice,70px";
tablaDatosIndicesOficialesData[4] = "indValorIndice,100px";
tablaDatosIndicesOficialesData[5] = "indCveStIndice,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoIndices = new FormValidator();
var fechaIndice = new Date();
var CONSULTAR = 3;

function cargaPrincipalCatalogoIndicesOficialesControlGestion() {
  onButtonClick("ControlGestion.PrincipalCatalogosIndicesOficialesControlGestion","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catIndices.getCatalogo());
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosClavesControlGestion)
function cargaMantenimientoCatalogosIndicesOficialesControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosIndicesOficialesControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoIndices.setup({
    formName      : "frmMantenimientoCatalogosIndicesOficialesControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad para la Fecha de Constitución
  Calendar.setup({
    inputField     :    "txtDiaMesAnoIndice",   // id of the input field
    button         :    "txtDiaMesAnoIndice",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaIndice,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
}

function loadCatalogo() {
  catIndices.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catIndices.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("indCveIndice,txtDiaMesAnoIndice".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosIndicesOficialesControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  GI("txtDiaMesAnoIndice").value=formatString(GI("indDiaIndice").value,"0",2,"Izquierda") + "/" + formatString(GI("indMesIndice").value,"0",2,"Izquierda") + "/" + GI("indAnoIndice").value;
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catIndices.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoIndices.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catIndices.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoIndices.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catIndices.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catIndices.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catIndices);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogoIndicesOficialesControlGestion();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("indCveIndice").value!="" && GI("txtDiaMesAnoIndice").value!="")
  {
    showWaitLayer();
    validacionAlta.indice = GI("indCveIndice").value;
    validacionAlta.diaIndice = GI("indDiaIndice").value;
    validacionAlta.mesIndice = GI("indMesIndice").value;
    validacionAlta.anoIndice = GI("indAnoIndice").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La clave ya existe, verifique");
    GI("indCveIndice").selectedIndex=0;
    GI("txtDiaMesAnoIndice").value="";
    
    GI("indDiaIndice").value="";
    GI("indMesIndice").value="";
    GI("indAnoIndice").value="";
  }
  hideWaitLayer();
}

//Funciones para la funcionalidad de la Fecha Indice
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

//Descompone la fecha obtenida del calendario a sus respectivas cajas de texto
function descomponeFecha(objOriginal,objDia,objMes,objAno)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  objDia.value=fecha[0];
  objMes.value=fecha[1];
  objAno.value=fecha[2];
  
  verificaExistenciaRegistro();
}