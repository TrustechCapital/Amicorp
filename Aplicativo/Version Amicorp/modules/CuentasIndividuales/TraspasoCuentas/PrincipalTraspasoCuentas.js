var catTrasCuentas = new Catalogo("mx.com.inscitech.fiducia.domain.FidTraspCtasInd");

showWaitLayer();

var numContrato = GI("paramFideicomiso").value;
var fechaMovto = "20/02/2008";

var TRASPASAR = 1;
var CONSULTAR = 2;

var operacion = 0;
var numPantalla = 0;
pkInfo = null;

var cmbNivelParam = JSON.parse("{}");
var objDatosNivelesParam = JSON.parse("{}");
var acumulaLongitud = 0;
var longMax = 0;
var nivelActual = 1;
var cuentaOrigenDestino = 1;

var fvTrasCuentas = new FormValidator();
var numNiveles = 0;

//Arreglo para llenar el grid
var tablaTraspasoCuentasData = new Array();
tablaTraspasoCuentasData[0] = "trasFecOpe,105";
tablaTraspasoCuentasData[1] = "trasCveInv1,170";
tablaTraspasoCuentasData[2] = "trasCveInv2,167";
tablaTraspasoCuentasData[3] = "trasFolio,91";
tablaTraspasoCuentasData[4] = "trasImporte,147";

//Colocar el Número de Fideicomiso en pantalla, así como el nombre correspondiente
GI("paramFideicomiso").value = numContrato;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

////////////////////////////////////////////////////////////////////
//Funciones que se mandan llamar al inicio para conocer la información de los Niveles que conforman el Fideicomiso elegido
function cargaDatosNiveles() {
  objDatosNivelesParam.id = "con3NumNivNomNivLogNivFid";
  objDatosNivelesParam.Fideicomiso = numContrato;
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDatosNivelesParam);
  makeAjaxRequest(url, "HTML", asignaDatosNiveles, null);
}

function asignaDatosNiveles(obj, result) {
  objDatosNivelesParam = JSON.parse(result);
  if(!isDefinedAndNotNull(objDatosNivelesParam.codigoError))
  {
    numNiveles = objDatosNivelesParam.length;
    for(i=0; i<numNiveles; i++)
    {
      longMax += objDatosNivelesParam[i].lonNivel;
      asignaEtiqueta("dvNivel"+(i+1),objDatosNivelesParam[i].nomNivel);
      muestraObj("cmb1Nivel"+(i+1));
      
      if(i==numNiveles-1)
      {
        asignaEtiqueta("dvUltNivel1",objDatosNivelesParam[i].nomNivel+ " Origen");
        asignaEtiqueta("dvUltNivel2",objDatosNivelesParam[i].nomNivel+ " Destino");
      }
    }
    
    cargarCombosPrincipal(1,1);
  }
  else
    hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar los combos de los niveles
function cargarCombosPrincipal(nivelActualLocal,origenDestino) {
  if(nivelActualLocal==2)
    borraCombos("cmb" +  origenDestino + "Nivel2,cmb" + origenDestino + "Nivel3");
  else if(nivelActualLocal==3)
    borraCombos("cmb" + origenDestino + "Nivel3");
  
  cmbNivelParam = JSON.parse("{}");
  
  switch (nivelActualLocal) {
    case 1: cmbNivelParam.inicioNivel = 1; break;
    case 2: cmbNivelParam.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel; break;
    case 3: cmbNivelParam.inicioNivel = 1 + objDatosNivelesParam[0].lonNivel + objDatosNivelesParam[1].lonNivel; break;
    default: cmbNivelParam.inicioNivel = 0; break;
  }
  
  if(isDefinedAndNotNull(objDatosNivelesParam[nivelActualLocal-1]))
  {
    cmbNivelParam.longitudNivel = objDatosNivelesParam[nivelActualLocal-1].lonNivel;
    cmbNivelParam.Fideicomiso = numContrato;
    cmbNivelParam.Nivel = nivelActualLocal;
    cmbNivelParam.parentNivel = (nivelActualLocal==1) ? 0 : eval("GI('cmb" + origenDestino + "Nivel"+(nivelActualLocal-1)+"').value");
    loadElementDo(eval("GI('cmb" + origenDestino + "Nivel"+nivelActualLocal+"')"));
  }
  else
    formsLoaded();
}

//Función para obtener la clave a partir de los combos
function asignaClave() {
  var longClave = 0;
  
  for(nivelActualLocal=3; nivelActualLocal>0; nivelActualLocal--)
    if(GI("cmb1Nivel" + nivelActualLocal).value != -1)
    {
      for(i=0; i<nivelActualLocal; i++)
        longClave += objDatosNivelesParam[i].lonNivel;
      
      GI("paramClave").value = GI("cmb1Nivel" + nivelActualLocal).value.substring(0,longClave);
      break;
    }
}

////////////////////////////////////////////////////////////////////
//Cargar la página principal
function cargaPrincipalTraspasoCuentas() {
  onButtonClickPestania("CuentasIndividuales.TraspasoCuentas.PrincipalTraspasoCuentas","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catTrasCuentas.getCatalogo());
}

/*function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catTrasCuentas.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catTrasCuentas);
  }
}*/

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalTraspasoCuentas();
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para la funcionalidad de la fecha
/*function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}*/






//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoTraspasoCuentas(tipoPantalla) {
  if (tipoPantalla==CONSULTAR && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/CuentasIndividuales/TraspasoCuentas/MantenimientoTraspasoCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result; // pestaña
	//GI("dvContenido").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvTrasCuentas.setup({
    formName      : "frmMantenimientoTraspasoCuentas",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}

function loadCatalogo() {
  catTrasCuentas.setOnUpdate(catLoaded);
  if(operacion==CONSULTAR)
    catTrasCuentas.buscaCatalogoPK(false);
  else //Si se trata de una alta
  {
    GI("trasContrato").value = numContrato;
    SA(GI("nomFideicomiso"),"next","prepararAltaPantalla");
    consultaNombreFideicomiso("nomFideicomiso",GI("trasContrato"));
    deshabilitaPK("trasContrato,trasFolio".split(","));
  }
}

function catLoaded() {
  deshabilitaObjetos(GI("frmMantenimientoTraspasoCuentas"));         //Deshabilita objetos (excepto botones)
  SA(GI("frmMantenimientoTraspasoCuentas").cmdAceptar, "LKD", "true");
  SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
  ocultaObj("cmdAceptar");
  //SA(GI("frmMantenimientoTraspasoCuentas").cmdAceptar, "disabled", "true");   //Deshabilita botón Aceptar
  
  SA(GI("nomFideicomiso"),"next","cargarCombosConsulta");
  consultaNombreFideicomiso("nomFideicomiso",GI("trasContrato"));
}

function cargarCombosConsulta() {
  cmbNivelParam.inicioNivel = 1 + acumulaLongitud;
  cmbNivelParam.longitudNivel = objDatosNivelesParam[nivelActual-1].lonNivel;
  cmbNivelParam.Fideicomiso = numContrato;
  cmbNivelParam.Nivel = nivelActual;
  
  cmbNivelParam.parentNivel = (nivelActual==1) ? 0 : eval("GI('cmb" + cuentaOrigenDestino + "Nivel" + (nivelActual-1) + "').value");
  SA(eval("GI('cmb"+ cuentaOrigenDestino + "Nivel" + nivelActual + "')"),"next","asignaValorCombo");
  loadElementDo(eval("GI('cmb" + cuentaOrigenDestino + "Nivel" + nivelActual + "')"));
}

function asignaValorCombo() {
  try{
    SA(eval("GI('cmb" + cuentaOrigenDestino + "Nivel" + nivelActual + "')"),"next","formsLoaded");
    asignaEtiqueta("dv" + cuentaOrigenDestino + "Nivel" + nivelActual,objDatosNivelesParam[nivelActual-1].nomNivel); //Asigna etiquetas de acuerdo al Número de Niveles
    muestraObj("cmb" + cuentaOrigenDestino + "Nivel" + nivelActual);  //Muestra los combos
    
    var valorKeyCombo = GI("trasCveInv" + cuentaOrigenDestino).value.substring(0,acumulaLongitud+objDatosNivelesParam[nivelActual-1].lonNivel);
    valorKeyCombo = formatString(valorKeyCombo,"0",longMax,"Derecha");
    GI("cmb" + cuentaOrigenDestino + "Nivel" + nivelActual).value = valorKeyCombo;
    
    acumulaLongitud += objDatosNivelesParam[nivelActual-1].lonNivel;
    nivelActual++;
    if(nivelActual <= objDatosNivelesParam.length)
      cargarCombosConsulta();
    else if(cuentaOrigenDestino == 1)
    {
      asignaEtiqueta("dvUltNivel1",objDatosNivelesParam[nivelActual-2].nomNivel + " Origen"); //Asigna etiquetas de la Cuenta Origen
      cuentaOrigenDestino = 2;
      acumulaLongitud = 0;
      nivelActual = 1;
      cargarCombosConsulta();
    }
    else
    {
      asignaEtiqueta("dvUltNivel2",objDatosNivelesParam[nivelActual-2].nomNivel + " Destino"); //Asigna etiquetas de la Cuenta Destino
      formsLoaded();
    }
  }catch(e){alert(JSON.stringify(e));}
}

//Muestra las etiquetas, los combos, carga el primero de ellos y vacia la fecha de Operacion
function prepararAltaPantalla() {
  for (origenDestino=1; origenDestino<3; origenDestino++)
    for(i=0; i<numNiveles; i++) {
      asignaEtiqueta("dv" + origenDestino + "Nivel"+(i+1),objDatosNivelesParam[i].nomNivel);
      muestraObj("cmb" + origenDestino + "Nivel" + (i+1));  //Muestra los combos
      SA(eval("GI('cmb" + origenDestino + "Nivel" + (i+1) + "')"),"required",""); //Coloca el atributo de que sean campos obligatorios
      SA(eval("GI('cmb" + origenDestino + "Nivel"+(i+1)+"')"),"message","Este es un campo obligatorio");
      
      if(i == (numNiveles-1))
        asignaEtiqueta("dvUltNivel" + origenDestino,objDatosNivelesParam[i].nomNivel + (origenDestino==1 ? " Origen" : " Destino") );
    }
  
  //Colocar las Fechas
  GI("trasFecOpe").value = fechaMovto;
  GI("trasFecAlta").value = fechaMovto;
  GI("trasFecUltMod").value = fechaMovto;
  
///////////////  
  //Colocar el Folio de acuerdo al Fideicomiso seleccionado  
  cmbNivelParam = JSON.parse("{\"id\":\"muestraFolioTraspaso\"}");
  eval("cmbNivelParam.Folio = " + numContrato);
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
  makeAjaxRequest(url, "HTML", resultadoFolio, GI("trasFolio"));
///////////////

  //Cargar los dos combos correspondientes al primer nivel (Origen y Destino)
  cargarCombosPrincipal(1,1);
  cargarCombosPrincipal(1,2);
}

function resultadoFolio(obj, result) {
  var resultado = JSON.parse(result);
  
  if(isDefinedAndNotNull(result))
    obj.value = resultado[0].trasFolio;
}

//Coloca la clave del inversionista de acuerdo al dato elegido en el combo
function muestraClaveInversionista(objCombo,cve) {
  if(objCombo.value != -1)
  {
    if(GI("cmb1Nivel3").value == GI("cmb2Nivel3").value)
    {
      alert("No puede Traspasar a la misma Cuenta");
      objCombo.value = -1;
    }
    else
    {
      GI("trasCveInv" + cve).value = objCombo.value;
    
      cmbNivelParam = JSON.parse("{\"id\":\"muestraSecuencialMovCtasIndividuales\"}");
      eval("cmbNivelParam.Fideicomiso = " + numContrato);
      eval("cmbNivelParam.FechaOperacion = '" + GI("trasFecOpe").value + "'");
      eval("cmbNivelParam.Clave = '" + objCombo.value + "'");
      
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
      makeAjaxRequest(url, "HTML", resultadoSecuencial, objCombo);
    }
  }
}

function resultadoSecuencial(obj, result) {
  var resultado = JSON.parse(result);
  
  if(isDefinedAndNotNull(result))
  {
    if(obj.name == "cmb1Nivel3")
      GI("Secuencial1").value = resultado[0].secuencial;
    else
      GI("Secuencial2").value = resultado[0].secuencial;
  }
}

//Da de Alta o Modifica la informacion
function AltaInfo() {
  catTrasCuentas.setOnUpdate(operacionExitosa);
  if(operacion==TRASPASAR && fvTrasCuentas.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    operacionAltaMovTraspaso(1);
    operacionAltaMovTraspaso(2);
    
    catTrasCuentas.altaCatalogo();
  }
}

function operacionAltaMovTraspaso(numOper) {
  
  cmbNivelParam = JSON.parse("{\"id\":\"insMovimientoTraspaso\"}");
  eval("cmbNivelParam.movContrato = " + numContrato);
  
  if(numOper == 1)
  {
    eval("cmbNivelParam.movClaveInv = '" + GI("trasCveInv1").value + "'");
    eval("cmbNivelParam.movSecuencial = " + GI("Secuencial1").value);
    eval("cmbNivelParam.movTipoOper = 'R'");
  }
  else
  {
    eval("cmbNivelParam.movClaveInv = '" + GI("trasCveInv2").value + "'");
    eval("cmbNivelParam.movSecuencial = " + GI("Secuencial2").value);
    eval("cmbNivelParam.movTipoOper = 'D'");
  }
  
  eval("cmbNivelParam.movFecOper = '" + GI("trasFecOpe").value + "'");
  eval("cmbNivelParam.movImporte = " + GI("trasImporte").value);
  eval("cmbNivelParam.movFecAlta = '" + GI("trasFecOpe").value + "'");
  eval("cmbNivelParam.movFecUltMod = '" + GI("trasFecOpe").value + "'");
  eval("cmbNivelParam.movEstatus = 'ACTIVO'");
  
  
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(cmbNivelParam);
  makeAjaxRequest(url, "HTML", null, null);
}

function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 