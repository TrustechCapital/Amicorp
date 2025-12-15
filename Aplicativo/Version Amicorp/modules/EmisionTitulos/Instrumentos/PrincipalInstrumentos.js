
var cmbTasaMayorMenorParam = JSON.parse("{\"Indice\":531,\"orderDescripcion\":\"S\"}");
var cmbTasaConsiderarParam = JSON.parse("{\"Indice\":530,\"orderDescripcion\":\"S\"}");
var cmbClaveInstrumentoParam = JSON.parse("{\"Indice\":514,\"orderDescripcion\":\"S\"}");
var oldColor = GI("txtPrograma").style.backgroundColor;
pkInfo2 = null;
var arrTblDat = new Array();
arrTblDat[0] = "eintIdSecInstrumento,50px";
arrTblDat[1] = "eintCveInstrumento,250px";
arrTblDat[2] = "eintPlazo,50px";
arrTblDat[3] = "tipoInstPlazo,100px";

function despliegaPantallaPrincipalInstrumentos(){ 
  GI("dvTitulo").innerHTML = "Instrumentos";
  GI("txtPrograma").id = "eeinIdPrograma";
  GI("txtFideicomiso").id = "eeinIdFideicomiso";
  GI("txtEmision").id = "eeinIdEmision";
  cat2.getCatalogo().eeinIdPrograma = pkInfo.eemiIdPrograma;
  cat2.getCatalogo().eeinIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat2.getCatalogo().eeinIdEmision = pkInfo.eemiIdEmision;
  GI("paramPrograma").value = pkInfo.eemiIdPrograma;
  GI("paramFideicomiso").value = pkInfo.eemiIdFideicomiso;
  GI("paramEmision").value = pkInfo.eemiIdEmision;
  GI("cmdConsultarPrincipal").onclick = "";
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdLimpiar,cmdAlta,cmdModificar,cmdBaja");
}

var once=true;

function asignaValues2ObjHTMLInstrumentos(){

   if(once)
   {
      once=false;
      
     if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
       cat2.setOnUpdate(cargaComplementoInstrumento);
       cat2.buscaCatalogoPK(false);
     }else
       formsLoaded();
     //consulta automatica de la tabla de instrumentos
     var botonTemp = GI("cmdCancelar");
     SA(botonTemp,"ref","emision.conETPriIns");
     SA(botonTemp,"fun","loadTableElement");
     SA(botonTemp,"tabla","tblReg");
     consultar(botonTemp, GI("frmDatos"), false);
     //Secuencial de los instrumentos  
     var objSecuencialParam = JSON.parse("{}");
     objSecuencialParam.id = "emision.asiETValSecIns";
     objSecuencialParam.Programa = pkInfo.eemiIdPrograma;
     objSecuencialParam.Fideicomiso = pkInfo.eemiIdFideicomiso;
     objSecuencialParam.Emision = pkInfo.eemiIdEmision;
     asignaSecuencial(GI("eintIdSecInstrumento"),objSecuencialParam);
   }
  
  dvOperacion('frmDatos');
}
function cargaComplementoInstrumento(){
  cat2.setOnUpdate(avisoOperacionCatalogo);
  cargaRadiosConMaster("eeinPublicadaConocer","rdTasaConocer");
  estableceObjetosInstrumento(GI("eeinIsrChk"));
  setValuesFormObject(cat2.getCatalogo());// estableceObjetosTasa borra los datos de algunos objs, por eso se vuelven a vaciar sobre la forma
  formsLoaded();
}

function estableceObjetosInstrumento(objCheckISR){
  if(objCheckISR.checked){
    limpiaTxts("eeinImpIsr");//% Monto de ISR
    muestraObj("eeinImpIsr");//% Monto de ISR
    SA(GI("eeinImpIsr"),"required","true");
  }else{
    ocultaObj("eeinImpIsr");//% Monto de ISR
    GI("eeinImpIsr").value = "0";//% Monto de ISR
    RA(GI("eeinImpIsr"),"required");
  }
}

function ejecutaOperacionCatalogoInstrumentos(){
  if(fvCat.checkForm()){
    cat2.setOnUpdate(operacionCatalogoInstrumentos);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
        cat2.altaCatalogo();
      break;
      case OPER_MODIFICAR:
        cat2.modificaCatalogo();
      break;
    }
  }
}

function operacionCatalogoInstrumentos(){
  alert("Operacion realizada exitosamente!");
  cargaDetalleParametrosCalculo(2);
  hideWaitLayer();
}

function limpiaDatosInstrumento(objTable){
  resetTable(objTable);
  GI("eintCveInstrumento").value = -1;
  GI("eintPlazo").value = "";
  GI("eintTipoInstPlazo").value = "on";
  GI("eintTipoInstPlazo").checked = false;
  GI("rdInstrumentoPlazoMaximo").value = "on";
  GI("rdInstrumentoPlazoMaximo").checked = false;
  
  GI("rdInstrumento").checked = false;
  GI("eintCveInstrumento").style.backgroundColor = oldColor;
  GI("eintPlazo").style.backgroundColor = oldColor;
  GI("eintTipoInstPlazo").style.backgroundColor = oldColor;
  RemoveOWAlert(GI("eintCveInstrumento"));
  RemoveOWAlert(GI("eintPlazo"));
  RemoveOWAlert(GI("eintTipoInstPlazo"));
  pkInfo2 = null;
}

function clickTabla2(pk){
  cloneObject(pk,cat3.getCatalogo());
  pkInfo2 = pk;
  GI("eintCveInstrumento").value = pk.eintCveInstrumento;
  GI("eintPlazo").value = pk.eintPlazo;
  GI("eintTipoInstPlazo").value = pk.eintTipoInstPlazo;
  cargaRadiosConMaster("eintTipoInstPlazo","rdInstrumentoPlazoMaximo");
}

function ejecutaOperacionInstrumento(modo2){
  GI("eintCveInstrumento").style.backgroundColor = oldColor;
  GI("eintPlazo").style.backgroundColor = oldColor;
  GI("eintTipoInstPlazo").style.backgroundColor = oldColor;
  RemoveOWAlert(GI("eintCveInstrumento"));
  RemoveOWAlert(GI("eintPlazo"));
  RemoveOWAlert(GI("eintTipoInstPlazo"));
  cat3.setOnUpdate(operacionInstrumento);
  if(modo2 != OPER_BAJA){
    if(GI("eintCveInstrumento").value == -1){
      fvCat.alertAndFocus(GI('eintCveInstrumento'), GI('eintCveInstrumento').message);
    }else if(GI("eintPlazo").value == ""){
      fvCat.alertAndFocus(GI('eintPlazo'), GI('eintPlazo').message);
    }else if(GI("eintTipoInstPlazo").value == "on"){
      fvCat.alertAndFocus(GI('eintTipoInstPlazo'), GI('eintTipoInstPlazo').message);
    }else{
      switch(modo2){
        case OPER_ALTA:
          showWaitLayer();
          cat3.getCatalogo().eintIdPrograma = pkInfo.eemiIdPrograma;
          cat3.getCatalogo().eintIdFideicomiso = pkInfo.eemiIdFideicomiso;
          cat3.getCatalogo().eintIdEmision = pkInfo.eemiIdEmision;
          cat3.getCatalogo().eintIdSecInstrumento = GI("eintIdSecInstrumento").value;
          cat3.getCatalogo().eintCveInstrumento = GI("eintCveInstrumento").value;
          cat3.getCatalogo().eintPlazo = GI("eintPlazo").value;
          cat3.getCatalogo().eintTipoInstPlazo = GI("eintTipoInstPlazo").value;
          cat3.getCatalogo().eintStEmiinst = GI("eintStEmiinst").value;
          cat3.altaCatalogo(false);
        break;
        case OPER_MODIFICAR:
          if(isDefinedAndNotNull(pkInfo2)){
            showWaitLayer();
            cat3.getCatalogo().eintCveInstrumento = GI("eintCveInstrumento").value;
            cat3.getCatalogo().eintPlazo = GI("eintPlazo").value;
            cat3.getCatalogo().eintTipoInstPlazo = GI("eintTipoInstPlazo").value;
            cat3.modificaCatalogo(false);
          }else
            alert("Debe seleccionar un registro de la tabla!");
        break;
      }
    }
  }else{
    if(isDefinedAndNotNull(pkInfo2)){
      showWaitLayer();
      cat3.bajaCatalogo(false);
    }else
      alert("Debe seleccionar un registro de la tabla!");
  }
}

function operacionInstrumento(){
  cat3.setOnUpdate(avisoOperacionCatalogo);
  alert("Operacion realizada exitosamente!");
  limpiaDatosInstrumento(GI("tblReg"));
  //consulta automatica de instrumentos
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","emision.conETPriIns");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg");
  consultar(botonTemp, GI("frmDatos"), false);
  //Secuencial de los instrumentos  
  var objSecuencialParam = JSON.parse("{}");
  objSecuencialParam.id = "emision.asiETValSecIns";
  objSecuencialParam.Programa = pkInfo.eemiIdPrograma;
  objSecuencialParam.Fideicomiso = pkInfo.eemiIdFideicomiso;
  objSecuencialParam.Emision = pkInfo.eemiIdEmision;
  asignaSecuencial(GI("eintIdSecInstrumento"),objSecuencialParam);
  hideWaitLayer();
}

// plazo instrumento

function asignaPlazoInstrumento(cmbInstrumento)
{

  if(cmbInstrumento.selectedIndex>0)
  {
      var objInstrumento = JSON.parse('{}') ;
      objInstrumento.id="conETDatInd";
      objInstrumento.Indice = 514;
      objInstrumento.Descripcion = cmbInstrumento.value;
      
      var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objInstrumento);
      makeAjaxRequest(url,"html",asignaPlazoInstrumentoRes,null);
  }
  else
    GI('eintPlazo').value='';
  
}

function asignaPlazoInstrumentoRes(obj,result)
{
  var res= JSON.parse(result);
  
  if(res.length>0)
    GI('eintPlazo').value=res[0].eindParam1;
}