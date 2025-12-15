var catOpasifir = new Catalogo("mx.com.inscitech.fiducia.domain.Opasifir");
var tblRegConDat = new Array();
var fvOperacionesFideicomiso = new FormValidator();
var pkInfo1 = null;
var pkInfo2 = null;

tblRegConDat[0] = "oafNumOperacion,100";
tblRegConDat[1] = "descripcion,300";
tblRegConDat[2] = "tipoOperacion,150";

fvOperacionesFideicomiso.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

consultar(GI("cmdCuentasFisos"), frmDatos, false);

function clickTabla1(pk){
  pkInfo1 = pk;
}
function clickTabla2(pk){
  pkInfo2 = pk;
  cloneObject(pk,catOpasifir.getCatalogo());
}
function consultaConceptosAsignados(){
  if(GI("paramFideicomiso").value !="")
    consultar(GI("cmdPersonasI"), GI("frmDatos"), true);
}
function agregarConcepto(){
  if(fvOperacionesFideicomiso.checkForm() && isDefinedAndNotNull(pkInfo1)){
    verificaConceptoFideicomiso();
  }
}
function quitarConcepto(){
  if(fvOperacionesFideicomiso.checkForm() && isDefinedAndNotNull(pkInfo2)){
    catOpasifir.setOnUpdate(operacionRealizadaConcepto);
    catOpasifir.getCatalogo().oafNumContrato = eval(GI("paramFideicomiso").value);
    catOpasifir.getCatalogo().oafNombreFirma = "0";
    catOpasifir.getCatalogo().oafUbicacionFirma = "0";
    catOpasifir.getCatalogo().oafNumeroPers = 0;
    catOpasifir.getCatalogo().oafTipoPers = "0";
    catOpasifir.getCatalogo().oafSubContrato = 0;
    catOpasifir.getCatalogo().oafCtoInter = 0;
    catOpasifir.getCatalogo().oafNumIntermed = 0;
    catOpasifir.bajaCatalogo(false);
  }
}
function verificaConceptoFideicomiso(){
  showWaitLayer();
  var fideicomiso = GI("paramFideicomiso").value;
  var clave = catOpasifir.getCatalogo().oafNumClave;
  var secuencial = catOpasifir.getCatalogo().oafNumOperacion;
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiConFid\",\"Fideicomiso\":" + fideicomiso + ",\"Clave\":" + clave + ",\"Secuencial\":" + secuencial + "}";
  makeAjaxRequest(url, "HTML", validaConceptoFideicomiso, null);
}
function validaConceptoFideicomiso(obj, result){
  var objValida = JSON.parse(result)[0];
  if(objValida.existeRegistro != 0){  
    alert("EL Concepto seleccionado se encuentra actualmente asignado al Fideicomiso");
  }else{
    /*
    var catOpasifir = JSON.parse("{\"id\":\"insConFid\"}");
    catOpasifir.NumContrato = eval(GI("paramFideicomiso").value);
    catOpasifir.NombreFirma = (pkInfo1.columna12 == 3)?pkInfo.columna15:"0";
    catOpasifir.UbicacionFirma = (pkInfo1.columna12 == 3)?pkInfo.columna9:"0";
    catOpasifir.NumeroPers = 0;
    catOpasifir.TipoPers = "0";
    catOpasifir.NumOperacion = eval(pkInfo.oafNumOperacion);
    catOpasifir.SubContrato = 0
    catOpasifir.CtoInter = (pkInfo1.columna14 != "")?eval(pkInfo.columna14):0;
    catOpasifir.NumIntermed = eval(pkInfo1.columna13);
    catOpasifir.ImpMaxRetiro = (pkInfo1.columna4 != "")?eval(pkInfo.columna4):null;
    catOpasifir.Periodicidad = (pkInfo1.columna5 != "")?eval(pkInfo.columna5):null;
    catOpasifir.DiaPago1 = (pkInfo1.columna7 == "SI")?(pkInfo1.columna5 == "Quincenal")?pkInfo1.columna8.substring(0,pkInfo1.columna8.indexOf(" ")):pkInfo.columna8:null;
    catOpasifir.DiaPago2 = (pkInfo1.columna7 == "SI")?(pkInfo1.columna5 == "Quincenal")?pkInfo1.columna8.substring(pkInfo1.columna8.indexOf(" Y ") + 3,pkInfo1.columna8.length):null:null;
    catOpasifir.VigenciaDe = (pkInfo1.columna6 != "")?pkInfo1.substring(0,10):null;
    catOpasifir.VigenciaA = (pkInfo1.columna6 != "")?pkInfo1.columna6.substring(pkInfo1.columna6.length - 10,pkInfo1.columna6.length):null;
    catOpasifir.Automatico = (pkInfo1.columna3 == "RETIRO")?(pkInfo1.columna7 == "SI")?1:0:null;
    catOpasifir.CveCuendep = (pkInfo1.columna12 == 3)?null:(pkInfo1.columna11 != "")?pkInfo1.columna11:null;
    catOpasifir.Liquidacion = (pkInfo1.columna12 != "")?pkInfo1.columna12:null;
    catOpasifir.NumClave = null;    
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(auxCatOpasifir);
    alert(url);
    */
    //oafNumContrato,oafNombreFirma,oafUbicacionFirma,oafNumeroPers,oafTipoPers,oafNumOperacion,oafSubContrato,oafCtoInter,oafNumIntermed,oafNumClave
    var auxCatOpasifir = JSON.parse("{\"id\":\"insConFid\"}");
    auxCatOpasifir.NumContrato = eval(GI("paramFideicomiso").value);
    auxCatOpasifir.NombreFirma = "0";
    auxCatOpasifir.UbicacionFirma = "0";
    auxCatOpasifir.NumeroPers = 0;
    auxCatOpasifir.TipoPers = "0";
    auxCatOpasifir.NumOperacion = eval(pkInfo1.oafNumOperacion);
    auxCatOpasifir.SubContrato = 0;
    auxCatOpasifir.CtoInter = 0;
    auxCatOpasifir.NumIntermed = 0;
    auxCatOpasifir.ImpMaxRetiro = null;
    auxCatOpasifir.Periodicidad = null;
    auxCatOpasifir.DiaPago1 = null;
    auxCatOpasifir.DiaPago2 = null;
    auxCatOpasifir.VigenciaDe = null;
    auxCatOpasifir.VigenciaA = null;
    auxCatOpasifir.Automatico = (pkInfo1.tipoOperacion == "RETIRO")?0:null;
    auxCatOpasifir.CveCuendep = null;
    auxCatOpasifir.Liquidacion = null;
    auxCatOpasifir.NumClave = (pkInfo1.tipoOperacion == "RETIRO")?175:(pkInfo1.tipoOperacion == "DEPOSITO")?75:null;
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(auxCatOpasifir);
    alert(url);
    makeAjaxRequest(url, "HTML", operacionRealizadaConcepto, null);
  }
  hideWaitLayer();
}
function operacionRealizadaConcepto(){
  pkInfo2 = null;
  consultar(GI("cmdPersonasI"), GI("frmDatos"), false);
}

function cargaPrincipalOperacionesFideicomiso(){
  var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/PrincipalOperacionesFideicomiso.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaCuentasPersonasOperacionesFideicomso, null);
}

function cargaPrincipalCuentasPersonasOperacionesFideicomiso(){
  var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/PrincipalCuentasPersonasOperacionesFideicomiso.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaCuentasPersonasOperacionesFideicomso, null);
}
function despliegaPantallaCuentasPersonasOperacionesFideicomso(obj, result) {
  GI("dvPantalla").innerHTML = result;
  showWaitLayer();
  initForms();
}

var tblRegCueDat = new Array();
var pkInfo3 = null;
var pkInfo4 = null;

tblRegCueDat[0] = "clave,50";
tblRegCueDat[1] = "banco,150";
tblRegCueDat[2] = "cuenta,150";
tblRegCueDat[3] = "titular,300";
tblRegCueDat[4] = "rfc,150";
tblRegCueDat[5] = "status,100";

function consultaCuentasAsignadas(){
  if(GI("paramFideicomiso").value !=""){
    consultar(GI("txtAux"), GI("frmDatos"), true);
    consultar(GI("txtAux2"), GI("frmDatos"), true);
  }
}
function clickTabla3(pk){
  pkInfo3 = pk;
}
function clickTabla4(pk){
  pkInfo4 = pk;
}

function agregarCuenta(){
  if(fvOperacionesFideicomiso.checkForm() && isDefinedAndNotNull(pkInfo3)){
    var objCuentasParam = JSON.parse("{\"id\":\"updCueFid\"}");
    objCuentasParam.Fecha = GI("txtFechaContable").value;
    objCuentasParam.Status = "ACEPTADA";
    objCuentasParam.Clave = pkInfo3.clave;
    objCuentasParam.Fideicomiso = eval(GI("paramFideicomiso").value);
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objCuentasParam);
    makeAjaxRequest(url, "HTML", operacionRealizadaCuenta, null);
  }
}
function quitarCuenta(){
  if(fvOperacionesFideicomiso.checkForm() && isDefinedAndNotNull(pkInfo4)){
    var objCuentasParam = JSON.parse("{\"id\":\"updCueFid\"}");
    objCuentasParam.Fecha = GI("txtFechaContable").value;
    objCuentasParam.Status = "NO ASIGNADA";
    objCuentasParam.Clave = pkInfo4.clave;
    objCuentasParam.Fideicomiso = eval(GI("paramFideicomiso").value);
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objCuentasParam);
    makeAjaxRequest(url, "HTML", operacionRealizadaCuenta, null);
  }
}
function operacionRealizadaCuenta(){
  pkInfo3 = null;
  pkInfo4 = null;
  consultaCuentasAsignadas();
}

function cargaPrincipalCuentasFideicomiso(){
  showWaitLayer();
  var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/PrincipalCuentasFideicomiso.do";
  loadDynamicJS(ctxRoot + "/modules/ControlGestion/OperacionesFideicomiso/PrincipalCuentasFideicomiso.js");
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaCuentasFideicomiso, GI("paramFideicomiso"));
}
function despliegaPantallaCuentasFideicomiso(obj, result) {
  GI("dvPantalla").innerHTML = result;
  GI("paramFideicomiso").value = obj.value;
  deshabilitaPK("paramFideicomiso".split(","));
  consultaNombreFideicomiso('nomFideicomiso',GI("paramFideicomiso"));
  hideWaitLayer();
}
function consulta(){
  consultar(GI("paramFideicomiso"), GI("frmDatos"), true);
}
function cargaPrincipalPersonasIFideicomiso(){
  showWaitLayer();
  var urlCliente = "modules/ControlGestion/OperacionesFideicomiso/PrincipalPersonasIFideicomiso.do";
  loadDynamicJS(ctxRoot + "/modules/ControlGestion/OperacionesFideicomiso/PrincipalPersonasIFideicomiso.js");
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPersonasIFideicomso, GI("paramFideicomiso"));
}

function despliegaPantallaPersonasIFideicomso(obj, result) {
  GI("dvPantalla").innerHTML = result;
  GI("paramFideicomiso").value = obj.value;
  deshabilitaPK("paramFideicomiso".split(","));
  consultaNombreFideicomiso('nomFideicomiso',GI("paramFideicomiso"));
  hideWaitLayer();
}

function consultaX(){
  var objConsultaPrincipalParam = JSON.parse("{\"id\":\"ejeFunPersonasInternet\"}");
  objConsultaPrincipalParam.Fideicomiso = eval(GI("paramFideicomiso").value);
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objConsultaPrincipalParam);
  makeAjaxRequest(url, "HTML", cargaTablaPrincipal, GI("tblRegPerInt"));
}

function cargaTablaPrincipal(objTabla, result){
  var resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado)){
    resultado = resultado.substring(1,resultado.length);
    var auxArreglo = new Array;
    var arrDatos = resultado.split(";");
    for(i=0; i < arrDatos.length; i++){
      auxArreglo[i] = new Object();
      auxArreglo[i].pinNumContrato = eval(GI("paramFideicomiso").value);
      auxArreglo[i].pinTipoPers = arrDatos[i].split("-")[0];
      auxArreglo[i].persona = arrDatos[i].split("-")[1];
      auxArreglo[i].pinNumPersona = eval(arrDatos[i].split("-")[2]);
      auxArreglo[i].formaLiquidacion = arrDatos[i].split("-")[3];
      auxArreglo[i].pinTipoOperacion = arrDatos[i].split("-")[4];
      auxArreglo[i].pinFormaLiq = eval(arrDatos[i].split("-")[5]);
    }
    loadTable(objTabla, auxArreglo, tblRegPerIntDat, GA(objTabla, "keys"), GA(objTabla, "fun"), true);
  }else
    alert("Error al cargar las Personas Internet asignadas al Fideicomiso!");
  hideWaitLayer();
}