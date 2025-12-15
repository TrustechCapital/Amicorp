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
  //limpiaTxts("txt1,txt2");
 // limpiaDivs("dv1,dv2");
  if(GI("chkTotalCA").checked){
  totalCargos();
  totalAbonos();   
  }
  hideWaitLayer();
}

function soloTotales()
{
  if(GI("chkSoloTotalCA").checked)
  {
    totalCargos();
    totalAbonos(); 
    return false;
  }
  else
  {
    if(!(GI("chkSoloTotalCA").checked&&GI("chkSoloTotalCA").checked))
    {
      GI("tCargos").value = "0.0";
      GI("tAbonos").value = "0.0";
      GI("tDiferencia").value = "0.0";  

    }
  
    return true; 
  }
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


// cargos y abonos
function totalCargos()
{
  var numCta = (GI("paramNumCtam").value!="")?",\"NumCtam\":"+eval(GI("paramNumCtam").value):"";
  var numScta = (GI("paramNumScta").value!="")?",\"NumScta\":"+eval(GI("paramNumScta").value):"";
  var numSscta = (GI("paramNumSscta").value!="")?",\"NumSscta\":"+eval(GI("paramNumSscta").value):"";
  var numSsscta = (GI("paramNumSsscta").value!="")?",\"NumSsscta\":"+eval(GI("paramNumSsscta").value):"";
  var numSssscta = (GI("paramNumSsssscta").value!="")?",\"NumSssscta\":"+eval(GI("paramNumSsssscta").value):"";
  var numAux1 = (GI("paramNumAux1").value!="")?",\"NumAux1\":"+eval(GI("paramNumAux1").value):"";
  var numAux2 = (GI("paramNumAux2").value!="")?",\"NumAux2\":"+eval(GI("paramNumAux2").value):"";
  var numAux3 = (GI("paramNumAux3").value!="")?",\"NumAux3\":"+eval(GI("paramNumAux3").value):"";
  var numfolio = (GI("paramFolio").value!="")?",\"Folio\":"+eval(GI("paramFolio").value):"";
  var dia = (GI("paramDia").value!="")?",\"Dia\":"+eval(GI("paramDia").value):"";
  var mes = (GI("paramMes").value!="")?",\"Mes\":"+eval(GI("paramMes").value):"";
  var ano = (GI("paramAno").value!="")?",\"Ano\":"+eval(GI("paramAno").value):"";
  var transaccion = (GI("paramTransaccion").value!="")?",\"Transaccion\":"+eval(GI("paramTransaccion")).value:"";
  var descripcion = (GI("paramDescripcion").value!="")?",\"Descripcion\":\""+GI("paramDescripcion").value+"\"":"";
  var estatus = (GI("chkStatus").checked)?",\"Status\":\"CANCELADO\"":",\"Status\":\"ACTIVO\"";
  
  var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaTotalCargos\""+numCta+numScta+numSscta+numSsscta+numSssscta+numAux1+numAux2+numAux3+numfolio+dia+mes+ano+transaccion+descripcion+estatus+"}";
  
  makeAjaxRequest(url, "HTML", regresaCargos, null);
}

function regresaCargos(obj,result)
{
  var res = JSON.parse(result)[0];
  if(isDefinedAndNotNull(res)){
     GI("tCargos").value = (res.asiImpMovimiento!=null)?res.asiImpMovimiento:"0.0";
  }else
    alert("Ocurrió un error inesperado");
}
// cargos y abonos


function totalAbonos()
{
  var numCta = (GI("paramNumCtam").value!="")?",\"NumCtam\":"+eval(GI("paramNumCtam").value):"";
  var numScta = (GI("paramNumScta").value!="")?",\"NumScta\":"+eval(GI("paramNumScta").value):"";
  var numSscta = (GI("paramNumSscta").value!="")?",\"NumSscta\":"+eval(GI("paramNumSscta").value):"";
  var numSsscta = (GI("paramNumSsscta").value!="")?",\"NumSsscta\":"+eval(GI("paramNumSsscta").value):"";
  var numSssscta = (GI("paramNumSsssscta").value!="")?",\"NumSssscta\":"+eval(GI("paramNumSsssscta").value):"";
  var numAux1 = (GI("paramNumAux1").value!="")?",\"NumAux1\":"+eval(GI("paramNumAux1").value):"";
  var numAux2 = (GI("paramNumAux2").value!="")?",\"NumAux2\":"+eval(GI("paramNumAux2").value):"";
  var numAux3 = (GI("paramNumAux3").value!="")?",\"NumAux3\":"+eval(GI("paramNumAux3").value):"";
  var numfolio = (GI("paramFolio").value!="")?",\"Folio\":"+eval(GI("paramFolio").value):"";
  var dia = (GI("paramDia").value!="")?",\"Dia\":"+eval(GI("paramDia").value):"";
  var mes = (GI("paramMes").value!="")?",\"Mes\":"+eval(GI("paramMes").value):"";
  var ano = (GI("paramAno").value!="")?",\"Ano\":"+eval(GI("paramAno").value):"";
  var transaccion = (GI("paramTransaccion").value!="")?",\"Transaccion\":"+eval(GI("paramTransaccion")).value:"";
  var descripcion = (GI("paramDescripcion").value!="")?",\"Descripcion\":\""+GI("paramDescripcion").value+"\"":"";
  var estatus = (GI("chkStatus").checked)?",\"Status\":\"CANCELADO\"":",\"Status\":\"ACTIVO\"";
 
  var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaTotalAbonos\""+numCta+numScta+numSscta+numSsscta+numSssscta+numAux1+numAux2+numAux3+numfolio+dia+mes+ano+transaccion+descripcion+estatus+"}";
  makeAjaxRequest(url, "HTML", regresaAbonos, null);
}

function regresaAbonos(obj,result)
{
  var res = JSON.parse(result)[0];
  if(isDefinedAndNotNull(res)){
     GI("tAbonos").value = (res.asiImpMovimiento!=null)?res.asiImpMovimiento:"0.0";
    }else
    {alert("Ocurrió un error inesperado");}
   GI("tDiferencia").value = eval(GI("tCargos").value.replace(",","").replace(",","").replace(",","").replace(",","")) - eval(GI("tAbonos").value.replace(",","").replace(",","").replace(",","").replace(",",""));  
}



function replaceAll(cadena,buscado,reemplaza)
{
  while(cadena.toString().indexOf(buscado)!=-1)
  {
    cadena = cadena.toString().replace(buscado,reemplaza);
    return cadena;
  }

  return cadena;
}