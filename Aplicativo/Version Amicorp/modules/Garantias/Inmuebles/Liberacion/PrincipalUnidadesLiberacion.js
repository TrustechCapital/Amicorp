//LLAMADO AL BEAN DE LA CLASE JAVA

var catUni = new Catalogo("mx.com.inscitech.fiducia.domain.FUnidades");
catUni.dateFormat = "dd/MM/YYYY";

var cmbEjecutivos = JSON.parse("{\"order\":\"s\"}");
var cmbFirma = JSON.parse("{\"TipoEjecutivo\":\"DELEGADO FIDUCIARIO\",\"order\":\"s\"}");



/*var catAd = new Catalogo("mx.com.inscitech.fiducia.domain.FAdquirentes");
catAd.dateFormat = "dd/MM/YYYY";*/

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

var strIdPK = "funiIdFideicomiso,funiIdSubcuenta,funiIdBien,funiIdEdificio,funiIdDepto";
var arrIdPK = strIdPK.split(",");

var usarSetValuesFormObject=false;
var parametroComboEstado;
var clavesCombo560 = JSON.parse("{\"llaveClave\":560}");

//__________________________________________________________________________


//ELEMENTOS PARA LA TABLA DE CONSULTA DE LA PANTALLA PRINCIPAL

initForms();

var arregloParametrosUnidadesLiberacion = new Array();
arregloParametrosUnidadesLiberacion[0] = "funiIdFideicomiso,100px";
arregloParametrosUnidadesLiberacion[1] = "funiIdSubcuenta,124px";
arregloParametrosUnidadesLiberacion[2] = "funiIdBien,126px";
arregloParametrosUnidadesLiberacion[3] = "funiIdEdificio,120px";
arregloParametrosUnidadesLiberacion[4] = "funiIdDepto,150px";
arregloParametrosUnidadesLiberacion[5] = "funiPrecio,150px";
arregloParametrosUnidadesLiberacion[6] = "funiMoneda,85px";
arregloParametrosUnidadesLiberacion[7] = "funiStatus,80px";


/*var arregloParametrosUnidades = new Array();
arregloParametrosUnidades[0] = "funiIdFideicomiso,100px";
arregloParametrosUnidades[1] = "funiIdSubcuenta,124px";
arregloParametrosUnidades[2] = "funiIdBien,126px";
arregloParametrosUnidades[3] = "funiIdDepto,150px";
arregloParametrosUnidades[4] = "funiPrecio,150px";
arregloParametrosUnidades[5] = "funiMoneda,85px";*/


Calendar.setup({
  inputField     :    "txtFecEscritura",   // id of the input field
  button         :    "txtFecEscritura",
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
  inputField     :    "txtFecFirma",   // id of the input field
  button         :    "txtFecFirma",
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


loadElement(GI('cmbNotario'));

function clickTabla(pk){
  cloneObject(pk,catUni.getCatalogo());
  pkInfo = pk;
  
  
  paramTipoPersona = JSON.parse("{\"Fiso\":"+pkInfo.funiIdFideicomiso+",\"order\":\"s\"}");
  paramTipoPersona1= JSON.parse("{\"Fiso\":"+pkInfo.funiIdFideicomiso+",\"order\":\"s\"}");
  
  loadElement(GI('cmbFideicomBenefici'));
  loadElement(GI('cmbFidBenSaneamiento'));
  loadElement(GI('cmbFidBenResponsabilidad'));
  loadElement(GI('cmbFidBenOtorgamiento'));
  
  GI("dvNomPersona").style.visibility = "hidden";
  GI("dvNomSaneamiento").style.visibility = "hidden";
  GI("dvNomResponsabilidad").style.visibility = "hidden";
  GI("dvNomOtorgamiento").style.visibility = "hidden";
  
  setTimeout("consultaProcesoLiberacion()",500);// proceso Liberacion
  setTimeout("cargaCombosPersonas()",1000);// proceso Liberacion
  setTimeout("consultaProcesoLiberacion()",1500);// proceso Liberacion
  
}

function cargaCombosPersonas()
{
  cargaCmbPersonas(GI('cmbFideicomBenefici'),GI('cmbNomPersona'));
  cargaCmbPersonas(GI('cmbFidBenSaneamiento'),GI('cmbNomSaneamiento'));
  cargaCmbPersonas(GI('cmbFidBenResponsabilidad'),GI('cmbNomResponsabilidad'));
  cargaCmbPersonas(GI('cmbFidBenOtorgamiento'),GI('cmbNomOtorgamiento'));

}

function consultaLiberacion()
{
  GI("dvNomPersona").style.visibility = "hidden";
  GI("dvNomSaneamiento").style.visibility = "hidden";
  GI("dvNomResponsabilidad").style.visibility = "hidden";
  GI("dvNomOtorgamiento").style.visibility = "hidden";

  consultar(GI('cmdAceptar'), GI('frmPrincipalUnidadesLiberacion'), false);
  GI("dvLiberacion").style.visibility = "hidden";
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
    var urlCliente = ctxRoot + "/modules/Garantias/Inmuebles/Liberacion/MantenimientoUnidadesLiberacion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvcatUni.setup({
    formName      : "frmMantenimientoUnidadesLiberacion",
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
  
  // FIN DE LA DEFINICION DE FECHAS -------------------------------------------------------------------
   
}

function loadCatalogo() {
  catUni.setOnUpdate(catLoaded);
  if(modo==MODIFICAR || modo==CONSULTAR||modo==LIBERACION){
    catUni.buscaCatalogoPK(false);
    if(modo == LIBERACION) {//desabilitar todos los campos que no tengan que ver con una liberacion
              SA(GI("funiIdFideicomiso"),"disabled","true");
              SA(GI("funiIdBien"),"disabled","true");
              SA(GI("funiIdEdificio"),"disabled","true");
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
      }
    else if(modo==CONSULTAR)//Si se trata de una consulta, deshabilitar
      {
        SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
        deshabilitaObjetos(GI("frmMantenimientoUnidadesLiberacion"));         //Deshabilita objetos (excepto botones)
      }
    muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
    formsLoaded();
  
}
//****************************************************************************

//FUNCIONES AUXILIARES

function cargaPrincipalUnidades() {
  onButtonClickPestania("Garantias.Inmuebles.Liberacion.PrincipalUnidadesLiberacion","");
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


/* --CARTA LIBERACION-- */

function generaCartaLiberacion()
{
  if(isDefinedAndNotNull(pkInfo))
  {
    var objParametros = JSON.parse("{}");
    objParametros.id = "garantias.ejeFunCartaLib";
    objParametros.numFiso = pkInfo.funiIdFideicomiso;
    objParametros.numSubcta = pkInfo.funiIdSubcuenta;
    objParametros.varBien = pkInfo.funiIdBien;
    objParametros.varDepto = pkInfo.funiIdDepto;
    objParametros.varEdificio = pkInfo.funiIdEdificio;
    objParametros.varFirma = GI('cmbFirma').selectedIndex>0?GI('cmbFirma').value:'SIN FIRMA';
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    
    showWaitLayer();
    makeAjaxRequest(url, "HTML", generaCartaLiberacionRes, objParametros);
    //generaCartaLiberacionRes(objParametros,"{\"RESULTADO\":0}")
  }
  else
  {
    alert("Seleccione un registro");
  }
}

function generaCartaLiberacionRes(obj, result)
{
  hideWaitLayer();
  
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO))
  {
      if(objResult.RESULTADO==0)
      {  
        var nombreReporte = "CartaLiberacion";
    
        
    
        if(GI('txtObservacion').value=='')// sin observacion
        {
          nombreReporte = "CartaLiberacionSinObservacion";
        }
        
        obj.id = "garantias.getCartaLib";
        obj.NameReporte = nombreReporte;
        //alert(nombreReporte)
        obj.template = "/xml/Reportes/Garantias/CartaLiberacion/" + nombreReporte + ".xsl";
        obj.nombreReporte = nombreReporte;
        
        var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
       // var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(obj);
        
        var link = GI("linkReporte");
        link.href=url;
        link.click();
        document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
      }
      else // error
      {
        alert("Ocurrió un error inesperado");
      }
  }
  else 
  {
    alert("Ocurrió un error inesperado");
  }
}


/* -- -------------- -- */


///--------------PROCESO LIBERACION--------------------


var clavesCombo750 = JSON.parse("{\"llaveClave\":750}");
var clavesCombo751 = JSON.parse("{\"llaveClave\":751}");
var clavesCombo752 = JSON.parse("{\"llaveClave\":752}");
var clavesCombo753 = JSON.parse("{\"llaveClave\":753}");
var clavesCombo754 = JSON.parse("{\"llaveClave\":754}");
var paramTipoPersona = JSON.parse("{\"order\":\"s\"}");
var paramTipoPersona1 = JSON.parse("{\"order\":\"s\"}");


function procesoLiberacion(npaso)
{

  switch(npaso)
  {
    case 1:
      ejecutaProcesoLiberacion("GENERAR CARTA");
      break;
    case 2:
      ejecutaProcesoLiberacion("CARTA GENERADA");
      break;
    case 3:
      ejecutaProcesoLiberacion("LIBERAR");
      break;
    case 4:
      ejecutaProcesoLiberacion("LIBERADO");
      break;
    case 5:
      ejecutaProcesoLiberacion("COMPROMETIDO");
      break;
    default:
    break;
  }

}

function ejecutaProcesoLiberacion(vstatus)
{
  var objLiberacion = JSON.parse("{}");
  objLiberacion.id = "garantias.ejeFunProcesoLib";
  objLiberacion.numFiso = pkInfo.funiIdFideicomiso;
  objLiberacion.numSubcta = pkInfo.funiIdSubcuenta;
  objLiberacion.varBien = pkInfo.funiIdBien;
  objLiberacion.varEdificio = pkInfo.funiIdEdificio;
  objLiberacion.varDepto = pkInfo.funiIdDepto;
  objLiberacion.numNotario = GI("cmbNotario").value;
  objLiberacion.varAdquirente = GI("txtAdquirente").value;
  objLiberacion.varTercero = GI("txtTercero").value;
  
  objLiberacion.varFideicomBenefici = GI("cmbFideicomBenefici").value;
  objLiberacion.varNomPersona = GI("cmbFideicomBenefici").value!='COMITE TECNICO'?GI("cmbNomPersona").value:GI("txtComiteFidBen").value;
  objLiberacion.varNumLugar = GI("cmbNumLugar").value;
  objLiberacion.varNomPersona1 = GI("cmbNomPersona1").value;
  objLiberacion.varNumLugar1 = GI("cmbNumLugar1").value;
  
  objLiberacion.varFidBenSaneamiento = GI("cmbFidBenSaneamiento").value;
  objLiberacion.varNomSaneamiento = GI("cmbFidBenSaneamiento").value!='COMITE TECNICO'?GI("cmbNomSaneamiento").value:GI("txtComiteSaneamiento").value;
  objLiberacion.varNumLugarSaneamiento = GI("cmbNumLugarSaneamiento").value;
  objLiberacion.varNomSaneamiento1 = GI("cmbNomSaneamiento1").value;
  objLiberacion.varNumLugarSaneamiento1 = GI("cmbNumLugarSaneamiento1").value;
  
  objLiberacion.varFidBenResponsabilidad = GI("cmbFidBenResponsabilidad").value;
  objLiberacion.varNomResponsabilidad = GI("cmbFidBenResponsabilidad").value!='COMITE TECNICO'?GI("cmbNomResponsabilidad").value:GI("txtComiteResponsabilidad").value;
  objLiberacion.varNumLugarResponsabilidad = GI("cmbNumLugarResponsabilidad").value;
  objLiberacion.varNomResponsabilidad1 = GI("cmbNomResponsabilidad1").value;
  objLiberacion.varNumLugarResponsabilidad1 = GI("cmbNumLugarResponsabilidad1").value;
  
  objLiberacion.varFidBenOtorgamiento = GI("cmbFidBenOtorgamiento").value;
  objLiberacion.varNomOtorgamiento = GI("cmbFidBenOtorgamiento").value!='COMITE TECNICO'?GI("cmbNomOtorgamiento").value:GI("txtComiteOtorgamiento").value;
  objLiberacion.varNumLugarOtorgamiento = GI("cmbNumLugarOtorgamiento").value;
  objLiberacion.varNomOtorgamiento1 = GI("cmbNomOtorgamiento1").value;
  objLiberacion.varNumLugarOtorgamiento1 = GI("cmbNumLugarOtorgamiento1").value;
  
  
  objLiberacion.varTransmisionReversion = GI("cmbTransmisionReversion").value;
  objLiberacion.varParcialTotal = GI("cmbParcialTotal").value;
  objLiberacion.varSujetoRegimen = 0;
  objLiberacion.varTipoInmueble = '';
  objLiberacion.varNomEnvio = GI("cmbNomEnvio").value;
  objLiberacion.varEmailEnvio = GI("txtEmailEnvio").value;
  
  objLiberacion.varObservacion = GI("txtObservacion").value;
  objLiberacion.varEscritura = GI("txtEscritura").value;
  objLiberacion.varFecEscritura = GI("txtFecEscritura").value;
  objLiberacion.varDelegado = GI("cmbDelegado").value;
  objLiberacion.varFecFirma = GI("txtFecFirma").value;
  objLiberacion.varStatus = vstatus;
  
  var url = ctxRoot+"/executeRef.do?json="+JSON.stringify(objLiberacion);
  
  makeAjaxRequest(url,"html",ejecutaProcesoLiberacionRes,vstatus);
} 


function ejecutaProcesoLiberacionRes(vstatus,result)
{
  //  alert(result)
  var res = JSON.parse(result).RESULTADO;
  
  if(isDefinedAndNotNull(res))
  {
    switch(Number(res))
    {
      case 0:
        alert("Proceso ejecutado correctamente");
        GI("paramCveStatus").selectedIndex=0;
        consultaLiberacion();
        
        if(vstatus=="CARTA GENERADA")
          generaCartaLiberacion();
        break;
      default:
        alert("Ocurrio un error inesperado");
        break;
    } 
  }
  else
  {
    alert("Ocurrio un error inesperado");
  }
} 



function consultaProcesoLiberacion()
{

  GI("dvLiberacion").style.visibility = "visible";
  
  GI("cmbNotario").value = pkInfo.fplNotario;
  GI("txtAdquirente").value = pkInfo.fplAdquirente.replace("null","");
  GI("txtTercero").value = pkInfo.fplTercero.replace("null","");
  GI("txtObservacion").value = pkInfo.fplObservacion.replace("null","");
  
  
  GI("cmbFideicomBenefici").value = pkInfo.fplFideicomBenefici.replace("null","-1");
  if(GI("cmbFideicomBenefici").value!='COMITE TECNICO')
    GI("cmbNomPersona").value = pkInfo.fplNomPersona.replace("null","-1");
  else
    GI("txtComiteFidBen").value = pkInfo.fplNomPersona.replace("null","");
  GI("cmbNumLugar").value = pkInfo.fplNumLugar.replace("null","-1");
  GI("cmbNomPersona1").value = pkInfo.fplNomPersona1.replace("null","-1");
  GI("cmbNumLugar1").value = pkInfo.fplNumLugar1.replace("null","-1");
  
  GI("cmbFidBenSaneamiento").value = pkInfo.fplFidBenSaneamiento.replace("null","-1");
  if(GI("cmbFidBenSaneamiento").value!='COMITE TECNICO')
    GI("cmbNomSaneamiento").value = pkInfo.fplNomSaneamiento.replace("null","-1");
  else
    GI("txtComiteSaneamiento").value = pkInfo.fplNomSaneamiento.replace("null","");
  GI("cmbNumLugarSaneamiento").value = pkInfo.fplNumLugarSaneamiento.replace("null","-1");
  GI("cmbNomSaneamiento1").value = pkInfo.fplNomSaneamiento1.replace("null","-1");
  GI("cmbNumLugarSaneamiento1").value = pkInfo.fplNumLugarSaneamiento1.replace("null","-1");
  
  GI("cmbFidBenResponsabilidad").value = pkInfo.fplFidBenResponsabilidad.replace("null","-1");
  if(GI("cmbFidBenResponsabilidad").value!='COMITE TECNICO')
    GI("cmbNomResponsabilidad").value = pkInfo.fplNomResponsabilidad.replace("null","-1");
  else
    GI("txtComiteResponsabilidad").value = pkInfo.fplNomResponsabilidad.replace("null","");
  GI("cmbNumLugarResponsabilidad").value = pkInfo.fplNumLugarResponsabilidad.replace("null","-1");
  GI("cmbNomResponsabilidad1").value = pkInfo.fplNomResponsabilidad1.replace("null","-1");
  GI("cmbNumLugarResponsabilidad1").value = pkInfo.fplNumLugarResponsabilidad1.replace("null","-1");
  
  GI("cmbFidBenOtorgamiento").value = pkInfo.fplFidBenOtorgamiento.replace("null","-1");
  if(GI("cmbFidBenOtorgamiento").value!='COMITE TECNICO')
    GI("cmbNomOtorgamiento").value = pkInfo.fplNomOtorgamiento.replace("null","-1");
  else
    GI("txtComiteOtorgamiento").value = pkInfo.fplNomOtorgamiento.replace("null","");
  GI("cmbNumLugarOtorgamiento").value = pkInfo.fplNumLugarOtorgamiento.replace("null","-1");
  GI("cmbNomOtorgamiento1").value = pkInfo.fplNomOtorgamiento1.replace("null","-1");
  GI("cmbNumLugarOtorgamiento1").value = pkInfo.fplNumLugarOtorgamiento1.replace("null","-1");
  
  
  GI("cmbTransmisionReversion").value = pkInfo.fplTransmisionReversion.replace("null","-1");
  GI("cmbParcialTotal").value = pkInfo.fplParcialTotal.replace("null","-1");
  GI("cmbNomEnvio").value = pkInfo.fplNomEnvio.replace("null","-1");
  GI("txtEmailEnvio").value = pkInfo.fplEmailEnvio.replace("null","");
  
  GI("txtEscritura").value = pkInfo.fplEscritura.replace("null","");
  GI("txtFecEscritura").value = pkInfo.fplFecEscritura;
  GI("txtFecFirma").value = pkInfo.fplFecFirma;
  GI("cmbDelegado").value = pkInfo.fplDelegado.replace("null","-1");
  deshabilitaLiberacion(pkInfo.funiStatus);
  
}

function deshabilitaLiberacion(vstatus)
{
  
  deshabilitaCamposLib("cmbNotario,txtAdquirente,txtTercero,txtObservacion,txtEscritura,txtFecEscritura,cmbDelegado,txtFecFirma,cmdReporte1,cmdReporte2,cmdReporte3,cmdReporte4,cmdReporte,cmbTransmisionReversion,cmbParcialTotal,cmbNomEnvio,txtEmailEnvio,cmbFirma");
  deshabilitaCamposLib("cmbFideicomBenefici,txtComiteFidBen,cmbNomPersona,cmbNumLugar,cmbNomPersona1,cmbNumLugar1");
  deshabilitaCamposLib("cmbFidBenSaneamiento,txtComiteSaneamiento,cmbNomSaneamiento,cmbNumLugarSaneamiento,cmbNomSaneamiento1,cmbNumLugarSaneamiento1");
  deshabilitaCamposLib("cmbFidBenResponsabilidad,txtComiteResponsabilidad,cmbNomResponsabilidad,cmbNumLugarResponsabilidad,cmbNomResponsabilidad1,cmbNumLugarResponsabilidad1");
  deshabilitaCamposLib("cmbFidBenOtorgamiento,txtComiteOtorgamiento,cmbNomOtorgamiento,cmbNumLugarOtorgamiento,cmbNomOtorgamiento1,cmbNumLugarOtorgamiento1");
  
  
  if(vstatus=="COMPROMETIDO")
  {
    habilitaCamposLib("cmbNotario,txtAdquirente,txtTercero,cmbDelegado,txtObservacion,cmdReporte1");
  }
  else
  {
    habilitaCamposLib("cmdReporte4");
  }
  
  if(vstatus=="GENERAR CARTA")
  {
    habilitaCamposLib("cmbNotario,txtAdquirente,txtTercero,cmbDelegado,txtObservacion");
    habilitaCamposLib("cmbFideicomBenefici,cmbNomPersona,cmbNumLugar,cmbTransmisionReversion,cmbParcialTotal,cmbNomEnvio,txtEmailEnvio,cmbFirma,cmdReporte2");
    
    habilitaCamposLib("cmbFideicomBenefici,txtComiteFidBen,cmbNomPersona,cmbNumLugar,cmbNomPersona1,cmbNumLugar1");
    habilitaCamposLib("cmbFidBenSaneamiento,txtComiteSaneamiento,cmbNomSaneamiento,cmbNumLugarSaneamiento,cmbNomSaneamiento1,cmbNumLugarSaneamiento1");
    habilitaCamposLib("cmbFidBenResponsabilidad,txtComiteResponsabilidad,cmbNomResponsabilidad,cmbNumLugarResponsabilidad,cmbNomResponsabilidad1,cmbNumLugarResponsabilidad1");
    habilitaCamposLib("cmbFidBenOtorgamiento,txtComiteOtorgamiento,cmbNomOtorgamiento,cmbNumLugarOtorgamiento,cmbNomOtorgamiento1,cmbNumLugarOtorgamiento1"); 
  }
  if(vstatus=="CARTA GENERADA")
  {
    habilitaCamposLib("cmbNotario,txtAdquirente,txtTercero,cmbDelegado,txtObservacion");
    habilitaCamposLib("txtEscritura,txtFecEscritura,cmdReporte3");
    habilitaCamposLib("cmbFideicomBenefici,cmbNomPersona,cmbNumLugar,cmbTransmisionReversion,cmbParcialTotal,cmbNomEnvio,txtEmailEnvio,cmbFirma,cmdReporte2");
  
    habilitaCamposLib("cmbFideicomBenefici,txtComiteFidBen,cmbNomPersona,cmbNumLugar,cmbNomPersona1,cmbNumLugar1");
    habilitaCamposLib("cmbFidBenSaneamiento,txtComiteSaneamiento,cmbNomSaneamiento,cmbNumLugarSaneamiento,cmbNomSaneamiento1,cmbNumLugarSaneamiento1");
    habilitaCamposLib("cmbFidBenResponsabilidad,txtComiteResponsabilidad,cmbNomResponsabilidad,cmbNumLugarResponsabilidad,cmbNomResponsabilidad1,cmbNumLugarResponsabilidad1");
    habilitaCamposLib("cmbFidBenOtorgamiento,txtComiteOtorgamiento,cmbNomOtorgamiento,cmbNumLugarOtorgamiento,cmbNomOtorgamiento1,cmbNumLugarOtorgamiento1"); 
  }
  if(vstatus=="LIBERAR")
  {
    habilitaCamposLib("txtFecFirma,cmdReporte");
  }
  
}

function deshabilitaCamposLib(campos)
{
    var camposSplit = campos.split(",");
    
    for(var i = 0; i < camposSplit.length; i++)
    {
      SA(GI(camposSplit[i]), "disabled", "true");
    }
}
function habilitaCamposLib(campos)
{
    var camposSplit = campos.split(",");
    
    for(var i = 0; i < camposSplit.length; i++)
    {
      GI(camposSplit[i]).disabled = false;
    }
}

function cargaCmbPersonas(cmbTipoPersona,cmbPersona)
{
  var idCmbTipoPersona = cmbTipoPersona.id;
  var valCmbTipoPersona = cmbTipoPersona.value;
  var numFiso = pkInfo.funiIdFideicomiso;
  
  var idCmbPersona = cmbPersona.id;
  var idDvPersona = idCmbPersona.replace('cmb','dv');

  if(valCmbTipoPersona=="FIDEICOMITENTE Y FIDEICOMISARIO")
  {
    paramTipoPersona = JSON.parse("{\"Fiso\":"+numFiso+",\"Tipo\":\"FIDEICOMITENTE\",\"order\":\"s\"}");
    paramTipoPersona1 = JSON.parse("{\"Fiso\":"+numFiso+",\"Tipo\":\"FIDEICOMISARIO\",\"order\":\"s\"}");
  }
  else
  {
    paramTipoPersona = JSON.parse("{\"Fiso\":"+numFiso+",\"Tipo\":\""+valCmbTipoPersona+"\",\"order\":\"s\"}");
    paramTipoPersona1 = JSON.parse("{\"Fiso\":"+numFiso+",\"Tipo\":\""+valCmbTipoPersona+"\",\"order\":\"s\"}");
  }
  
  loadElement(GI(idCmbPersona));
  loadElement(GI(idCmbPersona+'1'));

  // texto persona/representado por---
  if(valCmbTipoPersona=="COMITE TECNICO")
    GI(idDvPersona).style.visibility = "visible";
  else
    GI(idDvPersona).style.visibility = "hidden";
    
  //---------------------------------
}

function cargaEmailEnvio(cmbNomEnvio)
{
  var objNomEnvio = JSON.parse("{}");
  objNomEnvio.id = "muestraEjecutivos";
  objNomEnvio.NomEjecutivo = cmbNomEnvio.value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objNomEnvio);
  
  makeAjaxRequest(url,"html",cargaEmailEnvioRes,null);
  
}

function cargaEmailEnvioRes(obj,result)
{
  var res = JSON.parse(result)[0];
  GI("txtEmailEnvio").value = res.ejeEmail;
}

///----------------------------------------------------