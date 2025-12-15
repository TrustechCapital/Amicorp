var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FLayout");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var cmbClaves26 = JSON.parse("{\"llaveClave\":27,\"orderDescripcion\":\"s\"}");
var cmbInterfase = JSON.parse("{\"Indice\":650,\"orderSecuencial\":\"s\"}");
var cmbLayout = JSON.parse("{\"Indice\":651,\"orderSecuencial\":\"s\"}");

var tablaData = new Array();
tablaData[0] = "flyIdBanco,80px";
tablaData[1] = "flyIdInterfase,80px";
tablaData[2] = "flyIdLayout,80px";
tablaData[3] = "flyCampoTarget3,80px";
tablaData[4] = "flyNomBanco,100px";
tablaData[5] = "flyNomInterfase,200px";
tablaData[6] = "flyNomLayout,200px";

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
  catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.FLayout");
  pkInfo = null;
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
  
    var urlCliente = ctxRoot + "/modules/Operacion/Conciliacion/LayoutBancos/MantenimientoLayoutBancos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimiento, null);
  }
}


function despliegaPantallaMantenimiento(obj, result) {
  GI("dvPantalla").innerHTML = result;
  hideWaitLayer();
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
    deshabilitaPK("flyIdBanco,flyIdInterfase,flyIdLayout,flyCampoTarget3".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
  
  // decimales
   if(GI("flyDecimales2").value=="0")
      GI("flyDecimales2chk").checked=true; 
   else 
      GI("flyDecimales2chk").checked = false;
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
  onButtonClickPestania('Operacion.Conciliacion.LayoutBancos.PrincipalLayoutBancos','');
}


// campos target FLAYOUT

function actualizaTargets(obj)
{
  switch(eval(obj.value))
  {
    case 0: // DEPOSITO
      
      GI("flyTablaTarget1").value = "F_DEPOSITO";
      GI("flyCampoTarget1").value = "FDPO_CTA_CHEQUES";
      GI("flyTablaTarget2").value = "F_DEPOSITO";
      GI("flyCampoTarget2").value = "FDPO_IMPORTE_DEPOSITO";
      break;
    case 1: // RETIRO
      
      GI("flyTablaTarget1").value = "F_RETIRO";
      GI("flyCampoTarget1").value = "FRET_CTA_CHEQUES";
      GI("flyTablaTarget2").value = "F_RETIRO";
      GI("flyCampoTarget2").value = "FRET_IMP_RETIRO";
      break;
    case 2: // SALDO
      
      GI("flyTablaTarget1").value = "SALDOS";
      GI("flyCampoTarget1").value = "ASI_NUM_AUX3";
      GI("flyTablaTarget2").value = "SALDOS";
      GI("flyCampoTarget2").value = "SAL_IMP_SALDO_ACT";
      break;
    default:
      GI("flyTablaTarget1").value = "";
      GI("flyCampoTarget1").value = "";
      GI("flyTablaTarget2").value = "";
      GI("flyCampoTarget2").value = "";
      break;
  }
}
// Decimales 
function decimalesChk(chkobj)
{
   GI("flyDecimales2").value = chkobj.checked?0:2;
}

// Vista Previa Layout

function vpLayout()
{
   if(GI("taPreview").value=="")
   {
      alert("¡Introduzca línea de prueba!")
      return;
   }
   
   var vpreview = GI("taPreview").value.split("\\n")[0];// cadena de prueba 1er renglon


   var vtipomovto =  GI("flyIdLayout").options[GI("flyIdLayout").selectedIndex].text;
   vtipomovto+=  " - "+vpreview.substring(eval(GI("flyInicio3").value)-1,eval(GI("flyInicio3").value)+eval(GI("flyCampoTarget3").value.length)-1);
   
   var vformfecha =  GI("flyFormatoFecha").value;
   vformfecha += " - "+vpreview.substring(eval(GI("flyInicioFecha").value)-1,eval(GI("flyInicioFecha").value)+eval(GI("flyFormatoFecha").value.length)-1);
   
   var vcuenta = "";
   vcuenta += vpreview.substring(eval(GI("flyInicio1").value)-1,eval(GI("flyInicio1").value)+eval(GI("flyLongitud1").value)-1);
   
   var vimporte = "";
   if(GI("flyDecimales2chk").checked)
      vimporte += vpreview.substring(eval(GI("flyInicio2").value)-1,eval(GI("flyInicio2").value)+eval(GI("flyLongitud2").value)-1);
   else
      vimporte += vpreview.substring(eval(GI("flyInicio2").value)-1,eval(GI("flyInicio2").value)+eval(GI("flyLongitud2").value)-3) +"."+vpreview.substring(eval(GI("flyInicio2").value)+eval(GI("flyLongitud2").value)-3,eval(GI("flyInicio2").value)+eval(GI("flyLongitud2").value)-1);
   
   GI("tdTipoMovto").innerHTML = vtipomovto;
   GI("tdFecha").innerHTML =vformfecha;
   GI("tdCuenta").innerHTML =  vcuenta;
   GI("tdImporte").innerHTML = vimporte;
}