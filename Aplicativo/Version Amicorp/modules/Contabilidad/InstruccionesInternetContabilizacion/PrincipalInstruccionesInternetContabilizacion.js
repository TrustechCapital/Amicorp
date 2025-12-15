showWaitLayer();
initForms();

var arrTblLiqPenDat = new Array();
var fechaDefault = new Date();
var strId = "numContrato,folio,tipoInstruccion,importe,status";
var strIdDiv = "divNumContrato,divFolio,divTipoInstruccion,divImporte,divStatus,cmdContabilizar,cmdAceptarXPoliza";
var arrId = strId.split(",");
var arrIdDiv = strIdDiv.split(",");
var fncFecContAntParam = JSON.parse("{\"id\":\"ejeFunFecContAnt\"}");

//arrTblLiqPenDat[0] = "rubro,45";
arrTblLiqPenDat[0] = "folio,47";
arrTblLiqPenDat[1] = "status,132";
arrTblLiqPenDat[2] = "fechaContable,120";
arrTblLiqPenDat[3] = "numContrato,83";
arrTblLiqPenDat[4] = "tipoInstruccion,111";
arrTblLiqPenDat[5] = "importeFormat,75";
//arrTblLiqPenDat[7] = "concepto,149";
//arrTblLiqPenDat[8] = "contratoInversion,89";
arrTblLiqPenDat[6] = "fechaInstruccion,86";
//arrTblLiqPenDat[10] = "tipoLiquidacion,150";
ocultaObjs(strId);
ocultaObjs(strIdDiv);

function setFechaCal() {
  //alert("se actualizo la fecha");
}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "paramFecha",
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
}); 


function consultarTablas(btn, frm, reqParam){
  //consultar(btn, frm, reqParam);
  SA(btn,"ref","conPriInsIntPenCon");
  SA(btn,"tabla","tblRegPriLiqPen");
  SA(btn,"fun","addTableElement");
  consultar(btn, frm, reqParam);
  SA(btn,"ref","conPriInsIntLiqRecCon");
  SA(btn,"tabla","tblRegPriOpeRec");
  SA(btn,"fun","addTableElement");
  consultar(btn, frm, reqParam);
  SA(btn,"fun","addTableElement");
  SA(btn,"ref","conPriInsIntDepRecCon");
  consultar(btn, frm, reqParam);
  SA(btn,"fun","addTableElement");  
  SA(btn,"ref","conPriInsIntHonRecCon");
  consultar(btn, frm, reqParam);
 
}

function clickTabla(pk){
  showWaitLayer();
  pkInfo = pk;
  cargaDatosOperacion(pk);
}

function cargaDatosOperacion(objDatos){
  if(isDefinedAndNotNull(objDatos)){
    for(var i = 0;i < arrId.length; i++){
      eval("GI('" + arrId[i] + "').value = objDatos." + arrId[i]);
    }
    muestraObjs(strId);
    muestraObjs(strIdDiv);
    deshabilitaPK(arrId);
  }
  hideWaitLayer();
}


function contabilizar(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var folio = GI("folio").value;
    var tipoInstruccion = "'" + GI("tipoInstruccion").value + "'";
    var mesAbierto = 0; //0 cerrado; 1 abierto
    var usuario = 683;
    var fideicomiso = GI("numContrato").value;
    var fecha = "'" + GI("paramFecha").value + "'";
    var fechaAnt = fecha;
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunCharolaConta\",\"Folio\":" + folio + ",\"TipoInstruccion\":" + tipoInstruccion +
              ",\"MesAbierto\":" + mesAbierto + ",\"Usuario\":" + usuario + ",\"Fideicomiso\":" + fideicomiso + ",\"Fecha\":" + fecha + 
              ",\"FechaAnt\":" + fechaAnt + ",\"TipoCharola\":2,\"Paridad\":0}";
    makeAjaxRequest(url, "HTML", validaResultadoFunCharolaConta, folio);
  }
}
function validaResultadoFunCharolaConta(obj, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    switch(resultado){
      case -1:
        alert("Ocurrió un error al contabilizar la instrucción de internet");
      break;
      case 0:
        if(GI("status").value == "RECHAZADA"){
          showWaitLayer();
          var url = ctxRoot + "/doRef.do?json={\"id\":\"delErrRut\",\"Folio\":" + obj + "}";
          makeAjaxRequest(url, "HTML", validaDelErrorRutina, null);
        }else
          alert("Contabilidad afectada satisfactoriamente");
      break;
      case 1:
        alert("La instrucción ya fue procesada");
      break;
      case 2:
        alert("Contabilidad afectada satisfactoriamente");
      break;
      case 3:
        alert("No existe el folio en honorarios");
      break;
      case 4:
        alert("No existe el dato en la clave 30");
      break;
      case 5:
        alert("No se actualizo el status de la instrucción");
      break;
      case 6:
        alert("No actualizo correctamente el rubro de liquidación");
      break;
      case 7:
        alert("No actualizo correctamente el rubro de deposito");
      break;
    }
  }
  consultarTablas(GI("cmdAceptar"), GI("frmDatosInstrucciones"), false);
  limpiaTxts(strId);
  ocultaObjs(strId);
  ocultaObjs(strIdDiv);
  hideWaitLayer();
}
function validaDelErrorRutina(obj, result){
  alert(result);
  alert("Contabilidad afectada satisfactoriamente");
  hideWaitLayer();
}
function aceptarXPoliza(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var folio = GI("folio").value;
    var url = ctxRoot + "/doRef.do?json={\"id\":\"updInsPol\",\"Folio\":" + folio + "}";
    makeAjaxRequest(url, "HTML", validaUpdInstruccionPoliza, folio);
  }
}

function validaUpdInstruccionPoliza(obj, result){
  
  var resultado = JSON.parse(result);
  if(resultado.tipoError == "SUCCESS")
    alert("Se acepto por Póliza el folio " + obj);
  else
    alert("Ocurrio un error al aceptar por Póliza el folio " + obj);
  consultarTablas(GI("cmdAceptar"), GI("frmDatosInstrucciones"), false);
  limpiaTxts(strId);
  ocultaObjs(strId);
  ocultaObjs(strIdDiv);
  hideWaitLayer();
}

function ejecutaFechaContableAnterior() {
  fncFecContAntParam.fechaEnvia = GI("paramFecha").value;
  
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncFecContAntParam);
  makeAjaxRequest(url, "HTML", validaFechaContableAnterior, null);
}

function validaFechaContableAnterior(obj, result) {
  var resultado = JSON.parse(result)[0];
  
  if(isDefinedAndNotNull(resultado))
    GI("paramFecha").value = resultado;
  
  formsLoaded();
}