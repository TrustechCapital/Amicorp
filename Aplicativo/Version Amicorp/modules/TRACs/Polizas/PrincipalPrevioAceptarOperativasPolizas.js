var objNumFideicomisoParam;
var objNumOperacionParam;

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

function cargaPrincipalPrevioAceptarOperativasPolizas(){
  showWaitLayer();
  arrObjsPoliza = generaArrObjsHTML("cmbPoliza,txtFolio,txtFechaValor,txtNumTransaccion,txtDesc1,txtValor1,txtDesc2,txtValor2,txtDesc3,txtValor3,txtDesc4,txtValor4,txtDesc5,txtValor5,txtDesc6,txtValor6,txtDesc7,txtValor7,txtDesc8,txtValor8,txtDesc9,txtValor9,txtDesc10,txtValor10,txtDesc11,txtValor11,txtDesc12,txtValor12,txtDesc13,txtValor13,txtDesc14,txtValor14,txtDesc15,txtValor15,txtDesc16,txtValor16,txtDesc17,txtValor17,txtDesc18,txtValor18,txtDesc19,txtValor19,txtDesc20,txtValor20");
  var urlCliente = "modules/TRACs/Polizas/PrincipalPrevioAceptarOperativasPolizas.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrevioAceptarOperativasPolizas, null);
}

function despliegaPantallaPrevioAceptarOperativasPolizas(obj, result){
  GI("dvPantalla").innerHTML = result;
  //GI("dvContenido").innerHTML = result;
  GI("movNumContrato").value = arrObjsPoliza[5].value;
  GI("movFolioOpera").value = arrObjsPoliza[1].value;
  GI("paramFolio").value = arrObjsPoliza[1].value;
  GI("movNumOperacion").value = arrObjsPoliza[0].value;
  GI("movFechaContable").value = arrObjsPoliza[2].value;
  cargaComplemento();
  deshabilitaObjetos(GI("frmConsultarMovimientos"));
}

function cargaComplemento(){
  var objTemp = GI("movNomContrato");
  objNumFideicomisoParam = JSON.parse("{" + generaParametros("numFideicomiso","movNumContrato") + "}");
  objNumOperacionParam = JSON.parse("{" + generaParametros("numOperacion","movNumOperacion") + "}");
  loadElement(objTemp);
  var objTemp = GI("movFolioOpera");
  SA(objTemp,"ref","conPriAsiPol");
  SA(objTemp,"fun","loadTableElementSpecial");
  SA(objTemp,"tabla","tblRegPriAsi");
  totalCarAbo();
  
  consultar(objTemp, GI("frmConsultarMovimientos"), false);
  hideWaitLayer();
}

function totalCarAbo()
{
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conTotalAsiPol\",\"Folio\":"+eval(GI("paramFolio").value)+",\"cveMovto\":\"C\"}";
  makeAjaxRequest(url,"HTML",totalCargos,null);
}

function totalCargos(obj,result)
{
  var res = JSON.parse(result)[0].total;
  GI("tCargos").value=res;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conTotalAsiPol\",\"Folio\":"+eval(GI("paramFolio").value)+",\"cveMovto\":\"A\"}";
  makeAjaxRequest(url,"HTML",totalAbonos,null);
}

function totalAbonos(obj,result)
{
  var res = JSON.parse(result)[0].total;
  GI("tAbonos").value=res;
  GI("tDiferencia").value = eval(GI("tCargos").value.replace(",","").replace(",","").replace(",","").replace(",","")) - eval(GI("tAbonos").value.replace(",","").replace(",","").replace(",","").replace(",",""));  

  if(GI("tDiferencia").value!=0)
  {
  
    GI("cmdAceptar").disabled = true;
    alert("La diferencia entre Cargos y Abonos es dintinta de cero,Revise los datos de la póliza");
  
  }
}

function generaArrObjsHTML(strId){
  var arrId = strId.split(",");
  var arrObjTmp = new Array();
  for(i = 0; i < arrId.length; i++){
    arrObjTmp[i] = new Object();
    arrObjTmp[i].id = arrId[i];
    arrObjTmp[i].value = GI(arrId[i]).value;
  }
  return arrObjTmp;
}

function contabilizaOperacion(){
  showWaitLayer();
  
  //REEMPLAZAR ESTA FUNCION POR INSERCION EN INSTRUCC
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeStoPolContabiliza\",\"Folio\":" + folio + ",\"NumeroOperacion\":" + numOperacion + ",\"Ano\":" + ano + ",\"Mes\":" + mes + ",\"Dia\":" + dia + ",\"Forma\":\"Poliza Contable\",\"MesAbierto\":" + mesAbierto + ",\"AnoAnt\":" + anoAnt + ",\"MesAnt\":" + mesAnt + ",\"DiaAnt\":" + diaAnt + ",\"Usuario\":" + usuario + "}";
  makeAjaxRequest(url, "HTML", validaStoreContabiliza, null);
}

function validaStoreContabiliza(obj, result){
  var resultado = JSON.parse(result);
  if(resultado[1] != 0){
    alert(resultado[0]);
    onButtonClickPestania("TRACs.Polizas.PrincipalOperativasPolizas","")
  }else{
    alert("Poliza aplicada con el Folio " + arrObjsPoliza[1].value);
    onButtonClickPestania("TRACs.Polizas.PrincipalOperativasPolizas","")
  }
  hideWaitLayer();
}
function cargaPrincipalOperativasPolizas(){
  setSaveInnerHTML("dvPantalla");
  //setSaveInnerHTML("dvContenido");
}