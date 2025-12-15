var catPreciosm = new Catalogo("mx.com.inscitech.fiducia.domain.Preciosm");

showWaitLayer();

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbMercadoParam = JSON.parse("{\"chido\":45}");
var cmbInstrumentoParam = JSON.parse("{\"tipoMercado\":-1,\"order\":1}");
var fvCatPreciosm = new FormValidator();
var tblRegPriPreMerDat = new Array();
var fechaDefault = new Date();
var modo;
pkInfo=null;

//ocultaObjs("txtPrecio,txtTasa,dvPrecio,dvTasa");
initForms();

tblRegPriPreMerDat[0] = "mercado,122";
tblRegPriPreMerDat[1] = "instrumento,300";
tblRegPriPreMerDat[2] = "emision,60";
tblRegPriPreMerDat[3] = "pizarra,65";
tblRegPriPreMerDat[4] = "serie,60";
tblRegPriPreMerDat[5] = "cupon,50";
tblRegPriPreMerDat[6] = "precio,105";
tblRegPriPreMerDat[7] = "tasa,80";

fvCatPreciosm.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  GI("txtPrecio").value = pk.precio;
  GI("txtTasa").value = pk.tasa;
  delete pk.precio;
  delete pk.tasa;
  pkInfo = pk;
  cloneObject(pk,catPreciosm.getCatalogo());
  muestraObjs("txtPrecio,txtTasa,dvPrecio,dvTasa,cmdAceptarPM,cmdCancelarPM");
}

function limpiar(objForma){
  RF(objForma);
  catPreciosm = new Catalogo("mx.com.inscitech.fiducia.domain.Preciosm");
  pkInfo = null;
}
function cargaComboInstrumentos(objCmbMercado){
  limpiaCombos("paramInstrumento");
  borraCombos("paramInstrumento");
  if(objCmbMercado.selectedIndex != 0){
    showWaitLayer();
    cmbInstrumentoParam.tipoMercado = objCmbMercado.value; 
    loadElement(GI("paramInstrumento"));
  }
}
function consultarCount(obj, result){
  resultado = JSON.parse(result)[0];
  SA(GI("cmdAceptar"),"fun","loadTableElement");
  ocultaObjs("txtPrecio,txtTasa,dvPrecio,dvTasa,cmdAceptarPM,cmdCancelarPM");
  if(isDefinedAndNotNull(resultado)){
    if(resultado.registros != 0){
      SA(GI("cmdAceptar"),"ref","conPriPreMer");
      modo = OPER_MODIFICAR;
    }else{
      SA(GI("cmdAceptar"),"ref","conSecPreMer");
      modo = OPER_ALTA;
    }
    consultar(GI("cmdAceptar"),GI("frmDatos"),false);
  }
  SA(GI("cmdAceptar"),"fun","consultarCount");
  SA(GI("cmdAceptar"),"ref","conPriConPreMer");
  hideWaitLayer();
}
function estableceRequired(objEstableceRequired){
  switch(objEstableceRequired.name){
    case "paramMercado":
      if(objEstableceRequired.selectedIndex != 0){
        SA(GI("paramInstrumento"),"required","true");
        RA(GI("paramPizarra"),"required");
        RA(GI("paramSerie"),"required");
      }
    break;
    case "paramPizarra":
      if(objEstableceRequired.value != ""){
        SA(GI("paramSerie"),"required","true");
        RA(GI("paramMercado"),"required");
        RA(GI("paramInstrumento"),"required");
      }
    break;
  }
}

function ejecutaOperacionPrecioMercado(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    if(modo == OPER_ALTA){
      catPreciosm.getCatalogo().preDiaPrecEmis = eval(GI("paramDia").value);
      catPreciosm.getCatalogo().preMesPrecEmis = eval(GI("paramMes").value);
      catPreciosm.getCatalogo().preAnoPrecEmis = eval(GI("paramAno").value);
      catPreciosm.getCatalogo().prePrecioCierre = eval(GI("txtPrecio").value);
      catPreciosm.getCatalogo().preTasaAnual = eval(GI("txtTasa").value);
      catPreciosm.getCatalogo().preDiaAltaReg = eval(GI("paramDia").value);
      catPreciosm.getCatalogo().preMesAltaReg = eval(GI("paramMes").value);
      catPreciosm.getCatalogo().preAnoAltaReg = eval(GI("paramAno").value);
      catPreciosm.getCatalogo().preDiaUltMod = eval(GI("paramDia").value);
      catPreciosm.getCatalogo().preMesUltMod = eval(GI("paramMes").value);
      catPreciosm.getCatalogo().preAnoUltMod = eval(GI("paramAno").value);
      catPreciosm.getCatalogo().preCveStPrecio = "ACTIVO";
      catPreciosm.setOnUpdate(inicializaDatos);
      catPreciosm.altaCatalogo(false);
    }else if(modo == OPER_MODIFICAR){
      catPreciosm.setOnUpdate(asignaValoresCatalogo);
      catPreciosm.buscaCatalogoPK(false);
    }
  }
}
function asignaValoresCatalogo(){
  catPreciosm.getCatalogo().prePrecioCierre = eval(GI("txtPrecio").value);
  catPreciosm.getCatalogo().preTasaAnual = eval(GI("txtTasa").value);
  catPreciosm.getCatalogo().preDiaUltMod = eval(GI("paramDia").value);
  catPreciosm.getCatalogo().preMesUltMod = eval(GI("paramMes").value);
  catPreciosm.getCatalogo().preAnoUltMod = eval(GI("paramAno").value);
  catPreciosm.setOnUpdate(inicializaDatos);
  catPreciosm.modificaCatalogo(false);
}

function inicializaDatos(){
  catPreciosm.setOnUpdate(avisoOperacionCatalogo);
  ocultaObjs("txtPrecio,txtTasa,dvPrecio,dvTasa,cmdAceptarPM,cmdCancelarPM");
  resetTable(GI("tblRegPriPreMer"));
  pkInfo = null;
  alert("Operación realizada exitosamente!");
  hideWaitLayer();
}
function inicializaDatos2(){
  ocultaObjs("txtPrecio,txtTasa,dvPrecio,dvTasa,cmdAceptarPM,cmdCancelarPM");
  resetTable(GI("tblRegPriPreMer"));
  pkInfo = null;
}

function isValidDate(date){
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "txtFechaContable",
    button         :    "txtFechaContable",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    destazaFecha,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
function destazaFecha(){
  GI("paramDia").value = GI("txtFechaContable").value.split("/")[0];
  GI("paramMes").value = GI("txtFechaContable").value.split("/")[1];
  GI("paramAno").value = GI("txtFechaContable").value.split("/")[2];
  hideWaitLayer();
}