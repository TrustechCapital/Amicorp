var fvCat = new FormValidator();
var strIdPK = "eautIdAutoridad";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
var resultado;


var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");
var cmbEmision = JSON.parse("{\"NumEmisor\":\"-1\",\"order\":\"s\"}");

//------ FIRMAS ---------------
var paramFirmaUsuario = JSON.parse("{\"Status\":\"ACTIVO\",\"NumPuesto\":1,\"order\":\"s\"}");
//---------------------------------


/*var arrTblDat = new Array();

arrTblDat[0] = "ecalIdPrograma,65px";
arrTblDat[1] = "eemiNomEmisor,250px";
arrTblDat[2] = "ecalIdEmision,90px";
arrTblDat[3] = "eemiIdFideicomiso,90px";
arrTblDat[4] = "eemiCvePizarra,90px";
arrTblDat[5] = "eemiNumSerie,90px";
arrTblDat[6] = "ecalTipoCalculo,90px";
arrTblDat[7] = "ecalFecPago,90px";

//consulta automatica de la tabla

var botonTemp = GI("cmdConsultar");
SA(botonTemp,"ref","conETPriDatGen");
SA(botonTemp,"fun","loadTableElement");
SA(botonTemp,"tabla","tblReg");
consultar(botonTemp, GI("frmDatos"), false);*/

var fechas = new Date();
var usarSetValuesFormObject = true;
var comboDestino = null;

var objEncabezados = null;
var numTab = null;
var valorCmbSeleccionado = 0;


var arrTblDat = new Array();
arrTblDat[0] = "idRc,50px";
arrTblDat[1] = "eproNomPrograma,150px";
arrTblDat[2] = "eemiCvePizarra,100px";
arrTblDat[3] = "eemiNumSerie,100px";
arrTblDat[4] = "ctoNomContrato,150px";
arrTblDat[5] = "eproInstrumento,150px";
arrTblDat[6] = "eemiNomEmisor,250px";
arrTblDat[7] = "eemiFecInicio,70px";
arrTblDat[8] = "parametros,80px";
//arrTblDat[8] = "eemiStEmision,80px";

Calendar.setup({
  inputField     :    "paramFechaInicio",   // id of the input field
  button         :    "paramFechaInicio",
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


fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
}

function clickTabla(pk){
  pkInfo = pk;
}
var pkInfo2 = null;
function clickTabla2(pk){
  GI("ecalIdSecCalc").value = pk.CUPON;
  pkInfo2 = pk;
}

function ejecutaFuncion(obj, result) {
  if(pkInfo != null) 
  {
   if(pkInfo.parametros=="SIN CAPTURAR")
   {
      alert("¡Capture Parámetros de Cálculo!");
      return;
   }
      
      
  
    showWaitLayer();
    var objParametros = JSON.parse("{}");
    objParametros.id = "emision.ejeFunDetCalendario";
    eval("objParametros.Programa = " + pkInfo.eemiIdPrograma);
    eval("objParametros.Emision = " + pkInfo.eemiIdEmision);
    eval("objParametros.Fideicomiso = " + pkInfo.eemiIdFideicomiso);
    eval("objParametros.TipoCalculo = " + pkInfo.eereTipoCalculo);
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    //alert(url);
    makeAjaxRequest(url, "HTML", cargaMantenimientoCalendarioPagos, null);
  }
}



function cargaMantenimientoCalendarioPagos(obj, result){
  hideWaitLayer();
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO)) {
    if(objResult.RESULTADO == 0) {
      
      /*pkInfo = JSON.parse("{}");
      pkInfo.ecalIdPrograma = 1;
      pkInfo.eemiIdFideicomiso = 567;
      pkInfo.ecalIdEmision = 1;
      pkInfo.ecalTipoCalculo = 1;*/
      
      if(isDefinedAndNotNull(pkInfo)){
        showWaitLayer();
        var urlCliente = "modules/EmisionTitulos/CalendarioPagos/MantenimientoCalendarioPagos.do";
        makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCalendarioPagos, null);
      }
    }
    else
      alert("Proceso con errores, verifique");
  }
  else
    alert("Proceso con errores, verifique");
}
var vgprograma,vgfideicomiso,vgemision;
function despliegaPantallaMantenimientoCalendarioPagos(obj, result) {
  GI("dvPantalla").innerHTML = result;
  /*
  deshabilitaObjetos(GI("frmDatos"));
  habilitaPK("txtElaboro,txtVOBO".split(","));
  */
  vgprograma=pkInfo.eemiIdPrograma;
  vgfideicomiso=pkInfo.eemiIdFideicomiso;
  vgemision=pkInfo.eemiIdEmision;
  
  var objCalendarioPagosParam = JSON.parse("{}");
  objCalendarioPagosParam.id = "emision.conETSecCalPag";
  objCalendarioPagosParam.Programa = pkInfo.eemiIdPrograma;
  objCalendarioPagosParam.Fideicomiso = pkInfo.eemiIdFideicomiso;
  objCalendarioPagosParam.Emision = pkInfo.eemiIdEmision;
  objCalendarioPagosParam.TipoCalculo = pkInfo.eereTipoCalculo;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCalendarioPagosParam);
  makeAjaxRequest(url, "HTML", asignaDatosCalendarioPagos, null);
}

function asignaDatosCalendarioPagos(obj, result){
  resultado = JSON.parse(result)[0];
  //resultado = JSON.parse("[{\"ecalIdPrograma\":1,\"eemiNomEmisor\":\"GOBIERNO FEDERAL S.H.C.P.\",\"ecalIdEmision\":1,\"ctoNumContrato\":567,\"eemiCvePizarra\":\"PIZARRA\",\"eemiNumSerie\":\"SERIE\"}]")[0];
  //resultado.eepcIdTipoCalculo = 1;
  //***************************  
  setValuesFormObject(resultado);
  deshabilitaCampos("idRc,ecalIdPrograma,eproNomPrograma,ctoNumContrato,ctoNomContrato,ecalIdEmision,eemiCvePizarra,eemiNumSerie,eemiNomEmisor,ecalIdSecCalc");
  
  /*Asigna Campos*/
  GI('ecalIdPrograma').value = pkInfo.eemiIdPrograma; 
  GI('idRC').value = pkInfo.idRc; 
  
  
  if(pkInfo.eemiIdFideicomiso==0)
    {
      GI('ctoNumContrato').value = pkInfo.eemiIdFideicomiso; 
      GI("ctoNumContrato").style.visibility = "hidden";
      GI("dvFid").innerHTML = "";
      
      GI('ctoNomContrato').value =  "";
    }
    else
    {
      GI('ctoNumContrato').value = pkInfo.eemiIdFideicomiso; 
      GI('ctoNomContrato').value = pkInfo.ctoNomContrato; 
   }
  
  
  GI('eproNomPrograma').value = pkInfo.eproNomPrograma; 
  GI('eemiCvePizarra').value = pkInfo.eemiCvePizarra; 
  GI('eemiNumSerie').value = pkInfo.eemiNumSerie; 
  GI('ecalIdEmision').value = pkInfo.eemiIdEmision; 
  GI('ecalIdEmision').value = pkInfo.eemiIdEmision; 
  GI('eepcIdTipoCalculo').value = pkInfo.eereTipoCalculo; 
  GI('eemiNomEmisor').value = pkInfo.eemiNomEmisor; 

  var objCalendarioPagosParam = JSON.parse("{}");
  objCalendarioPagosParam.id = "emision.conETArcPla";
  objCalendarioPagosParam.Archivo = "CALENDARIOPAGOS";
  objCalendarioPagosParam.order = "S";
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCalendarioPagosParam);
  makeAjaxRequest(url, "HTML", asignaDatosAdicionalCalendarioPagos, null);
  
  hideWaitLayer();
}

function asignaDatosAdicionalCalendarioPagos(obj, result){
  try{
    //alert("asignaDatosAdicionalCalendarioPagos: " + result);
    resultado = JSON.parse(result);
    if(resultado.length>0)
    {
          var cabeceras = resultado[0].arpDescripcion;
          var propiedades = resultado[0].arpDescripcion;
          //alert("2");
          while(propiedades.indexOf(" ")!= -1)
            propiedades = propiedades.replace(" ","");
          while(propiedades.indexOf(";")!= -1)
            propiedades = propiedades.replace(";",",");
          
          var ancho = 23;
          
          for(var i = 0; i < propiedades.split(",").length; i++)
            arrTblDat[i] = propiedades.split(",")[i] + ","+cabeceras.split(";")[i].length*15+"px";
          //alert("4");
          var jsonArray = new Array();
          var propiedad;
          var valor;
          for(var i = 1; i < resultado.length; i++){
            jsonArray[i-1] = new Object();
            for(var j = 0; j < propiedades.split(",").length; j++){
              propiedad = propiedades.split(",")[j];
              valor = resultado[i].arpDescripcion.split(";")[j];
              //jsonArray[i-1].propiedad = valor;
              if(valor == null)
                valor = "N/A";
              //alert("propiedad: "+propiedad+"    valor: "+valor);
              
              eval("jsonArray[" + (i-1) + "]." + propiedad  + " = \"" + valor + "\"");
              //alert(eval("jsonArray[" + (i-1) + "]." + propiedad));
            }
          }
          //alert("5");
          //****************** inicio carga cabeceras
          var tbody = GI("tblCabeceras").lastChild;
          var fila = createElement("tr", tbody);
          fila.className = "cabeceras";
          for(var i = -1; i < cabeceras.split(";").length; i++) {
            if(i == -1) {
              var colRadio = createElement("td", fila);
              colRadio.width = 23;
              continue;
            }
            var item = cabeceras.split(";")[i];
            var col = createElement("td", fila); 
            //if(fieldInfo.length == 3)
              //SA(col,"align","right");
            
            col.width = item.length*15;
            ancho = ancho + item.length*15;
            col.innerHTML = item;
            //if(fieldWidth != "")      
          }
          
          GI("tblCabeceras").style.width = ancho;
          GI("tblReg").style.width = ancho;
          //****************** fin carga cabeceras
          loadTable(GI("tblReg"), jsonArray, arrTblDat, propiedades, clickTabla2, true);
          
      }
      hideWaitLayer();
  }catch(e){
    alert("error catch: "+e.message);
  }
  
initForms();

}

//**************************************************************
function generaDatosExcel() 
{
    var parametros = JSON.parse("{}");
    parametros.template = "/xml/Reportes/EmisionTitulos/ReporteDistribucion/ReporteDistribucion.xsl";
    parametros.nombreReporte = "ReporteDistribucion";
    parametros.extencionReporte = ".xls";
    //parametros.XmlProcessor = "emision.CalendarioPagosImpl";
    
   
      parametros.id = "emision.repFunRepDistribucion" ;
      parametros.Programa = pkInfo.eemiIdPrograma;
      parametros.Fideicomiso = pkInfo.eemiIdFideicomiso;
      parametros.Emision = pkInfo.eemiIdEmision;
      parametros.Secuencial = pkInfo.eereTipoCalculo;
      var url = ctxRoot + "/execRefReporte.do?json=" + JSON.stringify(parametros);
   
   // temporal---
      generaArchivoExcel(parametros,"{\"RESULTADO\":0}");
      return;
   
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
  } else if(objResult.RESULTADO == 1){ // Error
  } else { // Error ORACLE
  }
  
  //hideWaitLayer();
}


function generaCalendarioExcel()
{
    var parametros = JSON.parse("{}");
    parametros.urlReporte = "/jsp/Reportes/EmisionTitulos/CalendarioPagos.jsp";
    
   parametros.id = "emision.conETArcPla";
   //parametros.Archivo = "CALENARIOPAGOS";
   //parametros.order = "s";
   parametros.sendToJSP = "true";
   
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametros);
    var link = GI("linkReporte");
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
}

//****************************************************************************************************************


/*
function asignaDatosTasasCalendarioPagos(obj, result){
  //***************************
  alert("asignaDatosTasasCalendarioPagos: " + result);
  //***************************
  resultado = JSON.parse(result);
  GI("txtNoTasas").value = resultado.length;
  for(var i = 0; i < resultado.length; i++){
    eval("GI(\"txtTasa" + (i + 1) + "\").value = resultado[i].eintCveInstrumento");
    eval("GI(\"txtPlazo" + (i + 1) + "\").value = resultado[i].eintPlazo");
    eval("GI(\"txtPorcentaje" + (i + 1) + "\").value = resultado[i].eintTasaCalculo");
  }
  hideWaitLayer();
}

function ejecutaOperacionCalendarioPagos(opc){
  switch(opc){
    case 1:
    break;
    case 2:
    break;
    case 3:
    break;
  }
}
*/

///////////////////////////////////////////////////////////////////////////
//Funciones para el uso de las Fechas
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


////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Fideicomisos luego de haber elegido alguna opción del combo Programa
function cargaComboFideicomiso(objComboOrigen,objComboDestino,booleano,ValorCmbSeleccionado)
{
  
  if(objComboOrigen.name == "numEmision")
  {
    var objEmision = JSON.parse("{}");
    objEmision.id = "conETCmbEmiAsgPrgFid";
    objEmision.NumPrograma =  objComboOrigen.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmision);
    makeAjaxRequest(url, "HTML", cargaComboFideicomisoRes, null);
  }
  else //mantenimiento
  {
  if(objComboOrigen.name == "eemiIdPrograma")
    borraCombos("eemiIdFideicomiso,eemiNomEmisor");
  else if (objComboOrigen.name == "eemiIdFideicomiso")
    borraCombos("eemiNomEmisor");
  
  usarSetValuesFormObject = booleano;
  valorCmbSeleccionado = ValorCmbSeleccionado;
  paramCmbProg = JSON.parse("{\"NumPrograma\": " + objComboOrigen.value + ",\"order\":\"s\",\"NumFideicomiso\": " + objComboOrigen.value + "}");
  
  comboDestino = objComboDestino;
  SA(objComboDestino,"next","asignaFideicomiso");
  loadElement(objComboDestino);
  }
}

function cargaComboFideicomisoRes(obj,result)
{
  resultado = JSON.parse(result)[0];
  
  GI("paramNumPrograma").value = resultado.eemiIdPrograma;
  GI("paramNumFiso").value = resultado.eemiIdFideicomiso;
  
}

function asignaFideicomiso(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(cat.getCatalogo());
    if(comboDestino.name == "eemiIdFideicomiso")
      cargaComboFideicomiso(GI("eemiIdFideicomiso"),GI("eemiNomEmisor"),true,0);
  }
  else
    comboDestino.selectedIndex=0;
  
  if(modo==OPER_ALTA && numTab==FECHAS_EMISION)
  {
    comboDestino.value=valorCmbSeleccionado;
    if(comboDestino.name == "eemiIdFideicomiso")
      cargaComboFideicomiso(GI("eemiIdFideicomiso"),GI("eemiNomEmisor"),false,objEncabezados.Emisor);
  }
  
  formsLoaded();
}

function ejecutaOperacionCalendarioPagos1(){
    var objParametros = JSON.parse("{}");
            objParametros.id = "emision.ejeFunDetInteres";
            eval("objParametros.Programa = " + pkInfo.eemiIdPrograma);
            eval("objParametros.Emision = " + pkInfo.eemiIdEmision);
            eval("objParametros.Fideicomiso = " + pkInfo.eemiIdFideicomiso);
            var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
            makeAjaxRequest(url, "HTML", validaFuncionInteres, null);
            //alert(url);
            
            //eemiIdPrograma,eemiIdFideicomiso,eemiIdEmision
}

function validaFuncionInteres(obj, result) {
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO)) {
    if(objResult.RESULTADO == 0) {
      alert("Proceso concluido satisfactoriamente");
      ejecutaFuncion();
    }
  }
  hideWaitLayer();
}

function ejecutaOperacionCalculoInteres(opc){
  switch(opc){
    case 3: if(fvCat.checkForm())
    {
          if(GI("ecalIdSecCalc").value=="1")
          {
            alert("Reporte no disponible para el primer Periodo");
            return;
          }
          if(GI("ecalIdSecCalc").value=="")
          {
            alert("Seleccione Periodo");
            return;
          }
    
              showWaitLayer();
              var objParametros = JSON.parse("{}");
              objParametros.id = "emision.ejeFunImpresionAvisos";
              eval("objParametros.Programa = " + eval(vgprograma));
              eval("objParametros.Emision = " + eval(vgemision));
              eval("objParametros.Fideicomiso = " + eval(vgfideicomiso));
              eval("objParametros.Periodo = "+Number(GI("ecalIdSecCalc").value) );
              eval("objParametros.SecInter = "+Number(pkInfo2.SEC_INTER) );
              
              nomFirma = GI("paramFirma1").value!=-1?GI("paramFirma1").value:"";
              nomElaboro = GI("paramFirma2").value!=-1?GI("paramFirma2").value:"";
              objParametros.Elaboro = nomElaboro;
              objParametros.Firma = nomFirma;
              
              //eval("objParametros.NameReporte = ''");
              objParametros.takeParameters = "SI";
              var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
              makeAjaxRequest(url, "HTML", validaImprimeReporte, objParametros);
            }
            break;
  }
}

function validaImprimeReporte(obj, result) {
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO))
  {
   
    if(objResult.RESULTADO=='AUTORIDAD')
   {
      hideWaitLayer();
      alert("Defina Autoridad")
      return;
   }
    
    if(objResult.RESULTADO=='-1')
   {
      hideWaitLayer();
      alert("Ocurrió un error inesperado")
      return;
   }
    
    
    arrReportes = objResult.RESULTADO.split(";");
    
    if(arrReportes.length == 1) {
      obj.id = "getDatCalculoIntereses";
      obj.NameReporte = arrReportes[0];
      obj.template = "/xml/Reportes/EmisionTitulos/CalculoIntereses/" + arrReportes[0] + ".xsl";
      obj.nombreReporte = arrReportes[0];
      var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
      var link = GI("linkReporte");
      link.href=url;
      link.click();
      document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    }
    else if(arrReportes.length == 2){
      alert("Existen 2 reportes disponibles, seleccione el que desee imprimir");
      objAuxiliar = obj;
      GI("rdRep1").style.visibility = "visible";
      GI("rdRep2").style.visibility = "visible";
      asignaEtiqueta("nomRep1",arrReportes[0]);
      asignaEtiqueta("nomRep2",arrReportes[1]);
      hideWaitLayer();
    }
  }
  else {
    alert("ocurrió un error o No hay reportes para imprimir");
    hideWaitLayer();
  }
}

function validaImprimeReporte2(objRadio) {
  showWaitLayer();
  objAuxiliar.id = "getDatCalculoIntereses";
  
  if(objRadio.id == "rdRep1") {
    GI("rdRep1").style.visibility = "hidden";
    asignaEtiqueta("nomRep1","");
    GI("rdRep1").checked = false;
    
    objAuxiliar.template = "/xml/Reportes/EmisionTitulos/CalculoIntereses/" + arrReportes[0] + ".xsl";
    objAuxiliar.nombreReporte = arrReportes[0];
    objAuxiliar.NameReporte = arrReportes[0];
    
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(objAuxiliar);
    var link = GI("linkReporte");
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
  else if(objRadio.id == "rdRep2") {
    GI("rdRep2").style.visibility = "hidden";
    asignaEtiqueta("nomRep2","");
    GI("rdRep2").checked = false;
    
    objAuxiliar.template = "/xml/Reportes/EmisionTitulos/CalculoIntereses/" + arrReportes[1] + ".xsl";
    objAuxiliar.nombreReporte = arrReportes[1];
    objAuxiliar.NameReporte = arrReportes[1];
    
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(objAuxiliar);
    var link = GI("linkReporte");
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
  else
    hideWaitLayer();
}

// combos dependen emisor-------------------

function cargaProgFid(comboEmisor,comboPrograma,comboFideicomiso,cmbObjEmision)
{
  cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
   cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"s\"}");
   
   cmbEmision = JSON.parse("{\"NumEmisor\":\""+numIdRC(comboEmisor.value)+"\",\"order\":\"s\"}");
    
    loadElement(cmbObjEmision);
    loadElement(comboPrograma);
    loadElement(comboFideicomiso);
   
    setTimeout("cargaProgFidValores('"+comboPrograma.id+"','"+comboFideicomiso.id+"')",2000); 
}

function cargaProgFidValores(idCmbPrograma,idCmbFideicomiso)
{

    if(GI(idCmbPrograma).options.length==1)
      {
        GI(idCmbPrograma).selectedIndex=0;
        //habilitaCampos(idCmbPrograma);
      }
     else
     {
      GI(idCmbPrograma).selectedIndex=1;
      //deshabilitaCampos(idCmbPrograma);
    }
    
    if(GI(idCmbFideicomiso).options.length==1)
      {
        
        GI(idCmbFideicomiso).selectedIndex=0;
        //habilitaCampos(idCmbFideicomiso);
      }
     else
     {
        GI(idCmbFideicomiso).selectedIndex=1;
        //deshabilitaCampos(idCmbFideicomiso);
    }   
}