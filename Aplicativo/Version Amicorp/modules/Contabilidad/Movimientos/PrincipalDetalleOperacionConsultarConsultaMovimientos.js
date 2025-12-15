var strIdDO = "movNumContrato,movNomContrato,movNumOperacion,movNomOperacion,movNumTransac,movNomTransaccion,movFolioOpera,movHrTransac,movMinTransac,movDiaMovto,movMesMovto,movAnoMovto,movNumGuia";
var arrIdDO = strIdDO.split(",");
var arrObjs;
var txtDatosParam;

function cargaPrincipalDetalleOperacionConsultarConsultaMovimientos(){
  if(isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    arrObjs = generaArrObj(arrIdDO);
    var urlCliente = "modules/Contabilidad/Movimientos/PrincipalDetalleOperacionConsultarConsultaMovimientos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaDetalleOperacionConsultarConsultaMovimientos, null);
  }
}

function despliegaPantallaDetalleOperacionConsultarConsultaMovimientos(obj, result){
  GI("dvPantalla").innerHTML = result;
  
  //GI("dvContenido").innerHTML = result;
  if(isDefinedAndNotNull(pkInfo)){
    asignaValores2HTMLOfArrIdObjs(arrIdDO,arrObjs);
    cargaDatoVal();
  }else{
    hideWaitLayer();
  }
  deshabilitaObjetos(GI("frmConsultarMovimientosDetalleOperacion"));
}

function cargaDatoVal(){
  var objTemp = GI("txtDesc1");
  SA(objTemp, "ref", "conDatoValXFol");
  SA(objTemp, "fun", "asignaValoresDatoVal");
  SA(objTemp, "param", "txtDatosParam");
  txtDatosParam = JSON.parse("{" + generaParametros("Folio","movFolioOpera") + "}");
  loadElement(objTemp);
}

function asignaValoresDatoVal(obj, result){
  var objDatoVal = JSON.parse(result)[0];
  if(isDefinedAndNotNull(objDatoVal)){
    for(var i = 1; i <= 20 ; i++){
      if(i <= 5){
       eval("GI('txtDesc" + i + "').value = isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + " )?objDatoVal.dvaCveAplicaD" + i + ":'';");
       eval("GI('txtValor" + i + "').value = (isDefinedAndNotNull(objDatoVal.dvaImpDato" + i + ") && isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + "))?objDatoVal.dvaImpDato" + i + ":'';");
      }else if(i > 5 && i < 9){
        eval("GI('txtDesc" + i + "').value = isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + ")?objDatoVal.dvaCveAplicaD" + i + ":'';");
        eval("GI('txtValor" + i + "').value = (isDefinedAndNotNull(objDatoVal.dvaNumDato" + i + ") && isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + "))?objDatoVal.dvaNumDato" + i + ":'';");
      }else{
        eval("GI('txtDesc" + i + "').value = isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + ")?objDatoVal.dvaCveAplicaD" + i + ":'';");
        eval("GI('txtValor" + i + "').value = (isDefinedAndNotNull(objDatoVal.dvaPjeDato" + i + ") && isDefinedAndNotNull(objDatoVal.dvaCveAplicaD" + i + "))?objDatoVal.dvaPjeDato" + i + ":'';");
      }
    }
  }
  hideWaitLayer();
}