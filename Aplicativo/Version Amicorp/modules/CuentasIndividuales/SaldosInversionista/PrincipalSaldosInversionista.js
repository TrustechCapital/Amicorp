showWaitLayer();

var tablaSaldosInversionistaData = new Array();
tablaSaldosInversionistaData[0] = "datDato,360";
tablaSaldosInversionistaData[1] = "salInicial,100";
tablaSaldosInversionistaData[2] = "salImpDep,90";
tablaSaldosInversionistaData[3] = "salImpRet,82";
tablaSaldosInversionistaData[4] = "salImporte,92";
tablaSaldosInversionistaData[5] = "salNumDep,104";
tablaSaldosInversionistaData[6] = "salNumRet,50";
//tablaSaldosInversionistaData[7] = "datClave,80";

pkInfo = null;
var fvPrincipalSaldosInv = new FormValidator();
var divNombreFideicomisoParam;
var nivel = 1;
var numContrato = GI("paramFideicomiso").value;
GI("paramFideicomiso").value = numContrato;
consultaNombreFideicomiso("nomFideicomiso",GI("paramFideicomiso"));
deshabilitaPK("paramFideicomiso".split(","));

//Agregando la funcionalidad del required
fvPrincipalSaldosInv.setup({
  formName      : "frmPrincipalSaldosInversionista",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cargaPrincipalSaldosInversionista() {
  onButtonClickPestania("CuentasIndividuales.SaldosInversionista.PrincipalSaldosInversionista","");
}

function botonAceptar() {
  if(fvPrincipalSaldosInv.checkForm())
    consultar(GI("Aceptar"), GI("frmPrincipalSaldosInversionista"), false);
}

function asignaNivel(){
  divNombreFideicomisoParam.numNivel = nivel;
  loadElement(eval(GI("txtLonNiv" + nivel)));
  nivel++;
}

function loadTableElementSpecialInversionista(objTabla, result){
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  
  loadTableInversionista(objTabla, jsonArray, arWidth, "", null, false);
  hideWaitLayer();
}

function loadTableInversionista(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio) {
  var tbody = table.lastChild;
  var tipoRenglon = 1;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);

  for(var i = 0; i < dataArray.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    var valorItem = "";
    
    item.datDato=item.datClave.substring(0,eval(GI("txtLonNiv1").value))+" - "+item.datClave.substring(eval(GI("txtLonNiv1").value),eval(GI("txtLonNiv1").value)+eval(GI("txtLonNiv2").value))+
      " - "+item.datClave.substring(eval(GI("txtLonNiv1").value)+eval(GI("txtLonNiv2").value),eval(GI("txtLonNiv1").value)+eval(GI("txtLonNiv2").value)+eval(GI("txtLonNiv3").value))+"   "+item.datDato;
    
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


function reedireccionar(){
var validaRadio = JSON.parse("{\"id\":\"refer\",\"Fideicomiso\":0}");
    validaRadio.Fideicomiso = GI("paramFideicomiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validaRadio);
    makeAjaxRequest(url, "HTML", resultrefer, null);
    obtenerFechaContable();
    
  
}

function resultrefer(obj, result) {
   var objResult = JSON.parse(result);
  if(objResult[0].fisoSeleccionado!=1){
      onButtonClickPestania("CuentasIndividuales.CuentasIndividuales.PrincipalFideicomisosCuentasIndividuales","");
      loadDynamicJS(ctxRoot + "/modules/CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales.js");
      //hideWaitLayer();
      
  }
  else
    nextDivFunction(GI("divReedireccion"));
    hideWaitLayer();
} 