
var param535 = JSON.parse("{\"Indice\":535,\"order\":\"s\"}");

function despliegaPantallaPrincipalGastosPeriodo(){ 
  GI("dvTitulo").innerHTML = "Gastos Periodo";
  GI("paramPrograma").id = "ecpaIdPrograma";
  GI("paramFideicomiso").id = "ecpaIdFideicomiso";
  GI("paramEmision").id = "ecpaIdEmision";
  GI("paramReporte").id = "ecpaIdPeriodo";
  cat4.getCatalogo().ecpaIdPrograma = pkInfo3.ecedIdPrograma;
  cat4.getCatalogo().ecpaIdFideicomiso = pkInfo3.ecedIdFideicomiso;
  cat4.getCatalogo().ecpaIdEmision = 0;//pkInfo3.ecedIdEmision;
  cat4.getCatalogo().ecpaIdPeriodo = pkInfo3.ecedIdPeriodo;
  
   initForms();
  
  asignaValues2ObjHTMLGastosPeriodo();
}

function asignaValues2ObjHTMLGastosPeriodo(){
      loadElement(GI("ecpaIdSecPago"));
  if(isDefinedAndNotNull(pkInfo3) && modo != OPER_ALTA){
    cat4.setOnUpdate(terminoCargaPantalla);
    cat4.buscaCatalogoPK(false);
  }else {

    formsLoaded();
  }
}

function terminoCargaPantalla()
{
  formatoComasMonto('ecpaImpHonorario');
  formsLoaded();
}

function ejecutaOperacionGastosPeriodo()
{
  limpiaComasMonto('ecpaImpHonorario');

  if(fvCat.checkForm()){
    cat4.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
         asignaDescConcepto(GI('ecpaIdSecPago'),GI('ecpaConcepto'));
        cat4.altaCatalogo();
      break;
      case OPER_MODIFICAR:
        cat4.modificaCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  alert("Operacion realizada exitosamente!");
  cargaDetalleReporteDistribucion(2);
  hideWaitLayer();
}


// concepto unico ----------------------

function existeConceptoRepDist(objSec)
{
    var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "emision.asiETValSecGasPer";
    objSecuencialParam.Programa = GI("ecpaIdPrograma").value;
    objSecuencialParam.Fideicomiso = GI("ecpaIdFideicomiso").value;
    objSecuencialParam.Emision = GI("ecpaIdEmision").value;
    objSecuencialParam.Periodo = GI("ecpaIdPeriodo").value;
    objSecuencialParam.Secuencial = objSec.value;
    
    var url = ctxRoot +"/getRef.do?json="+JSON.stringify(objSecuencialParam);
    makeAjaxRequest(url,"html",existeConceptoRepDistRes,objSec);
} 


function  existeConceptoRepDistRes(obj,result)
{
   var res = JSON.parse(result)[0];
   if(res.existe>0)
   {
         alert("¡Ya existe Concepto!");
         obj.selectedIndex=0;
   }
}