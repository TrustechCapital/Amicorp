var param541 = JSON.parse("{\"Indice\":541,\"order\":\"s\"}");


function despliegaPantallaPrincipalEstadisticaMorosidad(){ 
  GI("dvTitulo").innerHTML = "Estadística de Morosidad";
  GI("paramPrograma").id = "ecmoIdPrograma";
  GI("paramFideicomiso").id = "ecmoIdFideicomiso";
  GI("paramEmision").id = "ecmoIdEmision";
  GI("paramReporte").id = "ecmoIdPeriodo";
  cat2.getCatalogo().ecmoIdPrograma = pkInfo3.ecedIdPrograma;
  cat2.getCatalogo().ecmoIdFideicomiso = pkInfo3.ecedIdFideicomiso;
  cat2.getCatalogo().ecmoIdEmision = 0;//pkInfo3.ecedIdEmision;
  cat2.getCatalogo().ecmoIdPeriodo = pkInfo3.ecedIdPeriodo;
  
  initForms();
  
  asignaValues2ObjHTMLEstadisticaMorosidad();
}

function asignaValues2ObjHTMLEstadisticaMorosidad(){
      loadElement(GI("ecmoIdSecMor"));
  if(isDefinedAndNotNull(pkInfo3) && modo != OPER_ALTA){
    cat2.setOnUpdate(terminoCargaPantalla);
    cat2.buscaCatalogoPK(false);
  }else {

    formsLoaded();
  }
}

function terminoCargaPantalla()
{
  formatoComasMonto('ecmoImpSaldo');
  formsLoaded();
}

function ejecutaOperacionEstadisticaMorosidad()
{
  limpiaComasMonto('ecmoImpSaldo');

  if(fvCat.checkForm()){
    cat2.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
         asignaDescConcepto(GI('ecmoIdSecMor'),GI('ecmoConcepMor'));
        cat2.altaCatalogo();
      break;
      case OPER_MODIFICAR:
        cat2.modificaCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  alert("Operacion realizada exitosamente!");
  cargaDetalleReporteDistribucion(2);
  hideWaitLayer();
}

function morCuentas(cmbConcepto)
{
   if(cmbConcepto.selectedIndex>1)
   {
      GI("ecmoNumCtas").style.visibility="visible";
      GI("ecmoPorCtas").style.visibility="visible";
   }
   else
   {
      GI("ecmoNumCtas").value="";
      GI("ecmoPorCtas").value="";
      
      
      GI("ecmoNumCtas").style.visibility="hidden";
      GI("ecmoPorCtas").style.visibility="hidden";
   }
      

}

// concepto unico ----------------------

function existeConceptoRepDist(objSec)
{
   var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "emision.asiETValSecEstMor";
    objSecuencialParam.Programa = GI("ecmoIdPrograma").value;
    objSecuencialParam.Fideicomiso = GI("ecmoIdFideicomiso").value;
    objSecuencialParam.Emision = GI("ecmoIdEmision").value;
    objSecuencialParam.Periodo = GI("ecmoIdPeriodo").value;
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