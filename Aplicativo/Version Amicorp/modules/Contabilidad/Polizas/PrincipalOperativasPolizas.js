loadDynamicJS(ctxRoot + "/modules/Contabilidad/Polizas/PrincipalPrevioAceptarOperativasPolizas.js");

var folio,numOperacion,mesAbierto,anoAnt,mesAnt,diaAnt,ano,mes,dia,usuario;
var cmbPolizaParam = JSON.parse("{}");
cmbPolizaParam.order = "S";
var txtNumTransaccionParam;
var txtNumGuiaParam;
var txtDatoTranParam;
var arrObjsPoliza;
var objComboParam;
var banCtoInv = 0;
var banCtoInv1 = 0;
var banFideicomitente = 0;
var banFideicomisario = 0;
var banTercero = 0;


var cmbTercero = JSON.parse("{}");

var fvPolizas = new FormValidator();

fvPolizas.setup({
  formName      : "frmDatosPolizas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
function cargaCmbPolizas(){
  showWaitLayer();
  limpiaCombos("cmbPoliza");
  loadElement(GI("cmbPoliza"));
}
function cargaVariablesPoliza(objCombo){
  ocultaDatoTran();
  if(eval(objCombo.value) != -1){
    showWaitLayer();
    inicializaDatoTran();
    GI("txtFechaValor").value = GI("txtFechaMovto").value;
    txtNumTransaccionParam = JSON.parse("{" + generaParametros("NumeroOperacion","cmbPoliza") + "}");
    loadElement(GI("txtNumTransaccion"));
  }
}
function cargaNumGuia(){
  txtNumGuiaParam = JSON.parse("{" + generaParametros("Numero","txtNumTransaccion") + "}");
  loadElement(GI("txtNumGuia"));
}
function cargaDatoTran(){
  txtDatoTranParam = JSON.parse("{" + generaParametros("modulo,transaccion,orderX","txtModulo,txtNumTransaccion,txtOrderX") + "}");
  loadElement(GI("txtOrderX"));
}
function ocultaDatoTran(){
  for(var i = 1; i <= 20; i++){
    ocultaObj(eval("'txtValor" + i + "'"));
    ocultaObj(eval("'txtDesc" + i + "'"));
  }
}
function inicializaDatoTran(){
  for(var i = 1; i <= 20; i++){
    limpiaTxts(eval("'txtDesc" + i + "'"));
    if(i<=6){
      limpiaCombos(eval("'txtValor" + i + "'"));
      RA(eval("GI('txtValor" + i + "')"),"required");
    }
    if(i>6)
      inicializaValores(eval("'txtValor" + i + "'"));
  }
}

function asignaDatoTran(objeto, result){
  hideWaitLayer();
  var indexCombos = 1;
  var indexTxts = 7;
  banCtoInv = 0;
  banFideicomitente = 0;
  banFideicomisario = 0;
  banTercero = 0;
  banCheques = 0;
  banSubcontra = 0;
  banCheques1 = 0;
  banSubcontra1 = 0;
  var obj = JSON.parse(result);
  for(var i = 0; i < obj.length; i++){
    switch(obj[i].dtrCveAplDato){
      case "CONTRATO":
        showWaitLayer();
        objComboParam = JSON.parse("{\"chido\":-1}");
        
        SA(eval("GI('txtValor" + indexCombos + "')"), "keyValue", "ctoNumContrato");
        SA(eval("GI('txtValor" + indexCombos + "')"), "theValue", "ctoNomContrato");
        SA(eval("GI('txtValor" + indexCombos + "')"), "ref", "conNumFidNomFid");
        SA(eval("GI('txtValor" + indexCombos + "')"), "next", "hideWaitLayer");
        loadElement(eval("GI('txtValor"+ indexCombos + "')"));
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "El " + obj[i].dtrCveAplDato + " es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
        
      break;
      case "CONTRATO DE INVERSION":
      case "CONTRATO INVERSION":
      case "CTOINVERSION":
        banCtoInv = indexCombos;
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "El Contrato de Inversion es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "CTOINVER1":
        banCtoInv1 = indexCombos;
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "El Contrato de Inversion es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "FIDEICOMITENTE":
      case "FIDEICOMITENTES":
        banFideicomitente = indexCombos;
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "EL Fideicomitente es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "FIDEICOMISARIO":
      case "FIDEICOMISARIOS":
        banFideicomisario = indexCombos;
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "El Fideicomisario es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "TERCERO":
      case "TERCEROS":
        banTercero = indexCombos;
        
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "El Tercero es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "MONEDA":
        showWaitLayer();
        objComboParam = JSON.parse("{\"chido\":-1}");
        SA(eval("GI('txtValor" + indexCombos + "')"), "keyValue", "monNumPais");
        SA(eval("GI('txtValor" + indexCombos + "')"), "theValue", "monNomMoneda");
        SA(eval("GI('txtValor" + indexCombos + "')"), "ref", "conNumMonNomMon");
        SA(eval("GI('txtValor" + indexCombos + "')"), "next", "hideWaitLayer");
        loadElement(eval("GI('txtValor"+ indexCombos + "')"));
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "La Moneda es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
      break;
      case "CUENTA CHEQUES":      
        banCheques = indexCombos;
    
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "La Cuenta de Cheques es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
        
      break;      
      
     case "SUBCONTRATO":    
       
        banSubcontra = indexCombos;
    
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        //SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        //SA(eval("GI('txtValor" + indexCombos + "')"), "message", "La Subcuenta es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
        
      break;
      
      case "CUENTA CHEQUES1":
        banCheques1 = indexCombos;
    
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "La Cuenta de Cheques es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
        
      break; 
     case "SUB_CUENTA1":
     case "SUBFISO2":
       
        banSubcontra1 = indexCombos;
    
        eval("GI('txtDesc" + indexCombos + "')").value = obj[i].dtrCveAplDato;
        deshabilitaPK(eval("'txtDesc" + indexCombos + "'").split(","));
        muestraObj(eval("'txtDesc" + indexCombos + "'"));
        SA(eval("GI('txtValor" + indexCombos + "')"), "required", "true");
        SA(eval("GI('txtValor" + indexCombos + "')"), "message", "La Subcuenta es un campo obligatorio");
        muestraObj(eval("'txtValor" + indexCombos + "'"));
        indexCombos++;
        
      break;
      default:
        if(obj[i].dtrCveAplDato != "SUBCONTRATO" && obj[i].dtrCveAplDato != "SUBFISO" && obj[i].dtrCveAplDato != "SUBFISO1"){
          eval("GI('txtDesc" + indexTxts + "')").value = obj[i].dtrCveAplDato;
          deshabilitaPK(eval("'txtDesc" + indexTxts + "'").split(","));
          muestraObj(eval("'txtDesc" + indexTxts + "'"));
          eliminaCero(eval("'txtValor" + indexTxts + "'"));
          SA(eval("GI('txtValor" + indexTxts + "')"), "message", obj[i].dtrCveAplDato + " es un campo obligatorio");
          muestraObj(eval("'txtValor" + indexTxts + "'"));
          indexTxts++;
        }else{
          eval("GI('txtDesc" + 20 + "')").value = obj[i].dtrCveAplDato;
        }
    }
  }
}

function cargaCombosDependientes(objCombo){

  var index = -1;
  objComboParam = JSON.parse("{\"Fideicomiso\":" + objCombo.value + ",\"Status\":\"ACTIVO\",\"orderSecuencial\":\"S\"}");
  if(banCtoInv != 0){
    showWaitLayer();
    index = banCtoInv;
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "cprContratoInter");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "cprNomIntermed");
    SA(eval("GI('txtValor" + index + "')"), "ref", "conNumNomFidInt");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  if(banCtoInv1 != 0){
    showWaitLayer();
    index = banCtoInv1;
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "cprContratoInter");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "cprNomIntermed");
    SA(eval("GI('txtValor" + index + "')"), "ref", "conNumNomFidInt");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  
  if(banFideicomisario != 0){
    showWaitLayer();
    index = banFideicomisario;
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "benBeneficiario");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "benNomBenef");
    SA(eval("GI('txtValor" + index + "')"), "ref", "conNumBeneficiNomBenfici");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  
  
  if(banCheques != 0){
    
    //showWaitLayer();
    index = banCheques;
    objComboParam = JSON.parse("{\"fideso\":"+GI("txtValor1").options[GI("txtValor1").selectedIndex].value+",\"status\":\"AUTORIZADA\"}");
    eval("GI('txtValor" + index + "').selectedIndex = 0;") 
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "fcbaClabeCba");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "fcbaClabeCba");
    SA(eval("GI('txtValor" + index + "')"), "ref", "muestraCuentaBancaria");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  if(banSubcontra != 0){
    index = banSubcontra;
    
    objComboParam = JSON.parse("{\"numContrato\":"+GI("txtValor1").options[GI("txtValor1").selectedIndex].value+"}");
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "fsctIdSubCuenta");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "fsctNombreSubCuenta");  
    SA(eval("GI('txtValor" + index + "')"), "ref", "consultaSubcuenta");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));   
  }
  
  if(banCheques1 != 0){
    
    //showWaitLayer();
    index = banCheques1;
    objComboParam = JSON.parse("{\"fideso\":"+GI("txtValor1").options[GI("txtValor1").selectedIndex].value+",\"status\":\"AUTORIZADA\"}");
    eval("GI('txtValor" + index + "').selectedIndex = 0;") 
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "fcbaClabeCba");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "fcbaClabeCba");
    SA(eval("GI('txtValor" + index + "')"), "ref", "muestraCuentaBancaria");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  
  if(banSubcontra1 != 0){
    index = banSubcontra1;
    
    objComboParam = JSON.parse("{\"numContrato\":"+GI("txtValor1").options[GI("txtValor1").selectedIndex].value+"}");
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "fsctIdSubCuenta");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "fsctNombreSubCuenta");  
    SA(eval("GI('txtValor" + index + "')"), "ref", "consultaSubcuenta");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));   
  }
  
  if(banTercero != 0){
    showWaitLayer();
    index = banTercero;
    
    cmbTercero = JSON.parse("{\"Fideicomiso\":"+GI('txtValor1').value+"}");
    
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "terNumTercero");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "terNomTercero");
    SA(eval("GI('txtValor" + index + "')"), "ref", "conNumTerceroNomTercero");
    SA(eval("GI('txtValor" + index + "')"), "param", "cmbTercero");
    
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  if(banFideicomitente != 0){
    showWaitLayer();
    index = banFideicomitente;
    eval("GI('txtValor" + index + "').selectedIndex = 0;")
    SA(eval("GI('txtValor" + index + "')"), "keyValue", "fidFideicomitente");
    SA(eval("GI('txtValor" + index + "')"), "theValue", "fidNomFideicom");
    SA(eval("GI('txtValor" + index + "')"), "ref", "conNumFideicomNomFideicom");
    SA(eval("GI('txtValor" + index + "')"), "next", "hideWaitLayer");
    loadElement(eval("GI('txtValor"+ index + "')"));
  }
  
}

function inicializaValores(strTxts){
  var arrTxts = strTxts.split(",");
  for(var i = 0; i < arrTxts.length ; i++)
    GI(arrTxts[i]).value = 0;
}
function eliminaCero(strTxt){
  GI(strTxt).value = "";
}
function ejecutaOperacionPolizas(){
  if(fvPolizas.checkForm()){
    showWaitLayer();
    verificaFechaMesAnteriorFideicomiso();
  }
}

function ejecutaAsignaFolio(){
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunAsignaFolio\",\"TipoFolio\":2}";
  makeAjaxRequest(url, "HTML", asignaFolio, null);
}
function asignaFolio(obj, result){

  var resultado = JSON.parse(result)[0];
  GI("txtFolio").value = resultado;
  if(isDefinedAndNotNull(resultado)){
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunGeneraDatoval\",\"DatoVal\":'" + generaCadenaDatoVal() + "'}";
    makeAjaxRequest(url, "HTML", validaGeneraDatoVal, null);
  }else{
    alert("Error al asignar el folio de operación");
    hideWaitLayer();
  }
}
function validaGeneraDatoVal(obj, result){
  var resultado = JSON.parse(result)[0];
  if(resultado == 0){
    alert("Error al generar Datoval");
  }else{
    folio = (GI("txtFolio").value != "")?GI("txtFolio").value:0;
    numOperacion = (GI("cmbPoliza").value != "")?GI("cmbPoliza").value:0;
    mesAbierto = GI("txtMesAbierto").value;
    anoAnt = GI("txtFechaValor").value.split("/")[2];
    mesAnt = GI("txtFechaValor").value.split("/")[1];
    diaAnt = GI("txtFechaValor").value.split("/")[0];
    ano = GI("txtFechaValor").value.split("/")[2];
    mes = GI("txtFechaValor").value.split("/")[1];
    dia = GI("txtFechaValor").value.split("/")[0];
    usuario = 683;
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeStoPolPreContabiliza\",\"Folio\":" + folio + ",\"NumeroOperacion\":" + numOperacion + ",\"Ano\":" + ano + ",\"Mes\":" + mes + ",\"Dia\":" + dia + ",\"Forma\":\"Poliza Contable\",\"MesAbierto\":" + mesAbierto + ",\"AnoAnt\":" + anoAnt + ",\"MesAnt\":" + mesAnt + ",\"DiaAnt\":" + diaAnt + ",\"Usuario\":" + usuario + "}";
    makeAjaxRequest(url, "HTML", validaStorePreContabiliza, null);
  }
}

function validaStorePreContabiliza(obj, result){
  var resultado = JSON.parse(result);
  if(resultado[1] != 0){
    alert("Error al Contabilizar");
  }else{
    saveInnerHTML("dvPantalla");
    //saveInnerHTML("dvContenido");
    cargaPrincipalPrevioAceptarOperativasPolizas();
  }
  hideWaitLayer();
}
function generaCadenaDatoVal(){
  var strAux = "";
  var folio = (GI("txtFolio").value != "")?GI("txtFolio").value:0;
  var numOperacion = (GI("cmbPoliza").value != "")?GI("cmbPoliza").value:0;
  var numTransaccion = (GI("txtNumTransaccion").value != "")?GI("txtNumTransaccion").value:0;
  var fecha = "\"" + GI("txtFechaValor").value + "\"";
  var fechaAno = GI("txtFechaValor").value.split("/")[2];
  var fechaMes = GI("txtFechaValor").value.split("/")[1];
  var fechaDia = GI("txtFechaValor").value.split("/")[0];
  
  for(var i = 1; i <= 20; i++){
    strAux += "\"" + eval("GI('txtDesc" + i + "')").value + "\",";
    strAux += (eval("GI('txtValor" + i + "')").value == -1?"0":eval("GI('txtValor" + i + "')").value) + ",";
  }
  strAux = strAux.substring(0,strAux.length - 1);
  strAux = folio + "," + numOperacion + "," + numTransaccion + "," + strAux + "," + fecha + "," + fechaAno + "," + fechaMes + "," + fechaDia + "," + fechaAno + "," + fechaMes + "," + fechaDia + ",";
  return strAux;  
}


var fechaDefault = new Date();

function verificaFecha(objFecha){
  showWaitLayer();
  var fecha = objFecha.value;
//  alert('objFecha.value ' + objFecha.value);

  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFecha\",\"Fecha\":\"" + fecha + "\"}";
  makeAjaxRequest(url, "HTML", validaFecha, objFecha);
}

function validaFecha(obj, result){
  var resultado = JSON.parse(result)[0];
  switch(resultado){
    case 0:
    case 1:
      if(GI("txtFechaMovto").value.split("/")[1] == obj.value.split("/")[1]){
        GI("txtMesAbierto").value = 0;
      }
      else{
        GI("txtMesAbierto").value = 1;
      }
    break;
    break;
    case 2:
      alert("La fecha seleccionada corresponde un día no hábil");
      obj.focus();
    break;
    case 3:
      alert("La fecha seleccionada corresponde a un día feriado");
      obj.focus();
    break;
    case 4:
      alert("Error al defasar la fecha contable un mes");
      obj.focus();
    break;
    case 5:
      alert("El mes seleccionado se encuentra cerrado");
      obj.focus();
    break;
    case 6:
      alert("Solo se permiten movimientos del mes actual o del mes anterior");
      obj.focus();
    break;
    case -1:
      alert("Error al verificar la fecha seleccionada");
      obj.focus();
    break;
  }
  hideWaitLayer();
}
function verificaFechaMesAnteriorFideicomiso(){
  var fecha = GI("txtFechaValor").value;
  var fideicomiso = GI("txtValor1").value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaMesAnterior\",\"Fecha\":\"" + fecha + "\",\"Fideicomiso\":" + fideicomiso + "}";
  makeAjaxRequest(url, "HTML", validaFechaMesAnterior, GI("txtValor1"));
}
function validaFechaMesAnterior(obj, result){
  var resultado = JSON.parse(result)[0];
  switch(resultado){
    case 0:
    case 2:
      showWaitLayer();
      ejecutaAsignaFolio();
    break;
    case 1:
    case -1:
      alert("El fideicomiso se encuentra cerrado");
      obj.focus();
    break;
  }
  hideWaitLayer();
}

function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "txtFechaValor",   // id of the input field
    button         :    "txtFechaValor",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    null,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});