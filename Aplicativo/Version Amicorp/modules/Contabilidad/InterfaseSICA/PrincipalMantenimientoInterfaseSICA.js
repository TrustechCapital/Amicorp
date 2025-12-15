var catSaldoConcilia = new Catalogo("mx.com.inscitech.fiducia.domain.SaldoIniConcilia");

showWaitLayer();

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroModulos\",\"numOpcion\":0}");

var tablaSaldoConciliaData = new Array();
tablaSaldoConciliaData[0] = "sicNumCtam,90";
tablaSaldoConciliaData[1] = "sicNumScta,235";
tablaSaldoConciliaData[2] = "sicNumSscta,125";
tablaSaldoConciliaData[3] = "sicNumSsscta,100";
tablaSaldoConciliaData[4] = "sicTipoEnte,100";
tablaSaldoConciliaData[5] = "sicEnte,100";
tablaSaldoConciliaData[6] = "sicAno,100";
tablaSaldoConciliaData[7] = "sicMes,100";
tablaSaldoConciliaData[8] = "sicSalInicial,100";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoSICA = new FormValidator();

cargaPrincipalMantenimientoInterfasesSICA();
formsLoaded();

function cargaPrincipalMantenimientoInterfasesSICA() {
  //onButtonClick("Contabilidad.InterfaseSICA.PrincipalMantenimientoInterfaseSICA","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catModulos.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catModulos.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catModulos);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadModulos();
}

/////////////////////////////////////////////////////////////////////////////
//Funcion para direccionar al mantenimiento
function botonPrincipalCancelar() {
  cargaPrincipalInterfaseSICA();
  //loadDynamicJS (ctxRoot + "/modules/Contabilidad/PrincipalInterfasesSICA.js");
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoSeguridadModulos)
function cargaMantenimientoSeguridadModulos(tipoPantalla) {
  if ((tipoPantalla==2 || tipoPantalla==3) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadModulos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoModulos.setup({
    formName      : "frmMantenimientoSeguridadModulos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catModulos.setOnUpdate(catLoaded);
  if(operacion==2 || operacion==3)
    catModulos.buscaCatalogoPK(false);
  else
    formsLoaded();
}

function catLoaded() {
  if(operacion==2)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("funIdOpcion".split(","));
  else if(operacion==3)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmMantenimientoSeguridadModulos"));         //Deshabilita objetos (excepto botones)
    SA(GI("frmMantenimientoSeguridadModulos").cmdAceptar, "LKD", "true");
    SA(GI("frmMantenimientoSeguridadModulos").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  }
  
  formsLoaded();
}

function AltaOModificaInfo() {
  catModulos.setOnUpdate(operacionExitosa);
  if(operacion==1 && fvMantenimientoModulos.checkForm())//Se trata de una alta
    catModulos.altaCatalogo();
  else if(operacion==2 && fvMantenimientoModulos.checkForm())//Se trata de una modificación
    catModulos.modificaCatalogo();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==1 && GI("funIdOpcion").value!="")
  {
    validacionAlta.numOpcion = GI("funIdOpcion").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La Opción ya existe, verifique");
    GI("funIdOpcion").value="";
  }
}