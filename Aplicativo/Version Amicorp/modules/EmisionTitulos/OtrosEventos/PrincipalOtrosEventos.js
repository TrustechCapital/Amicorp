var param537 = JSON.parse("{\"Indice\":537,\"order\":\"s\"}");


function despliegaPantallaPrincipalOtrosEventos(){ 
  GI("dvTitulo").innerHTML = "Otros Eventos";
  GI("paramPrograma").id = "ecpgIdPrograma";
  GI("paramFideicomiso").id = "ecpgIdFideicomiso";
  GI("paramEmision").id = "ecpgIdEmision";
  GI("paramReporte").id = "ecpgIdPeriodo";
  cat5.getCatalogo().ecpgIdPrograma = pkInfo.ecedIdPrograma;
  cat5.getCatalogo().ecpgIdFideicomiso = pkInfo.ecedIdFideicomiso;
  cat5.getCatalogo().ecpgIdEmision = pkInfo.ecedIdEmision;
  cat5.getCatalogo().ecpgIdPeriodo = pkInfo.ecedIdPeriodo;
  
  initForms();
  asignaValues2ObjHTMLOtrosEventos();
}

function asignaValues2ObjHTMLOtrosEventos(){
      loadElement(GI("ecfcIdConPag"));
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
  {
    cat5.setOnUpdate(terminoCargaPantalla);
    cat5.buscaCatalogoPK(false);
  }
  else 
  {
    formsLoaded();
  }
}

function terminoCargaPantalla()
{
  formatoComasMonto('ecpgImpPago');
  formsLoaded();
}

function ejecutaOperacionOtrosEventos()
{
  limpiaComasMonto('ecpgImpPago');

  if(fvCat.checkForm())
  {
   GI('ecpgImpPagoDis').value = GI('ecpgImpPago').value;
   
    cat5.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
        //asignaDescConcepto(GI('ecfcIdConPag'),GI('ecpgConcepto'));
        cat5.altaCatalogo();
      break;
      case OPER_MODIFICAR:
        cat5.modificaCatalogo();
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
    objSecuencialParam.id = "emision.asiETValSecOtrEven";
    objSecuencialParam.Programa = GI("ecpgIdPrograma").value;
    objSecuencialParam.Fideicomiso = GI("ecpgIdFideicomiso").value;
    objSecuencialParam.Emision = GI("ecpgIdEmision").value;
    objSecuencialParam.Periodo = GI("ecpgIdPeriodo").value;
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