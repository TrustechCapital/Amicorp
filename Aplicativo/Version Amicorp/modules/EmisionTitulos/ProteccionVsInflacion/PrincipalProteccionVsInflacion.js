var cmbPeriodoCalculoParam = JSON.parse("{\"Indice\":504,\"orderDescripcion\":\"S\"}");

function despliegaPantallaPrincipalProteccionVsInflacion(){ 
  GI("dvTitulo").innerHTML = "Protección contra Inflación";
  GI("txtPrograma").id = "eepiIdPrograma";
  GI("txtFideicomiso").id = "eepiIdFideicomiso";
  GI("txtEmision").id = "eepiIdEmision";
  cat4.getCatalogo().eepiIdPrograma = pkInfo.eemiIdPrograma;
  cat4.getCatalogo().eepiIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat4.getCatalogo().eepiIdEmision = pkInfo.eemiIdEmision;
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

function asignaValues2ObjHTMLProteccion(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    //cat4.setOnUpdate(cargaComplementoProteccion);
    cat4.buscaCatalogoPK(false);
    cargaComplementoProteccion();
  }else
    formsLoaded();
    
}
function cargaComplementoProteccion(){
  //cat4.setOnUpdate(avisoOperacionCatalogo);
  if(GI("eepiProtInflacionChk").checked){
    muestraObjs("eepiPeriodoCalculo,eepiNumMonedaInfla");
    SA(GI("eepiPeriodoCalculo"),"required","true");
    SA(GI("eepiNumMonedaInfla"),"required","true");
  }
  formsLoaded();
}

function estableceObjetosProteccion(objChk){
  limpiaCombos("eepiPeriodoCalculo,eepiNumMonedaInfla");
  if(objChk.checked){
    muestraObjs("eepiPeriodoCalculo,eepiNumMonedaInfla");
    SA(GI("eepiPeriodoCalculo"),"required","true");
    SA(GI("eepiNumMonedaInfla"),"required","true");
  }else{
    ocultaObjs("eepiPeriodoCalculo,eepiNumMonedaInfla");
    RA(GI("eepiPeriodoCalculo"),"required");
    RA(GI("eepiNumMonedaInfla"),"required");
  }
}

function ejecutaOperacionProteccion(){
  if(fvCat.checkForm()){
    //cat4.setOnUpdate(operacionCatalogo);
    showWaitLayer();
    switch(modo){
      case OPER_ALTA:
        cat4.altaCatalogo();
        operacionCatalogo();
      break;
      case OPER_MODIFICAR:
        cat4.modificaCatalogo();
        operacionCatalogo();
      break;
    }
  }
}

function operacionCatalogo(){
  //alert("Operacion realizada exitosamente!");
  cargaDetalleParametrosCalculo(2);
  hideWaitLayer();
}