//LLAMADO AL BEAN DE LA CLASE JAVA

var catUni = new Catalogo("mx.com.inscitech.fiducia.domain.FUnidades");
catUni.dateFormat = "dd/MM/YYYY";

//__________________________________________________________________________

//VARIABLES 

pkInfo = null 

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var LIBERACION = 4;

var modo;
var fvcatUni = new FormValidator();
var fechas = new Date();

var strIdPK = "funiIdFideicomiso,funiIdSubcuenta,funiIdBien,funiIdDepto";
var arrIdPK = strIdPK.split(",");

var usarSetValuesFormObject=false;
var parametroComboEstado;
var clavesCombo560 = JSON.parse("{\"llaveClave\":560}");

//__________________________________________________________________________


//ELEMENTOS PARA LA TABLA DE CONSULTA DE LA PANTALLA PRINCIPAL

initForms();

var arregloParametrosUnidades = new Array();
arregloParametrosUnidades[0] = "funiIdFideicomiso,100px";
arregloParametrosUnidades[1] = "funiIdSubcuenta,100px";
arregloParametrosUnidades[2] = "funiIdGarantia,100px";
arregloParametrosUnidades[3] = "funiIdBien,100px";
arregloParametrosUnidades[4] = "funiIdEdificio,100px";
arregloParametrosUnidades[5] = "funiIdDepto,100px";
arregloParametrosUnidades[6] = "funiPrecio,150px";
arregloParametrosUnidades[7] = "funiMoneda,100px";
arregloParametrosUnidades[8] = "funiStatus,100px";

/*var arregloParametrosLiberados = new Array();
arregloParametrosLiberados[0] = "funiIdFideicomiso,100px";
arregloParametrosLiberados[1] = "funiIdSubcuenta,124px";
arregloParametrosLiberados[2] = "funiIdBien,126px";
arregloParametrosLiberados[3] = "funiIdDepto,150px";
arregloParametrosUnidades[4] = "funiNumEscritura,100px";
arregloParametrosUnidades[5] = "funiFolioReal,150px";
arregloParametrosUnidades[6] = "funiFechaTrasladoDominio,85px";
arregloParametrosUnidades[6] = "funiStatus,85px";*/


function clickTabla(pk){
  cloneObject(pk,catUni.getCatalogo());
  pkInfo = pk;
}

//__________________________________________________________________________

//FUNCIONES QUE SE ENCARGAN DE MOSTRAR LA PANTALLA DE MANTENIMIENTO

function cargaMantenimientoUnidades(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR || tipoPantalla==LIBERACION) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    modo = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Garantias/Inmuebles/MantenimientoUnidades.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvcatUni.setup({
    formName      : "frmMantenimientoUnidades",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  // DEFINICION DE LOS CAMPOS DE TEXTOS PARA SER CONVERTIDOS EN FECHAS --------------------------------
       
  /*Calendar.setup({
    inputField     :    "funiFechaUltimoAvaluo",   // id of the input field
    button         :    "funiFechaUltimoAvaluo",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });*/
  
  Calendar.setup({
    inputField     :    "funiFechaTrasladoDominio",   // id of the input field
    button         :    "funiFechaTrasladoDominio",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "funiFechaReversion",   // id of the input field
    button         :    "funiFechaReversion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  // FIN DE LA DEFINICION DE FECHAS -------------------------------------------------------------------
   
}

function loadCatalogo() {
  catUni.setOnUpdate(catLoaded);
  if(modo==MODIFICAR || modo==CONSULTAR||modo==LIBERACION){
    catUni.buscaCatalogoPK(false);
    if(modo == LIBERACION) {//desabilitar todos los campos que no tengan que ver con una liberacion
              SA(GI("funiIdFideicomiso"),"disabled","true");
              SA(GI("funiIdBien"),"disabled","true");
              SA(GI("funiTipo"),"disabled","true");
              SA(GI("funiNiveles"),"disabled","true");
              SA(GI("funiCalleNum"),"disabled","true");
              SA(GI("funiNomPoblacion"),"disabled","true");
              SA(GI("funiNumPais"),"disabled","true");
              SA(GI("funiColindancias"),"disabled","true");
              SA(GI("funiMedidas"),"disabled","true");
              SA(GI("funiPrecio"),"disabled","true");
              SA(GI("funiUltimoAvaluo"),"disabled","true");
              SA(GI("funiMoneda"),"disabled","true");
              SA(GI("funiIdSubcuenta"),"disabled","true");
              SA(GI("funiIdDepto"),"disabled","true");
              SA(GI("txtTipo"),"disabled","true");
              SA(GI("funiNomColonia"),"disabled","true");
              SA(GI("funiCodigoPostal"),"disabled","true");
              SA(GI("funiNumEstado"),"disabled","true");
              SA(GI("funiFechaUltimoAvaluo"),"disabled","true");
              SA(GI("funiStatus"),"disabled","true");
              //HABILITA LOS NECESARIOS
              RA(GI("funiNotario"),"disabled");
              RA(GI("funiFolioReal"),"disabled");
              RA(GI("funiNumEscritura"),"disabled");
              RA(GI("funiFechaTrasladoDominio"),"disabled");
              muestraObjs("cmdAceptar,cmdCancelar");
    }
 }
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  cargaParamComboEstado(GI("funiNumPais"),true);
    if(modo==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
      {
        muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
        deshabilitaPK(arrIdPK);
        
        if(GI("funiStatus").value=="LIBERADO")
          SA(GI("funiStatus"),"disabled","true");
      }
    else if(modo==CONSULTAR)//Si se trata de una consulta, deshabilitar
      {
        SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
        deshabilitaObjetos(GI("frmMantenimientoUnidades"));         //Deshabilita objetos (excepto botones)
      }
    muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
    formsLoaded();
  
}
//****************************************************************************

//FUNCIONES AUXILIARES

function cargaPrincipalUnidades() {
  onButtonClickPestania("Garantias.Inmuebles.PrincipalUnidades","");
  hideWaitLayer();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalUnidades();
  hideWaitLayer();
}

// FUNCIONES QUE SE ENCARGAN DE LA GESTION DE LAS FECHAS


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


function isValidDateAll(date)
{
  return false;
}

//------------------------------------------------------------------------

//FUNCIONES QUE GESTIONAN A LOS COMBOS

//Funciones para cargar el combo Estado
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"clavePais\": \"" +objCombo.value + "\"}");
  SA(GI("funiNumEstado"),"next","asignaEstado");
  loadElement(GI("funiNumEstado"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catUni.getCatalogo());
  else
    GI("funiNumEstado").selectedIndex=0;
  
  formsLoaded();
}

//----------------------------------------------------------------------------

//*****************************************************************************

//______________________________________________________________________________

//FUNCIONES DE LOS EVENTOS DE BOTONES 

function AltaOModificaInfo() {
  catUni.setOnUpdate(operacionExitosa);
  if(modo==OPER_ALTA && fvcatUni.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catUni.altaCatalogo();
  }
  else if((modo==OPER_MODIFICAR || modo==LIBERACION) && fvcatUni.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catUni.modificaCatalogo();
  }
}

// eliminar

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catUni.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catUni);
  }
}