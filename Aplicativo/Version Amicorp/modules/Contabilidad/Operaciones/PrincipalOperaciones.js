showWaitLayer();
var catOperacio = new Catalogo("mx.com.inscitech.fiducia.domain.Operacio");
var catEstopera = new Catalogo("mx.com.inscitech.fiducia.domain.Estopera");

var cmbOperacionParam = JSON.parse("{\"chido\":69}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var cmbCombo1Param = JSON.parse("{\"chido\":69}");
var cmbCombo2Param;
var cmbCombo3Param;
var cmbCombo4Param;
var cmbCombo5Param;
var cmbCombo6Param;
var cmbCombo7Param;
initForms();

var arrTblOpeDat = new Array();
arrTblOpeDat[0] = "opeNumOperacion,102px";
arrTblOpeDat[1] = "opeNomOperacion,302px";
arrTblOpeDat[2] = "opeCveStOperaci,100px";

var fvCatOperacio = new FormValidator();
var strIdPK = "opeNumOperacion";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

fvCatOperacio.setup({
  formName      : "frmMantenimientoOperaciones",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function cmbAtxt(cmbObj,txtObj)
{
  if(cmbObj.value!=-1)//combo seleccionado
  {
    txtObj.value = cmbObj.value;
  }
  else
  {
    txtObj.value = "";
  }
}

function previoConsultar(botonConsulta)//se define si es caso especial - tipoOperacion = 10 Lineas de Credito vs Deposito
{
  var spCase =GI("paramOperacion").value;
  
  switch(eval(spCase))
  {
    case 1://Depositos
      GI("paramOperacionLineas").value = "";
      GI("paramOperacionDepositos").value = "00";
      break;
    case 10://Lineas Credito
      GI("paramOperacionLineas").value = "00";
      GI("paramOperacion").value = "1";
      GI("paramOperacionDepositos").value = "";
      break;
    default:// Los demás
      GI("paramOperacionLineas").value = "";
      GI("paramOperacionDepositos").value = "";
      break;
  }
  consultarCount(botonConsulta, frmDatosOperaciones, false);// consulta
}

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catOperacio.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catOperacio = new Catalogo("mx.com.inscitech.fiducia.domain.Operacio");
  catEstopera = new Catalogo("mx.com.inscitech.fiducia.domain.Estopera");
}

function cargaMantenimientoOperaciones(Modo){
  modo = Modo;
  catEstopera = new Catalogo("mx.com.inscitech.fiducia.domain.Estopera");
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Operaciones/MantenimientoOperaciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoOperaciones, null);
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Operaciones/MantenimientoEstructuraOperaciones.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacion();
  }
}

function despliegaPantallaMantenimientoOperaciones(obj, result) {
  
  GI("dvPantalla").innerHTML = result; // Pestania
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    deshabilitaPK("combo1,combo2,combo3,combo4,combo5,combo6,txtSecuencial".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoOperaciones"));
      muestraObjs("cmdAlta,cmdModificar,cmdBaja,cmdConsultar");
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
    //verificaCombos("combo1,combo2,combo3,combo4,combo5,combo6");
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaPK2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catOperacio.setOnUpdate(cargaComplemento);
    catOperacio.buscaCatalogoPK(false);
  }else{
    ocultaCombosDivs();
    formsLoaded();
  }
}
function cargaComplemento(){
  GI("paramNumeroOperacion").value = GI("opeNumOperacion").value;
  
  
  if(GI("opeNumOperacion").value.substring(0,3)=='100')//condicion Lineas de Credito
    GI("combo1").value = GI("opeNumOperacion").value.substring(0,2);
  else
    GI("combo1").value = GI("opeNumOperacion").value.substring(0,1);
  
  cargaCombos();
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","conPriEstopera");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblRegPriEstrucOpe");
  if(modo != OPER_CONSULTAR)
    GI("cmdConsultar").onclick = "";
  consultar(botonTemp, GI("frmMantenimientoOperaciones"), false);
  catOperacio.setOnUpdate(avisoOperacionCatalogo);
  formsLoaded();
}
var opc = 0;
function cargaCombos(){
  //showWaitLayer();
  var numOperacion = GI("opeNumOperacion").value;
  var tipoOperacion = eval(numOperacion.substring(0,1));
  
  if(GI("combo1").value>9)//condicion Lineas de Credito
    tipoOperacion = eval(numOperacion.substring(0,2));
  
  switch(tipoOperacion){
    case 1://DEPOSITOS
      opc = 1;
      cmbCombo2Param = JSON.parse("{\"chido\":83}");
      cmbCombo3Param = JSON.parse("{\"chido\":75}");
      cmbCombo4Param = JSON.parse("{\"chido\":74}");
      cmbCombo5Param = JSON.parse("{\"chido\":1000}");
      cmbCombo6Param = JSON.parse("{\"chido\":82}");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "asignaValues2Combos");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Deposito de");
      asignaEtiqueta("divCombo3","Tipo Deposito");
      asignaEtiqueta("divCombo4","Forma Deposito");
      asignaEtiqueta("divCombo5","Moneda");
      asignaEtiqueta("divCombo6","Origen de Recursos");
    break;
    case 2://INVERSIONES
      opc = 2;
      cmbCombo2Param = JSON.parse("{\"chido\":45}");
      cmbCombo3Param = JSON.parse("{\"tipoMercado\":" + parseInt(numOperacion.substring(1,2)) + "}");
      cmbCombo4Param = JSON.parse("{\"chido\":76}");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      if(eval(numOperacion.substring(4,6)) == 9){
        cmbCombo5Param = JSON.parse("{\"chido\":78}");
        asignaEtiqueta("divCombo5","Derechos");
      }else if(eval(numOperacion.substring(4,6)) == 6){
        cmbCombo5Param = JSON.parse("{\"chido\":122}");
        asignaEtiqueta("divCombo5","Intereses");
      }else{
        cmbCombo5Param = JSON.parse("{\"chido\":77}");
        asignaEtiqueta("divCombo5","Complemento de valores");
      }
      cmbCombo6Param = JSON.parse("{\"chido\":1000}");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "keyValue", "monNumPais");
      SA(GI("combo6"), "theValue", "monNomMoneda");
      SA(GI("combo6"), "ref", "conNumMonNomMon");
      SA(GI("combo6"), "next", "asignaValues2Combos");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Clasificación Instrumentos");
      asignaEtiqueta("divCombo3","Instrumento");
      asignaEtiqueta("divCombo4","Operación de Valores");
      asignaEtiqueta("divCombo6","Moneda");
    break;
    case 3://LIQUIDACIONES
      opc = 3;
      cmbCombo2Param = JSON.parse("{\"chido\":83}");
      cmbCombo3Param = JSON.parse("{\"chido\":81}");
      cmbCombo4Param = JSON.parse("{\"chido\":128}");
      cmbCombo5Param = JSON.parse("{\"chido\":1000}");
      cmbCombo6Param = JSON.parse("{\"chido\":82}");
      SA(GI("combo2"), "next", "combo3");
      
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "asignaValues2Combos");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Liquidación a");
      asignaEtiqueta("divCombo3","Forma Liquidación");
      asignaEtiqueta("divCombo4","Entregas Patrimoniales");
      asignaEtiqueta("divCombo5","Moneda");
      asignaEtiqueta("divCombo6","Origen de Recursos");
    break;
    case 4://INTERFASE TESORERIA
      opc = 4;
      cmbCombo2Param = JSON.parse("{\"chido\":45}");
      cmbCombo3Param = JSON.parse("{\"tipoMercado\":" + parseInt(numOperacion.substring(1,2)) + "}");
      cmbCombo4Param = JSON.parse("{\"chido\":301}");
      cmbCombo5Param = JSON.parse("{\"chido\":163}");
      cmbCombo6Param = JSON.parse("{\"chido\":1000}");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "keyValue", "monNumPais");
      SA(GI("combo6"), "theValue", "monNomMoneda");
      SA(GI("combo6"), "ref", "conNumMonNomMon");
      SA(GI("combo6"), "next", "asignaValues2Combos");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Clasificación Instrumentos");
      asignaEtiqueta("divCombo3","Instrumento");
      asignaEtiqueta("divCombo4","Operaciones MEDI");      
      asignaEtiqueta("divCombo5","Tipo Negocio");
      asignaEtiqueta("divCombo6","Moneda");
    break;
    case 5://HONORARIOS
      opc = 5;
      cmbCombo2Param = JSON.parse("{\"chido\":92}");
      cmbCombo3Param = JSON.parse("{\"chido\":142}");
      cmbCombo4Param = JSON.parse("{\"chido\":93}");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      if(eval(numOperacion.substring(1,2)) == 2 || eval(numOperacion.substring(1,2)) == 5 || eval(numOperacion.substring(1,2)) == 6 || eval(numOperacion.substring(1,2)) == 7 || eval(numOperacion.substring(1,2)) == 8 || eval(numOperacion.substring(1,2)) == 9){//HONORARIOS PAGO ...
        cmbCombo5Param = JSON.parse("{\"chido\":6}");
        cmbCombo6Param = JSON.parse("{\"chido\":1000}");
        SA(GI("combo6"), "keyValue", "monNumPais");
        SA(GI("combo6"), "theValue", "monNomMoneda");
        SA(GI("combo6"), "ref", "conNumMonNomMon");
        asignaEtiqueta("divCombo5","Forma de Pago");
        asignaEtiqueta("divCombo6","Moneda");
      }else{
        cmbCombo5Param = JSON.parse("{\"chido\":1000}");
        cmbCombo6Param = JSON.parse("{\"chido\":82}");
        SA(GI("combo5"), "keyValue", "monNumPais");
        SA(GI("combo5"), "theValue", "monNomMoneda");
        SA(GI("combo5"), "ref", "conNumMonNomMon");
        asignaEtiqueta("divCombo5","Moneda");
        asignaEtiqueta("divCombo6","Origen de los Recursos");
      }
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "asignaValues2Combos");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Tipo de Función de Honorarios");
      asignaEtiqueta("divCombo3","Forma de Contabilizar");
      asignaEtiqueta("divCombo4","Concepto de Honorarios");
    break;
    case 6://GARANTIAS
      opc = 6;
      
      cmbCombo2Param = JSON.parse("{\"chido\":38}");
      
      var cvechido = numOperacion.substring(1,3); 
      cvechido = (cvechido==74?cvechido=180:cvechido=cvechido);// excepcion garantias liquidas
      cmbCombo3Param = JSON.parse("{\"chido\":"+cvechido+"}");
      
      cmbCombo4Param = JSON.parse("{\"chido\":79}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "asignaValues2Combos");
      
      asignaEtiqueta("divCombo1","Tipo de Operación");
      asignaEtiqueta("divCombo2","Garantía");
      asignaEtiqueta("divCombo3","Tipo");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      
      loadElement(GI("combo2"));
    break;
    case 7://POLIZAS
      opc = 0;
      asignaEtiqueta("divComboX","Secuencial Poliza");
      GI("txtSecuencial").value = numOperacion.substring(1,10);
      ocultaCombosDivs(tipoOperacion);
      muestraCombosDivs(tipoOperacion);
      hideWaitLayer();
    break;
    case 8://BIENES FIDEICOMITIDOS
      opc = 8;
      cmbCombo2Param = JSON.parse("{\"chido\":70}");
      cmbCombo3Param = JSON.parse("{\"chido\":"+numOperacion.substring(1,3)+"}");
      cmbCombo4Param = JSON.parse("{\"chido\":79}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "asignaValues2Combos");
      
      asignaEtiqueta("divCombo1","Tipo de Operación");
      asignaEtiqueta("divCombo2","Bien");
      asignaEtiqueta("divCombo3","Tipo");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      
      loadElement(GI("combo2"));
    break;
    case 10://LINEAS CREDITO
      opc = 10;
      cmbCombo2Param = JSON.parse("{\"chido\":387}");
      cmbCombo3Param = JSON.parse("{\"chido\":388}");
      cmbCombo4Param = JSON.parse("{\"chido\":389}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "asignaValues2Combos");
      asignaEtiqueta("divCombo1","Tipo de Operación");
      asignaEtiqueta("divCombo2","Linea");
      asignaEtiqueta("divCombo3","Forma de Garantía");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      loadElement(GI("combo2"));
    break;
  }
}

function asignaValues2Combos(obj, result){
  if(isDefinedAndNotNull(result))
    var objValida = JSON.parse(result)[0];
  var numOperacion = GI("opeNumOperacion").value
  switch(opc){
    case 1://DEPOSITOS
      GI("combo2").value = eval(numOperacion.substring(1,2));
      GI("combo3").value = eval(numOperacion.substring(2,4));
      GI("combo4").value = eval(numOperacion.substring(4,6));
      GI("combo5").value = eval(numOperacion.substring(6,8));
      GI("combo6").value = eval(numOperacion.substring(8,10));
      hideWaitLayer();
    break;
    case 2://INVERSIONES
      GI("combo2").value = eval(numOperacion.substring(1,2));
      GI("combo3").value = eval(numOperacion.substring(2,4));
      GI("combo4").value = eval(numOperacion.substring(4,6));
      if(eval(numOperacion.substring(4,6)) == 6){
        GI("combo5").value = eval(numOperacion.substring(6,8));
        GI("combo6").value = eval(numOperacion.substring(8,10));
      }else{
        GI("combo5").value = eval(numOperacion.substring(6,7));
        GI("combo6").value = eval(numOperacion.substring(7,9));
      }
      hideWaitLayer();
    break;
    case 3://LIQUIDACIONES
      GI("combo2").value = eval(numOperacion.substring(1,2));
      GI("combo3").value = eval(numOperacion.substring(2,4));
      GI("combo4").value = eval(numOperacion.substring(4,6));
      GI("combo5").value = eval(numOperacion.substring(6,8));
      GI("combo6").value = eval(numOperacion.substring(8,10));
      hideWaitLayer();
    break;
    case 4://INTERFASE MEDI
      GI("combo2").value = eval(numOperacion.substring(1,2));
      GI("combo3").value = eval(numOperacion.substring(2,4));
      GI("combo4").value = eval(numOperacion.substring(4,6));
      GI("combo5").value = eval(numOperacion.substring(6,7));
      GI("combo6").value = eval(numOperacion.substring(7,9));
      hideWaitLayer();
    break;
    case 5://HONORARIOS
      opc = 51;
      GI("combo2").value = eval(numOperacion.substring(1,2));
      GI("combo3").value = eval(numOperacion.substring(2,3));
      GI("combo4").value = eval(numOperacion.substring(3,5));
      GI("combo5").value = eval(numOperacion.substring(5,7));
      GI("combo6").value = eval(numOperacion.substring(7,9));
      if(eval(numOperacion.substring(1,2)) == 2 || eval(numOperacion.substring(1,2)) == 5 || eval(numOperacion.substring(1,2)) == 6 || eval(numOperacion.substring(1,2)) == 7 || eval(numOperacion.substring(1,2)) == 8 || eval(numOperacion.substring(1,2)) == 9){//HONORARIOS PAGO ...
        cmbCombo7Param = JSON.parse("{\"secuencial\":" + GI("combo4").value + "}");
        SA(GI("combo7"), "keyValue", "x");
        SA(GI("combo7"), "theValue", "x");
        SA(GI("combo7"), "ref", "honSer");
        SA(GI("combo7"), "fun", "asignaValues2Combos");
        loadElement(GI("combo7"));
        muestraObj("divCombo7");
        muestraObj("combo7");
      }else{
        hideWaitLayer();
      }
    break;
    case 51://HONORARIOS PAGO ...
      opc = 52;      
      if(objValida.existeRegistro != 0){
        cmbCombo7Param = JSON.parse("{\"chido\":1000}");
        SA(GI("combo7"), "keyValue", "serNumServicio");
        SA(GI("combo7"), "theValue", "serNomServicio");
        SA(GI("combo7"), "ref", "conSer");
        SA(GI("combo7"), "fun", "loadComboElement");
        SA(GI("combo7"), "next", "asignaValues2Combos");
        asignaEtiqueta("divCombo7","Servicio");
        loadElement(GI("combo7"));
      }else{
        cmbCombo7Param = JSON.parse("{\"chido\":82}");
        SA(GI("combo7"), "keyValue", "cveNumSecClave");
        SA(GI("combo7"), "theValue", "cveDescClave");
        SA(GI("combo7"), "ref", "cves");
        SA(GI("combo7"), "fun", "loadComboElement");
        SA(GI("combo7"), "next", "asignaValues2Combos");
        asignaEtiqueta("divCombo7","Origen de los Recursos");
        loadElement(GI("combo7"));
      }
    break;
    case 52://HONORARIOS PAGO ...
      GI("combo7").value = eval(numOperacion.substring(9,10));
      hideWaitLayer();
    break;
    case 6://GARANTIAS
      GI("combo2").value = eval(numOperacion.substring(1,3));
      
      var cvechido = eval(numOperacion.substring(3,5));
      cvechido = (cvechido==74?cvechido=180:cvechido=cvechido);// excepcion garantias liquidas
     GI("combo3").value = cvechido;
      
      GI("combo4").value = eval(numOperacion.substring(5,7));
      GI("combo5").value = eval(numOperacion.substring(7,9));
      ocultaObj("combo6");
      ocultaObj("divCombo6");
      hideWaitLayer();
    break;
    case 7://POLIZAS
    break;
    case 8://BIENES FIDEICOMITIDOS
      GI("combo2").value = eval(numOperacion.substring(1,3));
      GI("combo3").value = eval(numOperacion.substring(3,5));
      GI("combo4").value = eval(numOperacion.substring(5,7));
      GI("combo5").value = eval(numOperacion.substring(7,9));
      ocultaObj("combo6");
      ocultaObj("divCombo6");
      hideWaitLayer();
    break;
    case 10://LINEAS DE CREDITO
      GI("combo2").value = eval(numOperacion.substring(2,4));
      GI("combo3").value = eval(numOperacion.substring(4,6));
      GI("combo4").value = eval(numOperacion.substring(6,8));
      GI("combo5").value = eval(numOperacion.substring(8,10));      
      ocultaObj("combo6");
      ocultaObj("divCombo6");
      hideWaitLayer();
  }
  verificaCombos("combo1,combo2,combo3,combo4,combo5,combo6");
}

function ocultaCombosDivs(){
  for(var i = 0; i < 7; i++){
    ocultaObj("combo2,combo3,combo4,combo5,combo6,combo7,txtSecuencial".split(",")[i]);
    ocultaObj("divCombo2,divCombo3,divCombo4,divCombo5,divCombo6,divCombo7,divComboX".split(",")[i]);
  }
}
function muestraCombosDivs(tipoOperacion){
  switch(tipoOperacion){
    case 2:
      muestraObjs("combo2,combo4,combo6");
      muestraObjs("divCombo2,divCombo4,divCombo6");
    break;
    case 1:
    case 3:
      muestraObjs("combo2,combo3,combo4,combo5,combo6");
      muestraObjs("divCombo2,divCombo3,divCombo4,divCombo5,divCombo6");
    case 4:
      muestraObjs("combo2,combo4,combo5,combo6");
      muestraObjs("divCombo2,divCombo4,divCombo5,divCombo6");
    break;
    case  5:
      muestraObjs("combo2,combo3,combo4");
      muestraObjs("divCombo2,divCombo3,divCombo4");
    break;
    case 6: // GARANTIAS
      muestraObjs("combo2,combo4,combo5");
      muestraObjs("divCombo2,divCombo4,divCombo5");
    break;
    case 7:
      muestraObjs("txtSecuencial,divComboX");
    break;
    case 8: // Bienes Fideicomitidos
      muestraObjs("combo2,combo4,combo5");
      muestraObjs("divCombo2,divCombo4,divCombo5");
    break;
    case 10: // lineas Credito
      muestraObjs("combo2,combo3,combo4,combo5");
      muestraObjs("divCombo2,divCombo3,divCombo4,divCombo5");
    break;
  }
}

function cargaCombosPrevioGenerarOperacion(objCombo){
  showWaitLayer();
  limpiaCombos("combo2,combo3,combo4,combo5,combo6,combo7");
  limpiaTxts("txtSecuencial");
  ocultaCombosDivs();
  var tipoOperacion = eval(objCombo.value);
  
  switch(tipoOperacion){
    case 1://DEPOSITOS
      opc = 1;
      cmbCombo2Param = JSON.parse("{\"chido\":83}");
      cmbCombo3Param = JSON.parse("{\"chido\":75}");
      cmbCombo4Param = JSON.parse("{\"chido\":74}");
      cmbCombo5Param = JSON.parse("{\"chido\":1000}");
      cmbCombo6Param = JSON.parse("{\"chido\":82}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo6"), "keyValue", "cveNumSecClave");
      SA(GI("combo6"), "theValue", "cveDescClave");
      SA(GI("combo6"), "ref", "cves");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Deposito de");
      asignaEtiqueta("divCombo3","Tipo Deposito");
      asignaEtiqueta("divCombo4","Forma Deposito");
      asignaEtiqueta("divCombo5","Moneda");
      asignaEtiqueta("divCombo6","Origen de Recursos");
      muestraCombosDivs(tipoOperacion);
    break;
    case 2://INVERSIONES
      opc = 2;
      cmbCombo2Param = JSON.parse("{\"chido\":45}");
      cmbCombo3Param = JSON.parse("{\"tipoMercado\":0}");
      cmbCombo4Param = JSON.parse("{\"chido\":76}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      cmbCombo6Param = JSON.parse("{\"chido\":1000}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");      
      SA(GI("combo3"), "keyValue", "insNumInstrume");
      SA(GI("combo3"), "theValue", "insNomInstrume");
      SA(GI("combo3"), "ref", "conIns");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "cveNumSecClave");
      SA(GI("combo5"), "theValue", "cveDescClave");
      SA(GI("combo5"), "ref", "cves");
      SA(GI("combo6"), "keyValue", "monNumPais");
      SA(GI("combo6"), "theValue", "monNomMoneda");
      SA(GI("combo6"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo6","Moneda");
      asignaEtiqueta("divCombo2","Clasificación Instrumentos");
      asignaEtiqueta("divCombo3","Instrumento");
      asignaEtiqueta("divCombo4","Operación de Valores");
      asignaEtiqueta("divCombo6","Moneda");
      muestraCombosDivs(tipoOperacion);
    break;
    case 3://LIQUIDACIONES
      cmbCombo2Param = JSON.parse("{\"chido\":83}");
      cmbCombo3Param = JSON.parse("{\"chido\":74}");
      cmbCombo4Param = JSON.parse("{\"chido\":128}");
      cmbCombo5Param = JSON.parse("{\"chido\":1000}");
      cmbCombo6Param = JSON.parse("{\"chido\":82}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo6"), "keyValue", "cveNumSecClave");
      SA(GI("combo6"), "theValue", "cveDescClave");
      SA(GI("combo6"), "ref", "cves");      
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Liquidación a");
      asignaEtiqueta("divCombo3","Forma Liquidación");
      asignaEtiqueta("divCombo4","Entregas Patrimoniales");
      asignaEtiqueta("divCombo5","Moneda");
      asignaEtiqueta("divCombo6","Origen de Recursos");
      muestraCombosDivs(tipoOperacion);
    break;
    case 4://INTERFASE TESORERIA
      cmbCombo2Param = JSON.parse("{\"chido\":45}");
      cmbCombo3Param = JSON.parse("{\"tipoMercado\":0}");
      cmbCombo4Param = JSON.parse("{\"chido\":301}");
      cmbCombo5Param = JSON.parse("{\"chido\":163}");
      cmbCombo6Param = JSON.parse("{\"chido\":1000}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "insNumInstrume");
      SA(GI("combo3"), "theValue", "insNomInstrume");
      SA(GI("combo3"), "ref", "conIns");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "cveNumSecClave");
      SA(GI("combo5"), "theValue", "cveDescClave");
      SA(GI("combo5"), "ref", "cves");
      SA(GI("combo6"), "keyValue", "monNumPais");
      SA(GI("combo6"), "theValue", "monNomMoneda");
      SA(GI("combo6"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Clasificación Instrumentos");
      asignaEtiqueta("divCombo3","Instrumento");
      asignaEtiqueta("divCombo4","Operaciones MEDI");      
      asignaEtiqueta("divCombo5","Tipo Negocio");
      asignaEtiqueta("divCombo6","Moneda");
      muestraCombosDivs(tipoOperacion);
    break;
    case 5://HONORARIOS
      cmbCombo2Param = JSON.parse("{\"chido\":92}");
      cmbCombo3Param = JSON.parse("{\"chido\":142}");
      cmbCombo4Param = JSON.parse("{\"chido\":93}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      cmbCombo6Param = JSON.parse("{\"chido\":0}");
      cmbCombo7Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "cveNumSecClave");
      SA(GI("combo5"), "theValue", "cveDescClave");
      SA(GI("combo5"), "ref", "cves");
      SA(GI("combo6"), "keyValue", "cveNumSecClave");
      SA(GI("combo6"), "theValue", "cveDescClave");
      SA(GI("combo6"), "ref", "cves");
      SA(GI("combo7"), "keyValue", "cveNumSecClave");
      SA(GI("combo7"), "theValue", "cveDescClave");
      SA(GI("combo7"), "ref", "cves");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo6"), "next", "hideWaitLayer");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "combo6");
      SA(GI("combo7"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Tipo de Función de Honorarios");
      asignaEtiqueta("divCombo3","Forma de Contabilizar");
      asignaEtiqueta("divCombo4","Concepto de Honorarios");
      muestraCombosDivs(tipoOperacion);
    break;
    case 6://GARANTIAS
      cmbCombo2Param = JSON.parse("{\"chido\":38}");
      cmbCombo3Param = JSON.parse("{\"chido\":142}");
      cmbCombo4Param = JSON.parse("{\"chido\":79}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Garantía");
      asignaEtiqueta("divCombo3","Tipo");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      muestraCombosDivs(tipoOperacion);
    break;
    case 7://POLIZAS
      var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunAsignaFolio\",\"TipoFolio\":3}";
      makeAjaxRequest(url, "HTML", asignaFolio, null);
      deshabilitaPK("txtSecuencial".split(","));
      asignaEtiqueta("divComboX","Secuencial Poliza");
      muestraCombosDivs(tipoOperacion);
    break;
    case 8://BIENES FIDEICOMITIDOS
      cmbCombo2Param = JSON.parse("{\"chido\":70}");
      cmbCombo3Param = JSON.parse("{\"chido\":142}");
      cmbCombo4Param = JSON.parse("{\"chido\":79}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "hideWaitLayer");
      
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Bien");
      asignaEtiqueta("divCombo3","Tipo");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      muestraCombosDivs(tipoOperacion);
    break;
    case 10://LINEAS DE CREDITO
      cmbCombo2Param = JSON.parse("{\"chido\":387}");
      cmbCombo3Param = JSON.parse("{\"chido\":388}");
      cmbCombo4Param = JSON.parse("{\"chido\":389}");
      cmbCombo5Param = JSON.parse("{\"chido\":0}");
      SA(GI("combo2"), "keyValue", "cveNumSecClave");
      SA(GI("combo2"), "theValue", "cveDescClave");
      SA(GI("combo2"), "ref", "cves");
      SA(GI("combo3"), "keyValue", "cveNumSecClave");
      SA(GI("combo3"), "theValue", "cveDescClave");
      SA(GI("combo3"), "ref", "cves");
      SA(GI("combo4"), "keyValue", "cveNumSecClave");
      SA(GI("combo4"), "theValue", "cveDescClave");
      SA(GI("combo4"), "ref", "cves");
      SA(GI("combo5"), "keyValue", "monNumPais");
      SA(GI("combo5"), "theValue", "monNomMoneda");
      SA(GI("combo5"), "ref", "conNumMonNomMon");
      SA(GI("combo2"), "next", "combo3");
      SA(GI("combo3"), "next", "combo4");
      SA(GI("combo4"), "next", "combo5");
      SA(GI("combo5"), "next", "hideWaitLayer");
      loadElement(GI("combo2"));
      asignaEtiqueta("divCombo2","Linea");
      asignaEtiqueta("divCombo3","Forma de Garantía");
      asignaEtiqueta("divCombo4","Operación");
      asignaEtiqueta("divCombo5","Moneda");
      muestraCombosDivs(tipoOperacion);
    break;
    default:
      hideWaitLayer();
    break;
  }
}
function asignaFolio(obj, result){
  var resultado = JSON.parse(result)[0];
  var aux = resultado + "";
  while(aux.length < 6)
    aux = "0" + aux;
  GI("txtSecuencial").value = aux;
  hideWaitLayer();
}
function cargaComboCorrespondiente(objComboOperacion,txtNumCombo){
  GI("opeNumOperacion").value = "";
  var tipoOperacion = eval(objComboOperacion.value);
  switch(tipoOperacion){
    case 2://INVERSIONES
      switch(txtNumCombo){
        case 2:
          showWaitLayer();
          //cmbCombo3Param = JSON.parse("{\"tipoMercado\":" + ((isDefinedAndNotNull(eval(GI("combo2").value)))?eval(GI("combo2").value):-1) + "}");
          //verifica que al menos tenga algo en value el combo, si es undefined se trae todos los registro (operacion erronea)
          cmbCombo3Param = JSON.parse("{\"tipoMercado\":" + eval(GI("combo2").value) + "}");
          SA(GI("combo3"), "keyValue", "insNumInstrume");
          SA(GI("combo3"), "theValue", "insNomInstrume");
          SA(GI("combo3"), "ref", "conIns");
          SA(GI("combo3"), "next", "hideWaitLayer");
          loadElement(GI("combo3"));
          muestraObj("combo3");
          muestraObj("divCombo3");
          limpiaCombos("combo3");
        break;
        case 4:
          showWaitLayer();
          if(eval(GI("combo4").value) == 9){
            cmbCombo5Param = JSON.parse("{\"chido\":78}");
            asignaEtiqueta("divCombo5","Derechos");
          }else if(eval(GI("combo4").value) == 6){
            cmbCombo5Param = JSON.parse("{\"chido\":122}");
            asignaEtiqueta("divCombo5","Intereses");
          }else{
            cmbCombo5Param = JSON.parse("{\"chido\":77}");
            asignaEtiqueta("divCombo5","Complemento de valores");
          }
          SA(GI("combo5"), "keyValue", "cveNumSecClave");
          SA(GI("combo5"), "theValue", "cveDescClave");
          SA(GI("combo5"), "ref", "cves");
          SA(GI("combo5"), "next", "hideWaitLayer");
          loadElement(GI("combo5"));
          muestraObj("combo5");
          muestraObj("divCombo5");
          limpiaCombos("combo5");
        break;
      }
    break;
    case 4:
      switch(txtNumCombo){
        case 2:
          showWaitLayer();
          cmbCombo3Param = JSON.parse("{\"tipoMercado\":" + eval(GI("combo2").value) + "}");
          SA(GI("combo3"), "keyValue", "insNumInstrume");
          SA(GI("combo3"), "theValue", "insNomInstrume");
          SA(GI("combo3"), "ref", "conIns");
          SA(GI("combo3"), "next", "hideWaitLayer");
          loadElement(GI("combo3"));
          muestraObj("combo3");
          muestraObj("divCombo3");
          limpiaCombos("combo3");
        break;
      }
    break;
    case 5:
      switch(txtNumCombo){
        case 2:
          showWaitLayer();
          ocultaObj("combo7");
          ocultaObj("divCombo7");
          if(eval(GI("combo2").value) == 2 || eval(GI("combo2").value) == 5 || eval(GI("combo2").value) == 6 || eval(GI("combo2").value) == 7 || eval(GI("combo2").value) == 8 || eval(GI("combo2").value) == 9){//HONORARIOS PAGO ...
            cmbCombo5Param = JSON.parse("{\"chido\":6}");
            cmbCombo6Param = JSON.parse("{\"chido\":1000}");
            SA(GI("combo5"), "keyValue", "cveNumSecClave");
            SA(GI("combo5"), "theValue", "cveDescClave");
            SA(GI("combo5"), "ref", "cves");
            SA(GI("combo6"), "keyValue", "monNumPais");
            SA(GI("combo6"), "theValue", "monNomMoneda");
            SA(GI("combo6"), "ref", "conNumMonNomMon");
            asignaEtiqueta("divCombo5","Forma de Pago");
            asignaEtiqueta("divCombo6","Moneda");
          }else{
            cmbCombo5Param = JSON.parse("{\"chido\":1000}");
            cmbCombo6Param = JSON.parse("{\"chido\":82}");
            SA(GI("combo5"), "keyValue", "monNumPais");
            SA(GI("combo5"), "theValue", "monNomMoneda");
            SA(GI("combo5"), "ref", "conNumMonNomMon");
            SA(GI("combo6"), "keyValue", "cveNumSecClave");
            SA(GI("combo6"), "theValue", "cveDescClave");
            SA(GI("combo6"), "ref", "cves");
            asignaEtiqueta("divCombo5","Moneda");
            asignaEtiqueta("divCombo6","Origen de los Recursos");
          }
          SA(GI("combo5"), "next", "combo6");
          SA(GI("combo6"), "next", "hideWaitLayer");
          loadElement(GI("combo5"));
          muestraObj("combo5");
          muestraObj("combo6");
          muestraObj("divCombo5");
          muestraObj("divCombo6");
          limpiaCombos("combo4,combo5,combo6");
        break;
        case 4:
          showWaitLayer();
          ocultaObj("combo7");
          ocultaObj("divCombo7");
          if(eval(GI("combo2").value) == 2 || eval(GI("combo2").value) == 5 || eval(GI("combo2").value) == 6 || eval(GI("combo2").value) == 7 || eval(GI("combo2").value) == 8 || eval(GI("combo2").value) == 9){//HONORARIOS PAGO ...
            cmbCombo7Param = JSON.parse("{\"secuencial\":" + GI("combo4").value + "}");
            SA(GI("combo7"), "keyValue", "x");
            SA(GI("combo7"), "theValue", "x");
            SA(GI("combo7"), "ref", "honSer");
            SA(GI("combo7"), "fun", "validaExisteHonorariosPor");
            loadElement(GI("combo7"));
          }else{
            hideWaitLayer();
          }
        break;
        case 41://HONORARIOS POR ...
            cmbCombo7Param = JSON.parse("{\"chido\":1000}");
            SA(GI("combo7"), "keyValue", "serNumServicio");
            SA(GI("combo7"), "theValue", "serNomServicio");
            SA(GI("combo7"), "ref", "conSer");
            SA(GI("combo7"), "fun", "loadComboElement");
            SA(GI("combo7"), "next", "hideWaitLayer");
            asignaEtiqueta("divCombo7","Servicio");
            loadElement(GI("combo7"));
            muestraObj("divCombo7");
            muestraObj("combo7");
            limpiaCombos("combo7");
        break;
        case 42:
            cmbCombo7Param = JSON.parse("{\"chido\":82}");
            SA(GI("combo7"), "keyValue", "cveNumSecClave");
            SA(GI("combo7"), "theValue", "cveDescClave");
            SA(GI("combo7"), "ref", "cves");
            SA(GI("combo7"), "fun", "loadComboElement");
            SA(GI("combo7"), "next", "hideWaitLayer");
            asignaEtiqueta("divCombo7","Origen de los Recursos");
            loadElement(GI("combo7"));
            muestraObj("divCombo7");
            muestraObj("combo7");
            limpiaCombos("combo7");
        break
      }
    break;
    case 6://GARANTIAS
        switch(txtNumCombo)
        {
          case 2:// 2do combo
            if(GI("combo2").selectedIndex!=0)// seleccionó algo
            {
              showWaitLayer();
              
              var cvechido = GI("combo2").value; 
              cvechido = (cvechido==74?cvechido=180:cvechido=cvechido);// excepcion garantias liquidas
              cmbCombo3Param = JSON.parse("{\"chido\":"+cvechido+"}");
              
              SA(GI("combo3"), "keyValue", "cveNumSecClave");
              SA(GI("combo3"), "theValue", "cveDescClave");
              SA(GI("combo3"), "ref", "cves");
              SA(GI("combo3"), "next", "hideWaitLayer");
              loadElement(GI("combo3"));
              muestraObj("combo3");
              muestraObj("divCombo3");
              limpiaCombos("combo3");
            }
          break;
        }
    break;
    case 8://BIENES FIDEICOMITIDOS
        switch(txtNumCombo)
        {
          case 2:
            if(GI("combo2").selectedIndex!=0)// seleccionó algo
            {
              showWaitLayer();
              cmbCombo3Param = JSON.parse("{\"chido\":"+GI("combo2").value+"}");
              SA(GI("combo3"), "keyValue", "cveNumSecClave");
              SA(GI("combo3"), "theValue", "cveDescClave");
              SA(GI("combo3"), "ref", "cves");
              SA(GI("combo3"), "next", "hideWaitLayer");
              loadElement(GI("combo3"));
              muestraObj("combo3");
              muestraObj("divCombo3");
              limpiaCombos("combo3");
            }
          break;
        }
    break;
  }
}

function validaExisteHonorariosPor(obj, result){
  if(isDefinedAndNotNull(result))
    var objValida = JSON.parse(result)[0];
  if(objValida.existeRegistro != 0)
    cargaComboCorrespondiente(GI("combo1"),41);
  else
    cargaComboCorrespondiente(GI("combo1"),42);
}


function generaNumeroOperacion(objTxt,objCombo){
  if(combosSeleccionados(objCombo)){
    var tipoOperacion = eval(objCombo.value);
    var numOperacion = formateaCadena(objCombo.value,1);
    switch(tipoOperacion){
      case 1: //DEPOSITO
        numOperacion += formateaCadena(GI("combo2").value,1);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
        numOperacion += formateaCadena(GI("combo6").value,2);
      break;
      case 2: //INVERSIONES
        numOperacion += formateaCadena(GI("combo2").value,1);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        if(eval(GI("combo4").value) == 6){
          numOperacion += formateaCadena(GI("combo5").value,2);
          numOperacion += formateaCadena(GI("combo6").value,2);
        }else{
          numOperacion += formateaCadena(GI("combo5").value,1);
          numOperacion += formateaCadena(GI("combo6").value,2);
          numOperacion += "0";
        }
      break;
      case 3: //LIQUIDACIONES        
        numOperacion += formateaCadena(GI("combo2").value,1);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
        numOperacion += formateaCadena(GI("combo6").value,2);
      break;
      case 4://INTERFASE MEDI
        numOperacion += formateaCadena(GI("combo2").value,1);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,1);
        numOperacion += formateaCadena(GI("combo6").value,2);
        numOperacion += "0";
      break;
      case 5://HONORARIOS
        numOperacion += formateaCadena(GI("combo2").value,1);
        numOperacion += formateaCadena(GI("combo3").value,1);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
        numOperacion += formateaCadena(GI("combo6").value,2);
        if(eval(GI("combo2").value) == 2 || eval(GI("combo2").value) == 5 || eval(GI("combo2").value) == 6 || eval(GI("combo2").value) == 7 || eval(GI("combo2").value) == 8 || eval(GI("combo2").value) == 9){//HONORARIOS PAGO ...
          numOperacion += formateaCadena(GI("combo7").value,2);
          numOperacion = numOperacion.substring(0,10);
        }else{
          numOperacion += "0";
        }
      break;
      case  6://GARANTIAS
        numOperacion += formateaCadena(GI("combo2").value,2);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
        while(numOperacion.length < 10)
          numOperacion += "0";
      break;
      case 7://POLIZAS
        numOperacion += GI("txtSecuencial").value;
        while(numOperacion.length < 10)
          numOperacion += "0";
      break;
      case 8://BIENES FIDEICOMITIDOS
        numOperacion += formateaCadena(GI("combo2").value,2);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
        while(numOperacion.length < 10)
          numOperacion += "0";
      break;
      case 10://LINEAS CREDITO
        numOperacion += formateaCadena(GI("combo2").value,2);
        numOperacion += formateaCadena(GI("combo3").value,2);
        numOperacion += formateaCadena(GI("combo4").value,2);
        numOperacion += formateaCadena(GI("combo5").value,2);
      break;
    }
    objTxt.value = numOperacion;
  }
}
function combosSeleccionados(objCombo){//TODOS LOS COMBOS ESTAN SELECCIONADOS??
  var tipoOperacion = eval(objCombo.value);
  switch(tipoOperacion){
    case 1:
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
        return true;
    break;
    case 2:
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
        return true;
    break;
    case 3:
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
        return true;
    break;
    case 4:
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
        return true;
    break;
    case 5:
      if(eval(GI("combo2").value) != -1 && (eval(GI("combo2").value) == 2 || eval(GI("combo2").value) == 5 || eval(GI("combo2").value) == 6 || eval(GI("combo2").value) == 7 || eval(GI("combo2").value) == 8 || eval(GI("combo2").value) == 9)){//HONORARIOS PAGO ...
        if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1 && eval(GI("combo7").value) != -1){
          return true;
        }
      }else if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
        return true;
    break;
    case 6://GARANTIAS
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1)
        return true;
      /*if(eval(GI("combo2").value) != -1 && eval(GI("combo2").value) == 3){//VALORES
        if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1 && eval(GI("combo6").value) != -1)
          return true;
      }else if(eval(GI("combo2").value) != -1){
        if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1)
          return true;
      }*/
    break;
    case 7:
      return true;
    break;
    case 8:// BIENES FIDEICOMITIDOS
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1)
        return true;
    break;
    case 10:// LINEAS CREDITO
      if(eval(GI("combo1").value) != -1 && eval(GI("combo2").value) != -1 && eval(GI("combo3").value) != -1 && eval(GI("combo4").value) != -1 && eval(GI("combo5").value) != -1)
        return true;
    break;
  }
  return false;
}

function ejecutaOperacion(){
  if(modo == OPER_ALTA){
    if(GI("opeNumOperacion").value.replace(" ","") != "" || combosSeleccionados(GI("combo1"))){
      if(GI("opeNumOperacion").value.replace(" ","") == ""){
        generaNumeroOperacion(GI("opeNumOperacion"),GI("combo1"));
      }else if(combosSeleccionados(GI("combo1"))){
        generaNumeroOperacion(GI("opeNumOperacion"),GI("combo1"));
      }
      if(fvCatOperacio.checkForm()){
        showWaitLayer();
        verificaOperacionOperaciones();
      }
    }else{
      alert("Es necesario formar el No. de Operación.");
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatOperacio.checkForm()){
      catOperacio.setOnUpdate(avisoOperacionCatalogo);
      catOperacio.modificaCatalogo();
      onButtonClickPestania("Contabilidad.Operaciones.PrincipalOperaciones","");
    }
  }else if(modo == OPER_BAJA){
    verificaOperacionOperaciones();
  }
}

function verificaOperacionOperaciones(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiOpe\",\"NumOperacion\":" + GI("opeNumOperacion").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionOperaciones, 1);
  }
  if(modo == OPER_BAJA){  
    var url = ctxRoot + "/doRef.do?json={\"id\":\"delEstOpe\",\"NumOperacion\":" + catOperacio.getCatalogo().opeNumOperacion + "}";
    makeAjaxRequest(url, "HTML", validaOperacionOperaciones , 2);
  }
}

function validaOperacionOperaciones(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case 1:
      if(resultado[0].existeOperacion != 0){
        alert("Esta Operación ya existe!");
        hideWaitLayer();
      }else{
        catOperacio.setOnUpdate(avisoOperacionCatalogo);
        catOperacio.altaCatalogo();
        onButtonClickPestania("Contabilidad.Operaciones.PrincipalOperaciones","");
        hideWaitLayer();
      }
    break;
    case 2:
      catOperacio.setOnUpdate(avisoOperacionCatalogo);
      catOperacio.bajaCatalogo(false);
      onButtonClickPestania("Contabilidad.Operaciones.PrincipalOperaciones","");
      hideWaitLayer();
    break;
  }
}
function formateaCadena(strFormatear,numDigitos){
  var intAux = eval(strFormatear);
  var strAux = "";
  if(strFormatear.length < numDigitos){
    for(var i = 0; i < numDigitos - strFormatear.length; i++)
      strAux += "0";
  }
  strAux += strFormatear;
  return strAux;
}