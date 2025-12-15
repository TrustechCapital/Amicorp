var catFideicomitentes = new Catalogo("mx.com.inscitech.fiducia.domain.Fideicom");

showWaitLayer();

var clavesCombo16 = JSON.parse("{\"llaveClave\":16}");
var clavesCombo23 = JSON.parse("{\"llaveClave\":23}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo1003 = JSON.parse("{\"llaveClave\":1003}");
var contenedor = new Object();

initForms();

var tablaFideicomitentesData = new Array();
tablaFideicomitentesData[0] = "fidNumContrato,100px";
tablaFideicomitentesData[1] = "fidFideicomitente,80px";
tablaFideicomitentesData[2] = "fidNomFideicom,300px";
tablaFideicomitentesData[3] = "fidCveStFideico,90px";
tablaFideicomitentesData[4] = "fidCurp,100px";



var operacion = 0;
var numPantalla = 0;
var modo = 0;
pkInfo = null;
var fvCat = new FormValidator();

//////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalFideicomitentes() {
  onButtonClickPestania("Administracion.PrincipalFideicomitentes","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catFideicomitentes.getCatalogo());
  
  consultaPacahon(pkInfo.fidNumContrato,'FIDEICOMITENTE'); // consulta pacahon
}


function limpiar(objForma){
  RF(objForma);
  catFideicomitentes = new Catalogo("mx.com.inscitech.fiducia.domain.Fideicom");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalFideicomitentes();
  hideWaitLayer();
}

function operacionExitosaKYC(){
  alert("La operación se realizó correctamente");
  //cargaPrincipalFideicomitentes();

  ocultaObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
  SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  deshabilitaObjetos(GI("frmDatos"));  
  cargaCheckList();
  hideWaitLayer();
}

function verificacionActivo() {
  if(GI("paramNumFiso").value != "") {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":" + GI("paramNumFiso").value + "}");
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
    GI("paramNumFiso").value="";
    asignaEtiqueta("nomFideicomiso","");
  }
  else
    consultaNombreFideicomiso("nomFideicomiso",GI("paramNumFiso"));
}

var OPER_MODIFICAR=2;
var OPER_CONSULTAR=3
var OPER_PROPIETARIO=4
var propietarioreal;
//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoFideicomitentes(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==OPER_CONSULTAR || tipoPantalla==OPER_PROPIETARIO) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
	if(tipoPantalla==OPER_PROPIETARIO)
		propietarioreal=1;
	else
		propietarioreal=0;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoFideicomitentes.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFideicomitentes, null);
    loadDynamicJS(ctxRoot + "/modules/Administracion/Direcciones/PrincipalDirecciones.js");
  }
}

function despliegaPantallaMantenimientoFideicomitentes(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvCat.setup({
    formName      : "frmDatos",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  deshabilitaPK("fidFideicomitente".split(","));
}

function loadCatalogo() {
  catFideicomitentes.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==OPER_CONSULTAR || operacion==OPER_PROPIETARIO)
    catFideicomitentes.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("fidNumContrato".split(","));
  }
  else if(operacion==OPER_CONSULTAR || operacion==4)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    //muestraObjs("cmdKYC");
    muestraObjs("cmdDirecciones"); //Mostrar el botón Regresar
    deshabilitaObjetos(GI("frmDatos"));                  //Deshabilita objetos (excepto botones)
    cargaCheckList();
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //cargaRadiosConMaster("fidCveSexo","fidCveSexo2,fidCveSexo3");
  consultaNombreFideicomiso('nomFideicomiso',GI("fidNumContrato"));
  formsLoaded();
}


function AltaOModificaInfo() {
  catFideicomitentes.setOnUpdate(operacionExitosaKYC);
  if(operacion==OPER_ALTA && fvCat.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    //catFideicomitentes.altaCatalogo();
    var vgContenedorDatos=null;
    vgContenedorDatos=JSON.parse("{\"id\":\"funcionIncorporaTipoPers\"}");//PRIMERO SE PROCESA LA BITACORA
    vgContenedorDatos.Etapa='FIDEICOMISO';
    vgContenedorDatos.NumProyFid=eval(GI("fidNumContrato").value);
    vgContenedorDatos.TipoPers='FIDEICOMITENTE';
    vgContenedorDatos.NumPers=eval(GI("fidFideicomitente").value);
    vgContenedorDatos.Nombre=GI("fidNomFideicom").value;
    vgContenedorDatos.CatPersona=GI("fidCveTipoPer").value;
    vgContenedorDatos.Pais=GI("fidNomNacional").value;        
    vgContenedorDatos.Calidad=GI("fidCveMigratoria").value;    
    vgContenedorDatos.Status='PENDIENTE';
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(vgContenedorDatos);
    //alert(url)
    makeAjaxRequest(url, "HTML", ejecutaFuncion, null);    
    
  }
  else if(operacion==OPER_MODIFICAR && fvCat.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catFideicomitentes.modificaCatalogo();
  }
}

  function ejecutaFuncion(tp,result){
    //alert(result);
    var rusultado= JSON.parse(result);
    var res=rusultado.result
    if(res==0){
		alert("Operacion Realizada Satisfactoriamente");
		ocultaObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
		SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
		deshabilitaObjetos(GI("frmDatos"));  
		cargaCheckList();	  
    } 
    else if(res==1){
      alert("El Registro ya existe");
	  onButtonClickPestania("Administracion.PrincipalFideicomitentes","");
    }
    else if(res==2){
      alert("Existen Registros PENDIENTES por Autorizar");
	  onButtonClickPestania("Administracion.PrincipalFideicomitentes","");
    }        
    else {
      alert("Ocurrio un error al realizar la Operacion.");
	  onButtonClickPestania("Administracion.PrincipalFideicomitentes","");
    }
    hideWaitLayer();   	
  }

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catFideicomitentes.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catFideicomitentes);
  }
}


//////////////////////////////////////////////////////////////
function validarPkAlta(objeto) {
  if(objeto.value!="")
  {
    showWaitLayer();
    var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
    validacionAlta.numContrato = objeto.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, objeto);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    obj.value="";
    obj.focus();
    hideWaitLayer();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    obj.value="";
    obj.focus();
    hideWaitLayer();
  }
  else
  {
    consultaNombreFideicomiso('nomFideicomiso',obj);
    
    //Agregar el número del Fideicomitente (Incremental)
    var SecNumFideicom = JSON.parse("{\"id\":\"numSecFidFideicomitente\",\"NumFiso\":0}");
    SecNumFideicom.NumFiso=obj.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumFideicom);
    makeAjaxRequest(url, "HTML", agregarFideicomitente, obj);
  }
}

function agregarFideicomitente(obj, result) {
  var objResult = JSON.parse(result);
  GI("fidFideicomitente").value=objResult[0].secNumFideicomitente;
  hideWaitLayer();
}

//----------------------------------------- Pantalla de Direcciones de Fideicomitentes
function cargaPrincipalDirecciones(){
  showWaitLayer();
  var objDatosFideicomitente = new Object();
  objDatosFideicomitente.NumContrato = GI("fidNumContrato").value;
  objDatosFideicomitente.NomContrato = GI("nomFideicomiso").innerHTML;
  objDatosFideicomitente.NumFideicomitente = GI("fidFideicomitente").value;
  objDatosFideicomitente.NomFideicomitente = GI("fidNomFideicom").value;
  var urlCliente = "modules/Administracion/Direcciones/PrincipalDirecciones.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalDirecciones, objDatosFideicomitente);
}

function despliegaPantallaPrincipalDirecciones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaObjetos(GI("frmDatos"));
  asignaEtiqueta("nomFideicomiso",obj.NomContrato);
  GI("fidNomFideicom").value = obj.NomFideicomitente;
  GI("paramFideicomiso").value = obj.NumContrato;
  GI("paramFideicom").value = obj.NumFideicomitente;
  consultar(GI("cmdRegresar"), GI("frmDatos"), false);
  formsLoaded();
}


/// enlace CHECKLIST-----------------

function cargaCheckList()
{
  contenedor.Fideicomiso = GI("fidNumContrato").value;
  contenedor.NumPersona = GI("fidFideicomitente").value;
  contenedor.NomPersona = GI("fidNomFideicom").value;
  //alert(propietarioreal)
  if (propietarioreal==0)
	contenedor.TPersona = "P"+GI("fidCveTipoPer").value.substring(0,1)+((GI("fidNomNacional").value=="MEXICANA")?"NAC":"EXT");
  else
	contenedor.TPersona = "P"+GI("fidCveTipoPer").value.substring(0,1)+((GI("fidNomNacional").value=="MEXICANA")?"NAC":"EXT")+"P";
  //alert(contenedor)	  
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
  GI("idRegresar").value = 1;
   GI("paramTipo").value =1;
  
 var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunCargaConceptosKYC\",\"TPersona\":\"" + obj.TPersona + "\",\"Fideicomiso\":" + obj.Fideicomiso + ",\"Tipo\":" + 1 + ",\"NumPersona\":" + obj.NumPersona + "}";
 
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
      
     var combohijo=GI('fidNumSrama'); 
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
  objParapaho.numFiso = pkInfo.fidNumContrato;
  objParapaho.cvePersona = 'FIDEICOMITENTE';
  objParapaho.numPersona = pkInfo.fidFideicomitente;
  
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