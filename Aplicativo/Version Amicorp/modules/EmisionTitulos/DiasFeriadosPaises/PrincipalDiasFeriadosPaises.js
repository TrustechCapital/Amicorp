var oldColor = GI("txtPrograma").style.backgroundColor;
pkInfo2 = null;
var arrTblDat = new Array();
arrTblDat[0] = "eproNomPrograma,200px";
arrTblDat[1] = "ctoNomContrato,200px";
arrTblDat[2] = "pizarraSerie,200px";
arrTblDat[3] = "paiNomPais,150px";

function despliegaPantallaPrincipalDiasFeriadosPaises(){ 
  GI("dvTitulo").innerHTML = "Dias Feriados Paises";
  GI("txtPrograma").id = "eedpIdPrograma";
  GI("txtFideicomiso").id = "eedpIdFideicomiso";
  GI("txtEmision").id = "eedpIdEmision";
  cat10.getCatalogo().eedpIdPrograma = pkInfo.eemiIdPrograma;
  cat10.getCatalogo().eedpIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat10.getCatalogo().eedpIdEmision = pkInfo.eemiIdEmision;
  GI("paramPrograma").value = pkInfo.eemiIdPrograma;
  GI("paramFideicomiso").value = pkInfo.eemiIdFideicomiso;
  GI("paramEmision").value = pkInfo.eemiIdEmision;
  initForms();
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdLimpiar,cmdBaja");
  
  GI("cmdConsultarPrincipal").onclick = "";
}


function asignaValues2ObjHTMLDiasFeriadosPaises(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    //cat10.setOnUpdate(formsLoaded);
    cat10.buscaCatalogoPK(false);
    formsLoaded();
  }else
    formsLoaded();
  //consulta automatica de la tabla de instrumentos
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","emision.conETDiaFerPai");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg");
  consultar(botonTemp, GI("frmDatos"), false);
}

function limpiaDatosDiasFeriadosPaises(objTable){
  resetTable(objTable);
  GI("eedpIdPais").value = -1;
  RemoveOWAlert(GI("eedpIdPais"));
  pkInfo2 = null;
}

function clickTabla6(pk){
  cloneObject(pk,cat10.getCatalogo());
  pkInfo2 = pk;
  GI("eedpIdPais").value = pk.eedpIdPais;
}

function ejecutaOperacionDiasFeriadosPaises(modo2){
  GI("eedpIdPais").style.backgroundColor = oldColor;
  RemoveOWAlert(GI("eedpIdPais"));
  if(modo2 != OPER_BAJA){
    if(GI("eedpIdPais").value == -1){
      fvCat.alertAndFocus(GI('eedpIdPais'), GI('eedpIdPais').message);
    }else if(modo2 == OPER_ALTA){
      showWaitLayer();
      var url = ctxRoot + "/getRef.do?json={\"id\":\"emision.verETExiDiaFerPai\",\"Programa\":" + pkInfo.eemiIdPrograma + 
                ",\"Fideicomiso\":" + pkInfo.eemiIdFideicomiso + ",\"Emision\":" + pkInfo.eemiIdEmision + ",\"Pais\":" + GI("eedpIdPais").value + "}"
      makeAjaxRequest(url, "HTML", validaAltaDiasFeriadosPaises, null)
    }
  }else{
    if(isDefinedAndNotNull(pkInfo2)){
      showWaitLayer();
      //cat10.setOnUpdate(operacionDiasFeriadosPaises);
      cat10.bajaCatalogo(false);
      operacionDiasFeriadosPaises();
    }else
      alert("Debe seleccionar un registro de la tabla!");
  }
}

function validaAltaDiasFeriadosPaises(obj, result) {
  var resultado = JSON.parse(result);
  if(resultado[0].existeRegistro > 0)
  {
    alert("El registro ya existe");
    hideWaitLayer();
  }
  else
  {
    var url = ctxRoot + "/getRef.do?json={\"id\":\"emision.verETExiDiaFerAsiPai\",\"Pais\":" + GI("eedpIdPais").value + "}"
    makeAjaxRequest(url, "HTML", validaExiDiaFerAsiPai, null)
  }
}

function validaExiDiaFerAsiPai(obj, result) {
  var resultado = JSON.parse(result);
  if(resultado[0].existeRegistro == 0)
    alert("Para éste País aún no existen días feriados");
  
  //cat10.setOnUpdate(operacionDiasFeriadosPaises);
  cat10.getCatalogo().eedpIdPrograma = pkInfo.eemiIdPrograma;
  cat10.getCatalogo().eedpIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat10.getCatalogo().eedpIdEmision = pkInfo.eemiIdEmision;
  cat10.getCatalogo().eedpIdPais = GI("eedpIdPais").value;
  cat10.getCatalogo().eedpStEmidiasf = GI("eedpStEmidiasf").value;
  cat10.altaCatalogo(false);
  operacionDiasFeriadosPaises();
}



function operacionDiasFeriadosPaises(){
  //cat10.setOnUpdate(avisoOperacionCatalogo);
  //alert("Operacion realizada exitosamente!");
  limpiaDatosDiasFeriadosPaises(GI("tblReg"));
  //consulta automatica de instrumentos
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","emision.conETDiaFerPai");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg");
  consultar(botonTemp, GI("frmDatos"), false);
  
  hideWaitLayer();
}
