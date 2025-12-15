var catEstructura = new Catalogo("mx.com.inscitech.fiducia.domain.Estructu");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroSeguridadEstructura\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");

initForms();

var validacionBaja1 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEjecutivos\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja2 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEComite\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja3 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEIngre\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja4 = JSON.parse("{\"id\":\"verificaExistenciaRegistroENegs\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja5 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEPatri\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja6 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEPresup\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja7 = JSON.parse("{\"id\":\"verificaExistenciaRegistroEProsp\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja8 = JSON.parse("{\"id\":\"verificaExistenciaRegistroERecpat\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja9 = JSON.parse("{\"id\":\"verificaExistenciaRegistroPersonal\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");
var validacionBaja10 = JSON.parse("{\"id\":\"verificaExistenciaRegistroUsuarios\",\"nivel1\":0,\"nivel2\":0,\"nivel3\":0,\"nivel4\":0,\"nivel5\":0}");


var tablaDatosEstructuraData = new Array();
tablaDatosEstructuraData[0] = "estNumNivel1,35px";
tablaDatosEstructuraData[1] = "estNumNivel2,35px";
tablaDatosEstructuraData[2] = "estNumNivel3,35px";
tablaDatosEstructuraData[3] = "estNumNivel4,35px";
tablaDatosEstructuraData[4] = "estNumNivel5,35px";
tablaDatosEstructuraData[5] = "estDescNivel,225px";
tablaDatosEstructuraData[6] = "estNomRespNivel,170px";
tablaDatosEstructuraData[7] = "estNumCveLada1,45px";
tablaDatosEstructuraData[8] = "estNumTelef1,100px";
tablaDatosEstructuraData[9] = "estNumExt1,45px";
tablaDatosEstructuraData[10] = "estCveStNivel,70px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoEstructura = new FormValidator();

var parametroComboEstado;
var usarSetValuesFormObject=false;
var CONSULTAR = 3;

function cargaPrincipalSeguridadEstructuraControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadEstructuraControlGestion","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catEstructura.getCatalogo());
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadEstructuraControlGestion();
  hideWaitLayer();
}

///////////////////////////////////////////////////////////////////////////
//Funciones que verifican si es posible eliminar el registro
function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    validacionBaja1.nivel1 = pkInfo.estNumNivel1;
    validacionBaja1.nivel2 = pkInfo.estNumNivel2;
    validacionBaja1.nivel3 = pkInfo.estNumNivel3;
    validacionBaja1.nivel4 = pkInfo.estNumNivel4;
    validacionBaja1.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja1);
    makeAjaxRequest(url, "HTML", validandoBaja1, null);
  }
}

function validandoBaja1(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existen ejecutivos asignados a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja2.nivel1 = pkInfo.estNumNivel1;
    validacionBaja2.nivel2 = pkInfo.estNumNivel2;
    validacionBaja2.nivel3 = pkInfo.estNumNivel3;
    validacionBaja2.nivel4 = pkInfo.estNumNivel4;
    validacionBaja2.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja2);
    makeAjaxRequest(url, "HTML", validandoBaja2, null);
  }
}

function validandoBaja2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de comités en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja3.nivel1 = pkInfo.estNumNivel1;
    validacionBaja3.nivel2 = pkInfo.estNumNivel2;
    validacionBaja3.nivel3 = pkInfo.estNumNivel3;
    validacionBaja3.nivel4 = pkInfo.estNumNivel4;
    validacionBaja3.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja3);
    makeAjaxRequest(url, "HTML", validandoBaja3, null);
  }
}

function validandoBaja3(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de ingresos en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja4.nivel1 = pkInfo.estNumNivel1;
    validacionBaja4.nivel2 = pkInfo.estNumNivel2;
    validacionBaja4.nivel3 = pkInfo.estNumNivel3;
    validacionBaja4.nivel4 = pkInfo.estNumNivel4;
    validacionBaja4.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja4);
    makeAjaxRequest(url, "HTML", validandoBaja4, null);
  }
}

function validandoBaja4(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de negocios en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja5.nivel1 = pkInfo.estNumNivel1;
    validacionBaja5.nivel2 = pkInfo.estNumNivel2;
    validacionBaja5.nivel3 = pkInfo.estNumNivel3;
    validacionBaja5.nivel4 = pkInfo.estNumNivel4;
    validacionBaja5.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja5);
    makeAjaxRequest(url, "HTML", validandoBaja5, null);
  }
}

function validandoBaja5(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de ingresos patrimoniales en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja6.nivel1 = pkInfo.estNumNivel1;
    validacionBaja6.nivel2 = pkInfo.estNumNivel2;
    validacionBaja6.nivel3 = pkInfo.estNumNivel3;
    validacionBaja6.nivel4 = pkInfo.estNumNivel4;
    validacionBaja6.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja6);
    makeAjaxRequest(url, "HTML", validandoBaja6, null);
  }
}

function validandoBaja6(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. del presupuesto asignado en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja7.nivel1 = pkInfo.estNumNivel1;
    validacionBaja7.nivel2 = pkInfo.estNumNivel2;
    validacionBaja7.nivel3 = pkInfo.estNumNivel3;
    validacionBaja7.nivel4 = pkInfo.estNumNivel4;
    validacionBaja7.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja7);
    makeAjaxRequest(url, "HTML", validandoBaja7, null);
  }
}

function validandoBaja7(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de prospectos en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja8.nivel1 = pkInfo.estNumNivel1;
    validacionBaja8.nivel2 = pkInfo.estNumNivel2;
    validacionBaja8.nivel3 = pkInfo.estNumNivel3;
    validacionBaja8.nivel4 = pkInfo.estNumNivel4;
    validacionBaja8.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja8);
    makeAjaxRequest(url, "HTML", validandoBaja8, null);
  }
}

function validandoBaja8(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe inf. de recursos patrimoniales en información ejecutiva asignada a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja9.nivel1 = pkInfo.estNumNivel1;
    validacionBaja9.nivel2 = pkInfo.estNumNivel2;
    validacionBaja9.nivel3 = pkInfo.estNumNivel3;
    validacionBaja9.nivel4 = pkInfo.estNumNivel4;
    validacionBaja9.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja9);
    makeAjaxRequest(url, "HTML", validandoBaja9, null);
  }
}

function validandoBaja9(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existe personal asignado a la estructura");
    hideWaitLayer();
  }
  else
  {
    validacionBaja10.nivel1 = pkInfo.estNumNivel1;
    validacionBaja10.nivel2 = pkInfo.estNumNivel2;
    validacionBaja10.nivel3 = pkInfo.estNumNivel3;
    validacionBaja10.nivel4 = pkInfo.estNumNivel4;
    validacionBaja10.nivel5 = pkInfo.estNumNivel5;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionBaja10);
    makeAjaxRequest(url, "HTML", validandoBaja10, null);
  }
}

function validandoBaja10(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("Existen usuarios asignados a la estructura");
    hideWaitLayer();
  }
  else
  {
    catEstructura.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catEstructura);
  }
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoSeguridadEstructuraControlGestion)
function cargaMantenimientoSeguridadEstructuraControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadEstructuraControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoEstructura.setup({
    formName      : "frmMantenimientoSeguridadEstructuraControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catEstructura.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catEstructura.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(numPantalla==1)
    cargaParamComboEstado(GI("estNomPais"),true); //El combo se carga sólo en el Mantenimiento
  
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("estNumNivel1,estNumNivel2,estNumNivel3,estNumNivel4,estNumNivel5".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoSeguridadEstructuraControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catEstructura.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoEstructura.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catEstructura.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoEstructura.checkForm())//Se trata de una modificación{
  {
    showWaitLayer();
    catEstructura.modificaCatalogo();
  }
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("estNumNivel1").value!="" && GI("estNumNivel2").value!="" && GI("estNumNivel3").value!="" && GI("estNumNivel4").value!="" && GI("estNumNivel5").value!="")
  {
    showWaitLayer();
    validacionAlta.nivel1 = GI("estNumNivel1").value;
    validacionAlta.nivel2 = GI("estNumNivel2").value;
    validacionAlta.nivel3 = GI("estNumNivel3").value;
    validacionAlta.nivel4 = GI("estNumNivel4").value;
    validacionAlta.nivel5 = GI("estNumNivel5").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La clave ya existe, verifique");
    GI("estNumNivel1").value="";
    GI("estNumNivel2").value="";
    GI("estNumNivel3").value="";
    GI("estNumNivel4").value="";
    GI("estNumNivel5").value="";
  }
  hideWaitLayer();
}


////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Estados luego de haber elegido alguna opción del combo Paises
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"llaveClaveEstado\":\"" + objCombo.value + "\"}");
  SA(GI("estNomEstado"),"next","asignaEstado");
  loadElement(GI("estNomEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catEstructura.getCatalogo());
  else
    GI("estNomEstado").selectedIndex=0;
  
  formsLoaded();
}
