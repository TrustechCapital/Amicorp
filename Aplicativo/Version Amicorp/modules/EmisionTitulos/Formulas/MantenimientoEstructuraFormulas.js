var cmbLoadParam520 = JSON.parse("{\"Indice\":520,\"orderDescripcion\":\"s\"}");
var cmbLoadParam521 = JSON.parse("{\"Indice\":521,\"orderDescripcion\":\"s\"}");
var cmbLoadParam522 = JSON.parse("{\"Indice\":522,\"orderDescripcion\":\"s\"}");

var numFormula = -1;
var tipoFormula = -1;
var formula = "";

var strIdPK2 = "efrdIdFormula,efrdIdClasific";
var arrIdPK2 = strIdPK2.split(",");

function cargaMantenimientoEstructuraFormula(objNumFormula,objTipoFormula,objFormula) {
  numFormula = objNumFormula.value;
  tipoFormula = objTipoFormula.value;
  formula = objFormula.value;
  
  showWaitLayer();
  var urlCliente = "modules/EmisionTitulos/Formulas/MantenimientoEstructuraFormulas.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoEstructuraFormulas, null);
}

function despliegaPantallaMantenimientoEstructuraFormulas(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
}
function asignaValues2ObjHTML2(){
  eliminaSeleccione(GI("cmbTerminos"));
  eliminaSeleccione(GI("cmbOperadores"));
  deshabilitaPK(arrIdPK2);
  
  GI("efrdIdFormula").value = numFormula;
  GI("efrdIdClasific").value = tipoFormula;
  GI("txtFormula").value = formula;
  
  formsLoaded();
}

function selTerminoOperador(objComboActual) {
  if(objComboActual.name=="cmbTerminos")
    GI("cmbOperadores").selectedIndex = -1;
  else if(objComboActual.name=="cmbOperadores")
    GI("cmbTerminos").selectedIndex = -1;
}


//////////////////////////////////////////////////////////////////////
//Funciones para Agregar y Quitar Términos y Operadores a txtFormula
function agregarDatosFormula(objCmb1, objCmb2) {
  showWaitLayer();
  var objCmbOrigen = null;
  if(objCmb1.selectedIndex != -1)
    objCmbOrigen = objCmb1;
  else if(objCmb2.selectedIndex != -1)
    objCmbOrigen = objCmb2;
  
  if(objCmbOrigen != null) {
    if(GI("txtFormula").value == "")
      GI("txtFormula").value = objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
    else
      GI("txtFormula").value = GI("txtFormula").value + " " + objCmbOrigen.options[objCmbOrigen.selectedIndex].text;
  }
  else
    alert("Efectúe alguna selección");
  hideWaitLayer();
}

function quitarDatosFormula(cadFormula){
  showWaitLayer();
  if(cadFormula.length > 0)
  {
    var arrForDet = cadFormula.split(" ");
    GI("txtFormula").value = "";
    
    for(var i=0; i < (arrForDet.length-1); i++)
    {
      if(GI("txtFormula").value == "")
        GI("txtFormula").value = arrForDet[i];
      else
        GI("txtFormula").value = GI("txtFormula").value + " " + arrForDet[i];
    }
  }
  else
    alert("Ya no hay elementos en la Fórmula");
  hideWaitLayer();
}


//////////////////////////////////////////////////////////////////////
//Funciones para Guardar la nueva Fórmula
function nuevaFormula(cadFormula) {
  showWaitLayer();
  var url = ctxRoot + "/doRef.do?json={\"id\":\"delETForDet\",\"TipoFormula\":" + eval(GI("efrdIdClasific").value) + ",\"NoFormula\":" + eval(GI("efrdIdFormula").value) + "}";
  makeAjaxRequest(url, "HTML", validaNuevaFormula, cadFormula);
}

function validaNuevaFormula(obj, result) {
  if(obj.length > 0)
  {
    var nomTermino = obj.split(" ");
    var tipoDato = null;
    var url = null;
    
    for(var secuencial = 1; secuencial <= nomTermino.length; secuencial++)
    {
      tipoDato = isTipoDeDato(nomTermino[secuencial-1]);
      var objElementoParam = JSON.parse("{}");
      objElementoParam.id = "insETForDet";
      objElementoParam.TipoFormula = GI("efrdIdClasific").value;
      objElementoParam.NoFormula = GI("efrdIdFormula").value;
      objElementoParam.IdTermino = secuencial;
      objElementoParam.NumElemento = secuencial;
      objElementoParam.NomTermino = nomTermino[secuencial-1];
      objElementoParam.TipoDato = tipoDato;
      url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objElementoParam);
      makeAjaxRequest(url, "HTML", verificaInsercionElementos, secuencial + "==" + nomTermino.length);
    }
  }
  else
  {
    cargaMantenimientoFormulas(modo);
    hideWaitLayer();
  }
}

function verificaInsercionElementos(obj, result) {
  if(eval(obj)) {
    alert("Operacion realizada exitosamente!");
    cargaMantenimientoFormulas(modo);
    hideWaitLayer();
  }
}

function isTipoDeDato(strElem) {
  for(var i = 0; i < GI("cmbTerminos").options.length; i++){
    if(GI("cmbTerminos").options[i].text == strElem)
      return 1;
  }
  return 2;
}
