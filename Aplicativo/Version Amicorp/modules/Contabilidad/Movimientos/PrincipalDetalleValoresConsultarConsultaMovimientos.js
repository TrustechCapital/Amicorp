var catDetvalor = new Catalogo("mx.com.inscitech.fiducia.domain.Detvalor");

var cmbProovedorParam;
var strIdDV = "movNumContrato,movNomContrato,movNumOperacion,movNomOperacion,movNumTransac,movNomTransaccion,movFolioOpera,movHrTransac,movMinTransac";
var arrIdDV = strIdDV.split(",");

//var arrObjs;

function cargaPrincipalDetalleValoresConsultarConsultaMovimientos(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    arrObjs = generaArrObj(arrIdDV);
    var urlCliente = "modules/Contabilidad/Movimientos/PrincipalDetalleValoresConsultarConsultaMovimientos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaDetalleValoresConsultarConsultaMovimientos, null);
  }
}

function despliegaPantallaDetalleValoresConsultarConsultaMovimientos(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  if(isDefinedAndNotNull(pkInfo)){
    asignaValores2HTMLOfArrIdObjs(arrIdDV,arrObjs);
    catDetvalor.getCatalogo().devFolioOpera = catMovimien.getCatalogo().movFolioOpera;
    catDetvalor.getCatalogo().devNumOperacion = GI("movNumOperacion").value;
    catDetvalor.getCatalogo().devNumSecOpera = 0;
    catDetvalor.getCatalogo().devNumModulo = 0;
    catDetvalor.getCatalogo().devNumTransac = 0;
    catDetvalor.getCatalogo().devNumCorte = 0;
    catDetvalor.setOnUpdate(cargaComplemento2);
    catDetvalor.buscaCatalogoPK(false);
    GI("movImpMovto").value = catMovimien.getCatalogo().movImpMovto;
  }else{
    hideWaitLayer();
  }
  deshabilitaObjetos(GI("frmConsultarMovimientosDetalleValores"));
}
function cargaComplemento2(){
  if(isDefinedAndNotNull(pkInfo)){
    if(catDetvalor.getCatalogo().devFolioOperPla == 0){
      GI("devTasaRendimien1").value = catDetvalor.getCatalogo().devTasaRendimien;
      GI("devNumImpTit1").value = catDetvalor.getCatalogo().devNumImpTit;
    }else{
      GI("devTasaRendimien2").value = catDetvalor.getCatalogo().devTasaRendimien;
      GI("devNumImpTit2").value = catDetvalor.getCatalogo().devNumImpTit;
    }
  }
  var objTemp = GI("devProovedor1");
  txtProovedorParam = JSON.parse("{" + generaParametros("Intermediario","devEntidadFin") + "}");
  txtInstrumentoParam = JSON.parse("{" + generaParametros("CveTipoMerca,NumInstrume","devCveTipoMerca,devNumInstrume") + "}");
  txtMonedaParam = JSON.parse("{" + generaParametros("NumMoneda","devNumNoneda") + "}");
  loadElement(objTemp);
  catDetvalor.setOnUpdate(avisoOperacionCatalogo);
}

function loadTxtElement(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.value = objeto.registro;
  }
  var nextElement = GA(obj, "next");
  if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
}