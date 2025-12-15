var fvCat = new FormValidator();
var modo = 0;
pkInfo = null;
var resultado;

var arrTblDat = new Array();
//funcion que destaza tabla archivos planos
function loadTableElementEmision(objTabla, result) {

  var jsonArray = JSON.parse(result);
  if(jsonArray=="")
  {
      alert("La consulta no trajó resultados. Realice el cálculo primero.");
      hideWaitLayer();
      return;
  }
  
  var cadenaEncabezado = "<table id='cabecera' border='0' cellpadding='0' cellspacing='0'><tr class='cabeceras' align='left'><td align=center width=23 nowrap>&nbsp;</td>";
  var columnas = jsonArray[0].arpDescripcion.split(";");

  
  var ancho = 23;// variable ancho de la tabla
  for(s=0;s<columnas.length;s++)//se separan los encabezados
  {
    cadenaEncabezado = cadenaEncabezado+"<td width="+columnas[s].length*9+" align=center>"+columnas[s]+"</td>";
    arrTblDat[s] = "arpDescripcion,"+columnas[s].length*9+"px";
    ancho = ancho+(columnas[s].length*9);
  }
  
  cadenaEncabezado = cadenaEncabezado+"</tr></table>";
  GI("encabezados").innerHTML = cadenaEncabezado;
  GI("cabecera").style.width = ancho;
  objTabla.style.width = ancho;
  
  var arWidth = eval(GA(objTabla, "dataInfo"));
  var jsonArrayNew = new Array();
  
  for(s=1;s<jsonArray.length;s++)//se quita el encabezado del arreglo
    jsonArrayNew[s-1] = jsonArray[s];
    
  loadTableEmision(objTabla, jsonArrayNew, arWidth, GA(objTabla, "keys"), GA(objTabla, "fun"), true,ancho);
  hideWaitLayer();
}

function loadTableEmision(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio,ancho) {

  var tbody = table.lastChild;
  var tipoRenglon = 1;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);
  
  if(dataArray.length <= 0) {
    var mensajeNoRecords = GA(table, "NoRecordsMsg");
    var funNoRecords = GA(table, "NoRecordsFun");
    
    if(isDefinedAndNotNull(funNoRecords))
      try { eval(funNoRecords + "();"); } catch(ex) {}

    if(isDefinedAndNotNull(mensajeNoRecords))
      alert(mensajeNoRecords);
  }
  
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
      //if(fieldInfo.length == 2)
        fieldWidth = ""+fieldInfo[1];
      
      for(k in item) {
        if(fieldInfo[0] == String(k)) {
          var col = createElement("td", fila);
          
          if(fieldInfo.length == 3)
            SA(col,"align","right");
          col.innerHTML = ""+item[k].split(";")[j];
          if(col.innerHTML == "null") col.innerHTML="";    
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
    
    fila.ondblclick = function() {
      this.click();
      var funDblClick = GA(table, "DblClickFun");
      if(isDefinedAndNotNull(funDblClick))
        try { eval(funDblClick+"();"); } catch(ex) {}
      else {
        var inputs = document.getElementsByTagName("input");
        for(var j = 0; j < inputs.length; j++) {
          if(inputs[j].type.toUpperCase() != "BUTTON") continue;
          if(trim(inputs[j].value.toUpperCase()) == "CONSULTAR") {
            inputs[j].click();
            break;
          }
        }
      }
    }
    
    SA(fila, "colorOriginal", fila.className);
    
    if(tipoRenglon == 1)
      tipoRenglon = 2;
    else
      tipoRenglon = 1;    
  }
}

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

//aun no usamos lo de abajo!!

var usarSetValuesFormObject = true;
var comboDestino = null;

var objEncabezados = null;
var numTab = null;
var valorCmbSeleccionado = 0;


function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
}

function clickTabla(pk){
  pkInfo = pk;
}

function consultaCal()
{
  if(fvCat.checkForm())
    consultar(GI('cmdAceptar'), GI('frmDatos'), false);

}

function ejecutaFuncion() {
  
    //consultar(GI('cmdAceptar'), GI('frmDatos'), false);
  
    var objParametros = JSON.parse("{}");
    objParametros.id = "emision.ejeFunDetCalendario";
    objParametros.Programa = GI("paramNumPrograma").value;
    objParametros.Emision = GI("paramNumEmision");
    objParametros.Fideicomiso = GI("paramNumFiso");
    objParametros.TipoCalculo = pkInfo.eereTipoCalculo;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    //alert(url);
    makeAjaxRequest(url, "HTML", cargaMantenimientoCalendarioPagos, null);
}



function cargaMantenimientoCalendarioPagos(obj, result){
  //alert(result);
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
        var urlCliente = "modules/EmisionTitulos/CalendarioPagos/MantenimientoCalendario.do";
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
  //alert("asignaDatosCalendarioPagos: " + result);
  resultado = JSON.parse(result)[0];
  //resultado = JSON.parse("[{\"ecalIdPrograma\":1,\"eemiNomEmisor\":\"GOBIERNO FEDERAL S.H.C.P.\",\"ecalIdEmision\":1,\"ctoNumContrato\":567,\"eemiCvePizarra\":\"PIZARRA\",\"eemiNumSerie\":\"SERIE\"}]")[0];
  //resultado.eepcIdTipoCalculo = 1;
  //***************************  
  //setValuesFormObject(resultado);
  
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
    alert(result);
    resultado = JSON.parse(result);
    alert(resultado);
    var cabeceras = resultado[0].arpDescripcion;
    var propiedades = resultado[0].arpDescripcion;
    //alert("2");
    while(propiedades.indexOf(" ")!= -1)
      propiedades = propiedades.replace(" ","");
    while(propiedades.indexOf(";")!= -1)
      propiedades = propiedades.replace(";",",");
    
    for(var i = 0; i < propiedades.split(",").length; i++)
      arrTblDat[i] = propiedades.split(",")[i] + ",100px";
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
      col.innerHTML = item;
      //if(fieldWidth != "")
      col.width = 100;      
    }
    //****************** fin carga cabeceras
    loadTable(GI("tblReg"), jsonArray, arrTblDat, propiedades, clickTabla2, true);
    hideWaitLayer();
  
  
  }catch(e){
    alert("error catch: "+e.message);
  }

}


////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Fideicomisos luego de haber elegido alguna opción del combo Programa
function cargaComboFideicomiso(objComboOrigen,objComboDestino,booleano,ValorCmbSeleccionado){
  if(objComboOrigen.name == "eemiIdPrograma")
    borraCombos("eemiIdFideicomiso,eemiNomEmisor");
  else if (objComboOrigen.name == "eemiIdFideicomiso")
    borraCombos("eemiNomEmisor");
  
  usarSetValuesFormObject = booleano;
  valorCmbSeleccionado = ValorCmbSeleccionado;
  paramCmbProg = JSON.parse("{\"NumPrograma\": " + objComboOrigen.value + ",\"order\":\"s\",\"NumFideicomiso\": " + objComboOrigen.value + "}");
  
  if(objComboOrigen.name == "paramNumPrograma")
    borraCombos("paramNumEmision,paramNumFiso");
  if(objComboOrigen.name == "paramNumFiso")
    paramCmbProg = JSON.parse("{\"NumPrograma\": " + GI("paramNumPrograma").value + ",\"order\":\"s\",\"NumFideicomiso\": " + objComboOrigen.value + "}");
  
  comboDestino = objComboDestino;
  SA(objComboDestino,"next","asignaFideicomiso");
  loadElement(objComboDestino);
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
  //alert(result);
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
    case 3: if(fvCat.checkForm()) {
              showWaitLayer();
              var objParametros = JSON.parse("{}");
              objParametros.id = "emision.ejeFunImpresionAvisos";
              eval("objParametros.Programa = " + eval(vgprograma));
              eval("objParametros.Emision = " + eval(vgemision));
              eval("objParametros.Fideicomiso = " + eval(vgfideicomiso));
              eval("objParametros.Periodo = "+eval(GI("ecalPeriodo").value) );
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
