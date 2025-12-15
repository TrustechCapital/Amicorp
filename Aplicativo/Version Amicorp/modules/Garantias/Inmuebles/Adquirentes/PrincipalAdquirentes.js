//LLAMADO AL BEAN DE LA CLASE JAVA

var catfadq = new Catalogo("mx.com.inscitech.fiducia.domain.FAdquirentes");
catfadq.dateFormat = "dd/MM/YYYY";

var catpag = new Catalogo("mx.com.inscitech.fiducia.domain.FImupagos");
catpag.dateFormat = "dd/MM/YYYY";

//__________________________________________________________________________

//VARIABLES 

pkInfo = null 

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;


var modo;
var fvcatfadq = new FormValidator();
var fechas = new Date();

var strIdPK = "fadqIdFideicomiso,fadqIdSubcuenta,fadqIdBien,fadqIdDepto,fadqIdVenta";
var arrIdPK = strIdPK.split(",");

var usarSetValuesFormObject=false;
var parametroComboEstado;

var clavesCombo351 = JSON.parse("{\"llaveClave\":351}");
var clavesCombo352 = JSON.parse("{\"llaveClave\":352}");
var clavesCombo560 = JSON.parse("{\"llaveClave\":560}");
var clavesCombo356 = JSON.parse("{\"llaveClave\":356}");

//__________________________________________________________________________


//ELEMENTOS PARA LA TABLA DE CONSULTA DE LA PANTALLA PRINCIPAL

initForms();

var arregloParametrosAdquirentes = new Array();
arregloParametrosAdquirentes[0] = "fadqIdFideicomiso,100px";
arregloParametrosAdquirentes[1] = "fadqIdSubcuenta,124px";
arregloParametrosAdquirentes[2] = "fadqIdBien,126px";
arregloParametrosAdquirentes[3] = "fadqIdEdificio,126px";
arregloParametrosAdquirentes[4] = "fadqIdDepto,150px";
arregloParametrosAdquirentes[5] = "fadqIdVenta,85px";
arregloParametrosAdquirentes[6] = "fadqNombreComprador,150px";
arregloParametrosAdquirentes[7] = "fadqStatus,85px";

var arregloParametrosPagos = new Array();
arregloParametrosPagos[0] = "fpaiIdFideicomiso,100px";
arregloParametrosPagos[1] = "fpaiIdSubcuenta,124px";
arregloParametrosPagos[2] = "fpaiIdBien,126px";
arregloParametrosPagos[3] = "fpaiIdDepto,150px";
arregloParametrosPagos[4] = "fpaiIdPeriodo,150px";
arregloParametrosPagos[5] = "fpaiFecPago,85px";
arregloParametrosPagos[6] = "fpaiAbono,85px";
arregloParametrosPagos[7] = "fpaiSaldo,85px";


function clickTabla(pk){
  cloneObject(pk,catfadq.getCatalogo());
  pkInfo = pk;
}

function clickTabla2(pk){
  cloneObject(pk,catpag.getCatalogo());
  pkInfo = pk;
}

//__________________________________________________________________________

//FUNCIONES QUE SE ENCARGAN DE MOSTRAR LA PANTALLA DE MANTENIMIENTO

function cargaMantenimientoAdquirentes(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR|| tipoPantalla==CONSULTAR) && pkInfo==null) 
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    modo = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Garantias/Inmuebles/Adquirentes/MantenimientoAdquirentes.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  
  //GI("txtOpc").value = modo;
  //Agregando la funcionalidad del required
  fvcatfadq.setup({
    formName      : "frmMantenimientoAdquirentes",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  
  Calendar.setup({
    inputField     :    "fadqFecEscricom",   // id of the input field
    button         :    "fadqFecEscricom",
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
  });
  
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
  });*/
  
  // FIN DE LA DEFINICION DE FECHAS -------------------------------------------------------------------
   
}

function loadCatalogo() {
  catfadq.setOnUpdate(catLoaded);
  if(modo==MODIFICAR || modo==CONSULTAR){
    catfadq.buscaCatalogoPK(false);
 }
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  //cargaRadiosConMaster("fadqCv","fadqCv2");
  cargaParamComboEstado(GI("fadqNotario"),true);
    if(modo==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
      {
        muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
        deshabilitaPK(arrIdPK);
      }
    else if(modo==CONSULTAR)//Si se trata de una consulta, deshabilitar
      {
        //consultar(botonTemp, GI("frmMantenimientoAdquirentes"), false);
        SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
        deshabilitaObjetos(GI("frmMantenimientoAdquirentes"));         //Deshabilita objetos (excepto botones)
      }
    muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
    
  formsLoaded();
  
}
//****************************************************************************

//FUNCIONES AUXILIARES

function cargaPrincipalAdquirentes() {
  onButtonClickPestania("Garantias.Inmuebles.Adquirentes.PrincipalAdquirentes","");
  hideWaitLayer();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalAdquirentes();
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

function despliegaLocalidad(objCombo) {
  var localidadd = JSON.parse("{\"NumNotario\": \"" +objCombo.value + "\"}");
  //GI("fadqLocalidad").value = localidadd.Localidad;
}

//Funciones para cargar el combo Estado
function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboEstado = JSON.parse("{\"NumNotario\": \"" +objCombo.value + "\"}");
  SA(GI("fadqLocalidad"),"next","asignaEstado");
  loadElement(GI("fadqLocalidad"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catfadq.getCatalogo());
  else
    GI("fadqLocalidad").selectedIndex=0;
  
  formsLoaded();
}

//----------------------------------------------------------------------------

//*****************************************************************************

//______________________________________________________________________________

//FUNCIONES DE LOS EVENTOS DE BOTONES 

function AltaOModificaInfo() {
//alert("entra aqui")
  catfadq.setOnUpdate(operacionExitosa);
  if(modo==OPER_ALTA)//Se trata de una alta
  {
    showWaitLayer();
    catfadq.altaCatalogo();
  }
  else if((modo==OPER_MODIFICAR || modo==LIBERACION))//Se trata de una modificación
  {
    showWaitLayer();
    catfadq.modificaCatalogo();
  }
}

// eliminar

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catfadq.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catfadq);
  }
}