var catMiembrosComiteTecnico = new Catalogo("mx.com.inscitech.fiducia.domain.Comite");

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesComboMiembros31 = JSON.parse("{\"llaveClave\":31}");

var tablaMiembrosComiteTecnicoData = new Array();
tablaMiembrosComiteTecnicoData[0] = "comNomMiembro,220px";
tablaMiembrosComiteTecnicoData[1] = "comCveParticip,200px";
tablaMiembrosComiteTecnicoData[2] = "comNomInstituc,270px";
tablaMiembrosComiteTecnicoData[3] = "comNomPuesto,350px";
tablaMiembrosComiteTecnicoData[4] = "comCveStMiembro,90px";

var operacionMiembrosComiteTecnico = 0;
var numPantallaMiembrosComiteTecnico = 0;
var pkAux = pkInfo;

var nombreComite = "";
pkInfo = null;
var fechaDesignacion = new Date();
var fvMantenimientoMiembrosComiteTecnico = new FormValidator();

function descomponeFechaMiembros(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  GI("comDiaDesig").value=fecha[0];
  GI("comMesDesig").value=fecha[1];
  GI("comAnoDesig").value=fecha[2];
}

function cargaPrincipalMiembrosComiteTecnico() {
  operacionMiembrosComiteTecnico = 0;
  numPantallaMiembrosComiteTecnico = 0;
  pkInfo = null;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Administracion/PrincipalMiembrosComiteTecnico.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoMiembrosComiteTecnico, nombreComite);
}

function clickTablaMiembros(pk) {
  pkInfo = pk;
  cloneObject(pk,catMiembrosComiteTecnico.getCatalogo());
}

function operacionExitosaMiembros() {
  alert("La operación se realizó correctamente");
  cargaPrincipalMiembrosComiteTecnico();
  hideWaitLayer();
}

function cargaMantenimientoMiembrosComiteTecnico(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacionMiembrosComiteTecnico = tipoPantalla;
    numPantallaMiembrosComiteTecnico = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoMiembrosComiteTecnico.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoMiembrosComiteTecnico, nombreComite);
  }
}

function despliegaPantallaMantenimientoMiembrosComiteTecnico(obj, result) {
  GI("dvPantalla").innerHTML = result;
  nombreComite = obj;
  
  if(numPantallaMiembrosComiteTecnico==0)
  {
    GI("paramNumContratoMiembros").value=pkAux.conNumContrato;
    
    consultaNombreFideicomiso("nomFideicomiso",GI("paramNumContratoMiembros"));
    GI("txtNomComite").value = nombreComite;
    
    deshabilitaPK("paramNumContratoMiembros,txtNomComite".split(","));
    consultar(GI("hdRegistrosMiembrosComiteTecnico"), GI('frmDatosMiembrosComiteTecnicoConsulta'), false);
    hideWaitLayer();
  }
  
  else if(numPantallaMiembrosComiteTecnico==1)
  {
    initForms();
    
    //Agregando la funcionalidad del required
    fvMantenimientoMiembrosComiteTecnico.setup({
      formName      : "frmDatosMiembrosComiteTecnicoMantenimiento",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
      //invalidFormatMsg: ""
    });
    
    Calendar.setup({
    inputField     :    "txtFechaDesignacion",   // id of the input field
    button         :    "txtFechaDesignacion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDesignacion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
  }
}

function loadCatalogoMiembros() {
  catMiembrosComiteTecnico.setOnUpdate(catLoadedMiembros);
  
  deshabilitaPK("comNumMiembro,comNumContrato,txtNomComite".split(","));
  if(operacionMiembrosComiteTecnico==MODIFICAR || operacionMiembrosComiteTecnico==CONSULTAR)
    catMiembrosComiteTecnico.buscaCatalogoPK(false);
  else
  {
    GI("comNumContrato").value = pkAux.conNumContrato;
    verificacionAlta(GI("comNumContrato"));
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoadedMiembros() {
  if(numPantallaMiembrosComiteTecnico==1 && (operacionMiembrosComiteTecnico==MODIFICAR || operacionMiembrosComiteTecnico==CONSULTAR))
    GI("txtFechaDesignacion").value=GI("comDiaDesig").value+"/"+GI("comMesDesig").value+"/"+GI("comAnoDesig").value;
  
  if(operacionMiembrosComiteTecnico==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
  else if(operacionMiembrosComiteTecnico==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMiembrosComiteTecnicoMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar datos en campos informativos
  GI("txtNomComite").value = nombreComite;
  consultaNombreFideicomiso("nomFideicomiso",GI("comNumContrato"));
  formsLoaded();
}



function AltaOModificaInfoMiembrosComiteTecnico() {
  catMiembrosComiteTecnico.setOnUpdate(operacionExitosaMiembros);
  if(operacionMiembrosComiteTecnico==ALTA && fvMantenimientoMiembrosComiteTecnico.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catMiembrosComiteTecnico.altaCatalogo();
  }
  else if(operacionMiembrosComiteTecnico==MODIFICAR && fvMantenimientoMiembrosComiteTecnico.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catMiembrosComiteTecnico.modificaCatalogo();
  }
}


function eliminarRegistroMiembros() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catMiembrosComiteTecnico.setOnUpdate(operacionExitosaMiembros);
    showWaitLayer();
    eliminaCatalogo(catMiembrosComiteTecnico);
  }
}


//////////////////////////////////////////////////////////////////
function verificacionAlta(objeto) {
  var validacionAltaMiembros = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
  validacionAltaMiembros.numContrato = objeto.value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaMiembros);
  makeAjaxRequest(url, "HTML", verificarAltaMiembros, objeto);
}

function verificarAltaMiembros(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    var SecNumMiembros = JSON.parse("{\"id\":\"numSecNumMiembro\",\"NumFiso\":0}");
    SecNumMiembros.NumFiso=obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumMiembros);
    makeAjaxRequest(url, "HTML", agregarNumMiembro, obj);
  }
  else
  {
    showWaitLayer();
    alert("El Fideicomiso no está ACTIVO");
    cargaPrincipalMiembrosComiteTecnico();
    hideWaitLayer();
  }
}

function agregarNumMiembro(obj, result) {
  var objResult = JSON.parse(result);
  consultaNombreFideicomiso("nomFideicomiso",obj);
  GI("txtNomComite").value = nombreComite;
  GI("comNumMiembro").value=objResult[0].secNumMiembro;
}

/////////////////////////////////////////////////////////////////////////////
//Funciones para integrar la funcionalidad de la fecha
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