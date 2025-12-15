var catCuentaco = new Catalogo("mx.com.inscitech.fiducia.domain.Cuentaco");
var arrObjPK = null;
var arrValues = new Array();
var arrCampos = new Array();
var strCampos = "cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta";
arrCampos = strCampos.split(",");
var fvCatCuentaco = new FormValidator();
var modo;

fvCatCuentaco.setup({
  formName      : "frmMantenimientoCatalogoCuentas",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function consultarPrincipalCatalogoCuentas() {
  showWaitLayer();
  arrObjPK = null;
  var url = ctxRoot + "/consultarPrincipalCatalogoCuentas.do?json=" + JSON.stringify(getParameters(GI("frmDatosCatalogoCuentas")));
  makeAjaxRequest(url, "HTML", imprimeResultado, null);
}

function imprimeResultado(obj, result){
  arrCuentas = JSON.parse(result);  
  arrCols = new Array();
  arrCols[0] = "cueNumCtam,50px";
  arrCols[1] = "cueNumScta,32px";
  arrCols[2] = "cueNumSscta,38px";
  arrCols[3] = "cueNumSsscta,46px";
  arrCols[4] = "cueNumSssscta,52px";
  arrCols[5] = "cueNumSsssscta,60px";
  arrCols[6] = "cueNumAux1,34px";
  arrCols[7] = "cueNumAux2,34px";
  arrCols[8] = "cueNumAux3,34px";
  arrCols[9] = "cueNomCta,300px";
  arrCols[10] = "cueCveAcreedora,26px";
  arrCols[11] = "cueCveDeudora,26px";
  arrCols[12] = "cueCveMovtoCta,52px";
  arrCols[13] = "cueCveAcumRubro,52px";
  arrCols[14] = "cueAnoAltaReg,100px";
  arrCols[15] = "cueMesAltaReg,58px";
  arrCols[16] = "cueDiaAltaReg,58px";
  arrCols[17] = "cueAnoUltMod,58px";
  arrCols[18] = "cueMesUltMod,58px";
  arrCols[19] = "cueDiaUltMod,58px";
  arrCols[20] = "cueCveStCuenta,58px";
  loadTable(GI("tablaRegistrosPrincipalCatalogoCuentas"), arrCuentas, arrCols, "cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta", "clickTabla", true);
  hideWaitLayer();
}

function cargaMantenimientoCatalogoCuentas(Modo) {
  showWaitLayer();
  if(arrObjPK != null || Modo == 'ALTA'){
    modo = Modo;
    var urlCliente = "jsp/Contabilidad/MantenimientoCatalogoCuentas.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoCuentas, arrObjPK);
  }
  hideWaitLayer();
}

function despliegaPantallaMantenimientoCatalogoCuentas(obj, result) {
  showWaitLayer();
  GI("dvPantalla").innerHTML = result; // Pestania
  //GI("dvContenido").innerHTML = result;  
  consultaCombos("cueNumAux1,cueNumAux2,cueNumAux3,cueCveAcumRubro,cueCveStCuenta");
  if(modo=='CONSULTAR'||modo=='MODIFICAR'){
    asignaObjPK2Obj(obj);
    alert("wait();");
    catCuentaco.buscaCatalogoPK();
    alert("wait();");
    cargaRadios("cueCveAcreedora,cueCveDeudora");
    cargaRadiosConMaster('cueCveMovtoCta','cueCveMovtoCta2,cueCveMovtoCta3');//el primer param es el master y el segundo son todos los radios (menos el master)
    cargaRadiosConMaster('cueTipoPersona','cueTipoPersona2');//el primer param es el master y el segundo son todos los radios (menos el master)
    cargaChecks("cueSat");
    /*
    //setValuesFormObject(catFideicomisos.getCatalogo());
    cargaFechaConstitucion("ctoDiaApertura","ctoMesApertura","ctoAnoApertura");
    */
    deshabilitaPK(obj);
    if(modo=='CONSULTAR'){
      alert("CONSULTAR");
      deshabilitaObjetos(GI("frmMantenimientoCatalogoCuentas"));
    }
    verificaCombos("cueNumAux1,cueNumAux2,cueNumAux3,cueCveAcumRubro,cueCveStCuenta");
  }
  hideWaitLayer();
}

var ban=1;
function verificaCuenta(tipoOperacion){
  showWaitLayer();
  var parametros = "";
  
  if(arrObjPK != null){
    ban = 0;
    
    for(var i = 0;i < arrObjPK.length; i++){
      parametros += "\"" + arrObjPK[i].campo + "\":" + arrObjPK[i].value + ",";
    }
    parametros=parametros.substring(0,parametros.length-1);
    
    if(tipoOperacion == "BAJA"){  
      var url = ctxRoot + "/verificaCuentaVSGuia.do?json={" + parametros + "}";
      makeAjaxRequest(url, "HTML", validaBaja, 1);
      var url2 = ctxRoot + "/verificaNivelesCuenta.do?json={" + parametros + "}";
      makeAjaxRequest(url2, "HTML", validaBaja, 2);
    }
  }
  if(tipoOperacion == "ALTA"){
    ban = 0;
    parametros = "";
    for(var i = 0;i < arrCampos.length; i++){
      parametros += "\"" + arrCampos[i] + "\":" + arrValues[i] + ",";
    }
    parametros=parametros.substring(0,parametros.length-1);
    var url3 = ctxRoot + "/verificaExisteCuenta.do?json={" + parametros + "}";
    makeAjaxRequest(url3, "HTML", validaAlta, 3);
    alert("Existe Cuenta:\n" +parametros);
    var arrValuesSuperior = convierteCuenta2Superior(arrValues);
    
    if(arrValues[0] != "0"){
      parametros = "";
      
      for(var i = 0;i < arrCampos.length; i++){
        parametros += "\"" + arrCampos[i] + "\":" + arrValuesSuperior[i] + ",";
      }
      parametros=parametros.substring(0,parametros.length-1);
      var url4 = ctxRoot + "/verificaNivelSuperiorCuenta.do?json={" + parametros + "}";
      makeAjaxRequest(url4, "HTML", validaAlta, 4);
      alert("Nivel Superior: \n"+parametros);
    }
  }
  alert("pausa");
  hideWaitLayer();
  return ban;
}

function validaBaja(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].numGuias > 0 && obj == 1){
    alert("No se puede dar de baja una cuenta que mantenga guias dependientes: " + resultado[0].numGuias);
    ban = obj;
  }
  if(resultado[0].numNiveles >1 && obj == 2){
    alert("No se puede dar de baja una cuenta que mantenga niveles inferiores: " + (resultado[0].numNiveles-1));
    ban = obj;
  }
}

function validaAlta(obj, result){
  resultado = JSON.parse(result);
  alert("->"+result);
  if(resultado[0].existeCuenta > 0 && obj == 3){
    alert("Esta cuenta ya existe actualmente: " + resultado[0].existeCuenta);
    ban = obj;
  }  
  if(resultado[0].existeSuperior == 0 && obj == 4){
    alert("No se puede dar de alta una cuenta que no tenga nivel superior: " + resultado[0].existeSuperior);
    ban = obj;
  }
}
function ejecutaOperacion(){
  showWaitLayer();
  if(modo=='ALTA'){
    generaArrValues();
    if(verificaNiveles(arrValues)){
      if(fvCatCuentaco.checkForm()){
        if(!verificaCuenta('ALTA')){
          catCuentaco.altaCatalogo();
          alert('Se dio de alta la cuenta');
          arrObjPK = null;
          cargaPrincipalCatalogoCuentas();
        }
      }
    }
  }else if(modo=='MODIFICAR'){
    if(fvCatCuentaco.checkForm()){
        catCuentaco.modificaCatalogo();
        arrObjPK = null;
        cargaPrincipalCatalogoCuentas();
    }
  }else if(modo=='BAJA'){
    if(!verificaCuenta('BAJA')){
      catCuentaco.bajaCatalogo();
      alert('Se dio de baja la cuenta');
      arrObjPK = null;
      rf(GI("frmDatosCatalogoCuentas"));
    }
  }
  hideWaitLayer();
}
function convierteCuenta2Superior(arrValues){
  var i;
  if(arrValues[0] != "0" && arrValues[1] == "0"){
    arrValues[0] = "0";
  }else{
    for(i = 2 ; i < arrValues.length ; i++)
      if(arrValues[i] == "0")
        break;
    for(var j = 1 ; j < arrValues.length ; j++)
      if(j == (i-1))
        arrValues[j] = "0";
  }
  return arrValues;
}
function verificaNiveles(arrValues){
  var nivelesCorrectos = true;
  for(var i=1 ; i < arrValues.length ; i++){
    if(arrValues[i] == "0" && arrValues[i] != ""){
      nivelesCorrectos = false;
    }
    if(arrValues[i] != "0" && arrValues[i] != "" && nivelesCorrectos == false){
      alert("Verifica el Nivel " + i);
      GI(arrCampos[i]).value = '';
      fvCatCuentaco.checkForm();
      return false;
    }
  }
  return true;
}

function generaArrValues(){
  for(var i=0 ; i < arrCampos.length ; i++)
    arrValues[i] = GI(arrCampos[i]).value;
}
/*
SELECT COUNT(*) FROM GUIACONT
WHERE
GUI_NUM_CTAM = &1 AND
GUI_NUM_SCTA = &2 AND
GUI_NUM_SSCTA = &3 AND
GUI_NUM_SSSCTA = &4 AND
GUI_NUM_SSSSCTA = &5 AND
GUI_NUM_SSSSSCTA = &6
*/