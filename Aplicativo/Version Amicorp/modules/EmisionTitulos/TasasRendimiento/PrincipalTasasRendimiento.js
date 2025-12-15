
var cmbTipoPromedioParam = JSON.parse("{\"Indice\":529,\"orderDescripcion\":\"S\"}");
var cmbPeriodoPromedioParam = JSON.parse("{\"Indice\":504,\"orderDescripcion\":\"S\"}");
var cmbProcesoParam = JSON.parse("{\"Indice\":505,\"orderDescripcion\":\"S\"}");
var cmbPeriodoCalculoParam = JSON.parse("{\"Indice\":504,\"orderDescripcion\":\"S\"}");


function despliegaPantallaPrincipalTasasRendimiento(){ 
  GI("dvTitulo").innerHTML = "Tasas de Rendimiento";
  GI("txtPrograma").id = "eereIdPrograma";
  GI("txtFideicomiso").id = "eereIdFideicomiso";
  GI("txtEmision").id = "eereIdEmision";
  cat.getCatalogo().eereIdPrograma = pkInfo.eemiIdPrograma;
  cat.getCatalogo().eereIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat.getCatalogo().eereIdEmision = pkInfo.eemiIdEmision;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

var once = true;
function asignaValues2ObjHTMLTasas()
{
   if(once)
   {
      once = false;
        if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
        {
          cat.setOnUpdate(cargaComplementoTasaRendimiento);
          cat.buscaCatalogoPK(false);
          //cargaComplementoTasaRendimiento();
        }else{
          formsLoaded();
        }
  }
  
  hideWaitLayer();
  dvOperacion('frmDatos');
}
function cargaComplementoTasaRendimiento(){
  //cat.setOnUpdate(avisoOperacionCatalogo);
  //var idRadioSelect = cargaRadiosConMaster("eereTipoCalculo","rdTasaVariable,rdTasaPromedio,rdTasaDescuento,rdIndizado");

  setValuesFormObject(cat.getCatalogo());// estableceObjetosTasa borra los datos de algunos objs, por eso se vuelven a vaciar sobre la forma
  
  formsLoaded();
  
  accionChkDias(GI("eereNumDiaFijoChk"));
  var idRadioSelect = cargaRadiosConMasterId("eereTipoCalculo","eereTipoCalculo,rdTasaVariable");
  estableceObjetosTasa("eereTipoCalculo",GI(idRadioSelect));
}

function estableceObjetosTasa(strRadioMaster,objRdActual)
{

  asignaValueRadio2Master(strRadioMaster,objRdActual);
  if(objRdActual.id == "eereTipoCalculo")
  {
    /* // Parámetros de Promedios Ponderados
    ocultaObjs("eereTipoPromedio,eereCalcSobretasaChk,eerePerPromedio,eereProceso,eereNumDecimalesPp,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    limpiaCombos("eereTipoPromedio,eerePerPromedio,eereProceso");//Parámetros de Promedios Ponderados
    
    limpiaChecks("eereCalcSobretasaChk,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    GI("eereNumDecimalesPp").value = "0";//Parámetros de Promedios Ponderados
    
    RA(GI("eerePerPromedio"),"required");//Parámetros de Promedios Ponderados
    */
    //ocultaObj("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    //GI("eereTasaInteres1").value = "0";//Tasa de Interés 1er. Periodo
    

    muestraObj("eerePjeTasa");//% Tasa Fija
    muestraObj("tfija");//% Tasa Fija
  }else if(objRdActual.id == "rdTasaVariable"){
    /*
    
    muestraObjs("eereTipoPromedio,eereCalcSobretasaChk,eerePerPromedio,eereProceso,eereNumDecimalesPp,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    limpiaTxts("eereNumDecimalesPp");//Parámetros de Promedios Ponderados
    SA(GI("eerePerPromedio"),"required","true");//Parámetros de Promedios Ponderados
    */
    //limpiaTxts("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    //muestraObj("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    limpiaTxts("eerePjeTasa");//% Tasa Fija<
    ocultaObj("eerePjeTasa");//% Tasa Fija
    ocultaObj("tfija");//% Tasa Fija
    GI("eerePjeTasa").value = "0";//% Tasa Fija
  }else if(objRdActual.id == "rdTasaPromedio"){
    ocultaObj("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    GI("eereTasaInteres1").value = "0";//Tasa de Interés 1er. Periodo
    /*
    muestraObjs("eereTipoPromedio,eereCalcSobretasaChk,eerePerPromedio,eereProceso,eereNumDecimalesPp,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    limpiaTxts("eereNumDecimalesPp");//Parámetros de Promedios Ponderados
    SA(GI("eerePerPromedio"),"required","true");//Parámetros de Promedios Ponderados
    */
    ocultaObj("eerePjeTasa");//% Tasa Fija
    GI("eerePjeTasa").value = "0";//% Tasa Fija
  }else if(objRdActual.id == "rdTasaDescuento")
  {
    /*
    ocultaObjs("eereTipoPromedio,eereCalcSobretasaChk,eerePerPromedio,eereProceso,eereNumDecimalesPp,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    limpiaCombos("eereTipoPromedio,eerePerPromedio,eereProceso");//Parámetros de Promedios Ponderados
    limpiaChecks("eereCalcSobretasaChk,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    GI("eereNumDecimalesPp").value = "0";//Parámetros de Promedios Ponderados
    RA(GI("eerePerPromedio"),"required");//Parámetros de Promedios Ponderados
    */
    limpiaTxts("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    muestraObj("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    ocultaObj("eerePjeTasa");//% Tasa Fija
    GI("eerePjeTasa").value = "0";//% Tasa Fija
  }else if(objRdActual.id == "rdIndizado"){
    /*
    ocultaObjs("eereTipoPromedio,eereCalcSobretasaChk,eerePerPromedio,eereProceso,eereNumDecimalesPp,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    limpiaCombos("eereTipoPromedio,eerePerPromedio,eereProceso");//Parámetros de Promedios Ponderados
    limpiaChecks("eereCalcSobretasaChk,eereDiasNaturalChk");//Parámetros de Promedios Ponderados
    GI("eereNumDecimalesPp").value = "0";//Parámetros de Promedios Ponderados
    RA(GI("eerePerPromedio"),"required");//Parámetros de Promedios Ponderados
    */
    limpiaTxts("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    muestraObj("eereTasaInteres1");//Tasa de Interés 1er. Periodo
    ocultaObj("eerePjeTasa");//% Tasa Fija
    GI("eerePjeTasa").value = "0";//% Tasa Fija
  }
}

function ejecutaOperacionTasaRendimiento(){
  if(fvCat.checkForm()){
    cat.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
        cat.altaCatalogo();
        //operacionCatalogo();
      break;
      case OPER_MODIFICAR:
        cat.modificaCatalogo();
        //operacionCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  alert("Operacion realizada exitosamente!");
  cargaDetalleParametrosCalculo(2);
  hideWaitLayer();
}

function accionChkDias(chkObj)
{

  if(chkObj.checked)
  {
    GI('eereDiaFijo').style.visibility="visible";
    GI('nDia').style.visibility="visible";
  }
  else
  {
    GI('eereDiaFijo').style.visibility="hidden";
    GI('eereDiaFijo').value="0";
    GI('nDia').style.visibility="hidden";
  }
}