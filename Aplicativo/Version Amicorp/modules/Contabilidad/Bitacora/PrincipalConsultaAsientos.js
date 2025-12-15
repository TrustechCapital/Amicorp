var catAsientos = new Catalogo("mx.com.inscitech.fiducia.domain.Asientos");
deshabilitaPK("txt1,txt2".split(","));

var arrTblAsiDat = new Array();
arrTblAsiDat[0] = "asiFolioOpera,60";
arrTblAsiDat[1] = "asiNumOperacion,80";
arrTblAsiDat[2] = "fechaAlta,60";
arrTblAsiDat[3] = "asiTransaccion,50";
//arrTblAsiDat[4] = "asiSecAsiento,50";
arrTblAsiDat[4] = "asiNumCtam,50";
arrTblAsiDat[5] = "asiNumScta,50";
arrTblAsiDat[6] = "asiNumSscta,50";
arrTblAsiDat[7] = "asiNumSsscta,70";
arrTblAsiDat[8] = "asiNumSssscta,70";
arrTblAsiDat[9] = "asiNumSsssscta,70";
arrTblAsiDat[10] = "asiNumAux1,50";
arrTblAsiDat[11] = "asiNumAux2,50";
arrTblAsiDat[12] = "asiNumAux3,50";
arrTblAsiDat[13] = "asiCveCarAbo,40";
arrTblAsiDat[14] = "importe,100";
arrTblAsiDat[15] = "asiDescAsiento,150";
arrTblAsiDat[16] = "asiCveStMovim,100";

var fvCat = new FormValidator();
fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  RF(objForma);
  catAsientos = new Catalogo("mx.com.inscitech.fiducia.domain.Asientos");
  ocultaObjs("txt1,txt2,dv1,dv2");
}
function cambiaStatus(objCheck, objStatus){
  if(objCheck.checked)
    objStatus.value = "CANCELADO";
  else
    objStatus.value = "ACTIVO";
}

function loadTableElementAsientos(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTable(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), null, false);
  limpiaTxts("txt1,txt2");
  limpiaDivs("dv1,dv2");
  if(GI("chkTotalCA").checked){
    SA(GI("cmdAceptar"),"ref","conTotCarAbo");
    SA(GI("cmdAceptar"),"fun","muestraTotalCargosAbonos");
    GI("cmdAceptar").click();
  }
  hideWaitLayer();
}

function muestraTotalCargosAbonos(obj, result){
  var resultado = JSON.parse(result);
  for(var i = 0; i < resultado.length; i++){
    eval("GI('dv" + (i+1) + "').innerHTML = resultado[" + i + "].descripcion");
    eval("GI('txt" + (i+1) + "').value = resultado[" + i + "].importeTotal");
  }
  SA(GI("cmdAceptar"),"ref","conPriAsi");
  SA(GI("cmdAceptar"),"fun","loadTableElementAsientos");
  hideWaitLayer();
}