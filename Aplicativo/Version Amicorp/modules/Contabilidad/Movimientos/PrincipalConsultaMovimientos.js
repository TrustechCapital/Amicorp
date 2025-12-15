var catMovimien = new Catalogo("mx.com.inscitech.fiducia.domain.Movimien");
var objsNombresNumerosParam;
var btnDetValParam;

var dia,mes,ano;

var arrTblMovDat = new Array();
arrTblMovDat[0] = "movDiaMovto,30";
arrTblMovDat[1] = "movMesMovto,32";
arrTblMovDat[2] = "movAnoMovto,32";
//arrTblMovDat[3] = "movHrTransac,28";
//arrTblMovDat[4] = "movMinTransac,34";
arrTblMovDat[3] = "movNumContrato,83";
arrTblMovDat[4] = "movSubContrato,83";
arrTblMovDat[5] = "movFolioOpera,70";
arrTblMovDat[6] = "movNumTransac,70";
arrTblMovDat[7] = "movDescMovto,300";
arrTblMovDat[8] = "movImpMovto,150";
//arrTblMovDat[10] = "movCveTipoMerca,63";
//arrTblMovDat[11] = "movNumInstrume,84";
//arrTblMovDat[12] = "movNumSecEmis,56";
//arrTblMovDat[13] = "movNumTitulos,53";
arrTblMovDat[9] = "movNumUsuario,56";
//arrTblMovDat[15] = "movCveImpreEdo,91";
arrTblMovDat[10] = "movCveEntSal,44";


var arrTblAsiDat = new Array();
arrTblAsiDat[0] = "asiSecAsiento,40";
arrTblAsiDat[1] = "asiNomCta,200";
arrTblAsiDat[2] = "asiNumCtam,50";
arrTblAsiDat[3] = "asiNumScta,40";
arrTblAsiDat[4] = "asiNumSscta,40";
arrTblAsiDat[5] = "asiNumSsscta,50";
arrTblAsiDat[6] = "asiNumSssscta,65";
arrTblAsiDat[7] = "asiNumSsssscta,65";
arrTblAsiDat[8] = "asiNumAux1,50";
arrTblAsiDat[9] = "asiNumAux2,50";
arrTblAsiDat[10] = "asiNumAux3,50";
arrTblAsiDat[11] = "asiCveCarAbo,40";
arrTblAsiDat[12] = "asiImpMovimiento,120";
arrTblAsiDat[13] = "asiDescAsiento,200";

var fvCat = new FormValidator();
//var strIdPK = "movAnoMovto,movMesMovto,movDiaMovto,movNumContrato,movSubContrato,movFolioOpera,movNumModulo,movNumTransac";
var strIdPK = "movFolioOpera";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catMovimien.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catMovimien = new Catalogo("mx.com.inscitech.fiducia.domain.Movimien");
}

function cambiaStatus(objCheck, objStatus){
  if(objCheck.checked)
    objStatus.value = "CANCELADO";
  else
    objStatus.value = "ACTIVO";
}

function cargaPrincipalConsultarConsultaMovimientos(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Movimientos/PrincipalConsultarConsultaMovimientos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaConsultarConsultaMovimientos, null);
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Movimientos/PrincipalDetalleOperacionConsultarConsultaMovimientos.js");
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Movimientos/PrincipalDetalleValoresConsultarConsultaMovimientos.js");
  }
}

function despliegaPantallaConsultarConsultaMovimientos(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  if(isDefinedAndNotNull(pkInfo)){
    catMovimien.setOnUpdate(cargaComplemento);
    catMovimien.buscaCatalogoPK(false);
    
    cargaFecLiq(pkInfo.movFolioOpera);// Fecha Liquidación
  }else{
    formsLoaded();
  }
  deshabilitaObjetos(GI("frmConsultarMovimientos"));
}

function cargaComplemento(){
  GI("paramFolio").value = catMovimien.getCatalogo().movFolioOpera;
  var objTemp = GI("movNumOperacion");
  SA(objTemp, "ref", "conNomFidNumOpeNomOpeNomTraNumGui");
  SA(objTemp, "fun", "asignaValores");
  SA(objTemp, "param", "objsNombresNumerosParam");
  objsNombresNumerosParam = JSON.parse("{" + generaParametros("Fideicomiso,Folio","movNumContrato,movFolioOpera") + "}");
  loadElement(objTemp);
  var objTemp = GI("movFolioOpera");
  SA(objTemp,"ref","conPriAsi");
  SA(objTemp,"fun","loadTableElementSpecial");
  SA(objTemp,"tabla","tblRegPriAsi");
  consultar(objTemp, GI("frmConsultarMovimientos"), false);
  var objTemp2 = GI("cmdDetalleValores");
  SA(objTemp2, "ref", "verExiDetVal");
  SA(objTemp2, "fun", "deshabilitaBoton");
  SA(objTemp2, "param", "btnDetValParam");
  btnDetValParam = JSON.parse("{" + generaParametros("Folio","movFolioOpera") + "}");
  loadElement(objTemp2);
  catOperacio.setOnUpdate(avisoOperacionCatalogo);
}
function asignaValores(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.value = objeto.numOperacion;
    GI("movNomContrato").value = objeto.nomContrato;
    GI("movNomOperacion").value = objeto.nomOperacion;
    GI("movNomTransaccion").value = objeto.nomTransac;
    GI("movNumGuia").value = objeto.numGuiaCont;
  }
  hideWaitLayer();
}

function deshabilitaBoton(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    if(objeto.existeRegistro == 0)
      obj.disabled = true;
  }
}


function cargaPrincipalConsultaMovimientos(){
  showWaitLayer();
  dia = GI("movDiaMovto").value;
  mes = GI("movMesMovto").value;
  ano = GI("movAnoMovto").value;
  var urlCliente = "modules/Contabilidad/Movimientos/PrincipalConsultaMovimientos.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalConsultaMovimientos, null);
}

function despliegaPantallaPrincipalConsultaMovimientos(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  pkInfo = null;
  if(isDefinedAndNotNull(objParameters)){
    setParameters(objParameters);
    GI("paramDia").value = dia;
    GI("paramMes").value = mes;
    GI("paramAno").value = ano;
    GI(objButtonConsultar).click();
  }
  formsLoaded();
}

function porFolio(objeto)
{
  if(objeto.value!=" "&&objeto.value!="")
  {  
      GI("paramDia").value="";
      GI("paramMes").value="";  
  }
  }
  
  // Fecha Liquición Movientos
  
  function cargaFecLiq(folio)
  {
   var surl = "\"id\":\"qryMovtoFecLiq\",";
   surl += "\"folio\":"+folio+",";
   surl += "\"order\":\"s\"";
   var url = ctxRoot+"/getRef.do?json={"+surl+"}";
   
   showWaitLayer();
   makeAjaxRequest(url,"HTML",cargaFecLiqResp,null);
  }
  
  function cargaFecLiqResp(obj,result)
  {
   var res = JSON.parse(result)[0];
   GI("movFeqLiq").value= res.fecliq;
   hideWaitLayer();
  }