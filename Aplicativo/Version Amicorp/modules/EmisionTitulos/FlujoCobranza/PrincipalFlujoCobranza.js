var fecha = new Date();
var strFechas = "ecfcFecInicioPer,ecfcFecFinPer,ecfcFecPagoPer";
var arrFechas = strFechas.split(",");

var param536 = JSON.parse("{\"Indice\":536,\"order\":\"s\"}");



function despliegaPantallaPrincipalFlujoCobranza()
{ 
  GI("dvTitulo").innerHTML = "Flujo de Cobranza";
  GI("paramPrograma").id = "ecfcIdPrograma";
  GI("paramFideicomiso").id = "ecfcIdFideicomiso";
  GI("paramEmision").id = "ecfcIdEmision";
  GI("paramReporte").id = "ecfcIdPeriodo";
  
  GI("txtFechaInicio").id = "ecfcFecInicioPer";
  GI("txtFechaFin").id = "ecfcFecFinPer";
  GI("txtFechaPago").id = "ecfcFecPagoPer";
  
  cat.getCatalogo().ecfcIdPrograma = GI("ecfcIdPrograma").value;
  cat.getCatalogo().ecfcIdFideicomiso = pkInfo3.ecedIdFideicomiso;
  cat.getCatalogo().ecfcIdEmision = 0;//pkInfo3.ecedIdEmision;
  cat.getCatalogo().ecfcIdPeriodo = pkInfo3.ecedIdPeriodo;
  
  /*for(var i in arrFechas) {
    Calendar.setup({
      inputField     :    arrFechas[i],   // id of the input field
      button         :    arrFechas[i],
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    setFechaCal,
      disableFunc    :    isValidDate,
      date           :    fecha,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
    });
  }*/
  initForms();
  asignaValues2ObjHTMLFlujoCobranza();
}

function asignaValues2ObjHTMLFlujoCobranza()
{
  
   loadElement(GI("ecfcIdSecCob"));

  if(isDefinedAndNotNull(pkInfo3) && modo != OPER_ALTA){
    cat.setOnUpdate(terminoCargaPantalla);
    cat.buscaCatalogoPK(false);
  }else 
  {
  
   formsLoaded();
  }
}

function terminoCargaPantalla()
{
  formatoComasMonto('ecfcImpCobranza');
  formsLoaded();
}

function ejecutaOperacionFlujoCobranza()
{
  
  limpiaComasMonto('ecfcImpCobranza');

  if(fvCat.checkForm()){
    cat.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA: 
         asignaDescConcepto(GI('ecfcIdSecCob'),GI('ecfcConcepto'));
        cat.altaCatalogo();
      break;
      case OPER_MODIFICAR:
        cat.modificaCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  alert("Operacion realizada exitosamente!");
  cargaDetalleReporteDistribucion(2);
  hideWaitLayer();
}

//Funciones para el uso de las Fechas
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}


// concepto unico ----------------------

function existeConceptoRepDist(objSec)
{
    var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "emision.asiETValSecFluCob";
    objSecuencialParam.Programa = GI("ecfcIdPrograma").value;
    objSecuencialParam.Fideicomiso = GI("ecfcIdFideicomiso").value;
    objSecuencialParam.Emision = GI("ecfcIdEmision").value;
    objSecuencialParam.Periodo = GI("ecfcIdPeriodo").value;
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