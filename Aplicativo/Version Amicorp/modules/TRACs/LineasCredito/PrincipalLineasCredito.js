var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var cmbFideicomisoTrac = JSON.parse("{}");
var cmbLineasCredito = JSON.parse("{}");
var cmbSubcuenta = JSON.parse("{}");
var clavesCombo26 = JSON.parse("{\"llaveClave\":26}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo388 = JSON.parse("{\"llaveClave\":388}");

var tablaData = new Array();
tablaData[0] = "lcrIdFideicomiso,50px";
tablaData[1] = "lcrIdLinea,50px";
tablaData[2] = "lcrScta,50px";
tablaData[3] = "lcrTipoCredito,150px";
tablaData[4] = "lcrInstitucion,100px";
tablaData[5] = "lcrNumDispo,80px";
tablaData[6] = "lcrImpCredito,100px";
tablaData[7] = "lcrImpDispo,100px";
tablaData[8] = "lcrTasa,50px";
tablaData[9] = "lcrFechaApertura,100px";
tablaData[10] = "lcrFechaVencimiento,100px";
tablaData[11] = "lcrStatus,50px";

var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;


//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}


initForms();
formsLoaded();


function limpiar(objForma){
  RF(objForma);
  catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FLineasCredito");
  pkInfo = null;
}

function cargaCmbScta(objcmb)
{
  cmbSubcuenta = JSON.parse("{\"Fideicomiso\":"+objcmb.value+"}");
  loadElement(GI("lcrScta"));
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla

var operacion = 0;

function cargaMantenimiento(tipoPantalla)
{
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    
    if(tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR)
      cmbSubcuenta = JSON.parse("{\"Fideicomiso\":"+pkInfo.lcrIdFideicomiso+"}");
    else
      cmbSubcuenta = JSON.parse("{\"Fideicomiso\":-1}");
      
    var urlCliente = ctxRoot + "/modules/TRACs/LineasCredito/MantenimientoLineasCredito.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}


function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
  
  cal.manageFields("lcrFechaApertura","lcrFechaApertura", "%d/%m/%Y");
  cal.manageFields("lcrFechaVencimiento","lcrFechaVencimiento", "%d/%m/%Y");

  initForms();
  
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
    deshabilitaPK("lcrIdFideicomiso,lcrIdLinea".split(","));
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
    showWaitLayer();
    cat.altaCatalogo();
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
    if(pkInfo.lcrImpDispo==0) // impDisposicion == 0 
    {
      cat.setOnUpdate(operacionExitosa);
      showWaitLayer();
      eliminaCatalogo(cat);
    }
    else
    {
      alert("No se puede Eliminar la Linea de Credito porque hay Disposiciones Vigentes");
    }
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipal();
  hideWaitLayer();
}

function cargaPrincipal() {
  onButtonClickPestania('TRACs.LineasCredito.PrincipalLineasCredito','');
}