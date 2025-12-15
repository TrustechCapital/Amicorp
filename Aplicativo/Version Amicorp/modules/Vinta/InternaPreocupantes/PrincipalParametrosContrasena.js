var cat = new Catalogo("mx.com.inscitech.fiducia.domain.InternasPreocupantes");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbParam660 = JSON.parse("{\"Indice\":660,\"orderDescripcion\":\"s\"}");
var cmbEmpresas = JSON.parse("{}");

var tablaData = new Array();
tablaData[0] = "iprFolio,100px";
tablaData[1] = "iprTipoReporte,300px";
tablaData[2] = "iprPeriodoReporte,300px";
tablaData[3] = "iprCveSujObl,300px";

var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;
initForms();
formsLoaded();

function limpiar(objForma){
  RF(objForma);
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.InternasPreocupantes");
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla

var operacion = 0;

function cargaMantenimiento(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Vinta/InternaPreocupantes/MantenimientoParametrosContrasena.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}


function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
  initForms();
  loadCatalogo();
  
  //Agregando la funcionalidad del required
  fvMantenimiento.setup({
    formName      : "frmDatosMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true,
    showErrors    : true
  });
}

function loadCatalogo() {
  cat.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    cat.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("iprTipoReporte,iprPeriodoReporte,iprFolio".split(","));
    funcactivacampos();
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  //alert("Operacion: " + operacion);
  cat.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimiento.checkForm())//Se trata de una alta
  {
    if(GI("iprRfc").value==""&&GI("iprCurp").value==""&&GI("iprFecNacimiento").value==""){
        alert("Son campos obligatorios el RFC o el CURP o la Fecha de Nacimiento");
        GI("iprRfc").focus();
    }
    else{
        showWaitLayer();
        cat.altaCatalogo();    
    }
  }
  else if(operacion==MODIFICAR && fvMantenimiento.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    cat.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    cat.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(cat);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipal();
  hideWaitLayer();
}

function cargaPrincipal() {
  onButtonClickPestania("Vinta.InternaPreocupantes.PrincipalParametrosContrasena","");
}



function verificarAlta() {
  if(GI("iprPeriodoReporte").value!="")
  {
    var ingresaSecuencial = JSON.parse("{\"id\":\"conInternPreocuSec\"}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(ingresaSecuencial);
    //alert(url)
    makeAjaxRequest(url, "HTML", funcionIngresaSecuencial, null);
  }
}

function funcionIngresaSecuencial(obj, result) {
 //alert(result)
  var objResult = JSON.parse(result);
  GI("iprFolio").value = objResult[0].folio;
}

function funcactivacampos() {
    ActivaTipoPersona();
}

function ActivaTipoPersona()
{
    //1 persona fisica y 2 persona moral
    if(eval(GI("iprTipoPersona").value)==2) {
        GI("iprRazonSocial").disabled=false;
        GI("iprNombre").disabled=true;
        GI("iprApPat").disabled=true;
        GI("iprApMat").disabled=true;
        GI("iprApMaterno").disabled=true;
        GI("iprApPaterno").disabled=true;
    }
    else {
        GI("iprRazonSocial").disabled=true;
        GI("iprNombre").disabled=false;
        GI("iprApPat").disabled=false;
        GI("iprApMat").disabled=false;        
        GI("iprApMaterno").disabled=false;
        GI("iprApPaterno").disabled=false;
    }
}

function ValidaLongRFC() {
    if(GI("iprRfc").value!=""){
        if(!(GI("iprRfc").value.length>=13 && GI("iprRfc").value.length<=14) ){
            alert("La longitud del RFC deber ser entre 13 y 14 Caracteres");
            GI("iprRfc").focus();
        }      
    }
}

function ValidaLongCURP() {
    if(GI("iprCurp").value!=""){
        if(GI("iprCurp").value.length!=18){
            alert("La longitud del CURP deber ser de 18 Caracteres");
            GI("iprCurp").focus();
        }
            
    }
}

