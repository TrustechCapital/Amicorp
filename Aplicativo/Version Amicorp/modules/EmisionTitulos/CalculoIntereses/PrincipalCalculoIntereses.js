var fvCat = new FormValidator();
var strIdPK = "eautIdAutoridad";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

//------ FIRMAS ---------------
var paramFirmaUsuario = JSON.parse("{\"Status\":\"ACTIVO\",\"NumPuesto\":1,\"order\":\"s\"}");
//---------------------------------

var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "fintIdPrograma,65px";
arrTblDat[1] = "fintNomEmisor,250px";
arrTblDat[2] = "fintIdEmision,90px";
arrTblDat[3] = "fintIdFideicomiso,90px";
arrTblDat[4] = "fintCvePizarra,90px";
arrTblDat[5] = "fintNumSerie,90px";
arrTblDat[6] = "fintIdTipoCalculo,90px";
arrTblDat[7] = "fintIdFecCalcPer,90px";
arrTblDat[8] = "fintNomFormula,90px";

/*
var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "fintIdPrograma,65px";
//arrTblDat[1] = "eemiNomEmisor,250px";
arrTblDat[1] = "fintIdEmision,90px";
arrTblDat[2] = "fintIdFideicomiso,90px";
arrTblDat[3] = "fintCvePizarra,90px";
arrTblDat[4] = "fintNumSerie,90px";
arrTblDat[5] = "fintTipoCalculo,90px";
arrTblDat[6] = "fintIdFecCalcPer,90px";
arrTblDat[7] = "fintNomFormula,90px";
*/

arrTblDatMnt = new Array();
arrTblDatMnt[0] = "eintIdSecInstrumento,70px,right";
arrTblDatMnt[1] = "eintTasaCalculo,150px,right";
arrTblDatMnt[2] = "eintPlazo,150px,right";
arrTblDatMnt[3] = "eintTasaEquivalente,150px,right";

var arrReportes;
var objAuxiliar;

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

funcionConsulta(validaFuncionConsulta);

function funcionConsulta(funcionMantenimiento) {
  showWaitLayer();
  var objParametros = JSON.parse("{}");
  objParametros.id = "emision.ejeFunGeneraInteres";
  
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(url, "HTML", funcionMantenimiento, null);
  //validaFuncionConsulta(objParametros, "{\"RESULTADO\": 0 }");
}

function validaFuncionConsulta(obj, result) {
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO))
    consultar(GI("cmdAceptar"), GI("frmDatos"), false); //consulta automatica de la tabla
  
  hideWaitLayer();
}

function clickTabla(pk){
  pkInfo = pk;
}

function cargaMantenimientoCalculoIntereses(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/CalculoIntereses/MantenimientoCalculoIntereses.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCalculoIntereses, null);
  }
}
//try{
function despliegaPantallaMantenimientoCalculoIntereses(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaObjetos(GI("frmDatos"));
  habilitaPK("txtElaboro,txtVOBO".split(","));
  
  RA(GI("rdRep1"), "disabled");
  RA(GI("rdRep2"), "disabled");
  
  GI("paramPrograma").value = pkInfo.fintIdPrograma;
  GI("fintNomPrograma").value = pkInfo.fintNomPrograma;
  GI("paramFideicomiso").value = pkInfo.fintIdFideicomiso;
  GI("fintNomContrato").value = pkInfo.fintNomContrato;
  GI("paramEmision").value = pkInfo.fintIdEmision;
  GI("fintCvePizarra").value = pkInfo.fintCvePizarra;
  GI("fintNumSerie").value = pkInfo.fintNumSerie;
  GI("fintNomEmisor").value = pkInfo.fintNomEmisor;
  GI("fintImpValNomTot").value = pkInfo.fintImpValNomTot;
  GI("fintValnomTitulos").value = pkInfo.fintValnomTitulos;
  GI("fintNumTitulos").value = pkInfo.fintNumTitulos;
  GI("fintIdTipoCalculo").value = pkInfo.fintIdTipoCalculo;
  GI("fintPorcTasaFija").value = pkInfo.fintPorcTasaFija;
  //GI("ecalPlazo").value = pkInfo.ecalPlazo;
  GI("fintTasaPromedio").value = pkInfo.fintTasaPromedio;
  GI("fintTasa").value = pkInfo.fintTasa;
  GI("fintIdFormula").value = pkInfo.fintIdFormula;
  GI("fintNomFormula").value = pkInfo.fintNomFormula;
  GI("fintIdCalcSecuencial").value = pkInfo.fintIdCalcSecuencial;
  GI("fintInicioPeriodo").value = pkInfo.fintInicioPeriodo;
  GI("fintFinDePeriodo").value = pkInfo.fintFinDePeriodo;
  GI("fintPeriodicidadDias").value = pkInfo.fintPeriodicidadDias;
  GI("fintFechaDePago").value = pkInfo.fintFechaDePago;
  GI("fintTasaBase").value = pkInfo.fintTasaBase;
  GI("fintSobretasa").value = pkInfo.fintSobretasa;
  GI("fintTasaBruta").value = pkInfo.fintTasaBruta;
  GI("fintIsr").value = pkInfo.fintIsr;
  GI("fintTasaNeta").value = pkInfo.fintTasaNeta;
  GI("fintDolarInicio").value = pkInfo.fintDolarInicio;
  GI("fintDolarFin").value = pkInfo.fintDolarFin;
  GI("fintTasaNeta").value = pkInfo.fintTasaNeta;
  GI("fintIsr2").value = pkInfo.fintIsr2;
  GI("fintTasaBruta").value = pkInfo.fintTasaBruta;
  GI("fintTasaAbsoluta").value = pkInfo.fintTasaAbsoluta;
  GI("fintTasaEquibalente").value = pkInfo.fintTasaEquibalente;
  GI("fintFechaCalculo").value = pkInfo.fintFechaCalculo;
  GI("fintInteresesPer").value = pkInfo.fintInteresesPer;
  GI("fintInteresesCap").value = pkInfo.fintInteresesCap;
  GI("fintInteresesNetos").value = pkInfo.fintImpAmortizacion;
  GI("fintImpAmortizacion").value = pkInfo.fintImpAmortizacion;
  GI("fintAmortExt").value = pkInfo.fintAmortExt;
  GI("fintElaboro").value = pkInfo.fintElaboro;
  GI("fintFirmaVobo").value = pkInfo.fintFirmaVobo;
  
  consultar(GI("cmdAceptarAtm"), GI("frmDatos"), false); //consulta automatica de la tabla (en el mantenimiento)
  
  hideWaitLayer();
  
  //---- FIRMAS ------------
   loadElement(GI("paramFirma1"));
  habilitaCampos("paramFirma1,paramFirma2");
  //----------------------------
   
}

function colocaValoresFInteres(obj, result) {
  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO))
  {
    var objCalculoInteresParam = JSON.parse("{}");
    objCalculoInteresParam.id = "emision.conETPriInteres";
    objCalculoInteresParam.Programa = pkInfo.fintIdPrograma;
    objCalculoInteresParam.Fideicomiso = pkInfo.fintIdFideicomiso;
    objCalculoInteresParam.Emision = pkInfo.fintIdEmision;
    objCalculoInteresParam.Secuencial = pkInfo.fintIdCalcSecuencial;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objCalculoInteresParam);
    makeAjaxRequest(url, "HTML", validaColocaValoresFInteres, obj);
  }
}

function validaColocaValoresFInteres(obj, result) {
  var objResult = JSON.parse(result)[0];
  RF(GI("frmDatos"));
  
  GI("paramPrograma").value = objResult.fintIdPrograma;
  GI("fintNomPrograma").value = objResult.fintNomPrograma;
  GI("paramFideicomiso").value = objResult.fintIdFideicomiso;
  GI("fintNomContrato").value = objResult.fintNomContrato;
  GI("paramEmision").value = objResult.fintIdEmision;
  GI("fintCvePizarra").value = objResult.fintCvePizarra;
  GI("fintNumSerie").value = objResult.fintNumSerie;
  GI("fintNomEmisor").value = objResult.fintNomEmisor;
  GI("fintImpValNomTot").value = objResult.fintImpValNomTot;
  GI("fintValnomTitulos").value = objResult.fintValnomTitulos;
  GI("fintNumTitulos").value = objResult.fintNumTitulos;
  GI("fintIdTipoCalculo").value = objResult.fintIdTipoCalculo;
  GI("fintPorcTasaFija").value = objResult.fintPorcTasaFija;
  //GI("ecalPlazo").value = objResult.ecalPlazo;
  GI("fintTasaPromedio").value = objResult.fintTasaPromedio;
  GI("fintTasa").value = objResult.fintTasa;
  GI("fintIdFormula").value = objResult.fintIdFormula;
  GI("fintNomFormula").value = objResult.fintNomFormula;
  GI("fintIdCalcSecuencial").value = objResult.fintIdCalcSecuencial;
  GI("fintInicioPeriodo").value = objResult.fintInicioPeriodo;
  GI("fintFinDePeriodo").value = objResult.fintFinDePeriodo;
  GI("fintPeriodicidadDias").value = objResult.fintPeriodicidadDias;
  GI("fintFechaDePago").value = objResult.fintFechaDePago;
  GI("fintTasaBase").value = objResult.fintTasaBase;
  GI("fintSobretasa").value = objResult.fintSobretasa;
  GI("fintTasaBruta").value = objResult.fintTasaBruta;
  GI("fintIsr").value = objResult.fintIsr;
  GI("fintTasaNeta").value = objResult.fintTasaNeta;
  GI("fintDolarInicio").value = objResult.fintDolarInicio;
  GI("fintDolarFin").value = objResult.fintDolarFin;
  GI("fintTasaNeta").value = objResult.fintTasaNeta;
  GI("fintIsr2").value = objResult.fintIsr2;
  GI("fintTasaBruta").value = objResult.fintTasaBruta;
  GI("fintTasaAbsoluta").value = objResult.fintTasaAbsoluta;
  GI("fintTasaEquibalente").value = objResult.fintTasaEquibalente;
  GI("fintFechaCalculo").value = objResult.fintFechaCalculo;
  GI("fintInteresesPer").value = objResult.fintInteresesPer;
  GI("fintInteresesCap").value = objResult.fintInteresesCap;
  GI("fintInteresesNetos").value = objResult.fintImpAmortizacion;
  GI("fintImpAmortizacion").value = objResult.fintImpAmortizacion;
  GI("fintAmortExt").value = objResult.fintAmortExt;
  GI("fintElaboro").value = objResult.fintElaboro;
  GI("fintFirmaVobo").value = objResult.fintFirmaVobo;
  
  consultar(GI("cmdAceptarAtm"), GI("frmDatos"), false); //consulta automatica de la tabla (en el mantenimiento --REFRESCAR EL GRID--)
  alert("Proceso concluido satisfactoriamente");
  hideWaitLayer();
}


// SELECCION_FIRMA_EMISION(PROGRAMA NUMBER,EMISION NUMBER,FIDEICOMISO NUMBER,PERIODO NUMBER) RETURN VARCHAR2
/*}catch(e)
  alert(e.message);
}*/
function ejecutaOperacionCalculoInteres(opc){
  switch(opc){
    case 1: showWaitLayer();
            var objParametros = JSON.parse("{}");
            objParametros.id = "emision.ejeFunPrevio";
            eval("objParametros.TipoCalculo = " + pkInfo.fintIdTipoCalculo); //Verificar si es NUMBER o VARCHAR
            eval("objParametros.Programa = " + pkInfo.fintIdPrograma);
            eval("objParametros.Emision = " + pkInfo.fintIdEmision);
            eval("objParametros.Fideicomiso = " + pkInfo.fintIdFideicomiso);
            eval("objParametros.Periodo = " + pkInfo.fintIdCalcSecuencial);
            eval("objParametros.Numtasas = " + GI("txtNoTasas").value);
            eval("objParametros.Pje1 = " + GI("txtPorcentaje1").value);
            eval("objParametros.Pje2 = " + GI("txtPorcentaje2").value);
            eval("objParametros.Pje3 = " + GI("txtPorcentaje3").value);
            eval("objParametros.Pje4 = " + GI("txtPorcentaje4").value);
            eval("objParametros.Pje5 = " + GI("txtPorcentaje5").value);
            eval("objParametros.Formula = " + pkInfo.fintIdFormula);
            eval("objParametros.ValorNominal = " + pkInfo.fintImpValNomTot);
            eval("objParametros.Tasaabs = " + pkInfo.fintTasaAbsoluta);
            eval("objParametros.Numdias = " + pkInfo.fintPeriodicidadDias);
            eval("objParametros.Plazo1 = " + GI("txtPlazo1").value);
            eval("objParametros.Plazo2 = " + GI("txtPlazo2").value);
            eval("objParametros.Plazo3 = " + GI("txtPlazo3").value);
            eval("objParametros.Plazo4 = " + GI("txtPlazo4").value);
            eval("objParametros.Plazo5 = " + GI("txtPlazo5").value);
            eval("objParametros.Nsobretasa = " + pkInfo.fintSobretasa);
            eval("objParametros.Nisr = " + pkInfo.fintIsr);
            eval("objParametros.Fechainicio = '" + pkInfo.fintInicioPeriodo + "'");
            eval("objParametros.Fechafin = '" + pkInfo.fintFinDePeriodo + "'");
            
            var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
            makeAjaxRequest(url, "HTML", validaFuncionPrevIntImpAvi, objParametros);
            break;
    case 2: showWaitLayer();
            var objParametros = JSON.parse("{}");
            objParametros.id = "emision.ejeFunDetInteres";
            
            eval("objParametros.Programa = " + pkInfo.fintIdPrograma);
            eval("objParametros.Emision = " + pkInfo.fintIdEmision);
            eval("objParametros.Fideicomiso = " + pkInfo.fintIdFideicomiso);
            var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
            makeAjaxRequest(url, "HTML", validaFuncionPrevIntImpAvi, objParametros);
            break;
    case 3: if(fvCat.checkForm()) {
              showWaitLayer();
              var objParametros = JSON.parse("{}");
              objParametros.id = "emision.ejeFunImpresionAvisos";
              eval("objParametros.Programa = " + pkInfo.fintIdPrograma);
              eval("objParametros.Emision = " + pkInfo.fintIdEmision);
              eval("objParametros.Fideicomiso = " + pkInfo.fintIdFideicomiso);
              eval("objParametros.Periodo = " + pkInfo.fintIdCalcSecuencial);
              
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


function validaFuncionPrevIntImpAvi(obj, result) 
{
  var objResult = JSON.parse(result);
  
  if(obj.id == "emision.ejeFunPrevio") {
    if(isDefinedAndNotNull(objResult.RESULTADO)) {
      GI("fintInteresesPer").value = objResult.RESULTADO;
      GI("cmdAceptar").disabled = false;
      hideWaitLayer();
    }
  }
  else if(obj.id == "emision.ejeFunDetInteres") {
    if(isDefinedAndNotNull(objResult.RESULTADO))
      if(objResult.RESULTADO == 0) {
        hideWaitLayer();
        funcionConsulta(colocaValoresFInteres);
      }
  }
  else
    hideWaitLayer();
}

function validaImprimeReporte(obj, result) {

  var objResult = JSON.parse(result);
  if(isDefinedAndNotNull(objResult.RESULTADO)) {
    
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
    alert("Ocurrió un error o No hay reportes para imprimir");
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
