showWaitLayer();

var catFuncionesXPuesto = new Catalogo("mx.com.inscitech.fiducia.domain.FPerFun");
var validacionExisteRegistro = JSON.parse("{\"id\":\"verificaExistenciaRegistroFuncionesXPuesto\",\"numPuesto\":0}");
var paramOrderPerfil = JSON.parse("{\"orderPerfil\":\"s\"}");

initForms();

var tablaFuncionesXPuestoData = new Array();
//tablaFuncionesXPuestoData[0] = "fperIdPerfil,154";
tablaFuncionesXPuestoData[0] = "ffunIdFuncion,120px";
tablaFuncionesXPuestoData[1] = "ffunNomMenu,500px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoFuncionesXPuesto = new FormValidator();
var valorPuestoPrincipal;
var parametroComboFuncionesAsignadas = JSON.parse("{\"Puesto\":0,\"orderPuesto\":\"0\"}");

fvMantenimientoFuncionesXPuesto.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaPrincipalSeguridadFuncionesXPuesto() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadFuncionesXPuesto","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoSeguridadFuncionesXPuesto)
function cargaMantenimientoSeguridadFuncionesXPuesto(tipoPantalla,objCmbPuesto) {
  operacion = tipoPantalla;
  numPantalla = 1;
  valorPuestoPrincipal = objCmbPuesto.value;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadFuncionesXPuesto.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
}

///////////////////////////
function loadCatalogo() {
  eliminaSeleccione(GI("txtFunciones"));
  GI("fperIdPerfil").value = valorPuestoPrincipal;
  deshabilitaPK("fperIdPerfil".split(","));
  
  if(operacion == 1)
    muestraObjs("cmdAceptar,cmdCancelar");
  else if(operacion == 2)
  {
    deshabilitaPK("cmdAgregar,cmdQuitar".split(","));
    GI("cmdCancelar").value = "Regresar";
    muestraObj("cmdCancelar");
  }
  
  parametroComboFuncionesAsignadas = JSON.parse("{\"Puesto\":" + valorPuestoPrincipal+ ",\"orderPuesto\":\"s\"}");
  SA(GI("txtFuncionesAsignadas"),"next","asignaFuncionesAsignadas");
  loadElement(GI("txtFuncionesAsignadas"));
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo txtFuncionesAsignadas luego de haber elegido alguna opción del combo Puesto
/*function cargaParamComboFuncionesAsignadas(objCombo){
  parametroComboFuncionesAsignadas = JSON.parse("{\"Puesto\": " + objCombo.value + "}");
  SA(GI("txtFuncionesAsignadas"),"next","asignaFuncionesAsignadas");
  loadElement(GI("txtFuncionesAsignadas"));
}*/

function asignaFuncionesAsignadas(){
  GI("txtFuncionesAsignadas").selectedIndex=0;
  eliminaSeleccione(GI("txtFuncionesAsignadas"));
  formsLoaded();
}


//////////////////////////////////////////////////////////////////////
//Funciones para Agregar y Quitar del combo txtFuncionesAsignadas
function agregarClave(objComboOrigen, objComboDestino){
  if(objComboOrigen.selectedIndex !=-1 && fvMantenimientoFuncionesXPuesto.checkForm()){
    showWaitLayer();
    var key = GA(objComboDestino, "keyValue");
    var value = GA(objComboDestino, "theValue");
    var llave = objComboOrigen.options[objComboOrigen.selectedIndex].value;
    var texto = objComboOrigen.options[objComboOrigen.selectedIndex].text;
    var result = "[{\"" + key + "\":\"" + llave + "\",\"" + value + "\":\"" + texto + "\"}]";
    var arrValues = JSON.parse(result);
    if(!validaExisteClave(texto,objComboDestino))
      addCombo(objComboDestino, arrValues, key, value);
    else
      alert("La Función ya está asignada al Perfil");
    hideWaitLayer();
  }
}

function quitarClave(objCombo){
  if(objCombo.selectedIndex !=-1){
    showWaitLayer();
    if(objCombo.selectedIndex == 0)
      eliminaSeleccione(objCombo);
    else if(objCombo.selectedIndex == objCombo.options.length-1){
      objCombo.options.length = objCombo.options.length - 1;
      objCombo.selectedIndex = objCombo.options.length - 1;
    }else{
        for(var i = objCombo.selectedIndex; i <= objCombo.options.length - 2; i++){
          objCombo.options[i].value = objCombo.options[i+1].value;
          objCombo.options[i].text = objCombo.options[i+1].text;
        }
        objCombo.options.length = objCombo.options.length - 1;
    }
    hideWaitLayer();
  }
}

function validaExisteClave(strValor,objCombo){
  for(var i = 0; i < objCombo.options.length; i++){
    if(objCombo.options[i].text == strValor)
      return true;
  }
  return false;
}


//////////////////////////////////////////////////////////////////
//Aceptar la Operacion
function ejecutaOperacionFunciones(){
  if(fvMantenimientoFuncionesXPuesto.checkForm())
  {
    showWaitLayer();
    realizarDeletesFuncionesXPuesto(realizarInsercionesFuncionesXPuesto);
  }
}

function realizarDeletesFuncionesXPuesto(funcionMantenimiento){
    var puesto = GI("fperIdPerfil").value;
    var url = ctxRoot + "/doRef.do?json={\"id\":\"delDatoFuncionesXPuestoPerfil\",\"Puesto\":" + puesto + "}";
    makeAjaxRequest(url, "HTML", funcionMantenimiento, null);
}

function realizarInsercionesFuncionesXPuesto(obj, result) {  
  var dato0 = GI("fperIdPerfil").value;
  var objCombo = GI("txtFuncionesAsignadas");
  
  for(var i = 0; i < objCombo.options.length; i++){
    //showWaitLayer();
    var dato = objCombo.options[i].value ;
    var parametros = "\"numPuesto\":" + dato0 + ",\"idOpcion\":" + dato;
    var url = ctxRoot + "/doRef.do?json={\"id\":\"insDatoFuncionesXPuestoPerfil\","+ parametros + "}";
    makeAjaxRequest(url, "HTML", verificaInsercionesFunciones, i + "==" + (objCombo.options.length-1));
    //hideWaitLayer();
  }
}

function verificaInsercionesFunciones(obj, result) {
  if(eval(obj)) {
    alert("Operacion realizada exitosamente!");
    cargaPrincipalSeguridadFuncionesXPuesto();
  }
}


////////////////////////////////////////////////////////////////////
//Función para el botón refrescar el menú
function refrescarMenu() {
  var urlRefresh = ctxRoot + "/modules/ControlGestion/clearMenuCache.do";
  makeAjaxRequest(urlRefresh, "HTML", null, null);
}