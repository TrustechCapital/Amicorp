var catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.Contrato");
var catHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Pacahon");

showWaitLayer();

var clavesCombo9   = JSON.parse("{\"llaveClave\":9}");
var clavesCombo10  = JSON.parse("{\"llaveClave\":10}");
var clavesCombo23  = JSON.parse("{\"llaveClave\":23}");
var clavesCombo24  = JSON.parse("{\"llaveClave\":24}");
var clavesCombo31  = JSON.parse("{\"llaveClave\":32}");
var clavesCombo36  = JSON.parse("{\"llaveClave\":36}");
var clavesCombo37  = JSON.parse("{\"llaveClave\":37}");
var clavesCombo636 = JSON.parse("{\"llaveClave\":636}");
var clavesCombo1005 = JSON.parse("{\"llaveClave\":1005}");
var varNumContrato = JSON.parse("{\"NumContrato\":0}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");

initForms();

var tablaFideicomisosData = new Array();
tablaFideicomisosData[0] = "ctoNumContrato,80px";
tablaFideicomisosData[1] = "ctoCveTipoNeg,100px";
tablaFideicomisosData[2] = "ctoNomContrato,360px";
//tablaFideicomisosData[3] = "ctoNumProducto,100px";
//tablaFideicomisosData[4] = "ctoCveFormaMan,150";
tablaFideicomisosData[3] = "ctoCveTipoPer,100px";
//tablaFideicomisosData[6] = "ctoCveStContrat,100";

var tablaEjecutivosAsignadosAlFideicomisoData = new Array();
tablaEjecutivosAsignadosAlFideicomisoData[0] = "ateNumContrato,70px";
tablaEjecutivosAsignadosAlFideicomisoData[1] = "ateCveBanca,90px";
tablaEjecutivosAsignadosAlFideicomisoData[2] = "ateEjecAtencion,70px";
tablaEjecutivosAsignadosAlFideicomisoData[3] = "ateNomEjecutivo,300px";
tablaEjecutivosAsignadosAlFideicomisoData[4] = "ateNumNivel1,70px";
tablaEjecutivosAsignadosAlFideicomisoData[5] = "ateNumNivel2,70px";
tablaEjecutivosAsignadosAlFideicomisoData[6] = "ateNumNivel3,70px";
tablaEjecutivosAsignadosAlFideicomisoData[7] = "ateNumNivel4,70px";
tablaEjecutivosAsignadosAlFideicomisoData[8] = "ateNumNivel5,70px";

var tablaEjecutivosData = new Array();
tablaEjecutivosData[0] = "ejeCveBanca,90px";
tablaEjecutivosData[1] = "ejeNumEjecAtenc,70px";
tablaEjecutivosData[2] = "ejeNomEjecutivo,300px";
tablaEjecutivosData[3] = "ejeCveTipoEjec,200px";
tablaEjecutivosData[4] = "ejeNumCveLada1,70px";
tablaEjecutivosData[5] = "ejeNumTelef1,80px";
tablaEjecutivosData[6] = "ejeNumExt1,70px";

var operacion = 0;
var numPantalla = 0;
pkInfo=null;
var fechaConstitucion = new Date();
var CONSULTAR = 3;

var parametroComboProducto;
var usarSetValuesFormObject=false;
var infoCatalogo = null;
var fvMantenimientoFideicomisos = new FormValidator();

//Variables para guardar información del primer Tab al dar de alta
var numContrato=null;
var nomContrato=null;
var numCtoEje=null;
var cveTipoPer=null;
var numCliente=null;

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalFideicomisos() {
  onButtonClickPestania("Administracion.PrincipalFideicomisos","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
}
function limpiar(objForma){
  RF(objForma);
  catFideicomisos = new Catalogo("mx.com.inscitech.fiducia.domain.Contrato");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalFideicomisos();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoFideicomisos(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFideicomisos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
  }
}

function cargaMantenimientoFideicomisosTab() {
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFideicomisos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
}

function guardaInfoSiguiente() {
  //Para tener toda la información al dar de alta
  if(fvMantenimientoFideicomisos.checkForm())
  {
    infoCatalogo = catFideicomisos.getCatalogo();
    setValuesToObject(infoCatalogo);
    pkInfo = JSON.parse("{\"ctoNumContrato\":" + GI("ctoNumContrato").value+ "}"); 
    
    //Guardando los encabezados
    numContrato=GI("ctoNumContrato").value;
    nomContrato=GI("ctoNomContrato").value;
    numCtoEje=GI("ctoNumCtoEje").value;
    cveTipoPer=GI("ctoCveTipoPer").value;
    numCliente=GI("ctoNumCliente").value;
    //alert("Información de Pantalla 1 capturada");
    //alert("pantalla 1: " + JSON.stringify(infoCatalogo));
    cargaMantenimientoFideicomisos2Tab();
  }
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la tercera pantalla
function cargaMantenimientoFideicomisos2Tab() {
  numPantalla = 2;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFideicomisos2.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la cuarta pantalla
function cargaPrincipalAtencionFideicomisos() {
  numPantalla = 3;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Administracion/PrincipalAtencionFideicomisos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la quinta pantalla
function cargaConsultaHonorariosFideicomisos() {
  numPantalla = 4;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Administracion/PrincipalConsultaHonorariosFideicomisos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisos, null);
}

function despliegaPantallaMantenimientoFideicomisos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  if(numPantalla==1)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoFideicomisos.setup({
      formName      : "frmDatosMantenimientoFideicomisos",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    Calendar.setup({
    inputField     :    "ctoFechaConstitucion",   // id of the input field
    button         :    "ctoFechaConstitucion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaConstitucion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
      deshabilitaPK("ctoNumNivel1".split(","));
  }
  
  else if(numPantalla==2)
  {
    //Agregando la funcionalidad del required
    fvMantenimientoFideicomisos.setup({
      formName      : "frmDatosMantenimientoFideicomisos2",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
    
    habilitaDeshabilitaRadiosPublic(true);                //Deshabilitando los radio-botones que pertenecen al tipo Público
    habilitaDeshabilitaComponentesEscrituraPublica(true); //Deshabilitando los componentes que pertenecen a EscrituraPublica
    deshabilitaPK("ctoNumContrato,txtLocalidad,txtNumNotario".split(","));
  }
  
  else if(numPantalla==3)
  {
    GI("paramNumContrato").value = pkInfo.ctoNumContrato;
    deshabilitaPK("paramNumContrato".split(","));
    consultaNombreFideicomiso('nomFideicomiso',GI("paramNumContrato"));
    
    varNumContrato.NumContrato = pkInfo.ctoNumContrato;
    consultar(GI("hdRegistrosAtencion"), GI('frmDatosAtencionConsulta'), false);
    consultar(GI("hdRegistrosEjecutivos"), GI('frmDatosAtencionConsulta'), false);
    hideWaitLayer();
  }
  
  else if(numPantalla==4)
  {
    GI("pacNumContrato").value = pkInfo.ctoNumContrato;
    GI("paramNumContrato").value = pkInfo.ctoNumContrato;
  }
}

function loadCatalogo() {
  if(numPantalla==4)
  {
    catHonorarios.setOnUpdate(catLoaded);
    catHonorarios.buscaCatalogoPK();
  }
  else
  {
    catFideicomisos.setOnUpdate(catLoaded);
    if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    {
      GI("ctoNumContrato").value = pkInfo.ctoNumContrato;
      catFideicomisos.buscaCatalogoPK();
    }
    else
    {
      if (numPantalla==OPER_ALTA)
        muestraObjs("cmdSiguiente,cmdCancelar"); //Mostrar el botón Siguiente y Cancelar
      else if(numPantalla==2 && numContrato!=null)//Si se trata de una alta, no permitir ir a Atención ni Honorarios
      {
        muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
        GI("ctoNumContrato").value=numContrato;
        GI("ctoNomContrato").value=nomContrato;
        GI("ctoNumCtoEje").value=numCtoEje;
        GI("ctoCveTipoPer").value=cveTipoPer;
        GI("ctoNumCliente").value=numCliente;
        
        GI("ctoNumContrato").disabled=true;
        GI("ctoNomContrato").disabled=true;
      }
      
      formsLoaded();
    }
  }
}

function catLoaded() {
  if(numPantalla==1)
  {
    cargaParamComboProducto(GI("ctoCveTipoNeg"),GI("ctoCveClasProd"),true); //Sólo en la primer pantalla se carga este combo
    
    
    // Moneda desde proyecto
    if(isDefinedAndNotNull(pkInfo))
    {
      if(pkInfo.antMoneda!="SIN DEFINIR")
        GI('antMoneda').value = pkInfo.antMoneda;
        
      cargaChkMonedaExt(GI('antMoneda'));// carga check
    } 
  }
  else if(numPantalla==4)
  {
    deshabilitaObjetos(GI("frmDatosConsultaHonorarios"));                  //Deshabilita objetos (excepto botones)
    
    //Visualiza las fechas existentes en 3 hidden a una sola caja de texto
    GI("txtUltimaRevision").value=GI("pacDiaUltRevis").value+"/"+GI("pacMesUltRevis").value+"/"+GI("pacAnoUltRevis").value;
    GI("txtFechaProxCalc").value=GI("pacDiaCalcHono").value+"/"+GI("pacMesCalcHono").value+"/"+GI("pacAnoCalcHono").value;
    hideWaitLayer();
  }
  
  
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    deshabilitaPK("ctoNumContrato".split(","));
    muestraObjs("tabs"); //Mostrar los tabs
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    
    if(numPantalla==1)//Para la página de Características
    {
      GI("ctoFechaConstitucion").value=GI("ctoDiaApertura").value+"/"+GI("ctoMesApertura").value+"/"+GI("ctoAnoApertura").value;
      cargaRadiosConMaster("ctoTipoAdmon","ctoTipoAdmon2");
    }
    else if(numPantalla==2)//Para la página de Características Adicionales
    {
      cargaRadiosConMaster("ctoTipoClient","Privado");
      cargaRadiosConMaster("ctoTipoPublic","Paraestatal,Estatal,Municipal,Nada");
      cargaRadiosConMaster("ctoTipoContacto","ctoTipoContacto2");
      
      if(GI("ctoTipoClient").checked) //Si el radio Publico está checado, habilitar los otros que dependen de él
        habilitaDeshabilitaRadiosPublic(false);
      if(GI("ctoTipoContacto2").checked) //Si el radio Escritura Publica está checado, habilitar los otros que dependen de él
        habilitaDeshabilitaComponentesEscrituraPublica(false);
      
      muestraLocalidadNumNotario(); //Muestra la Localidad y el Número Oficial de Notario
    }
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    muestraObjs("tabs"); //Mostrar los tabs
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    muestraObjs("cmdCancelar"); //Mostrar el botón Cancelar
    
    if(numPantalla==1)//Para la página de Características
    {
      GI("ctoFechaConstitucion").value=GI("ctoDiaApertura").value+"/"+GI("ctoMesApertura").value+"/"+GI("ctoAnoApertura").value;
      deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisos"));                  //Deshabilita objetos (excepto botones)
      cargaRadiosConMaster("ctoTipoAdmon","ctoTipoAdmon2");
    }
    else if(numPantalla==2)//Para la página de Características Adicionales
    {
      deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisos2"));                  //Deshabilita objetos (excepto botones)
      
      cargaRadiosConMaster("ctoTipoClient","Privado");
      cargaRadiosConMaster("ctoTipoPublic","Paraestatal,Estatal,Municipal,Nada");
      cargaRadiosConMaster("ctoTipoContacto","ctoTipoContacto2");
      
      muestraLocalidadNumNotario(); //Muestra la Localidad y el Número Oficial de Notario
      
      muestraObjs("cmdAtencion,cmdHonorarios"); //Mostrar los botones 
    }
  }
  
  formsLoaded();
}


function AltaOModificaInfo() {
  catFideicomisos.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoFideicomisos.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catFideicomisos.altaCatalogo();
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoFideicomisos.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catFideicomisos.modificaCatalogo();
  }
}

///////////////////////////////////////////////////////////////////////////
//Para cargar el Combo de Producto
function cargaParamComboProducto(objComboUno,objComboDos,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboProducto = JSON.parse("{\"llaveClaveTipoNegocio\":\"" +objComboUno.value + "\",\"llaveClaveClasifProd\":\"" +objComboDos.value + "\"}");
  SA(GI("ctoNumProducto"),"next","asignaProducto");
  loadElement(GI("ctoNumProducto"));
}

function asignaProducto(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catFideicomisos.getCatalogo());
  else
    GI("ctoNumProducto").selectedIndex=0;
  
  formsLoaded();
}

function actualizaComboProducto() {
  cargaParamComboProducto(GI("ctoCveTipoNeg"),GI("ctoCveClasProd"),false);
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catFideicomisos.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catFideicomisos);
  }
}



///////////////////////////////////////////////////////////////////////////
//Validando que el Registro pueda ser dado de alta
function validarPkAlta() {
  showWaitLayer();
  validacionAlta.numContrato = GI("ctoNumContrato").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
  makeAjaxRequest(url, "HTML", verificarAlta, null);
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    alert("El registro ya existe, verifique");
    GI("ctoNumContrato").value="";
  }
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////////////////
//Para descomponer la fecha en día//mes/año
function descomponeFecha(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  GI("ctoDiaApertura").value=fecha[0];
  GI("ctoMesApertura").value=fecha[1];
  GI("ctoAnoApertura").value=fecha[2];
}

////////////////////////////////////////////////////////////////////////////////
//Agregar la funcionalidad del calendario
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


////////////////////////////////////////////////////////////////
//Funciones para habilitar/deshabilitar objetos que dependen de los radio-botones
function clickPublicoPrivado(cad,obj,booleano) {
  GI("ctoTipoPublic").disabled=booleano;
  GI("Paraestatal").disabled=booleano;
  GI("Estatal").disabled=booleano;
  GI("Municipal").disabled=booleano;
  
  asignaValueRadio2Master(cad,obj);
  
  if(booleano)
  {
    GI("Nada").checked=true;
    asignaValueRadio2Master("ctoTipoPublic",GI("Nada"));
  }
}

function habilitaDeshabilitaRadiosPublic(booleano) {
  GI("ctoTipoPublic").disabled=booleano;
  GI("Paraestatal").disabled=booleano;
  GI("Estatal").disabled=booleano;
  GI("Municipal").disabled=booleano;
}

function clickContratoEscritura(cad,obj,booleano) {
  GI("ctoNumEscritura").disabled=booleano;
  GI("ctoNumNotario").disabled=booleano;
  
  asignaValueRadio2Master(cad,obj);
  
  if(booleano)
  {
    GI("ctoNumEscritura").value="";
    GI("ctoNumNotario").value=-1;
    GI("txtLocalidad").value="";
    GI("txtNumNotario").value="";
  }
}

function habilitaDeshabilitaComponentesEscrituraPublica(booleano) {
  GI("ctoNumEscritura").disabled=booleano;
  GI("ctoNumNotario").disabled=booleano;
}


//////////////////////////////////////////////////////////////////////
//Muestra los datos informativos Localidad y Número de notario oficial
function muestraLocalidadNumNotario() {
  if(GI("ctoNumNotario").value!=-1)
  {
    var regresaLocalidadNumNotario = JSON.parse("{\"id\":\"muestraDatosNotarios\",\"Numero\":0}");
    regresaLocalidadNumNotario.Numero=GI("ctoNumNotario").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(regresaLocalidadNumNotario);
    makeAjaxRequest(url, "HTML", mostrarLocalidadNumNotario, null);
  }
  else
  {
    GI("txtLocalidad").value="";
    GI("txtNumNotario").value="";
  }
}

function mostrarLocalidadNumNotario(obj, result) {
  var objResult = JSON.parse(result);
  
  GI("txtLocalidad").value=objResult[0].notLocalidadNota;
  GI("txtNumNotario").value=objResult[0].notNumOficNota;
}


//para cargar actividades economicas hijas dinamicamente

var objComboParamAlt;

function cambiaCombo(item)
{

  if(item.selectedIndex>0 && item.selectedIndex<=item.options.length){     
      
     var combohijo=GI('ctoNomActividad'); 
     SA(eval(combohijo), "param","objComboParamAlt");
      objComboParamAlt = JSON.parse("{\"numRama\":"+item.value+"}");  
      RA(combohijo,"next");
      loadElement(combohijo);  
  }

}


function cargaChkMonedaExt(cmbAntMoneda)
{
  if(cmbAntMoneda.value=="MONEDA NACIONAL") // moneda nacional
    GI('ctoCveMonExtChk').checked = false;
  else // moneda extranjera
    GI('ctoCveMonExtChk').checked = true;
}