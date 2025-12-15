showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.CuentasSat");
var divNombreFideicomisoParam;

initForms();

function asignaAnoMovimiento(obj, result){
  var resultado = JSON.parse(result)[0];
  obj.value = resultado.fecha.split("/")[2] - 1;
  formsLoaded();
}

var arrTblRegDat = new Array();
arrTblRegDat[0] = "csaNumCtam,40";
arrTblRegDat[1] = "csaNumScta,40";
arrTblRegDat[2] = "csaNumSscta,45";
arrTblRegDat[3] = "csaNumSsscta,50";
arrTblRegDat[4] = "csaNumSssscta,55";
arrTblRegDat[5] = "csaNumSsssscta,70";
arrTblRegDat[6] = "csaNomCta,300";
arrTblRegDat[7] = "csaAportacion,70";
arrTblRegDat[8] = "csaIngreso,70";
arrTblRegDat[9] = "csaCargo,70";
arrTblRegDat[10] = "csaAbono,70";
arrTblRegDat[11] = "csaTipoPersona,100";

var fvCat = new FormValidator();
var strIdPK = "csaNumCtam,csaNumScta,csaNumSscta,csaNumSsscta,csaNumSssscta,csaNumSsssscta,csaNumAux1";
var arrIdPK = strIdPK.split(",");
var modo = 0;

pkInfo = null;
fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,cat.getCatalogo());
  muestraObjs("dvDatos,cmdGuardar,cmdCancelar");
  SA(GI("Aportacion"),"required","true");
  cargaDatosSaldosSAT();
}
function cargaDatosSaldosSAT(){
  cat.getCatalogo().csaAportacion == "SI"?GI("Aportacion").checked = true:GI("Aportacion").checked = false;
  cat.getCatalogo().csaIngreso == "SI"?GI("Ingreso").checked = true:GI("Ingreso").checked = false;
  cat.getCatalogo().csaCargo == "SI"?GI("Cargo").checked = true:GI("Cargo").checked = false;
  cat.getCatalogo().csaAbono == "SI"?GI("Abono").checked = true:GI("Abono").checked = false;
}
function ejecutaOperacionSaldosSAT(){
  if(fvCat.checkForm()){
    showWaitLayer();
    cat.getCatalogo().csaNumAux1 = eval(GI("paramFideicomiso").value);
    cat.getCatalogo().csaAportacion = GI("Aportacion").checked?"SI":"NO";
    cat.getCatalogo().csaIngreso = GI("Ingreso").checked?"SI":"NO";
    cat.getCatalogo().csaCargo = GI("Cargo").checked?"SI":"NO";
    cat.getCatalogo().csaAbono = GI("Abono").checked?"SI":"NO";
    cat.setOnUpdate(altaRegistro);
    cat.bajaCatalogo(false);
  }
}
function altaRegistro(){
  cat.setOnUpdate(avisoOperacionCatalogo);
  cat.altaCatalogo(false);
  hideWaitLayer();
  RA(GI("Aportacion"),"required");
  ocultaObjs("dvDatos,cmdGuardar,cmdCancelar");
  resetTable(GI("tblRegPri"));
}
function cancelarOperacionSaldosSAT(){
  RA(GI("Aportacion"),"required");
  ocultaObjs("dvDatos,cmdGuardar,cmdCancelar");
  resetTable(GI("tblRegPri"));
}