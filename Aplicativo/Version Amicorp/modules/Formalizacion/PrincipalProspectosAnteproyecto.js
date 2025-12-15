var catProspectosAnteproyecto = new Catalogo("mx.com.inscitech.fiducia.domain.Anteproy");
var infoCatalogo = null;

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var clavesCombo24  = JSON.parse("{\"llaveClave\":24}");
var clavesCombo31  = JSON.parse("{\"llaveClave\":31}");
var clavesCombo36  = JSON.parse("{\"llaveClave\":36}");
var clavesCombo125 = JSON.parse("{\"llaveClave\":125}");
var clavesCombo148 = JSON.parse("{\"llaveClave\":148}");
var clavesCombo161 = JSON.parse("{\"llaveClave\":161}");
var clavesCombo162 = JSON.parse("{\"llaveClave\":162}");
var clavesCombo709 = JSON.parse("{\"llaveClave\":709}");
var clavesCombo701 = JSON.parse("{\"llaveClave\":701,\"orderDescripcion\":\"s\"}");
var validacionNoExistaFideicomiso = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacion = JSON.parse("{\"id\":\"cuentaAnteproyectosBajaProspectos\",\"numProspecto\":-1,\"numContrato\":0}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaProspecto\",\"numProspecto\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaAnteproyecto\",\"numProspecto\":0}");
var buscaDatos = JSON.parse("{\"id\":\"traeDatosProyecto\",\"numProspecto\":0}");
var regresaLocalidadNumNotario = JSON.parse("{\"id\":\"muestraDatosNotarios\",\"Numero\":0}");
var determinaContrato = JSON.parse("{\"id\":\"determinaSigContrato\"}"); 
var determinaExistenciaPersonas = JSON.parse("{\"id\":\"determinaExistenciaPersonas\"}"); 
var traeDatosContrato = JSON.parse("{\"id\":\"traeDatosContrato\",\"numProspecto\":0}");
var insertaAfidben = JSON.parse("{\"id\":\"insertaAfidben\"}"); 
//var parametroMoneda = JSON.parse("{\"llaveClave\":161}");

initForms();

var tablaProspectosAnteproyectoData = new Array();
tablaProspectosAnteproyectoData[0] = "antNumProspecto,70";
tablaProspectosAnteproyectoData[1] = "antNomNegocio,300";
//tablaProspectosAnteproyectoData[2] = "antNumAbogado,40";
//tablaProspectosAnteproyectoData[3] = "ejeNomEjecutivo,200";
tablaProspectosAnteproyectoData[2] = "antCveTipoNeg,150";
tablaProspectosAnteproyectoData[3] = "antCveClasifPro,150";
tablaProspectosAnteproyectoData[4] = "prlNomProducto,150";
tablaProspectosAnteproyectoData[5] = "antNumContrato,80";
//tablaProspectosAnteproyectoData[6] = "antSeguimiento,128";
//tablaProspectosAnteproyectoData[7] = "antCveStProspec,75";

var operacion = 0;
var numPantalla = 0;
pkInfo=null;
var fechaApertura = new Date();
var fechaProbableConstitucion = new Date();
var fechaUltimaGestion = new Date();

var fecha1 = new Date();
var fecha2 = new Date();
var fecha3 = new Date();

var parametroComboProducto;
var clavesCombo37;
var usarSetValuesFormObject=false;
var fvMantenimientoAnteproyecto = new FormValidator();

//Variables que pasarán del primero al segundo Tab cuando se de una alta
var numPromotor=null;
var nomNegocio=null;
var numAbogado=null;

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalProspectosAnteproyecto () {
  onButtonClickPestania("Formalizacion.PrincipalProspectosAnteproyecto","");
}

function clickTabla(pk) {
  pkInfo = pk;
  
  cloneObject(pk,catProspectosAnteproyecto.getCatalogo());
}


//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda y tercera pantalla
function cargaMantenimientoProspectosAnteproyectoGenerales(tipoPantalla) {

  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    if(pkInfo!=null)
      if(pkInfo.prsCveStatus == "CONSTITUIDO" && tipoPantalla==MODIFICAR)
      {
        alert("El Prospecto está CONSTITUIDO");
        return;
      }
    
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosAnteproyectoGenerales.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAnteproyecto, null);
  }
}

function cargaMantenimientoProspectosAnteproyectoGeneralesTab() {
  numPantalla = 1;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosAnteproyectoGenerales.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAnteproyecto, null);
}

function cargaMantenimientoProspectosAnteproyectoCaracteristicasTab() {
  numPantalla = 2;
  showWaitLayer();
  var urlCliente = ctxRoot + "/modules/Formalizacion/MantenimientoProspectosAnteproyectoCaracteristicas.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAnteproyecto, null);
}

function despliegaPantallaMantenimientoAnteproyecto(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  if(numPantalla==1)
  {
    cargaComboClasProd(false);
    
    Calendar.setup({
    inputField     :    "antFechaApertura",   // id of the input field
    button         :    "antFechaApertura",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaApertura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "antFecProConsti",   // id of the input field
    button         :    "antFecProConsti",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateSpecial,
    date           :    fechaProbableConstitucion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "antFecGestion",   // id of the input field
    button         :    "antFecGestion",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaUltimaGestion,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    //Agregando la funcionalidad del required
    fvMantenimientoAnteproyecto.setup({
      formName      : "frmDatosMantenimientoAnteproyectoGenerales",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
  }
  else if(numPantalla==2)
  {
    Calendar.setup({
    inputField     :    "txtFecha1",   // id of the input field
    button         :    "txtFecha1",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaApertura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "txtFecha2",   // id of the input field
    button         :    "txtFecha2",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaApertura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "txtFecha3",   // id of the input field
    button         :    "txtFecha3",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaApertura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    Calendar.setup({
    inputField     :    "txtFecAltaCaracteristicasAnteproyecto",   // id of the input field
    button         :    "txtFecAltaCaracteristicasAnteproyecto",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaApertura,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
    });
    
    //Agregando la funcionalidad del required
    fvMantenimientoAnteproyecto.setup({
      formName      : "frmDatosMantenimientoAnteproyectoCaracteristicas",
      tipoAlert     : 1,
      alertFunction : BaloonAlert,
      sendObjToAlert: true
    });
        
    
    habilitaDeshabilitaRadiosPublic(true);                //Deshabilitando los rado-botones que pertenecen al tipo Público
    habilitaDeshabilitaComponentesEscrituraPublica(true); //Deshabilitando los componentes que pertenecen a EscrituraPublica
    
    if(operacion==CONSULTAR)
      deshabilitaPK("antNumContrato,txtFecAltaCaracteristicasAnteproyecto".split(","));
    
    deshabilitaPK("txtLocalidad,txtNumNotario".split(","));
     
  }
}

//se recupera informacion de giro y actividad
  function obtenGiro(obj,result){
    // alert(result);
     var resultado = JSON.parse(result)[0];
     //alert(resultado.actNomRama);
     GI("ctoRama").value=resultado.actNomRama;
     //se recupera la informacion de la actividad
      vgContenedorDatos=null;
      vgContenedorDatos=JSON.parse("{\"id\":\"consultaActividades2\"}");
      vgContenedorDatos.numProspecto=numProspecto;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(vgContenedorDatos);
     // alert(url);
      makeAjaxRequest(url, "HTML", obtenActividad, null);     
  }   
  function obtenActividad(obj,result){
     //alert(result);
     var resultado = JSON.parse(result)[0];
     GI("antNomActividad").value=resultado.prsCveActividad;     
  }   


function loadCatalogo() {
  catProspectosAnteproyecto.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catProspectosAnteproyecto.buscaCatalogoPK(false);
  else
  {
    if (numPantalla==1)
      muestraObjs("cmdSiguiente,cmdCancelar"); //Mostrar el botón Siguiente y Cancelar
    else if(numPantalla==2 && numPromotor!=null)   //Asignar los encabezados e inhabilitar la llave primaria y los datos de encabezado
    {
      muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
      GI("antNumProspecto").value=pkInfo.antNumProspecto;
      GI("antNumProspecto").disabled=true;
      GI("antNumPromotor").value=numPromotor;
      GI("antNumPromotor").disabled=true;
      GI("antNomNegocio").value=nomNegocio;
      GI("antNomNegocio").disabled=true;
      GI("antNumAbogado").value=numAbogado;
      GI("antNumAbogado").disabled=true;
    }
    
    formsLoaded();
  }
}
var numProspecto;
function catLoaded() {
  muestraObjs("tabs"); //Mostrar los tabs
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    /*if(numPantalla==1)//Para la página de Generales
      muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    else */if(numPantalla==2)//Para la página de Características
    { //Cargando los radio-botones
      cargaRadiosConMaster("antTipoClient","Privado");
      cargaRadiosConMaster("antTipoPublic","Paraestatal,Estatal,Municipal,Nada");
      cargaRadiosConMaster("antTipoContacto","antTipoContacto2");
      cargaRadiosConMaster("antTipoAdmon","antTipoAdmon2");

      if(GI("antTipoClient").checked) //Si el radio Publico está checado, habilitar los otros que dependen de él
        habilitaDeshabilitaRadiosPublic(false);
      if(GI("antTipoContacto2").checked) //Si el radio Escritura Publica está checado, habilitar los otros que dependen de él
        habilitaDeshabilitaComponentesEscrituraPublica(false);
      
      muestraLocalidadNumNotario(); //Muestra la Localidad y el Número Oficial de Notario
      reuneFechas();                //Integra las fechas de los Convenios Modificatorios
      //se recupera la info del giro
        vgContenedorDatos=null;
        vgContenedorDatos=JSON.parse("{\"id\":\"claveActividad2\"}");
        numProspecto=GI("antNumProspecto").value;
        vgContenedorDatos.numProspecto=GI("antNumProspecto").value;
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(vgContenedorDatos);
        //alert(url);
        makeAjaxRequest(url, "HTML", obtenGiro, GI("antNumProspecto"));  
    }
    deshabilitaPK("antNumProspecto".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    muestraObjs("cmdCancelar"); //Mostrar el botón Cancelar
    
    if(numPantalla==1)//Para la página de Generales
      deshabilitaObjetos(GI("frmDatosMantenimientoAnteproyectoGenerales"));                  //Deshabilita objetos (excepto botones)
    else if(numPantalla==2)//Para la página de Características
    { //Cargando los radio-botones
      cargaRadiosConMaster("antTipoClient","Privado");
      cargaRadiosConMaster("antTipoPublic","Paraestatal,Estatal,Municipal,Nada");
      cargaRadiosConMaster("antTipoContacto","antTipoContacto2");
      cargaRadiosConMaster("antTipoAdmon","antTipoAdmon2");
      
      deshabilitaObjetos(GI("frmDatosMantenimientoAnteproyectoCaracteristicas"));                  //Deshabilita objetos (excepto botones)
      
      muestraLocalidadNumNotario(); //Muestra la Localidad y el Número Oficial de Notario
      reuneFechas();                //Integra las fechas de los Convenios Modificatorios
    //se recupera la info del giro
      vgContenedorDatos=null;
      vgContenedorDatos=JSON.parse("{\"id\":\"claveActividad2\"}");
      vgContenedorDatos.numProspecto=GI("antNumProspecto").value;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(vgContenedorDatos);
      //alert(url);
      makeAjaxRequest(url, "HTML", obtenGiro, null);  
    }
  }
  if(numPantalla==1)  //Sólo en la primer pantalla se carga éste combo
    {
      cargaParamComboProducto(GI("antCveTipoNeg"),GI("antCveClasifPro"),true);
      cargaComboClasProd(true);
    }
  setCargaParams();	
  formsLoaded();
}

function setCargaParams(){//prodsForz
    RA(GI("antCveClasifPro"),"onchange");
    vgContenedorDatos=null;
    vgContenedorDatos=JSON.parse("{\"id\":\"prodsForz\"}");
    vgContenedorDatos.numProsp=GI("antNumProspecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(vgContenedorDatos);
    makeAjaxRequest(url, "HTML", forzaCargaParams, null);
}
function forzaCargaParams(obj, result){
    var resultado = JSON.parse(result)[0];
    GI('antCveClasifPro').value=resultado.antCveClasifPro;
    
    GI('antCveClasifSubPro').value=resultado.antCveClasifSubPro;
    cargaParamComboProductov2(resultado.prlNumProducto);
}

function cargaParamComboProductov2(parametro2){
  //parametroComboProducto = JSON.parse("{\"llaveClaveTipoNegocio\":\"FIDEICOMISO\",\"order\":\"s\"}");
  //GI("antNumProducto").value=parametro2;
  
  var opciones = GI("antNumProducto").options;
  //alert(opciones);
    var ubic=0;
    for (var i = 0; i < opciones.length; i++) {
        console.log(opciones[i].text);
        if(opciones[i].text===parametro2){
            ubic=i;
            alert(ubic);
        }
    }
    GI("antNumProducto").selectedIndex = ubic;
  
}

var numProyecto;
var vTipoPersona;
var vNombrePersona;

function AltaOModificaInfo() {
  catProspectosAnteproyecto.setOnUpdate(operacionExitosa);
  
  
  if(operacion==ALTA)// && fvMantenimientoAnteproyecto.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catProspectosAnteproyecto.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoAnteproyecto.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catProspectosAnteproyecto.modificaCatalogo();
  }

  /*catProspectosAnteproyecto.setOnUpdate(operacionExitosa);
  if(operacion==1) {//Se trata de una alta
    setValuesToObject(infoCatalogo);
    catProspectosAnteproyecto.setCatalogo(infoCatalogo);
    catProspectosAnteproyecto.altaCatalogo(false);
  } else if(operacion==2)//Se trata de una modificación
    catProspectosAnteproyecto.modificaCatalogo();
    */
}


function operacionExitosa() {
  alert("La operación se realizó correctamente");
  alert(operacion)
  if(operacion==ALTA){
	  insertaAfidben.Proyecto = numProyecto;
	  insertaAfidben.TipoPersona = vTipoPersona;
	  insertaAfidben.NombrePersona = vNombrePersona;
	  
	  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(insertaAfidben);
	  
	  makeAjaxRequest(url, "HTML", fn_insertaAfidben, null); 	  
  }
  else{
	  cargaPrincipalProspectosAnteproyecto();
	  hideWaitLayer();
  }
}

function fn_insertaAfidben(obj, result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var txtNextFid = objResult.RESULTADO;        
  }
	cargaPrincipalProspectosAnteproyecto();
	hideWaitLayer();  
}
/////////////////////////////////BORRAR UN REGISTRO SIN VALIDAR
/*
function eliminarRegistro() {
  catProspectosAnteproyecto.setOnUpdate(operacionExitosa);
  eliminaCatalogo(catProspectosAnteproyecto);
  cargaPrincipalProspectosAnteproyecto();
}*/
////////////////////////////////////////////////////////////////////////////////
var ProspectoAlta;
function guardaInfoSiguiente() {
  //Para tener toda la información al dar de alta
  if(fvMantenimientoAnteproyecto.checkForm())
  {
    infoCatalogo = catProspectosAnteproyecto.getCatalogo();
    setValuesToObject(infoCatalogo);
    ProspectoAlta=GI("antNumProspecto").value
    pkInfo = JSON.parse("{\"antNumProspecto\":" + GI("antNumProspecto").value+ "}"); 
    //alert("llego aki")
    //Guardando los encabezados
    numPromotor=GI("antNumPromotor").value;
    nomNegocio=GI("antNomNegocio").value;
    numAbogado=GI("antNumAbogado").value;
	
	numProyecto=GI("antNumProspecto").value;
	vTipoPersona=GI("antTipoNegSat").options[GI("antTipoNegSat").selectedIndex].value;  // GI("antTipoNegSat").value;
	vNombrePersona=GI("antNomNegocio").value;
    
    if (operacion==ALTA){
      vgContenedorDatos=null;
      vgContenedorDatos=JSON.parse("{\"id\":\"claveActividad2\"}");
      numProspecto=ProspectoAlta;
      vgContenedorDatos.numProspecto=ProspectoAlta;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(vgContenedorDatos);
      //alert(url);
      makeAjaxRequest(url, "HTML", obtenGiro, GI("antNumProspecto"));    
    }
    
    //alert("Información de Pantalla 1 capturada");
    //alert("pantalla 1: " + JSON.stringify(infoCatalogo));
    cargaMantenimientoProspectosAnteproyectoCaracteristicasTab();
  }
}


////////////////////////////////////////////////////////////////////////////////
//Carga el Combo de Producto
function cargaParamComboProducto(objComboUno,objComboDos,parametro2){
  usarSetValuesFormObject=parametro2;
  parametroComboProducto = JSON.parse("{\"llaveClaveTipoNegocio\":\"" +objComboUno.value + "\",\"llaveClaveClasifProd\":\"" +objComboDos.value + "\",\"order\":\"s\"}");
  SA(GI("antNumProducto"),"next","asignaProducto");
  setTimeout('GI("antNumProducto").value = '+GI("antNumProducto").value,1000);
  loadElement(GI("antNumProducto"));
}

function asignaProducto(){
	alert("producto "+parametro2)
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectosAnteproyecto.getCatalogo());
  else
    GI("antNumProducto").selectedIndex=0;
  
  formsLoaded();
}

function actualizaComboProducto() {

  cargaParamComboProducto(GI("antCveTipoNeg"),GI("antCveClasifPro"),false);
}

function actualizaComboClasProd()
{
  cargaComboClasProd(false);
}

function cargaComboClasProd(boleano)
{
   usarSetValuesFormObject=boleano;
   
   var cveClasProd = GI("antCveTipoNeg").selectedIndex==0?-1:GI("antCveTipoNeg").value=="REPRESENTACION COMUN"?1002:37;
   clavesCombo37  = JSON.parse("{\"llaveClave\":"+eval(cveClasProd)+"}");
   
   SA(GI("antCveClasifPro"),"next","asignaClasProd");
   loadElement(GI("antCveClasifPro"));
}

function asignaClasProd()
{
  if(usarSetValuesFormObject)
    setValuesFormObject(catProspectosAnteproyecto.getCatalogo());
  else
    GI("antCveClasifPro").selectedIndex=0;
    
  actualizaComboProducto();
  formsLoaded();
}

////////////////////////////////////////////////////////////////////////////////
//Verifica si es posible eliminar un registro
function eliminarRegistro(/*idQuery, noProyecto*/) {
  //validacion.numProspecto = noProyecto;
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    if(pkInfo.prsCveStatus == "CONSTITUIDO")
      alert("El Prospecto está CONSTITUIDO");
    else
    {
      validacion.numProspecto = pkInfo.antNumProspecto;
      var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacion);
      makeAjaxRequest(url, "HTML", verificarEliminacion, null);
    }
  }
}

function verificarEliminacion(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].totalAnteproy > 0)
    alert("El Proyecto ha sido constituido como fideicomiso");
  else
  {
    catProspectosAnteproyecto.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catProspectosAnteproyecto);
  }
}

////////////////////////////////////////////////////////////////
function validarPkAlta(objeto) {
	verificarAlta();
}

function verificarAlta() {
    validacionAlta2.numProspecto = GI("antNumProspecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
}

function verificarAlta2(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Proyecto ya existe, verifique");
    GI("antNumProspecto").value="";
    obj.focus();
  }
  else
  {
  buscaDatos.numProspecto = GI("antNumProspecto").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(buscaDatos);
    makeAjaxRequest(url, "HTML", traeNombreFecha, obj); 
  }
  
  
}

function traeNombreFecha(obj, result){

  var objResult = JSON.parse(result);
  //alert(objResult[0].datosProyecto);
  
  var sdatosProy  = objResult[0].datosProyecto.split('-');
  var sdpLength = sdatosProy.length; // longitud
  
  if(sdpLength==2)
  { 
    GI('antNomNegocio').value= sdatosProy[0];
  }
  else// nombre de proyecto contiene guiones
  {
    var sdatosProyAux = new Array();
    
    for(var i=0;i<sdpLength-1;i++)
      sdatosProyAux[i] = sdatosProy[i];
      
    GI('antNomNegocio').value= sdatosProyAux.join("-");
  }
  
    GI('antFechaApertura').value= sdatosProy[sdatosProy.length-1];// fecha
  
    
}

////////////////////////////////////////////////////////////////
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

function isValidDateSpecial(date)
{
  var today = new Date();
  if(date>today)
    return false;
  else
    return false;
}



function descomponeFecha(objOriginal,diaCopia,mesCopia,anoCopia)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  diaCopia.value=fecha[0];
  mesCopia.value=fecha[1];
  anoCopia.value=fecha[2];
}

function reuneFechas() {
  GI("txtFecha1").value=GI("antDiaConmod1").value+"/"+GI("antMesConmod1").value+"/"+GI("antAnoConmod1").value;
  GI("txtFecha2").value=GI("antDiaConmod2").value+"/"+GI("antMesConmod2").value+"/"+GI("antAnoConmod2").value;
  GI("txtFecha3").value=GI("antDiaConmod3").value+"/"+GI("antMesConmod3").value+"/"+GI("antAnoConmod3").value;
}

////////////////////////////////////////////////////////////////
//Funciones para habilitar/deshabilitar objetos que dependen de los radio-botones
function clickPublicoPrivado(cad,obj,booleano) {
  GI("antTipoPublic").disabled=booleano;
  GI("Paraestatal").disabled=booleano;
  GI("Estatal").disabled=booleano;
  GI("Municipal").disabled=booleano;
  
  asignaValueRadio2Master(cad,obj);
  
  if(booleano)
  {
    GI("Nada").checked=true;
    asignaValueRadio2Master("antTipoPublic",GI("Nada"));
  }
}

function habilitaDeshabilitaRadiosPublic(booleano) {
  GI("antTipoPublic").disabled=booleano;
  GI("Paraestatal").disabled=booleano;
  GI("Estatal").disabled=booleano;
  GI("Municipal").disabled=booleano;
}

function clickContratoEscritura(cad,obj,booleano) {
  GI("antNumEscritura").disabled=booleano;
  GI("antNumNotario").disabled=booleano;
  
  asignaValueRadio2Master(cad,obj);
  
  if(booleano)
  {
    GI("antNumEscritura").value="";
    GI("antNumNotario").value=-1;
    GI("txtLocalidad").value="";
    GI("txtNumNotario").value="";
  }
}

function habilitaDeshabilitaComponentesEscrituraPublica(booleano) {
  GI("antNumEscritura").disabled=booleano;
  GI("antNumNotario").disabled=booleano;
}

//////////////////////////////////////////////////////////////////////
//Muestra los datos informativos Localidad y Número de notario oficial
function muestraLocalidadNumNotario() {
  if(GI("antNumNotario").value!=-1)
  {
    regresaLocalidadNumNotario.Numero=GI("antNumNotario").value;
    
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

/* --- SIG FIDEICOMISO ---*/


function determinaFideicomiso()
{

  determinaContrato.NumProducto = pkInfo.antNumProspecto;
  
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(determinaContrato);
  
  makeAjaxRequest(url, "HTML", determinaFideicomisoRes, null);  
}

function determinaFideicomisoRes(obj, result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var txtNextFid = objResult.RESULTADO;
        
        if(txtNextFid==0)
        {
          alert('¡El Producto no tiene Numeracion asignada!')
        }
        else 
          GI("txtNoFideicomiso").value=txtNextFid;
  }
  else
    GI("txtNoFideicomiso").value="";
}


function verificaNoExistaFideicomiso() {
  if(GI("txtNoFideicomiso").value!="")
  {
    validacionNoExistaFideicomiso.numContrato=GI("txtNoFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionNoExistaFideicomiso);
    makeAjaxRequest(url, "HTML", verificarNoExistenciaFideicomiso, null);
  }
}

function verificarNoExistenciaFideicomiso(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    alert("El Fideicomiso ya existe, verifique");
    //GI("txtNoFideicomiso").value="";
    //GI("txtNoFideicomiso").focus();
    GI("txtCveFideicomiso").focus();
  }
}

function ocultaMuestraFiso(ovisibility)
{
GI('tablaFiso').style.visibility =ovisibility;// tabla fiso

GI('txtNoFideicomiso').value = '';
}

function ocultaMuestraConstitucion(ovisibility)
{
GI('tablaConstitucion').style.visibility =ovisibility;// tabla fiso

GI('txtFechaConstitucion').value = '';
}

function botonFideicomiso(fisoOpc)
{
    if(fisoOpc=='CANCELAR')
    {
      ocultaMuestraFiso('hidden');
    }
    else if(fisoOpc=='ACEPTAR')
    {
        if(GI('txtNoFideicomiso').value.length<=0)
        {
          alert("Seleccione Generar Fideicomiso");
        }
        else
        {
          // funcion actualizar num fiso
          
          var nproyecto  = pkInfo.antNumProspecto;
          var nfideicomiso = GI('txtNoFideicomiso').value;
          
          var objUpdFiso = JSON.parse("{}"); 
          
          objUpdFiso.id = "actualizaProyectoFiso";
          objUpdFiso.NumProyecto = nproyecto;
          objUpdFiso.NumFiso = nfideicomiso;
          
          var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objUpdFiso);
          
          makeAjaxRequest(url, "HTML", actualizaProyectoFiso, null);  
          
        }
    
    }
}

function actualizaProyectoFiso(obj, result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var res = objResult.RESULTADO;
        
        switch(Number(res))
        {
            case 0:
              alert("Asignación Correcta");
              ocultaMuestraFiso('hidden');
              GI('cmdAceptar').click();
              break;
            default:
              alert("Ocurrió un error inesperado");
              break;
        }
  }
  else
      alert("Ocurrió un error inesperado");
}

function asignarFideicomiso()
{
  if(isDefinedAndNotNull(pkInfo))
  {
          if(Number(pkInfo.antNumContrato)>0)
          {
            alert("El Proyecto ya tiene asignado un no. de fideicomiso");
            return;
          }
          
      ocultaMuestraFiso('visible');
  
  }else
    alert("Seleccione Proyecto");
}


function constituirFideicomiso()
{
	traeDatosContrato.numProspecto = pkInfo.antNumContrato;
	var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(traeDatosContrato);
	makeAjaxRequest(url, "HTML", traeDatosContrato2, null); 
}

function traeDatosContrato2(obj, result){

  var objResult = JSON.parse(result);
  var existe=objResult[0].datos;
  //alert(existe)
  if (existe==0){
	if(Number(pkInfo.antNumContrato)==0)
	{
	alert("El Proyecto aun no tiene no. de fideicomiso");
	return;
	}

	ocultaMuestraConstitucion('visible');
  }
  else{
	alert("El Proyecto ya esta constituido!");
  }
}

function desasignaProyectoFiso(nfideicomiso,nproyecto)
{         
          var objUpdFiso = JSON.parse("{}"); 
          
          objUpdFiso.id = "actualizaProyectoFiso";
          objUpdFiso.NumProyecto = nproyecto;
          objUpdFiso.NumFiso = nfideicomiso;
          
          var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objUpdFiso);
          
          makeAjaxRequest(url, "HTML", desasignaProyectoFisoRes, null);  
}

function desasignaProyectoFisoRes(obj,result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var res = objResult.RESULTADO;
        
        switch(Number(res))
        {
            case 0:
              //alert("Asignación Correcta");
              break;
            default:
              alert("Ocurrió un error inesperado");
              break;
        }
  }
  else
      alert("Ocurrió un error inesperado");
}

/* --- SIG FIDEICOMISO ---*/


function reportaSeguimiento()// reporte seguimiento
{
  var cveSeguimiento = GI('antSeguimiento').value;
  if(GI('antSeguimiento').selectedIndex>0)
  {
    var objSeguimiento = JSON.parse("{}");
    objSeguimiento.id = "ejeFunRepSeguimientoProy";
    objSeguimiento.numProspecto = GI("antNumProspecto").value;
    objSeguimiento.numUsuario = ctxUser;
    objSeguimiento.varSeguimiento = cveSeguimiento;
    
    var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objSeguimiento);
    
    makeAjaxRequest(url,"html",reportaSeguimientoRes,null);
  }
}  

function reportaSeguimientoRes(obj,result)
{
  //alert(result);
}

function asignarFideicomisoExisPersona()
{
  determinaExistenciaPersonas.Proyecto = pkInfo.antNumProspecto; 
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(determinaExistenciaPersonas);
  makeAjaxRequest(url, "HTML", determinaFideicomisoExistenciaRes, null);  
}

function determinaFideicomisoExistenciaRes(obj, result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var txtNextFid = objResult.RESULTADO;
        
        if(txtNextFid==0)
        {
          alert('¡El Proyecto no tiene Fideicomitente y Fideicomisario!')
        }
        else 
          asignarFideicomiso();
  }
  else
    alert('¡El Proyecto no tiene Fideicomitente y Fideicomisario!');
}


function botonFideicomisoConstitucion(fisoOpc)
{
    if(fisoOpc=='CANCELAR')
    {
      ocultaMuestraConstitucion('hidden');
    }
    else if(fisoOpc=='ACEPTAR')
    {
        if(GI('cmbEjecutivo').value.length<=0 && GI('txtFechaConstitucion').value=="")
        {
          alert("Seleccione Ejecutivo y Fecha de Constitucion");
        }
        else
        {
          // funcion actualizar num fiso
          
          var nproyecto  = pkInfo.antNumProspecto;
          var nfideicomiso = pkInfo.antNumContrato;
          
          var objUpdFiso = JSON.parse("{}"); 
          
          objUpdFiso.id = "funcionConstitucion";
          objUpdFiso.Prospecto = nproyecto;
          objUpdFiso.Fideicomiso = nfideicomiso;
          objUpdFiso.ContabilidadDetallad = 0;
          objUpdFiso.EnvioMensajeria = 0;
          objUpdFiso.FideicomisoFoseg = 0;
          objUpdFiso.FechaConstitucion = GI('txtFechaConstitucion').value;
		  objUpdFiso.NumAdministradorResponsable = GI('cmbEjecutivo').value;
		  objUpdFiso.NomAdministradorResponsable = GI("cmbEjecutivo").options[GI("cmbEjecutivo").selectedIndex].value;
		  objUpdFiso.Comentarios = '';

          var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objUpdFiso);
          
          makeAjaxRequest(url, "HTML", actualizaProyectoFisoConstitucion, null);  
          
        }
    
    }
}

function actualizaProyectoFisoConstitucion(obj, result)
{
  var objResult = JSON.parse(result);
  
  if(isDefinedAndNotNull(objResult))
  {
        var res = objResult.resultado;
        
        switch(Number(res))
        {
            case 0:
              alert("Constitucion Correcta");
              ocultaMuestraConstitucion('hidden');
              GI('cmdAceptar').click();
              break;
            default:
              alert("Ocurrió un error inesperado");
              break;
        }
  }
  else
      alert("Ocurrió un error inesperado");
}