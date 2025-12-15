//showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FBitacoraDeclara");
cat.dateFormat = "dd/MM/YYYY";

var fvCat = new FormValidator();
var strIdPK = "fbdeEjercicioDeclara,fbdePeriodoDeclara,fbdeTipoDeclara";
var arrIdPK = strIdPK.split(",");

var modo = 0;
var varFecha = new Date();
var varFecha2 = new Date();
pkInfo = null;
var numPantalla=0;

initForms();

var arrTblDat = new Array();
arrTblDat[0] = "fbdeEjercicioDeclara,150px";
arrTblDat[1] = "fbdePeriodoDeclara,150px";
arrTblDat[2] = "fbdeTipoDeclara,150px";
arrTblDat[3] = "fecha,150px";
arrTblDat[4] = "fbdeFolioDeclara,150px";


fvCat.setup({
  formName      : "frmDatosManto",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


//Agregando la funcionalidad para las Fechas
  Calendar.setup({
    inputField     :    "paramPeriodo",   // id of the input field
    button         :    "paramPeriodo",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    varFecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Agregando la funcionalidad para la Fecha de Inicio
  Calendar.setup({
    inputField     :    "paramFechaDeclaracion",   // id of the input field
    button         :    "paramFechaDeclaracion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    varFecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });


function clickTabla(pk){
  
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FBitacoraDeclara");
  pkInfo = null;
}

function cargaMantenimientoBitacora(Modo){
  modo = Modo;
  if ((Modo==OPER_MODIFICAR || Modo==OPER_CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    modo = Modo
    numPantalla = 1;
    //showWaitLayer();
    var urlCliente = "modules/Contabilidad/Bitacora/MantenimientoBitacora.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoBitacora, null);
  }


}

function despliegaPantallaMantenimientoBitacora(obj, result) {
  //GI("dvContenido").innerHTML = result;
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad para las Fechas
  Calendar.setup({
    inputField     :    "fbdePeriodoDeclara",   // id of the input field
    button         :    "fbdePeriodoDeclara",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    varFecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  //Agregando la funcionalidad para la Fecha de Inicio
  Calendar.setup({
    inputField     :    "fbdeFechaDeclara",   // id of the input field
    button         :    "fbdeFechaDeclara",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    varFecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  asignaValues2ObjHTML()
}

function asignaValues2ObjHTML(){
  cat.setOnUpdate(catLoaded);
  if(modo==OPER_MODIFICAR || modo==OPER_CONSULTAR){
    cat.buscaCatalogoPK(false);
  }else{
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(modo == OPER_MODIFICAR){
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    //muestraObjs("cmdCancelar");
    deshabilitaPK(arrIdPK);
  }
  else if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatosManto"));
      GI("cmdCancelar").value = "Regresar";
    }
     
    muestraObjs("cmdCancelar");
   formsLoaded();
  //cargaComboDependiente(GI("envpIdPrograma"),true);
}


function eliminarRegistro() {
    cat.setOnUpdate(operacionExitosa);
    //showWaitLayer();
    eliminaCatalogo(cat);
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalBitacora();
  //hideWaitLayer();
}


function cargaPrincipalBitacora() {
  onButtonClickPestania("Contabilidad/Bitacora/PrincipalBitacora","");
  //hideWaitLayer();
}

function AltaOModificaInfo() {
  cat.setOnUpdate(operacionExitosa);
  if(modo==OPER_ALTA && fvCat.checkForm())//Se trata de una alta
  {
    //showWaitLayer();
    cat.altaCatalogo();
  }
  else if(modo==OPER_MODIFICAR && fvCat.checkForm())//Se trata de una modificación
  {
    //showWaitLayer();
    cat.modificaCatalogo();
  }
}


//Funciones para la funcionalidad de la Fecha 
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