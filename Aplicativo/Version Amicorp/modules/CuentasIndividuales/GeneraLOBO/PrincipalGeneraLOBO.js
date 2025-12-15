//showWaitLayer();
var objArchivosPlanosParam = JSON.parse("{\"id\":\"muestraCadenasLOBO\",\"ano\":0,\"mes\":0}");
var fvPrincipalLOBO = new FormValidator();
var clavesCombo616 = JSON.parse("{\"llaveClave\":616}");
//Agregando la funcionalidad del required
fvPrincipalLOBO.setup({
  formName      : "frmPrincipalGeneraLOBO",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function loadComboElementAnoConta(obj, result) {
  var arrValuesAux = JSON.parse(result);
  var anoFinal=2001;
  var i=0;
  
  var defaultValue = GA(obj, "defaultValue");
  if(!isDefinedAndNotNull(defaultValue)) defaultValue = "-1";
  
  obj.options.length = arrValuesAux[0].fcoAnoApliConta+2-anoFinal;
  obj.options[0].value = defaultValue;
  obj.options[0].text = "-- Seleccione --";
  
  try {
    for(var anoCombo=anoFinal;anoCombo<=arrValuesAux[0].fcoAnoApliConta;anoCombo++) {
      obj.options[++i].value = anoCombo;
      obj.options[i].text = anoCombo;
    }
  } catch(ex) { 
    alert(ex.message); 
  }
  
  var nextElement = GA(obj, "next");
  if(isDefinedAndNotNull(nextElement)) {
    var nextObj = GI(nextElement); 
    if(isDefinedAndNotNull(nextObj)) {
      loadElement(nextObj);
    } else {
      try { eval(nextElement+"()"); } catch(ex) {}
    }
  }
}

function loadComboElementMeses() {
  obj=GI("cmbMes");
  
  obj.options.length = 13;
  
  obj.options[0].value = -1;
  obj.options[0].text = "-- Seleccione --";
  
  obj.options[1].value = 01;
  obj.options[1].text = "Enero";
  obj.options[2].value = 02;
  obj.options[2].text = "Febrero";
  obj.options[3].value = 03;
  obj.options[3].text = "Marzo";
  obj.options[4].value = 04;
  obj.options[4].text = "Abril";
  obj.options[5].value = 05;
  obj.options[5].text = "Mayo";
  obj.options[6].value = 06;
  obj.options[6].text = "Junio";
  obj.options[7].value = 07;
  obj.options[7].text = "Julio";
  obj.options[8].value = 08;
  obj.options[8].text = "Agosto";
  obj.options[9].value = 09;
  obj.options[9].text = "Septiembre";
  obj.options[10].value = 10;
  obj.options[10].text = "Octubre";
  obj.options[11].value = 11;
  obj.options[11].text = "Noviembre";
  obj.options[12].value = 12;
  obj.options[12].text = "Diciembre";
  
  formsLoaded();
}

function botonAceptar() {
  if(fvPrincipalLOBO.checkForm())
  {
    showWaitLayer();
    
    //Armando el nombre del archivo
    var nomArchivo="apor_Fiducia";
      //El mes a dos dígitos
    if(GI("cmbMes").value>0 && GI("cmbMes").value<10)
      nomArchivo+="0";
    nomArchivo+=GI("cmbMes").value;
      //El año a los dos últimos dígitos
    var aux=GI("cmbAno").value%100;
    if(aux<10)
      nomArchivo+="0";
    nomArchivo+=aux;
      
      objArchivosPlanosParam.ano = GI("cmbAno").value;
      objArchivosPlanosParam.mes=GI("cmbMes").value;
      objArchivosPlanosParam.tipoId = 1;
      objArchivosPlanosParam.Archivo = nomArchivo;
      objArchivosPlanosParam.colData = "cadena";      
      delete objArchivosPlanosParam.id;
      objArchivosPlanosParam.queryId = "muestraCadenasLOBO";      
      objArchivosPlanosParam.fileName = nomArchivo;
      
      var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(objArchivosPlanosParam);
      var liga = GI("ligaArchivo");
      liga.href = url;
      liga.click();
      hideWaitLayer();
      alert("Proceso concluido satisfactoriamente!");
      onButtonClick('CuentasIndividuales.GeneraLOBO.PrincipalGeneraLOBO','');
      
  }
}