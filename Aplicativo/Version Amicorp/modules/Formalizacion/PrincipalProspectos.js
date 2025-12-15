var catProspectos = new Catalogo("mx.com.inscitech.fiducia.domain.Prospect");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo16  = JSON.parse("{\"llaveClave\":16}");
var clavesCombo23  = JSON.parse("{\"llaveClave\":23}");
var clavesCombo148 = JSON.parse("{\"llaveClave\":148}");
var clavesCombo161 = JSON.parse("{\"llaveClave\":161}");
//var numRama = JSON.parse("{\"numRama\":-1,\"order\":1}");
var validaExistaRegistro = JSON.parse("{\"id\":\"verificarExistenciaRegistroProspecto\",\"numProspecto\":-1}");
var validacion = JSON.parse("{\"id\":\"cuentaAnteproyectosBajaProspectos\",\"numProspecto\":-1}");

initForms();

var tablaProspectosData = new Array();
tablaProspectosData[0] = "prsNumProspecto,42";
tablaProspectosData[1] = "prsNomProspecto,364";
tablaProspectosData[2] = "prsEjecAsig,131";
tablaProspectosData[3] = "prsFecProspecto,118";
tablaProspectosData[4] = "prsFecConstit,111";
tablaProspectosData[5] = "prsNumContrato,88";
tablaProspectosData[6] = "prsCveStatus,107";

var operacion = 0;
var numPantalla = 0;

var parametroComboEstado;
var numRama;
var usarSetValuesFormObject=false;

pkInfo=null;
var fechaConstitucion = new Date();
var fechaProspecto = new Date();
var fvMantenimientoProspectos = new FormValidator();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalProspectos() {
  onButtonClickPestania("Formalizacion.PrincipalProspectos","");
}

function clickTabla(pk) {
  pkInfo = pk;
  
  cloneObject(pk,catProspectos.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalProspectos();
  hideWaitLayer();
}

function verificaExistaProspecto() {
  if(GI("prsNumProspecto").value!="")
  {
    validaExistaRegistro.numProspecto=GI("prsNumProspecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaExistaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistaProspecto, null);
  }
}

function verificacionExistaProspecto(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Prospecto ya existe");
    GI("prsNumProspecto").value="";
  }
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoProspectos(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    if(pkInfo!=null && tipoPantalla==MODIFICAR)
    {
      if(pkInfo.prsCveStatus == "CONSTITUIDO")
        alert("El Prospecto está CONSTITUIDO");
      else
      {
        operacion = tipoPantalla;
        numPantalla = 1;
        showWaitLayer();
        var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectos.do";
        makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProspectos, null);
      }
    }
    else
    {
      operacion = tipoPantalla;
      numPantalla = 1;
      showWaitLayer();
      var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectos.do";
      makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProspectos, null);
    }
  }
}

function despliegaPantallaMantenimientoProspectos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoProspectos.setup({
    formName      : "frmDatosMantenimientoProspectos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcinalidad de la Fecha de Constitución
  Calendar.setup({
  inputField     :    "prsFecConstit",   // id of the input field
  button         :    "prsFecConstit",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaConstitucion,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
  });
  //Agregando la funcinalidad de la Fecha Prospecto
  Calendar.setup({
  inputField     :    "prsFecProspecto",   // id of the input field
  button         :    "prsFecProspecto",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaProspecto,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
  });
}


function loadCatalogo() {
  catProspectos.setOnUpdate(catLoaded);
  deshabilitaPK("prsNumProspecto".split(","));
  if(operacion==MODIFICAR || operacion==CONSULTAR){
    //Deshabilitando campos Fideicomiso y Fecha de Constitución
    deshabilitaPK("prsNumContrato,prsFecConstit".split(","));
    catProspectos.buscaCatalogoPK(false);
  }else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    
    var Secuencial = JSON.parse("{\"id\":\"numSecProspecto\"}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(Secuencial);
    makeAjaxRequest(url, "HTML", verificarSecuencial, null);
  }
}

function verificarSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("prsNumProspecto").value=objResult[0].secNumProspecto;
  hideWaitLayer();
}


function catLoaded() {
  cargaParamComboEstado(GI("prsNomPais"),true);
  cargaComboSubRamas(GI("prsCorreo2"),true);
  if(operacion==MODIFICAR)
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoProspectos"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  
  formsLoaded();
}

function AltaOModificaInfo() {
  catProspectos.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoProspectos.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catProspectos.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoProspectos.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catProspectos.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    if(pkInfo.prsCveStatus == "CONSTITUIDO")
      alert("El Prospecto está CONSTITUIDO");
    else
    {
      validacion.numProspecto = pkInfo.prsNumProspecto;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacion);
      makeAjaxRequest(url, "HTML", verificarEliminacion, null);
    }
  }
}

function verificarEliminacion(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].totalAnteproy > 0)
    alert("El Prospecto está asignado a un Proyecto");
  else
  {
    catProspectos.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectos);
  }
}


////////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Estado
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"llaveClaveEstado\": \"" +objCombo.value + "\"}");
  SA(GI("prsNomEstado"),"next","asignaEstado");
  loadElement(GI("prsNomEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectos.getCatalogo());
  else
    GI("prsNomEstado").selectedIndex=0;
  
  formsLoaded();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para el uso del calendario
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

function validaNacionalidad(tipo)
{
  if(tipo='NACION'){
    if(GI('prsNomNacion').value=='MEXICANA' && GI('prsCveMigra').value=='EXTRANJERA'){GI('prsCveMigra').selectedIndex=0;}
    if(GI('prsNomNacion').value!='MEXICANA' && GI('prsNomNacion').selectedIndex!=0 && GI('prsCveMigra').value=='NACIONAL'){GI('prsCveMigra').selectedIndex=0;}
   
  }
  
  if(tipo='MIGRA'){
    if(GI('prsNomNacion').value=='MEXICANA' && GI('prsCveMigra').value=='EXTRANJERA'){GI('prsNomNacion').selectedIndex=0;}
    if(GI('prsNomNacion').value!='MEXICANA' && GI('prsNomNacion').selectedIndex!=0 && GI('prsCveMigra').value=='NACIONAL'){GI('prsNomNacion').selectedIndex=0;}
    
  }
}


//para cargar actividades economicas hijas dinamicamente

var objComboParamAlt;

function cambiaCombo(item)
{


  if(item.selectedIndex>0 && item.selectedIndex<=item.options.length){
     
      
     var combohijo=GI('prsCveActividad'); 
     SA(eval(combohijo), "param","objComboParamAlt");
      objComboParamAlt = JSON.parse("{\"numRama\":"+item.value+"}");                            
      loadElement(combohijo);  
  }

}


function cargaComboSubRamas(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  numRama = JSON.parse("{\"numRama\": " +objCombo.value + "}");
  SA(GI("prsCveActividad"),"next","asignaActividad");
  loadElement(GI("prsCveActividad"));
}

function asignaActividad(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectos.getCatalogo());
  else
    GI("prsCveActividad").selectedIndex=0;
  
  formsLoaded();
}


/*
function cargaComboSubRamas(objGiro){
    limpiaCombos("prsCveActividad");
    showWaitLayer();
    numRama.numRama = objGiro.value; 
    loadElement(GI("prsCveActividad"));
}*/