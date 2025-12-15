var catFideicomisarios = new Catalogo("mx.com.inscitech.fiducia.domain.Benefici");

showWaitLayer();

var clavesCombo16 = JSON.parse("{\"llaveClave\":16}");
var clavesCombo23 = JSON.parse("{\"llaveClave\":23}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraDatosFideicomisos\",\"NumFideicomiso\":0}");
var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaFideicomisarioAdmon\",\"numContrato\":0,\"beneficiario\":0}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var clavesCombo1003 = JSON.parse("{\"llaveClave\":1003}");

var contenedor = new Object();

initForms();

var tablaFideicomisariosData = new Array();
tablaFideicomisariosData[0] = "benNumContrato, 100px";
tablaFideicomisariosData[1] = "benBeneficiario,80px";
tablaFideicomisariosData[2] = "benNomBenef,300px";
tablaFideicomisariosData[3] = "benNomRepres,220px";
tablaFideicomisariosData[4] = "benCveStBenefic,90px";
tablaFideicomisariosData[5] = "benCurp,100px";


var operacion = 0;
var numPantalla = 0;
var numParametroPantalla = 0;
pkInfo = null;
var fechaNacimiento = new Date();
var fvMantenimientoFideicomisarios = new FormValidator();

//No permitir editar el campo informativo de la página principal:
//1. Nombre del fiso
//deshabilitaPK("txtNomFiso".split(","));

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalFideicomisarios() {
  onButtonClickPestania("Administracion.PrincipalFideicomisarios","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catFideicomisarios.getCatalogo());
  
  consultaPacahon(pkInfo.benNumContrato,'FIDEICOMISARIO'); // consulta pacahon
}

function limpiar(objForma){
  RF(objForma);
  catFideicomisarios = new Catalogo("mx.com.inscitech.fiducia.domain.Benefici");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

/*function validarStatus() {
  alert(GI("nomFideicomiso").value);
  if(GI("nomFideicomiso").value == "EXTINTO")
  {
    alert("El Fideicomiso no está Activo");
    limpiar(GI("frmDatosFideicomisariosConsulta"));
  }
}*/

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalFideicomisarios();
}

function operacionExitosaKYC() {
  alert("La operación se realizó correctamente");
  //cargaPrincipalFideicomisarios();

  ocultaObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
  SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisarios"));
  
  cargaCheckList();
  hideWaitLayer();
}


function verificacionActivo() {
  if(GI("paramFideicomiso").value != "") {
    validacionAlta2.numContrato = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", funcionVerificacionActivo, null);
  }else
    asignaEtiqueta("nomFideicomiso","");
}

function funcionVerificacionActivo(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("paramFideicomiso").value="";
    asignaEtiqueta("nomFideicomiso","");
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
var propietarioreal;
function cargaMantenimientoFideicomisarios(tipoPantalla) {
  if ((tipoPantalla==2 || tipoPantalla==3 || tipoPantalla==4) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
	if(tipoPantalla==4)
		propietarioreal=1;
	else
		propietarioreal=0;	
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFideicomisarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomisarios, null);
  }
}

function despliegaPantallaMantenimientoFideicomisarios(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoFideicomisarios.setup({
    formName      : "frmDatosMantenimientoFideicomisarios",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  //Agregando la funcionalidad del calendario
  Calendar.setup({
    inputField     :    "benFecNac",   // id of the input field
    button         :    "benFecNac",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaNacimiento,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  deshabilitaPK("benBeneficiario".split(","));
}

function loadCatalogo() {
  catFideicomisarios.setOnUpdate(catLoaded);
  if(operacion==2 || operacion==3 || operacion==4)
    catFideicomisarios.buscaCatalogoPK(false);
  else
    formsLoaded();
}

function catLoaded() {
  if(operacion==2)//Si se trata de una modificación, no permitir modificar la PK
    deshabilitaPK("benNumContrato,benBeneficiario".split(","));
  else if(operacion==3||operacion==4)//Si se trata de una consulta, deshabilitar
  {
    deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisarios"));  
    //muestraObjs("cmdKYC");
    //Deshabilita objetos (excepto botones)
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    SA(GI("frmDatosMantenimientoFideicomisarios").cmdAceptar, "LKD", "true");
    SA(GI("frmDatosMantenimientoFideicomisarios").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
    cargaCheckList();
  }
  
  //Mostrar el nombre del fiso (informativo)
  //mostrarDatosInformativos(3);
  //cargaRadiosConMaster("benCveSexo","benCveSexo2,benCveSexo3");
  formsLoaded();
}

function AltaOModificaInfo() {
  catFideicomisarios.setOnUpdate(operacionExitosaKYC);
  if(operacion==1 && fvMantenimientoFideicomisarios.checkForm()){//Se trata de una alta
    //catFideicomisarios.altaCatalogo();
    var vgContenedorDatos=null;
    vgContenedorDatos=JSON.parse("{\"id\":\"funcionIncorporaTipoPers\"}");//PRIMERO SE PROCESA LA BITACORA
    vgContenedorDatos.Etapa='FIDEICOMISO';
    vgContenedorDatos.NumProyFid=eval(GI("benNumContrato").value);
    vgContenedorDatos.TipoPers='BENEFICIARIO';
    vgContenedorDatos.NumPers=eval(GI("benBeneficiario").value);
    vgContenedorDatos.Nombre=GI("benNomBenef").value;
    vgContenedorDatos.CatPersona=  GI("benCveTipoPer").value; 
    vgContenedorDatos.Pais=GI("benNomNacional").value;    
    vgContenedorDatos.Calidad=GI("benNomRepres").value;
    vgContenedorDatos.Status='PENDIENTE';
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(vgContenedorDatos);
    //alert(url)  
    makeAjaxRequest(url, "HTML", ejecutaFuncion, null);    
    
  }  
  else if(operacion==2 && fvMantenimientoFideicomisarios.checkForm())//Se trata de una modificación
    catFideicomisarios.modificaCatalogo();
}

  function ejecutaFuncion(tp,result){
    //alert(result);
    var rusultado= JSON.parse(result);
    var res=rusultado.result
    if(res==0){
		alert("Operacion Realizada Satisfactoriamente");
		ocultaObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
		SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
		deshabilitaObjetos(GI("frmDatosMantenimientoFideicomisarios"));  
		cargaCheckList();	  
    } 
    else if(res==1){
      alert("El Registro ya existe");
	  onButtonClickPestania("Administracion.PrincipalFideicomisarios","");
    }
    else if(res==2){
      alert("Existen Registros PENDIENTES por Autorizar");
	  onButtonClickPestania("Administracion.PrincipalFideicomisarios","");
    }        
    else {
      alert("Ocurrio un error al realizar la Operacion.");
	  onButtonClickPestania("Administracion.PrincipalFideicomisarios","");
    }
    hideWaitLayer();   
  }

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catFideicomisarios.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catFideicomisarios);
  }
}


////////////////////////////////////////////////////////////////////////
//Función para mostrar los datos del Fideicomiso (Informativo)
function mostrarDatosInformativos(parametroPantalla) {
  numParametroPantalla = parametroPantalla;
  GI("txtNomFiso").value="";
  
  if(parametroPantalla==1 && GI("paramFideicomiso").value!="")
  {
    consultaDatosInformativos.NumFideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
  else
    GI("txtNomFiso").value="";
  //Para el caso de que se muestre el dato informativo en la segunda pantalla
  /*else if(parametroPantalla==2)
  {
    consultaDatosInformativos.NumFideicomiso = GI("benNumContrato").value;
    validacionAlta.numContrato = GI("benNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, null);
  }
  else
  {
    consultaDatosInformativos.NumFideicomiso = GI("benNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }*/
}

function verificarAlta() {
  if(GI("benNumContrato").value!="")
  {
    validacionAlta.numContrato = GI("benNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAltaFunction, null);
  }
}

function verificarAltaFunction(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionAlta2.numContrato = GI("benNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("benNumContrato").value="";
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("benNumContrato").value="";
  }
  else
  {
    var ingresaSecuencial = JSON.parse("{\"id\":\"conADFideicomisariosSec\",\"numContrato\":" + GI("benNumContrato").value + "}");
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(ingresaSecuencial);
    makeAjaxRequest(url, "HTML", funcionIngresaSecuencial, null);
  }
  
  //Si se coloca el dato informativo en la segunda pantalla
  /*if(objResult[0].ctoCveStContrat == 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }*/
}

function funcionIngresaSecuencial(obj, result) {
  var objResult = JSON.parse(result);
  GI("benBeneficiario").value = objResult[0].beneficiario;
  verificacionExistenciaRegistro();
}


function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomFiso").value=objResult[0].ctoNomContrato;
}

//Verificar que no exista el registro que se desea dar de alta
function verificacionExistenciaRegistro() {
  if(GI("benNumContrato").value!="" && GI("benBeneficiario").value!="")
  {
    validacionExistenciaRegistro.numContrato = GI("benNumContrato").value;
    validacionExistenciaRegistro.beneficiario = GI("benBeneficiario").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificacionExistenciaRegistroFunction, null);
  }
}

function verificacionExistenciaRegistroFunction(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El Registro ya existe, verifique");
    GI("benNumContrato").value="";
    GI("benBeneficiario").value="";
  }
}

////////////////////////////////////////////////////////////////////////
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

/// enlace CHECKLIST-----------------

function cargaCheckList()
{
  contenedor.Fideicomiso = GI("benNumContrato").value;
  contenedor.NumPersona = GI("benBeneficiario").value;
  contenedor.NomPersona = GI("benNomBenef").value;
  if (propietarioreal==0)
	contenedor.TPersona = "P"+GI("benCveTipoPer").value.substring(0,1)+((GI("benNomNacional").value=="MEXICANA")?"NAC":"EXT");
  else
	contenedor.TPersona = "P"+GI("benCveTipoPer").value.substring(0,1)+((GI("benNomNacional").value=="MEXICANA")?"NAC":"EXT")+"P";
  var url = ctxRoot + "/modules/KYC/PrincipalCheckList.do";
  makeAjaxRequest(url, "HTML", cargaParametros, contenedor);
  loadDynamicJS(ctxRoot + "/modules/KYC/PrincipalCheckList.js");
}


function cargaParametros(obj,result)
{
  GI("cargaCheck").innerHTML = result;
  //initForms();
  GI("paramProyecto").value= obj.Fideicomiso;
  GI("paramTPersona").value= obj.TPersona;
  GI("paramNumPersona").value= obj.NumPersona;
  GI("paramNomPersona").value= obj.NomPersona;
  GI("idRegresar").value = 2;
   GI("paramTipo").value =2;
  
 var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunCargaConceptosKYC\",\"TPersona\":\"" + obj.TPersona + "\",\"Fideicomiso\":" + obj.Fideicomiso + ",\"Tipo\":" + 2 + ",\"NumPersona\":" + obj.NumPersona + "}";
 makeAjaxRequest(url, "HTML",cargaConceptosKYC,null);
}

function cargaConceptosKYC(obj,result){
  var resultado = JSON.parse(result).result;
  switch(resultado){
    case 0:
          consultar(GI("cmdCargar"), GI('frmCheckList'), false);
    break;
    case 1:
      alert("No hay Conceptos para esta Persona");
    break;
  }
  hideWaitLayer();
  GI('ContenedorKYC').style.visibility='visible';
  GI('cargaConceptos').innerHTML='<div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div>';
}


//para cargar actividades economicas hijas dinamicamente

var objComboParamAlt;

function cambiaCombo(item)
{

  if(item.selectedIndex>0 && item.selectedIndex<=item.options.length){     
      
     var combohijo=GI('benNumSrama'); 
     SA(eval(combohijo), "param","objComboParamAlt");
      objComboParamAlt = JSON.parse("{\"numRama\":"+item.value+"}");  
      RA(combohijo,"next");
      loadElement(combohijo);  
  }

}


/// ----------- HONORARIOS ---------------

function consultaPacahon(oNumContrato,oCvePersona)
{
  var objPacahon = JSON.parse("{}");
  objPacahon.id = "muestraDatosParametrosHonorarios";
  objPacahon.NumFiso = oNumContrato;
  objPacahon.cvePersonaCob = oCvePersona;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objPacahon);
  
  makeAjaxRequest(url,"html",consultaPacahonRes,null);
}

function consultaPacahonRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res))
  {
    if(res.length==1)
    {
      GI("dvHonorarios").style.visibility = "visible";
      GI("txtPjeFragmentacion").value = pkInfo.honPjeFragComis;
      
      return;
    }
  }
  
  GI("dvHonorarios").style.visibility = "hidden";
}

function ejecutaFunParapaho(cveInstruccion)
{
  var objParapaho = JSON.parse("{}");
  objParapaho.id = "ejeFunParapaho";
  objParapaho.numFiso = pkInfo.benNumContrato;
  objParapaho.cvePersona = 'FIDEICOMISARIO';
  objParapaho.numPersona = pkInfo.benBeneficiario;
  
  if(GI("txtPjeFragmentacion").value==""&&cveInstruccion=="ACTUALIZAR"){  alert("Seleccione % Fragmentación"); return; }
   objParapaho.pjeFragmentacion = GI("txtPjeFragmentacion").value;
  if(GI("cmbStatus").selectedIndex==0&&cveInstruccion=="ACTUALIZAR"){  alert("Seleccione Status"); return; }
  objParapaho.cveStatus = GI("cmbStatus").value;
  
  objParapaho.cveInstruccion = cveInstruccion;
  
  var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objParapaho);
  
  makeAjaxRequest(url,"html",ejecutaFunParapahoRes,null);

}

function ejecutaFunParapahoRes(obj,result)
{

  var res = JSON.parse(result);
  
  if(isDefinedAndNotNull(res))
  {
    switch(eval(res.RESULTADO))
    {
      case 0:
        alert("Operación exitosa");
        GI("cmdAceptar").click();
        GI("dvHonorarios").style.visibility= "hidden";
        
        break;
      case 1:
        alert("% Fragmentación no puede ser mayor al 100%");
        break;
      default:
        alert("Ocurrió un error inesperado");
        break;
    }
  }
  
}

/// ----------------------------------