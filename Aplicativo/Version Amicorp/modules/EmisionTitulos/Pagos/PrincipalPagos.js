
hideWaitLayer(); 
var cmbLoadParam504 = JSON.parse("{\"Indice\":504,\"orderSecuencial\":\"S\"}");

// Periodicidad Pagos--------
pkInfo2 = null;

var arrTblDat = new Array();
arrTblDat[0] = "eperIdSecuencial,50px";
arrTblDat[1] = "eperPeriodicidad,100px";
arrTblDat[2] = "eperFecInicio,100px";
arrTblDat[3] = "eperFecVencimiento,100px";
arrTblDat[4] = "eperComentario,200px";

function funConsultar(objBtn)
{
  consultar(objBtn, GI('frmDatos'), false);
  GI('cmdBaja').style.visibility = 'hidden';
  pkInfo2 = null;
  consultaPeriodosPago();
}

function clickTablaPagos(pk)
{
  GI("cmdBaja").style.visibility = "visible";
  pkInfo2 = pk;
}

function ejecutaOperacionPeriodoPago(tipoOpt)
{
  var objParametros = JSON.parse("{}");
  objParametros.id = "emision.ejeFunMantPeriodoPago";
  eval("objParametros.Programa = " + pkInfo.eemiIdPrograma);
  eval("objParametros.Emision = " + pkInfo.eemiIdEmision);
  eval("objParametros.Fideicomiso = " + pkInfo.eemiIdFideicomiso);

  if(tipoOpt== "ALTA")
  {
    vFecIni = GI("paramFecIni").value;
    vFecFin = GI("paramFecFin").value;
    vPeriodo = GI("paramPeriodoPago").value;
    vComentario =  GI("paramComentario").value;
  
    if(vFecIni==""||vFecFin==""||GI("paramPeriodoPago").selectedIndex<1)
    {
    alert("Seleccione valor para campos obligatorios (Fecha Inicio, Fecha Fin,Periodo)");
    return;
    }
    objParametros.IdSecuencial = 0;
    objParametros.FecIni = vFecIni;
    objParametros.FecFin = vFecFin;
    objParametros.Periodo = vPeriodo;
    objParametros.Comentario = vComentario;
  }
  else if(tipoOpt== "BAJA")
  {
    if(pkInfo2==null)
    {
      alert("¡Debe seleccionar algún registro!");
      return;
    }
    
    objParametros.IdSecuencial =  pkInfo2.eperIdSecuencial;
    objParametros.FecIni =  pkInfo2.eperFecInicio;
    objParametros.FecFin =  pkInfo2.eperFecVencimiento;
    objParametros.Periodo =  pkInfo2.eperPeriodicidad;
    objParametros.Comentario =  pkInfo2.eperComentario;
  }
  
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
   
  showWaitLayer();          
  makeAjaxRequest(url, "HTML", ejecutaOperacionPeriodoPagoRes, null);
}

function ejecutaOperacionPeriodoPagoRes(obj, result)
{
  hideWaitLayer();
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO)) {
    if(objResult.RESULTADO == 0) 
    {
        alert("¡Operación Exitosa!");
        GI("cmdConsultar").click();
    }
    else
      alert("Proceso con errores, verifique");
  }
  else
    alert("Proceso con errores, verifique");

}
//----------------------------------

var fecha = new Date();

function despliegaPantallaPrincipalPagos()
{
  GI("dvTitulo").innerHTML = "Pagos";
  GI("txtPrograma").id = "eepaIdPrograma";
  GI("txtFideicomiso").id = "eepaIdFideicomiso";
  GI("txtEmision").id = "eepaIdEmision";
  cat9.getCatalogo().eepaIdPrograma = pkInfo.eemiIdPrograma;
  cat9.getCatalogo().eepaIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat9.getCatalogo().eepaIdEmision = pkInfo.eemiIdEmision;
  Calendar.setup({
    inputField     :    "eepaFecPago",   // id of the input field
    button         :    "eepaFecPago",
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
  

//calendarios------------
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
});

cal.manageFields("paramFecIni","paramFecIni", "%d/%m/%Y");
cal.manageFields("paramFecFin","paramFecFin", "%d/%m/%Y");
cal.manageFields("eepaFecPago","eepaFecPago", "%d/%m/%Y");
//----------------------------

  GI("paramPrograma").value = pkInfo.eemiIdPrograma;
  GI("paramFideicomiso").value = pkInfo.eemiIdFideicomiso;
  GI("paramEmision").value = pkInfo.eemiIdEmision;

  initForms();
  if(modo == OPER_CONSULTAR){
    deshabilitaObjetos(GI("frmDatos"));
    GI("cmdCancelar").value = "Regresar";
    muestraObj("cmdCancelar");
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

var once = true;

function asignaValues2ObjHTMLPagos()
{
   if(once)
   {
      once=false;
        if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
          //cat9.setOnUpdate(formsLoaded);
          cat9.buscaCatalogoPK(false);
          formsLoaded();
        }else
        {
          formsLoaded();
        }
        
        dvOperacion('frmDatos');
        
        GI("cmdConsultar").click();
        consultaFechasEmision();
        
   }
}


function ejecutaOperacionPagos()
{
  if(fvCat.checkForm()){
    //cat9.setOnUpdate(operacionCatalogo);
    
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
        cat9.altaCatalogo();
         if(!bPeriodosPago)// no hay periodos de pago definidos
          {
            alert("¡Defina Periodicidad de Pago!");
            hideWaitLayer();
            GI('cmdAceptar').style.visibility= "hidden";
            deshabilitaCampos('eepaFecPago,eepaPeriodoPago,eepaDiasPerPagoChk,eepaNumDiaPerPago,eepaDiasCalendChk,eepaRecorre,eepaAjustaPeriodoChk,eepaDiaFijoChk,eepaNumDiaFijo,eepaCalculaSigPerChk,eepaDiasAntesCalc,eepaAjustaPeriodoSigChk,eepaDiasInhCalcChk,eepaDiasInhPagoChk,eepaDiasTranscurridosChk,eepaDiasEfectivosChk');
          }
          else
            operacionCatalogo();
      break;
      case OPER_MODIFICAR:
        cat9.modificaCatalogo();
        operacionCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  //alert("Operacion realizada exitosamente!");
  cargaDetalleParametrosCalculo(2);
  hideWaitLayer();
}

//Funciones para el uso de las Fechas
function setFechaCal()
{}

function isValidDate(date)
{
  return false;
}

// dias habiles e inhabiles

function accionChkDias(objChk)
{
  if(objChk.id=="eepaDiasInhCalcChk")
  {
      habilitaCampos('eepaDiasTranscurridosChk,eepaDiasEfectivosChk');
      GI('eepaDiasInhPagoChk').checked = false;
  
  }
  else if(objChk.id=="eepaDiasInhPagoChk")
  {
     deshabilitaCampos('eepaDiasTranscurridosChk,eepaDiasEfectivosChk');
     
     GI('eepaDiasTranscurridosChk').checked = false;
     GI('eepaDiasEfectivosChk').checked = false;
     GI('eepaDiasInhCalcChk').checked = false;
  
  }
  else if(objChk.id=="eepaDiaFijoChk")
  {
    if(objChk.checked)
      habilitaCampos('eepaNumDiaFijo');
    else
      deshabilitaCampos('eepaNumDiaFijo');
      
  }
}
// Fechas Emisión
function consultaFechasEmision()
{
  var objFecEmision = JSON.parse("{}");
  objFecEmision.id = "conETPriDatGen";
  objFecEmision.NumPrograma = GI('txtPrograma').value;
  objFecEmision.NumFiso = GI('txtFideicomiso').value;
  objFecEmision.NumEmision = GI('txtEmision').value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objFecEmision);
  makeAjaxRequest(url,"html",consultaFechasEmisionRes,null);
}

function consultaFechasEmisionRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(res.length>0)
  {
     GI('paramFecIni').value = res[0].eemiFecInicio;
     GI('paramFecFin').value = res[0].eemiFecVencimiento;
  }
}


// Consulta Periodos Pago
var bPeriodosPago = false; // no hay periodos definidos

function consultaPeriodosPago()
{
  var objPerEmision = JSON.parse("{}");
  objPerEmision.id = "emision.conETPeriodoPagos";
  objPerEmision.Programa = GI('txtPrograma').value;
  objPerEmision.Fideicomiso = GI('txtFideicomiso').value;
  objPerEmision.Emision = GI('txtEmision').value;
  objPerEmision.order = "s";
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objPerEmision);
  makeAjaxRequest(url,"html",consultaPeriodosPagoRes,null);
}

function consultaPeriodosPagoRes(obj,result)
{
  var res = JSON.parse(result);
  if(res.length>0)
    bPeriodosPago = true; //  hay periodos definidos
  else
    bPeriodosPago = false; // no hay periodos definidos
}