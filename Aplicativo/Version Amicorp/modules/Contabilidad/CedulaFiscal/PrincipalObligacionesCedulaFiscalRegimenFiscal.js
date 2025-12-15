var catOblfisc = new Catalogo("mx.com.inscitech.fiducia.domain.Oblfisc");
var catOblFid = new Catalogo("mx.com.inscitech.fiducia.domain.OblFid");
var arrTblOblFisDat = new Array();

arrTblOblFisDat[0] = "oblTipoImp,150";
arrTblOblFisDat[1] = "obfDescripcion,167";
arrTblOblFisDat[2] = "obfCveObligfisc,50";
arrTblOblFisDat[3] = "obfNumDeclar,122";
arrTblOblFisDat[4] = "obfPeriodo,55";
arrTblOblFisDat[5] = "obfPlazPres,154";
arrTblOblFisDat[6] = "obfLugarPres,168";
arrTblOblFisDat[7] = "obfFormato,100";

pkInfo2 = null;
pkInfo3 = null;

function clickTabla2(pk){
  pkInfo2 = pk;
  cloneObject(pk,catOblfisc.getCatalogo());
}
function clickTabla3(pk){
  pkInfo3 = pk;
  cloneObject(pk,catOblFid.getCatalogo());
}
function agregarObligacion(){
  if(isDefinedAndNotNull(pkInfo2)){
    verificaObligacionFideicomiso();
  }
}
function quitarObligacion(){
  if(isDefinedAndNotNull(pkInfo3)){
    catOblFid.setOnUpdate(operacionRealizada);
    catOblFid.bajaCatalogo(false);
  }
}
function verificaObligacionFideicomiso(){
  showWaitLayer();
  var fideicomiso = GI("crfNumFideicom").value;
  var clave = catOblfisc.getCatalogo().obfCveObligfisc;
  var tipoImporte = catOblfisc.getCatalogo().oblTipoImp;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiOblFid\",\"Fideicomiso\":" + fideicomiso + ",\"Clave\":'" + clave + "',\"TipoImporte\":'" + tipoImporte + "'}";
  makeAjaxRequest(url, "HTML", validaObligacionFideicomiso, null);
}
function validaObligacionFideicomiso(obj, result){
  var objValida = JSON.parse(result)[0];
  if(objValida.existeRegistro != 0){
    alert("La obligacion seleccionada se encuentra actualmente asignada al fideicomiso");
  }else{
    catOblFid.setOnUpdate(operacionRealizada);
    catOblFid.getCatalogo().crfNumFideicom = GI("crfNumFideicom").value;
    catOblFid.getCatalogo().obfCveObligfisc = catOblfisc.getCatalogo().obfCveObligfisc;
    catOblFid.getCatalogo().oblTipoImp = catOblfisc.getCatalogo().oblTipoImp;
    catOblFid.altaCatalogo(false);
  }
  hideWaitLayer();
}
function operacionRealizada(){
  pkInfo3 = null;
  consultar(GI("crfNumFideicom"), frmDatosObligacionesFiscales, false);
}