function generaArrObjPK(keyCampos,keyValues){
  var arrkeyCampos = keyCampos.split(",");
  var arrkeyValues = keyValues.split(",");
  var arrAuxPK = new Array();
  for(var i = 0;i < arrkeyCampos.length; i++){
      arrAuxPK[i] = new Object();
      arrAuxPK[i].campo = arrkeyCampos[i];
      arrAuxPK[i].value = arrkeyValues[i];     
  }
  return arrAuxPK;
}

function asignaObjPK2Obj(arrObjPK){
  for(var i = 0;i < arrObjPK.length; i++){
    GI(arrObjPK[i].campo).value = arrObjPK[i].value;
  }
}
//***************************************************
var FV_DEFAULT_MESSAGE = "Mensaje de default";
var FV_DEFAULT_SINGLE_MESSAGE = "Campo Requerido";
var FV_INVALID_FORMAT_MESSAGE = "Formato no valido";
var FV_MSG_INVALID_FORM = "Por favor verifique los datos";

var OPER_ALTA = 1;
var OPER_MODIFICAR = 2;
var OPER_BAJA = 3;
var OPER_CONSULTAR = 4;

function deshabilitaObjetos(forma){
  for(var i = 0; i < forma.elements.length; i++){
    if(forma.elements[i].type != "button"){
      SA(forma.elements[i], "LKD", "true");
      SA(forma.elements[i], "disabled", "true");
      forma.elements[i].className = "inputLocked";
    }
  }
}

function deshabilitaPK(arrIdPk){
  for(var i = 0; i < arrIdPk.length; i++) { 
    SA(GI(arrIdPk[i]), "LKD", "true");
    SA(GI(arrIdPk[i]), "disabled", "true");
    GI(arrIdPk[i]).className = "inputLocked";
  }
}
function habilitaPK(arrIdPk){
  for(var i = 0; i < arrIdPk.length; i++) { 
    RA(GI(arrIdPk[i]), "LKD");
    RA(GI(arrIdPk[i]), "disabled");
    RA(GI(arrIdPk[i]), "className");
  }
}
function verificaCombos(strCombos){
  var arrCombos = strCombos.split(",");
  for(var i = 0;i < arrCombos.length; i++)
    if(GI(arrCombos[i]).selectedIndex < 0)
      GI(arrCombos[i]).options[0].selected = true;
}

function cargaRadios(radios){
  var arrRadios = radios.split(",");
  for(var i = 0; i < arrRadios.length; i++) {
    var objRadio = GI(arrRadios[i]);
    if(objRadio.value != "0")
      objRadio.checked=true;
  }
}

function asignaValueRadio(objRadio,objRadio2){
  if(objRadio.checked == true){
    objRadio.value = "1";
    objRadio2.value = "0";
  }
}

function asignaValueRadio2Master(radioMaster,objRadioValue){
  var objRadioMaster = GI(radioMaster);
  objRadioMaster.value = objRadioValue.value;
  if(objRadioMaster.id == objRadioValue.id)
    objRadioMaster.value = objRadioMaster.value2;
}

function cargaRadiosConMaster(radioMaster,radios){//el primer param es el master y el segundo son todos los radios (menos el master)
  var objRadioMaster = GI(radioMaster);
  var arrRadios = radios.split(",");
  var ban = 0;
  for(var i = 0; i < arrRadios.length; i++) {
    var objRadio = GI(arrRadios[i]);
    if(objRadioMaster.value == objRadio.value){
      objRadio.checked = true;
      ban = 1;
    }
  }
  if(objRadioMaster.value == objRadioMaster.value2)
    objRadioMaster.checked = true;
}

function cargaChecks(checks){
  var arrChecks = checks.split(",");
  for(var i = 0; i < arrChecks.length; i++) {
    var objCheck = GI(arrChecks[i]);
    if(objCheck.value == "1"){
      objCheck.checked = true
    }
  }
}

function asignaValue2Check(objCheck){
  if(objCheck.checked == true)
    objCheck.value = "1";
  else
    objCheck.value = "0";
}

function ocultaObj(strObj){
  GI(strObj).style.visibility = "hidden";
}
  
function muestraObj(strObj){
  GI(strObj).style.visibility = "visible";
}

function ocultaObjs(strArrObj){
  for(var i = 0; i < strArrObj.split(",").length; i++)
    ocultaObj(strArrObj.split(",")[i]);
}
  
function muestraObjs(strArrObj){
  for(var i = 0; i < strArrObj.split(",").length; i++)
    muestraObj(strArrObj.split(",")[i]);
}

function asignaEtiqueta(strObj,msg){
  GI(strObj).innerHTML = msg;
}

function loadTableElementSpecial(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  var keys = GA(objTabla, "keys");
  if(!isDefinedAndNotNull(keys))
    keys = "";
  loadTable(objTabla, jsonArray, arWidth, keys, null, false);
  hideWaitLayer();
}

function generaParametros(camposReales,camposValidar){
  var paramAux = "";
  var arrCamposReales = camposReales.split(",");
  var arrCamposValidar = camposValidar.split(",");
  for(var i = 0;i < arrCamposReales.length; i++)
      paramAux += "\"" + arrCamposReales[i] + "\":" + GI(arrCamposValidar[i]).value + ",";
  paramAux = paramAux.substring(0,paramAux.length-1);
  return paramAux;
}

function generaArrObj(arrId){
  var arrObjTmp = new Array();
  for(i = 0; i < arrId.length; i++){
    arrObjTmp[i] = new Object();
    arrObjTmp[i].value = GI(arrId[i]).value;
  }
  return arrObjTmp;
}

function asignaValores2HTMLOfArrIdObjs(arrId,arrObjs){
  for(i = 0; i < arrId.length; i++)
    GI(arrId[i]).value = arrObjs[i].value
}

function limpiaCombos(strCombos){
  var arrCombos = strCombos.split(",");
  for(var i = 0; i < arrCombos.length ; i++)
    GI(arrCombos[i]).selectedIndex = 0;
}
function borraCombos(strCombos){
  var arrCombos = strCombos.split(",");
  for(var i = 0; i < arrCombos.length ; i++)
    GI(arrCombos[i]).options.length = 1;
}
function borraCombosSinSeleccione(strCombos){
  var arrCombos = strCombos.split(",");
  for(var i = 0; i < arrCombos.length ; i++)
    GI(arrCombos[i]).options.length = 0;
}
function limpiaTxts(strTxts){
  var arrTxts = strTxts.split(",");
  for(var i = 0; i < arrTxts.length ; i++)
    GI(arrTxts[i]).value = "";
}
function limpiaDivs(strDivs){
  var arrDivs = strDivs.split(",");
  for(var i = 0; i < arrDivs.length ; i++)
    GI(arrDivs[i]).innerHTML = "";
}

function loadTxtElementX(obj, result){
  var objeto = JSON.parse(result)[0];
  var value = GA(obj, "theValue");
  if(isDefinedAndNotNull(objeto)){
    obj.value = eval("objeto." + value);
  }else{
    obj.value = "";
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
function RA(el, atrrName)
{
	try { el.removeAttribute(atrrName); return true; } catch(e) { return false; }
}
var idObjNumFideicomiso;
function consultaNombreFideicomiso(strDivFideicomiso,objNumFideicomiso){
  showWaitLayer();
  var objDivFideicomiso = GI(strDivFideicomiso);
  var numFideicomiso = objNumFideicomiso.value;
  if(objNumFideicomiso.value != ""){
    idObjNumFideicomiso = objNumFideicomiso.id;
    divNombreFideicomisoParam = JSON.parse("{\"numFideicomiso\":" + numFideicomiso + "}");
    loadElement(objDivFideicomiso);
  }else {
    asignaEtiqueta(strDivFideicomiso,"");
    hideWaitLayer();
  }
}
function asignaValor2DivFideicomiso(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.innerHTML = objeto.nombre;
    var value = GA(obj, "theValue");
    if(isDefinedAndNotNull(value)){
      obj.value = eval("objeto." + value);
    }
  }else{
    GI(idObjNumFideicomiso).value = "";
    alert("El Fideicomiso no existe");
    obj.innerHTML = "";
  }
  /**** probar, si no ignorar******/
  var nextElement = GA(obj, "next");
  if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
  /**** probar, si no ignorar******/
  hideWaitLayer();
}



function asignaValor2DivFideicomisoCtasIndiv(obj, result){
  var objeto = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objeto)){
    obj.innerHTML = objeto.nombre;
    var value = GA(obj, "theValue");
    if(isDefinedAndNotNull(value)){
      obj.value = eval("objeto." + value);
    }
  }else{
    GI(idObjNumFideicomiso).value = "";
    alert("No has seleccionado ningun Fideicomiso");
    obj.innerHTML = "";
  }
  /**** probar, si no ignorar******/
  var nextElement = GA(obj, "next");
  if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
  /**** probar, si no ignorar******/
  hideWaitLayer();
}



function nextDivFunction(obj){ 
    var nextElement = GA(obj, "next");
    if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
  /**** probar, si no ignorar******/
  hideWaitLayer();
}

function addTableElement(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  addTable(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), GA(objTabla, "fun"), true);
  hideWaitLayer();
}
function addTable(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio) {
  var tbody = table.lastChild;
  var tipoRenglon = 1;
  //while(tbody.hasChildNodes())
  //  tbody.removeChild(tbody.lastChild);
  for(var i = 0; i < dataArray.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    var valorItem = "";
    
    if(createRadio ) {
      var tdRadioWidth = GA(table, "radioWidth");
      var colRadio = createElement("td", fila);
      var radio = createElement("<input type='radio' name='" + table.id + "Rdo" + "'/>", colRadio);
      radio.className = "radio";
      if(isDefinedAndNotNull(tdRadioWidth)) colRadio.width = tdRadioWidth;
    }
    
    for(var j = 0; j < fieldsArray.length; j++) {
      var fieldInfo = fieldsArray[j].split(",");
      var fieldWidth = "";
      if(fieldInfo.length == 2) fieldWidth = ""+fieldInfo[1];
      
      for(k in item) {
        if(fieldInfo[0] == String(k)) {
          var col = createElement("td", fila);
          col.innerHTML = ""+item[k];
          if(fieldWidth != "") col.width = fieldWidth;        
        }
      }
    }
    
    for(k in item) {
      var kName = String(k);
      if(keyValue.indexOf(kName) != -1) {
        if(typeof(item[k]) == "number")
          valorItem += "\"" + kName + "\":" + item[k] + ",";
        else
          valorItem += "\"" + kName + "\":\"" + item[k] + "\",";
      }
    }
    
    valorItem = valorItem.substring(0, valorItem.length - 1);
    SA(fila, "valorItem", valorItem);
    fila.className = "renglon" + tipoRenglon;
    fila.onmouseover = function() { cambiaColorFila(this); }
    fila.onmouseout = function() { cambiaColorFila(this); }
    fila.onclick = function() { 
      try { this.firstChild.firstChild.checked = true; } catch(ex) {}
      var fun = eval(nombreFuncion);
      if(isDefinedAndNotNull(fun))
        fun(JSON.parse("{"+GA(this, "valorItem")+"}"));
    }
    SA(fila, "colorOriginal", fila.className);
    
    if(tipoRenglon == 1)
      tipoRenglon = 2;
    else
      tipoRenglon = 1;    
  }
}

function verificaFechaLiq(objFecha, objFecLiq) // valida fechas de liquidación
{
  showWaitLayer();
  var fecha = objFecha.value;
  var fechaLiq = objFecLiq.value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFechaLiq\",\"Fecha\":\"" + fecha + "\",\"FechaLiq\":\"" + fechaLiq + "\"}";
  makeAjaxRequest(url, "HTML", validaFecha, objFecLiq);
}

function verificaFecha(objFecha){
  showWaitLayer();
  var fecha = objFecha.value;
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunValidaFecha\",\"Fecha\":\"" + fecha + "\"}";
  makeAjaxRequest(url, "HTML", validaFecha, objFecha);
}

function validaFecha(obj, result){
  var resultado = JSON.parse(result)[0];
  switch(resultado){
    case 0:
    case 1:
      //if(GI("txtFechaValor").value.split("/")[1] == GI("txtFechaContable").value.split("/")[1]){
      if(obj.value.split("/")[1] == GI("txtFechaContable").value.split("/")[1]){
        GI("txtMesAbierto").value = 0;
      }
      else{
        GI("txtMesAbierto").value = 1;
      }
    break;
    break;
    case 2:
      alert("La Fecha seleccionada corresponde un día no hábil");
      obj.focus();
    break;
    case 3:
      alert("La Fecha seleccionada corresponde a un día feriado");
      obj.focus();
    break;
    case 4:
      alert("Error al defasar la Fecha contable un mes");
      obj.focus();
    break;
    case 5:
      alert("El mes seleccionado se encuentra cerrado");
      obj.focus();
    break;
    case 6:
      alert("Solo se permiten movimientos del mes actual o del mes anterior");
      obj.focus();
    case 7:
      alert("La fecha de Liquidación no puede ser menor");
      obj.focus();
    break;
    case -1:
      alert("Error al verificar la Fecha seleccionada");
      obj.focus();
    break;
  }
  hideWaitLayer();
}

function addComboElement(obj, result){
  var arrValues = JSON.parse(result);
  var key = GA(obj, "keyValue");
  var value = GA(obj, "theValue"); 
  addCombo(obj, arrValues, key, value);
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

function addCombo(combo, arreglo, llave, valor) {  
  combo.options.length = combo.options.length + 1;
  try {
    for(var i = combo.options.length - 1; i < combo.options.length; i++) {
      var itemArreglo = arreglo[(i-(combo.options.length-1))];
      combo.options[i].value = eval("itemArreglo." + llave);
      combo.options[i].text = eval("itemArreglo." + valor); 
      
      
    }
  } catch(ex) { 
  }
}

function consultarSpecial(btn, frm, param){
  var parametros = param;
  eval("parametros.id=\"" + GA(btn, "ref") + "\"")
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(parametros);
  var m = GA(btn, "fun"); // Nombre de la funcion a ejecutar
  var fun = isDefinedAndNotNull(m) ? eval(m) : null;
  showWaitLayer();
  makeAjaxRequest(url, "HTML", fun, GI(GA(btn, "tabla")));
}

function eliminaSeleccione(objCombo){
  for(var i = 0;i <= objCombo.length - 2; i++){
    objCombo.options[i].value = objCombo.options[i+1].value;
    objCombo.options[i].text = objCombo.options[i+1].text;
  }
  objCombo.options.length = objCombo.options.length - 1;
}

function validaLongitud(obj,longitud){
  if(obj.value.length >= longitud)
    obj.value = obj.value.substring(0,obj.value.length - 1);
}
function formatString(strFormatear,strCaracter,numCaracteres,sentido){
  var strAux = "";
  if(strFormatear.length < numCaracteres){
    for(var i = 0; i < numCaracteres - strFormatear.length; i++)
      strAux += strCaracter;
  }
  if(sentido == "Derecha")
    strAux = strFormatear + strAux;
  else
    strAux += strFormatear;
  return strAux;
}
function resetTable(objTable){
  var radios = document.getElementsByName(objTable.id + "Rdo"); 
  for (var i = 0; i < radios.length; i++)
    radios[i].checked = false;
}

function consultarDo(btn, frm, reqParam) {
  var parametros = getParameters(frm);
  if(reqParam && JSON.stringify(parametros) == "{}") {
    // TODO: Cambiar de alert a el mensaje de la aplicacion
    alert("Se requiere que almenos se especifique un parametro");
    return;
  }
  eval("parametros.id=\"" + GA(btn, "ref") + "\"")
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(parametros);
  var m = GA(btn, "fun"); // Nombre de la funcion a ejecutar
  var fun = isDefinedAndNotNull(m) ? eval(m) : null;
  showWaitLayer();
  makeAjaxRequest(url, "HTML", fun, GI(GA(btn, "tabla")));
}

function loadElementDo(e) {
  var q = GA(e, "ref"); // Referencia del Query a ejecutar
  var m = GA(e, "fun"); // Nombre de la funcion a ejecutar
  var a = GA(e, "loc"); // Indica si la referencia es local o remota
  var p = GA(e, "param"); // Variable con los parametros adicionales para el, los combos
  if(isDefinedAndNotNull(q)) {
    var fun = isDefinedAndNotNull(m) ? eval(m) : null;
    if(!isDefinedAndNotNull(a)) {
      var url = ctxRoot;
      if(!isDefinedAndNotNull(p))
        url += "/getRef.do?json={\"id\":\"" + q + "\"}";
      else {
        var objParam = eval(p);
        eval("objParam.id=\"" + q + "\"");
        url += "/doRef.do?json=" + JSON.stringify(objParam);
      }
      makeAjaxRequest(url, "HTML", fun, e);
    } else {
      fun(); // Se ejecuta la funcion en lugar de ir al server
    }
    return true;
  }
  
  return false;
}
function loadComboElementDo(obj, result) {
  var arrValues = JSON.parse(result);
  if(isDefinedAndNotNull(arrValues.tipoError))
    result="[]";
  loadComboElement(obj, result);
}


var objParameters = null;
var objButtonConsultar = null;

function consultarSaveParameters(objButton, objFrm, opc){
  consultarCount(objButton, objFrm, opc);
  objParameters = getParameters(objFrm);
  objButtonConsultar = objButton.id;
}

function setParameters(obj) {
  try{
    for(i in obj) {
      var elemento = GI("param" + i);
      if(isDefinedAndNotNull(elemento)) {
        if(elemento.type == "checkbox"){
          elemento.value = obj[i];
          elemento.click();
        } else {
          elemento.value = obj[i];
        }
      }
    }  
  }catch(e){
      alert("Objeto: " + i + " Error: "  + JSON.stringify(e));
  }
}

function borraTabla(objTable){
  var tbody = objTable.lastChild;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);
}

function formateaCantidades(strId){
  for(var i = 0; i < strId.split(",").length; i++)
    convertToMoneyById(strId.split(",")[i]);
}

function asignaSecuencial(objSecuencial,objSecuencialParam){
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objSecuencialParam);
  makeAjaxRequest(url, "HTML", asignaValorSecuencial, objSecuencial);
}

function asignaValorSecuencial(obj, result){
  var resultado = JSON.parse(result)[0];
  obj.value = resultado.numSecuencial;
  hideWaitLayer();
}
function consultarCount(btn, frm, reqParam) {
 
  var parametros = getParameters(frm);
  if(reqParam && JSON.stringify(parametros) == "{}") {
    alert("Se requiere que almenos se especifique un parametro");
    return;
  }
  parametros.id = GA(btn, "ref") + "Count";
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(parametros);
  var arrBtnFrmReqParam = new Array();
  arrBtnFrmReqParam[0] = btn;
  arrBtnFrmReqParam[1] = frm;
  arrBtnFrmReqParam[2] = reqParam;
  makeAjaxRequest(url, "HTML", verificaConsultarCount, arrBtnFrmReqParam);
}

function verificaConsultarCount(obj, result){

  var dataLength = JSON.parse(result)[0];
  if(dataLength.length > 250){
    if(confirm("La Consulta con estos criterios recuperará " + dataLength.length + " registros y podrá tardarse. ¿Desea continuar?"))
      {
      showWaitLayer();
      consultar(obj[0], obj[1], obj[2]);
       hideWaitLayer();
      }
  }else
      {
       showWaitLayer();
       consultar(obj[0], obj[1], obj[2]);
        hideWaitLayer();
      }
 
}

function saveInnerHTML(idObjInnerHTML){
  strSaveInnerHTML = GI(idObjInnerHTML).innerHTML;
}

function setSaveInnerHTML(idObjInnerHTML){
  GI(idObjInnerHTML).innerHTML = "";
  GI(idObjInnerHTML).innerHTML = strSaveInnerHTML;
}

var strSaveInnerHTML = "";
var cmbStatusParam = JSON.parse("{\"Indice\":500,\"orderDescripcion\":\"S\"}");
//***********************************************************