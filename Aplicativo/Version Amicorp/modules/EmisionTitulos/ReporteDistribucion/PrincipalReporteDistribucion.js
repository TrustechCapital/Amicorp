showWaitLayer();
var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FCedevfco");
var cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FCedevmor");
var cat3 = new Catalogo("mx.com.inscitech.fiducia.domain.FCedevpag");
var cat4 = new Catalogo("mx.com.inscitech.fiducia.domain.FCedevhon");
var cat5 = new Catalogo("mx.com.inscitech.fiducia.domain.FCedecpag");

var cmbFideicomisoParam = JSON.parse("{\"NumPrograma\":-1,\"order\":\"S\"}");
var cmbEmsisionParam = JSON.parse("{\"NumPrograma\":-1,\"NumFideicomiso\":-1,\"order\":\"S\"}");


var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");
var cmbEmision = JSON.parse("{\"NumEmisor\":\"-1\",\"order\":\"s\"}");

var fvCat = new FormValidator();
var strIdPK = "idRC,ecedIdPrograma,ecedIdFideicomiso,ecedIdEmision";
var arrIdPK = strIdPK.split(",");

var strIdPKEnc = "txtIdRC,txtFechaInicio,txtFechaFin,txtFechaPago,paramPrograma,paramFideicomiso,paramEmision,txtCupon,paramReporte,txtPizarra,txtSerie,totalFC,totalGP,totalEM,totalOE";
var arrIdPKEnc = strIdPKEnc.split(",");
var modo = 0;
var modo2 = 0;
pkInfo = null;
pkInfo2 = null;
pkInfo3 = null;
var objCmbOrigen = null;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,50px";
arrTblDat[1] = "ecedIdPeriodo,58px";
arrTblDat[2] = "ecedIdPrograma,77px";
arrTblDat[3] = "ecedIdEmision,67px";
arrTblDat[4] = "ecedCvePizarra,54px";
arrTblDat[5] = "ecedNumSerie,71px";
arrTblDat[6] = "ecedIdFideicomiso,83px";
arrTblDat[7] = "ecedNomEmisor,142px";
arrTblDat[8] = "ecedFecInicioPer,100px";
arrTblDat[9] = "ecedFecFinPer,100px";
arrTblDat[10] = "ecedFecPagoPer,100px";
arrTblDat[11] = "repDist,80px";


var arrTblDatPer = new Array();
arrTblDatPer[0] = "idRc,50px";
arrTblDatPer[1] = "ecedIdPeriodo,58px";
arrTblDatPer[2] = "ecedIdPrograma,77px";
arrTblDatPer[3] = "ecedIdFideicomiso,83px";
arrTblDatPer[4] = "ecedNomEmisor,142px";
arrTblDatPer[5] = "ecedFecInicioPer,100px";
arrTblDatPer[6] = "ecedFecFinPer,100px";
arrTblDatPer[7] = "ecedFecPagoPer,100px";

var arrTblDatFluCob = new Array();
arrTblDatFluCob[0] = "ecfcIdSecCob,70px";
/*arrTblDatFluCob[1] = "ecfcFecInicioPer,100px";
arrTblDatFluCob[2] = "ecfcFecFinPer,100px";
arrTblDatFluCob[3] = "ecfcFecPagoPer,100px";*/
arrTblDatFluCob[1] = "ecfcConcepto,250px";
arrTblDatFluCob[2] = "ecfcImpCobranza,120px,right";
//arrTblDatFluCob[6] = "ecfcComentario,200px";

var arrTblDatEstMor = new Array();
arrTblDatEstMor[0] = "ecmoIdSecMor,70px";
arrTblDatEstMor[1] = "ecmoConcepMor,250px";
arrTblDatEstMor[2] = "ecmoNumCtas,80px";
arrTblDatEstMor[3] = "ecmoPorCtas,80px";
arrTblDatEstMor[4] = "ecmoImpSaldo,120px,right";

var arrTblDatGasPer = new Array();
arrTblDatGasPer[0] = "ecpaIdSecPago,70px";
arrTblDatGasPer[1] = "ecpaConcepto,250px";
arrTblDatGasPer[2] = "ecpaImpHonorario,120px,right";


var arrTblDatOtrEven = new Array();
arrTblDatOtrEven[0] = "ecfcIdConPag,70px";
arrTblDatOtrEven[1] = "ecpgConcepto,350px";
arrTblDatOtrEven[2] = "ecpgImpPago,120px,right";
arrTblDatOtrEven[3] = "ecpgImpPagoDis,120px,right";




fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function clickTablaPer(pk)
{
  cloneObject(pk,cat3.getCatalogo());
  pkInfo = null;
  pkInfo3 = pk;
  tablaEmisiones("visible");
}


function clickTabla(pk)
{
  cloneObject(pk,cat3.getCatalogo());
  pkInfo3 = null;
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
  pkInfo2 = null;
  pkInfo3 = null;
}

function cargaComboSiguiente(objCmb, isModifCons){
  if(objCmb.id == "paramPrograma"){
    cmbFideicomisoParam.NumPrograma = objCmb.value;
    loadElement(GI("paramFideicomiso"));
  }else if(objCmb.id == "paramFideicomiso"){
    cmbEmsisionParam.NumPrograma = GI("paramPrograma").value;
    cmbEmsisionParam.NumFideicomiso = objCmb.value; 
    loadElement(GI("paramEmision"));
  }else if(objCmb.id == "ecedIdPrograma"){
    if(isModifCons) {
      objCmbOrigen = objCmb;
      SA(GI("ecedIdFideicomiso"),"next","mostrarValoresCmb");
    }
    cmbFideicomisoParam.NumPrograma = objCmb.value;
    loadElement(GI("ecedIdFideicomiso"));
  }else{
    if(isModifCons) {
      objCmbOrigen = objCmb;
      SA(GI("ecedIdEmision"),"next","mostrarValoresCmb");
    }
    cmbEmsisionParam.NumPrograma = GI("ecedIdPrograma").value;
    cmbEmsisionParam.NumFideicomiso = objCmb.value; 
    loadElement(GI("ecedIdEmision"));
  }
}

function mostrarValoresCmb() {
  setValuesFormObject(cat3.getCatalogo());
  if(objCmbOrigen.id == "ecedIdPrograma") {
    SA(GI("ecedIdFideicomiso"),"next","hideWaitLayer");
    cargaComboSiguiente(GI("ecedIdFideicomiso"),true);
  }
  else
  {
    SA(GI("ecedIdEmision"),"next","hideWaitLayer");
    formsLoaded();
  }
}

function cargaDetalleReporteDistribucion(opc)
{
  if(opc == 1 && (isDefinedAndNotNull(pkInfo)||isDefinedAndNotNull(pkInfo3)))
  {
    showWaitLayer();
    pkInfo2 = null;
    var urlCliente = "modules/EmisionTitulos/ReporteDistribucion/MantenimientoReporteDistribucion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaDetalleReporteDistribucion, null);
  }else if (opc == 2){
    pkInfo2 = null;
    setSaveInnerHTML('dvPantalla','MantenimientoReporteDistribucion',true);
    consultarTablasDetalle();
    totales();
  }
  
}

function despliegaPantallaDetalleReporteDistribucion(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK(arrIdPKEnc);
  
  asignaValues2ObjHTML();
}

var once = true;
function asignaValues2ObjHTML()
{
  if(once)
  {
      once=false;
    
       if(isDefinedAndNotNull(pkInfo))
       {
               GI("paramPrograma").value = pkInfo.ecedIdPrograma;
               asignaEtiqueta("dvPrograma",pkInfo.ecedNomPrograma);
               GI("paramFideicomiso").value = pkInfo.ecedIdFideicomiso;
               if(isDefinedAndNotNull(pkInfo.ecedNomFideicomiso))
               {
                  if(pkInfo.ecedNomFideicomiso>0)
                  asignaEtiqueta("dvFideicomiso",pkInfo.ecedNomFideicomiso);
               }
               GI("paramEmision").value = pkInfo.ecedIdEmision;
               asignaEtiqueta("dvEmisor",pkInfo.ecedNomEmisor);
               GI("txtCupon").value = pkInfo.ecedIdPeriodo
               GI("paramReporte").value = pkInfo.ecedIdPeriodo;
               GI("txtPizarra").value = pkInfo.ecedCvePizarra;
               GI("txtSerie").value = pkInfo.ecedNumSerie;
               
               
               GI("txtIdRC").value = pkInfo.idRc;
               GI("txtFechaInicio").value = pkInfo.ecedFecInicioPer;
               GI("txtFechaFin").value = pkInfo.ecedFecFinPer;
               GI("txtFechaPago").value = pkInfo.ecedFecPagoPer;
               
               consultarTablasDetalle();
               totales();
       }
       
       if(isDefinedAndNotNull(pkInfo3))
       {
            GI("paramPrograma").value = pkInfo3.ecedIdPrograma;
            asignaEtiqueta("dvPrograma",pkInfo3.ecedNomPrograma);
            GI("paramFideicomiso").value = pkInfo3.ecedIdFideicomiso;
            if(isDefinedAndNotNull(pkInfo3.ecedNomFideicomiso))
            {
               if(pkInfo3.ecedNomFideicomiso>0)
               asignaEtiqueta("dvFideicomiso",pkInfo3.ecedNomFideicomiso);
            }
            asignaEtiqueta("dvEmisor",pkInfo3.ecedNomEmisor);
            GI("txtCupon").value = pkInfo3.ecedIdPeriodo
            GI("paramReporte").value = pkInfo3.ecedIdPeriodo;
            
            
            //no aplican----
            GI("paramEmision").value = 0;
            GI("txtPizarra").value = "";
            GI("txtSerie").value = "";
            //----------------
            
            GI("txtIdRC").value = pkInfo3.idRc;
            GI("txtFechaInicio").value = pkInfo3.ecedFecInicioPer;
            GI("txtFechaFin").value = pkInfo3.ecedFecFinPer;
            GI("txtFechaPago").value = pkInfo3.ecedFecPagoPer;
            
            consultarTablasDetalle();
            totales();
       }
      
         formsLoaded();
      }
}

function consultarTablasDetalle()
{
  //Llevar a cabo las consultas de las 3 tablas
  consultar(GI("cmdAceptar"), frmDatos, false);
  
  
   if(isDefinedAndNotNull(pkInfo3))
   {
        GI("cmdAceptar").ref = "emision.conETTabEstMor";
        GI("cmdAceptar").tabla = "tblRegEstMor";
        consultar(GI("cmdAceptar"), frmDatos, false);
        
        GI("cmdAceptar").ref = "emision.conETTabGasPer";
        GI("cmdAceptar").tabla = "tblRegGasPer";
        consultar(GI("cmdAceptar"), frmDatos, false);
        
        GI("cmdAceptar").ref = "emision.conETTabFluCob";
        GI("cmdAceptar").tabla = "tblRegFluCob";
        consultar(GI("cmdAceptar"), frmDatos, false);
        
        
     //leyendas
     GI('tdOE').style.visibility = "hidden";
     //totales
     GI('totalOE').style.visibility = "hidden";
     //tablas
     GI('tableOE').style.visibility = "hidden";
     GI('tableOE').style.position = "absolute";
  }
  
  
   if(isDefinedAndNotNull(pkInfo))
   {
     GI("cmdAceptar").ref = "emision.conETTabOtrEven";
     GI("cmdAceptar").tabla = "tblRegOtrEven";
     consultar(GI("cmdAceptar"), frmDatos, false);
     
     //leyendas
     GI('tdFC').style.visibility = "hidden";
     GI('tdGP').style.visibility = "hidden";
     GI('tdEM').style.visibility = "hidden";
     //totales
     GI('totalFC').style.visibility = "hidden";
     GI('totalGP').style.visibility = "hidden";
     GI('totalEM').style.visibility = "hidden";
     //tablas
     GI('tableFCGPEM').style.visibility = "hidden";
     GI('tableFCGPEM').style.position = "absolute";
     
     
   }
  
}

function cargaOpcionReporteDistribucion(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo)||isDefinedAndNotNull(pkInfo3)) && fvCat.checkForm()){
    showWaitLayer();
    saveInnerHTML("dvPantalla", "MantenimientoReporteDistribucion");
    var urlCliente = "modules/EmisionTitulos/" + GI("rdOpcion").value.substring(9) + "/" + GI("rdOpcion").value + ".do";
    
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaOpcion, GI("rdOpcion").value);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/" + GI("rdOpcion").value.substring(9) + "/" + GI("rdOpcion").value + ".js");
  }
}

function despliegaPantallaOpcion(obj, result)
{
  GI("dvContenido2").innerHTML = result;
  if(modo == OPER_CONSULTAR){
    deshabilitaObjetos(GI("frmDatos"));
    GI("cmdCancelar").value = "Regresar";
    muestraObj("cmdCancelar");
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
  eval("despliegaPantalla" + obj + "();");
}

function cargaOpcionReporteDistribucion2(Modo) {
  modo = Modo;
  var strPantalla = null;
  var strRdOpcion = null;
  
  if(pkInfo2 == null)
   return;
  
  if(isDefinedAndNotNull(pkInfo2.ecfcIdPrograma)) {//PANTALLA: FLUJO DE COBRANZA
    strPantalla = "FlujoCobranza/PrincipalFlujoCobranza";
    strRdOpcion = "PrincipalFlujoCobranza";
  }
  else if(isDefinedAndNotNull(pkInfo2.ecmoIdPrograma)) {//PANTALLA: ESTADISTICA DE MOROSIDAD
    strPantalla = "EstadisticaMorosidad/PrincipalEstadisticaMorosidad";
    strRdOpcion = "PrincipalEstadisticaMorosidad";
  }
  else if(isDefinedAndNotNull(pkInfo2.ecpaIdPrograma)) {//PANTALLA: GASTOS PERIODO
    strPantalla = "GastosPeriodo/PrincipalGastosPeriodo";
    strRdOpcion = "PrincipalGastosPeriodo";
  }
  else if(isDefinedAndNotNull(pkInfo2.ecpgIdPrograma)) {//PANTALLA: OTROS EVENTOS
    strPantalla = "OtrosEventos/PrincipalOtrosEventos";
    strRdOpcion = "PrincipalOtrosEventos";
  }
  
  if(isDefinedAndNotNull(pkInfo)||isDefinedAndNotNull(pkInfo3)){
    showWaitLayer();
    saveInnerHTML("dvPantalla", "MantenimientoReporteDistribucion");
    var urlCliente = "modules/EmisionTitulos/" + strPantalla + ".do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaOpcion, strRdOpcion);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/" + strPantalla + ".js");
  }
}

function clickTablaFluCob(pk) {
  cloneObject(pk,cat.getCatalogo());
  pkInfo2 = pk;
}

function clickTablaEstMor(pk) {
  cloneObject(pk,cat2.getCatalogo());
  pkInfo2 = pk;
}

function clickTablaGasPer(pk) {
  cloneObject(pk,cat4.getCatalogo());
  pkInfo2 = pk;
}

function clickTablaOtrEven(pk) 
{
  cloneObject(pk,cat5.getCatalogo());
  pkInfo2 = pk;
}

function eliminarCatalogo(Modo) {
  modo = Modo;
  var catX;
  
  if(pkInfo2 == null)
    return;
  
  showWaitLayer();
  if(isDefinedAndNotNull(pkInfo2.ecfcIdPrograma))//PANTALLA: FLUJO DE COBRANZA
    catX = cat;
  else if(isDefinedAndNotNull(pkInfo2.ecmoIdPrograma))//PANTALLA: ESTADISTICA DE MOROSIDAD
    catX = cat2;
  else if(isDefinedAndNotNull(pkInfo2.ecpaIdPrograma))//PANTALLA: GASTOS PERIODO
    catX = cat4;
  else if(isDefinedAndNotNull(pkInfo2.ecpgIdPrograma))//PANTALLA: OTROS EVENTOS
    catX = cat5;
  
  catX.setOnUpdate(operacionCatalogoX);
  catX.bajaCatalogo(false);
}

function operacionCatalogoX() {
  pkInfo2 = null;
  alert("Operacion realizada exitosamente!");
  consultarTablasDetalle();
  totales();
  hideWaitLayer();
}

//********************************* DETALLE DE CALCULO DE PAGO
var fecha = new Date();

function cargaMantenimientoCalculoPago(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo3) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/CalculoPago/MantenimientoCalculoPago.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCalculoPago, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    //ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoCalculoPago(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  Calendar.setup({
    inputField     :    "ecedFecInicioPer",   // id of the input field
    button         :    "ecedFecInicioPer",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "ecedFecPagoPer",   // id of the input field
    button         :    "ecedFecPagoPer",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fecha,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
    // Id RC
    GI('idRC').value = pkInfo3.idRc;
    consultaEmisor(GI('idRC'),GI('ecedIdPrograma'),GI('ecedIdFideicomiso'),GI('ecedIdEmision'));
    
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
  
  initForms();
}

var once2 = true;
function asignaValues2ObjHTMLCalculoPago()
{
  if(once2)
  { 
    once2=false;

      if(isDefinedAndNotNull(pkInfo3) && modo != OPER_ALTA){
        cat3.setOnUpdate(cargaComplementoCalculoPago);
        cat3.buscaCatalogoPK(false);
      }else{
        formsLoaded();
      }
  }
}

function cargaComplementoCalculoPago() {
  cargaRadiosConMaster("ecedTipoMoneda","rdMXN");
  cargaComboSiguiente(GI("ecedIdPrograma"),true);
}

function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date<today)
    return false;
  else
    return true;
}

function asignaSecuencialCalculoPago() {
 if(GI("ecedIdEmision").value == -1) {
  GI("ecedIdPeriodo").value = "";
 }
 else {
  var objSecuencialParam = JSON.parse("{}");
  objSecuencialParam.id = "emision.asiETValSecCalPag";
  objSecuencialParam.Programa = GI("ecedIdPrograma").value;
  objSecuencialParam.Fideicomiso = GI("ecedIdFideicomiso").value;
  objSecuencialParam.Emision = GI("ecedIdEmision").value;
  asignaSecuencial(GI("ecedIdPeriodo"),objSecuencialParam);
 }
}

function ejecutaOperacionCalculoPago(){
  cat3.setOnUpdate(operacionCatalogo);
  if(modo == OPER_ALTA && fvCat.checkForm()){
    showWaitLayer();
    cat3.altaCatalogo();
  }
  else if(modo == OPER_MODIFICAR && fvCat.checkForm()){
    showWaitLayer();
    cat3.modificaCatalogo();
  }
}

function operacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.ReporteDistribucion.PrincipalReporteDistribucion","");
  hideWaitLayer();
}


/// ------------- ID RC----------

var cmbEmisorG;
var cmbProgramaG;
var cmbFideicomisoG; 

function consultaEmisor(cmbObjEmisor,cmbObjPrograma,cmbObjFideicomiso,cmbObjEmision)
{
  existeIdRC(cmbObjEmisor);
  
   cmbEmision = JSON.parse("{\"NumEmisor\":\""+numIdRC(cmbObjEmisor.value)+"\",\"order\":\"s\"}");
   loadElement(cmbObjEmision);
   
  consultaPrograma(cmbObjEmisor,cmbObjPrograma);
   consultaFideicomiso(cmbObjEmisor,cmbObjFideicomiso);
}

function consultaPrograma(cmbObjEmisor,cmbObjPrograma)
{
    cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(cmbObjEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
    loadElement(cmbObjPrograma);
    cmbProgramaG = cmbObjPrograma;
    setTimeout("cargaDatosPrograma(cmbProgramaG)",2000); 
}


function cargaDatosPrograma(cmbObjPrograma)
{

    if(cmbObjPrograma.options.length==1)
    {
      //habilitaCampos("eemiIdPrograma");
      return;
     }
     
    cmbObjPrograma.selectedIndex=1;
    //deshabilitaCampos("eemiIdPrograma");
    
}

function consultaFideicomiso(cmbObjEmisor,cmbObjFideicomiso)
{
    cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(cmbObjEmisor.value)+",\"order\":\"s\"}");
    loadElement(cmbObjFideicomiso);
    cmbEmisorG = cmbObjEmisor; 
    cmbFideicomisoG = cmbObjFideicomiso;
    setTimeout("consultaTimeFideicomiso(cmbEmisorG,cmbFideicomisoG)",2000);    
}

function consultaTimeFideicomiso(cmbObjEmisor,cmbObjFideicomiso)
{
  var objEmisor = JSON.parse("{}");
   objEmisor.id = "emision.conETEmisorFideicomiso";
   objEmisor.idEmisor = numIdRC(cmbObjEmisor.value);
       
   var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmisor);
   makeAjaxRequest(url, "HTML", consultaFideicomisoRes,cmbObjFideicomiso);
}

function consultaFideicomisoRes(cmbObjFideicomiso,result)
{
    var res = JSON.parse(result);
    if(res.length>0)
    {
      cmbObjFideicomiso.selectedIndex=1;
      //deshabilitaCampos("eemiIdFideicomiso");
    }
    else
    {
      cmbObjFideicomiso.selectedIndex=0;
      //habilitaCampos("eemiIdFideicomiso");
    }
    cargaEmisiones(cmbEmisorG,cmbObjFideicomiso);
}

//----------- ----- TOTALES --------------------

function totales()
{

    var url;

   if(isDefinedAndNotNull(pkInfo3))
   {
   
      var objFC = JSON.parse("{}");
      objFC.id = "emision.conETSumFluCob";
      objFC.Fideicomiso = pkInfo3.ecedIdFideicomiso;
      objFC.Programa = pkInfo3.ecedIdPrograma;
      objFC.Emision =  0;//pkInfo3.ecedIdEmision;
      objFC.Reporte =  pkInfo3.ecedIdPeriodo;
      
      var objGP = JSON.parse("{}");
      objGP.id = "emision.conETSumGasPer";
      objGP.Fideicomiso = pkInfo3.ecedIdFideicomiso;
      objGP.Programa = pkInfo3.ecedIdPrograma;
      objGP.Emision =  0;//pkInfo3.ecedIdEmision;
      objGP.Reporte =  pkInfo3.ecedIdPeriodo;
      
      var objEM = JSON.parse("{}");
      objEM.id = "emision.conETSumEstMor";
      objEM.Fideicomiso = pkInfo3.ecedIdFideicomiso;
      objEM.Programa = pkInfo3.ecedIdPrograma;
      objEM.Emision =  0;//pkInfo3.ecedIdEmision;
      objEM.Reporte =  pkInfo3.ecedIdPeriodo;
   
      url = ctxRoot+"/getRef.do?json="+JSON.stringify(objFC);
      makeAjaxRequest(url,"html",totalesRes,"totalFC");  
      
      
      url = ctxRoot+"/getRef.do?json="+JSON.stringify(objGP);
      makeAjaxRequest(url,"html",totalesRes,"totalGP");  
      
      
      url = ctxRoot+"/getRef.do?json="+JSON.stringify(objEM);
      makeAjaxRequest(url,"html",totalesRes,"totalEM");  
      
   }
   
    if(isDefinedAndNotNull(pkInfo))
   {
   
        var objOE = JSON.parse("{}");
         objOE.id = "emision.conETSumOtrEven";
         objOE.Fideicomiso = pkInfo.ecedIdFideicomiso;
         objOE.Programa = pkInfo.ecedIdPrograma;
         objOE.Emision =  pkInfo.ecedIdEmision;
         objOE.Reporte =  pkInfo.ecedIdPeriodo;
         
         url = ctxRoot+"/getRef.do?json="+JSON.stringify(objOE);
         makeAjaxRequest(url,"html",totalesRes,"totalOE");  
      
   }
}

function totalesRes(id,result)
{
   var res = JSON.parse(result)[0];
   GI(id).value = res.total;
}


// conceptos de importe indices-----------


function asignaDescConcepto(objCmbConcepto,objTextConcepto)
{
   if(objCmbConcepto.selectedIndex>0)
      objTextConcepto.value = objCmbConcepto.options[objCmbConcepto.selectedIndex].text;
   else
      objTextConcepto.value = "";
}

// -- REPORTE DISTRIBUCION----------


function generaDatosExcel() 
{
   if(!isDefinedAndNotNull(pkInfo3))
   {
      alert("¡Seleccione Registro!");
      return;
    }
    /*if(pkInfo.repDist!="SI")
    {
      alert("¡Emisión no genera Reporte de Distribución!");
      return;
    }*/
    
    var parametros = JSON.parse("{}");
    parametros.template = "/xml/Reportes/EmisionTitulos/ReporteDistribucion/ReporteDistribucion.xsl";
    parametros.nombreReporte = "ReporteDistribucion";
    parametros.extencionReporte = ".xls";
    //parametros.XmlProcessor = "emision.CalendarioPagosImpl";
    
   
      parametros.id = "emision.repFunRepDistribucion" ;
      parametros.Programa = pkInfo3.ecedIdPrograma;
      parametros.Fideicomiso = pkInfo3.ecedIdFideicomiso;
      parametros.Emision = 0;
      parametros.Secuencial = pkInfo3.ecedIdPeriodo;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
   
    showWaitLayer();
    makeAjaxRequest(url, "HTML", generaArchivoExcel, parametros);   
    hideWaitLayer();
}

function generaArchivoExcel(obj, result) 
{
  // TODO: Dejar el mensaje de espera hasta que se despliegue el guardar como
  var objResult = JSON.parse(result);
  if(objResult.RESULTADO == 0) { // Ejecucion OK
    obj.id = "emision.getFunRepDistribucion";
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
    var link = GI("linkReporte");
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  } else if(objResult.RESULTADO == 1)
  { // Error
      alert("Error en la generación del Reporte de Distribución");
  } else if(objResult.RESULTADO == 2)
  { // Error
      alert("No Existe valor de la UDI para la fecha de pago");
  } else { // Error ORACLE
      alert("Ocurrió un error inesperado");
  }
  
  //hideWaitLayer();
}


// tabla emisiones----------


function tablaEmisiones(vbly)
{

   if(vbly=="visible")
   {// aparece tabla emisiones
      GI("hdEmisiones").style.visibility = "visible";
      GI("tbEmisiones").style.visibility = "visible";
   
      GI('paramCupon').value= pkInfo3.ecedIdPeriodo;
   
      GI("cmdAceptar").click();
   }
   else
   {// desaparece tabla emisiones
      GI("hdEmisiones").style.visibility = "hidden";
      GI("tbEmisiones").style.visibility = "hidden";
   }

}


// funcionalidad parametros

function consultaRepDist(btnAceptar)
{
  if(fvCat.checkForm())
  {
    tablaEmisiones('hidden');
    consultar(btnAceptar, frmDatos, false);
  }
}

function cargaEmisiones(textRC,comboFid)
{
  if(textRC.value!='')
  {
      var objEmision = JSON.parse("{}");
      objEmision.id="conETCmbEmiAsgPrgFid";
      objEmision.NumEmisor = numIdRC(textRC.value);
      objEmision.NumFideicomiso = comboFid.selectedIndex>0?comboFid.value:0;
      
      var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objEmision);
      makeAjaxRequest(url,"HTML",cargaEmisionesRes,null);
  }
  else
  {
    GI('dvEmisiones').innerHTML="";
  }
}


function cargaEmisionesRes(obj,result)
{
  var res = JSON.parse(result);
  var txtEmisiones = "";
  for(i=0;i<res.length;i++)
  {
    txtEmisiones += res[i].eemiCvePizarra;
    txtEmisiones += " - "+res[i].eemiNumSerie+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  }
  GI('dvEmisiones').innerHTML = txtEmisiones;
}