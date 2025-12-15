function cargaPrincipalEntesConceptosContInst(){
  showWaitLayer();
  var urlCliente = "modules/Contabilidad/Conceptos/PrincipalEntesConceptosContInst.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalEntesConceptosContIns, null);
}

function despliegaPantallaPrincipalEntesConceptosContIns(obj, result){
  GI("dvContenido").innerHTML = result;
  hideWaitLayer();
  loadDynamicJS(ctxRoot + "/modules/Contabilidad/Conceptos/PrincipalEntesConceptosContInst.js");
}