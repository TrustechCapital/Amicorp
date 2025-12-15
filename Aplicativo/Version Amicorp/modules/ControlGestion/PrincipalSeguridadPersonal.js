var catPersonal = new Catalogo("mx.com.inscitech.fiducia.domain.Personal");

showWaitLayer();

var paramOrderPerfil = JSON.parse("{\"orderPerfil\":\"s\"}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroPersonalSeguridad\",\"numUsuario\":0}");

//initForms();

var tablaDatosPersonalData = new Array();
tablaDatosPersonalData[0] = "perNumUsuario,50px";
tablaDatosPersonalData[1] = "perNomUsuario,300px";
tablaDatosPersonalData[2] = "perNivelEstudios,300px";
//tablaDatosPersonalData[2] = "fperNombrePerfil,250px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoPersonal = new FormValidator();
var fechaIngreso = new Date();
var fechaNacimiento = new Date();
var CONSULTAR = 3;

hideWaitLayer();

function cargaPrincipalSeguridadPersonal() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadPersonal","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catPersonal.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catPersonal.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catPersonal);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadPersonal();
  //hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoAutorizacionesControlGestion)
function cargaMantenimientoSeguridadPersonal(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadPersonal.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  //initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoPersonal.setup({
    formName      : "frmMantenimientoSeguridadPersonal",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad para la Fecha de Inicio
  Calendar.setup({
    inputField     :    "txtFecIngreso",   // id of the input field
    button         :    "txtFecIngreso",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaIngreso,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Agregando la funcionalidad para la Fecha Fin
  Calendar.setup({
    inputField     :    "txtFecNacimiento",   // id of the input field
    button         :    "txtFecNacimiento",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaNacimiento,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  loadCatalogo();
}

function loadCatalogo() {
  catPersonal.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catPersonal.buscaCatalogoPK(false);
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
    deshabilitaPK("perNumUsuario".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoSeguridadPersonal"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Obtener la Fecha de Inicio y de Fin y juntarla en las cajas de texto destinadas para ello
  GI("txtFecIngreso").value = formatString(GI("perDiaIng").value,"0",2,"Izquierda") + "/" + formatString(GI("perMesIng").value,"0",2,"Izquierda") + "/" + GI("perAnoIng").value;
  GI("txtFecNacimiento").value = formatString(GI("perDiaNac").value,"0",2,"Izquierda") + "/" + formatString(GI("perMesNac").value,"0",2,"Izquierda") + "/" + GI("perAnoNac").value;
  
  cargaRadiosConMaster("perImss","perImss2");
  cargaRadiosConMaster("perEdoCivil","perEdoCivil2,perEdoCivil3,perEdoCivil4,perEdoCivil5");
  //cargaRadiosConMaster("perSexo","perSexo2");
  
  formsLoaded();
}

function AltaOModificaInfo() {
  catPersonal.setOnUpdate(operacionExitosa);
  
  if(operacion==OPER_ALTA && fvMantenimientoPersonal.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catPersonal.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoPersonal.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catPersonal.modificaCatalogo();
  }
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("perNumUsuario").value!="")
  {
    showWaitLayer();
    validacionAlta.numUsuario = GI("perNumUsuario").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El usuario ya existe, verifique");
    GI("perNumUsuario").value="";
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
function descomponeFecha(objOriginal,objDia,objMes,objAno) {
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  objDia.value=fecha[0];
  objMes.value=fecha[1];
  objAno.value=fecha[2];
}

//Si selecciona un valor del combo Nombre, se cambia el combo Operaciones y viceversa
function igualaNombreOperaciones(numCombo) {
  if(numCombo==1)
    GI("autNumOperacion").value=GI("cmbNombre").value;
  else if(numCombo==2)
    GI("cmbNombre").value=GI("autNumOperacion").value;
  
  verificaExistenciaRegistro();
}

function convertirMayusculas( objeto ) {
   var strMayusculas = objeto.value;
   objeto.value = strMayusculas.toUpperCase();
   }
   