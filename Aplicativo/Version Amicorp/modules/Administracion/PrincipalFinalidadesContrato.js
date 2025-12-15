var catFinalidades = new Catalogo("mx.com.inscitech.fiducia.domain.Finalida");

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo164 = JSON.parse("{\"llaveClave\":164}");
var usarSetValuesFormObject = null;

initForms();

var tablaFinalidadesContratoData = new Array();
tablaFinalidadesContratoData[0] = "finNumContrato,90px";
//tablaFinalidadesContratoData[1] = "finFolioFinalida,80px";
//tablaFinalidadesContratoData[2] = "finCveTipoFinal,200px";
//tablaFinalidadesContratoData[3] = "finNumDictador,100px";
tablaFinalidadesContratoData[1] = "finNomDictador,300px";
tablaFinalidadesContratoData[2] = "finCveStFinalid,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoFinalidades = new FormValidator();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalFinalidadesContrato() {
  onButtonClickPestania("Administracion.PrincipalFinalidadesContrato","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catFinalidades.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catFinalidades = new Catalogo("mx.com.inscitech.fiducia.domain.Finalida");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalFinalidadesContrato();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoFinalidadesContrato(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFinalidadesContrato.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFinalidadesContrato, null);
  }
}

function despliegaPantallaMantenimientoFinalidadesContrato(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoFinalidades.setup({
    formName      : "frmDatosFinalidadesContratoMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  deshabilitaPK("finFolioFinalida".split(","));
}

function loadCatalogo() {
  catFinalidades.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catFinalidades.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("finNumContrato,finCveTipoFinal".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosFinalidadesContratoMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar el nombre del fiso (informativo)
  consultaNombreFideicomiso("nomFideicomiso",GI("finNumContrato"));
  cargaParamComboMandante(GI("finNumContrato"),true);
  formsLoaded();
}

function AltaOModificaInfo() {
  catFinalidades.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoFinalidades.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catFinalidades.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoFinalidades.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catFinalidades.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catFinalidades.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catFinalidades);
  }
}


///////////////////////////////////////////////////////////
function mostrarDatosInformativos() {
  showWaitLayer();
  var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
  validacionAlta.numContrato = GI("finNumContrato").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
  makeAjaxRequest(url, "HTML", verificarAlta, GI("finNumContrato"));
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = GI("finNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    asignaEtiqueta("nomFideicomiso","");
    GI("finFolioFinalida").value = "";
    obj.value="";
    borraCombos("finNumDictador");
    obj.focus();
    hideWaitLayer();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    consultaNombreFideicomiso("nomFideicomiso",obj);
    
    //Agregar el número de la Finalidad (Incremental)
    var SecNumFinalida = JSON.parse("{\"id\":\"numSecNumFinalida\",\"NumFiso\":0}");
    SecNumFinalida.NumFiso=GI("finNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumFinalida);
    makeAjaxRequest(url, "HTML", agregarFinalida, obj);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    asignaEtiqueta("nomFideicomiso","");
    GI("finFolioFinalida").value = "";
    obj.value="";
    borraCombos("finNumDictador");
    obj.focus();
    hideWaitLayer();
  }
}

function agregarFinalida(obj, result) {
  var objResult = JSON.parse(result);
  GI("finFolioFinalida").value=objResult[0].secNumFinalida;
  
  cargaParamComboMandante(obj,false);
}

/////////////////////////////////////////////////////////////////////////
//Verificar al intentar dar de alta si el Registro aún no existe
function verificacionExistenciaRegistro(isNumContrato) {
  if(GI("finNumContrato").value!="" && GI("finCveTipoFinal").value!="" && GI("finFolioFinalida").value!=-1)
  {
    showWaitLayer();
    var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaFinalidadesAdmon\",\"numContrato\":0,\"cveTipoFinal\":0,\"folioFinalida\":0}");
    validacionExistenciaRegistro.numContrato = GI("finNumContrato").value;
    validacionExistenciaRegistro.cveTipoFinal = GI("finCveTipoFinal").value;
    validacionExistenciaRegistro.folioFinalida = GI("finFolioFinalida").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistenciaRegistroFunction, GI("finNumContrato"));
  }
  if(GI("finNumContrato").value!="" && isNumContrato)
    mostrarDatosInformativos();
  else if(GI("finNumContrato").value=="" && isNumContrato)
  {
    asignaEtiqueta("nomFideicomiso","");
    GI("finFolioFinalida").value = "";
    borraCombos("finNumDictador");
  }
}

function verificacionExistenciaRegistroFunction(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Registro ya existe, verifique");
    obj.value="";
    GI("finCveTipoFinal").value=-1;
    GI("finFolioFinalida").value="";
    borraCombos("finNumDictador");
    obj.focus();
  }
  hideWaitLayer();
}


/////////////////////////////////////////////////////////////////////////
//Función para obtener el Nombre del Dictador
function obtieneNombre(combo) {
  if(combo.value != -1)
    GI("finNomDictador").value = combo.options[combo.selectedIndex].text;
  else
    GI("finNomDictador").value = "";
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Fideicomitente/Mandante luego de haber colocado un número de Fideicomiso
function cargaParamComboMandante(obj,usoSetValuesFormObject){
  usarSetValuesFormObject = usoSetValuesFormObject;
  parametroComboMandante = JSON.parse("{\"llaveClaveNumContrato\": " +obj.value + "}");
  SA(GI("finNumDictador"),"next","asignaMandante");
  loadElement(GI("finNumDictador"));
}

function asignaMandante(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(catFinalidades.getCatalogo());
  }
  else
    GI("finNumDictador").selectedIndex=0;
  
  formsLoaded();
}