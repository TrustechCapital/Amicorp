var catTipocamb = new Catalogo("mx.com.inscitech.fiducia.domain.Tipocamb");

showWaitLayer();

var cmbStatusParam = JSON.parse("{\"chido\":31}");
var strIdPK = "ticNumPais,ticAnoAltaReg,ticMesAltaReg,ticDiaAltaReg,ticHoraAlta,ticMinutoAlta,ticFechaAlta";
var arrIdPK = strIdPK.split(",");
var fvCatTipocamb = new FormValidator();
var fvCatTipocambPri = new FormValidator();
var tblRegPriTipCam = new Array();
var fechaDefault = new Date();
var modo = 0;
pkInfo = null;

initForms();

tblRegPriTipCam[0] = "paiNomPais,140";
tblRegPriTipCam[1] = "monNomMoneda,140"; 
tblRegPriTipCam[2] = "ticAnoAltaReg,50";
tblRegPriTipCam[3] = "ticMesAltaReg,50";
tblRegPriTipCam[4] = "ticDiaAltaReg,50";
tblRegPriTipCam[5] = "ticHoraAlta,50";
tblRegPriTipCam[6] = "ticMinutoAlta,50";
tblRegPriTipCam[7] = "ticImpTipoCamb,80";
tblRegPriTipCam[8] = "ticCveStTipocam,100";

fvCatTipocamb.setup({
  formName      : "frmMantenimientoTiposCambio",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

fvCatTipocambPri.setup({
  formName      : "frmDatosTiposCambio",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catTipocamb.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catTipocamb = new Catalogo("mx.com.inscitech.fiducia.domain.Tipocamb");
  pkInfo = null;
}
function asignaRequiredCampos(objTxt){
  if(objTxt.value != ""){
    if(objTxt.id == "paramMes" || objTxt.id == "paramAno"){
      SA(GI("paramMes"),"required","true");
      SA(GI("paramAno"),"required","true");
      RA(GI("paramTipoCambio"),"required");
    }
    else{
      SA(GI("paramTipoCambio"),"required","true");
      RA(GI("paramMes"),"required");
      RA(GI("paramAno"),"required");
    }
  }
}
function cargaMantenimientoTiposCambio(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/TiposCambio/MantenimientoCatalogoTiposCambio.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoTiposCambio, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionTiposCambio();
  }
}

function despliegaPantallaMantenimientoCatalogoTiposCambio(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK("txtHoraMinuto".split(","));
  setupFechaAlta();
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoTiposCambio"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catTipocamb.setOnUpdate(cargaComplemento);
    catTipocamb.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    loadElement(GI("ticFechaAlta"));
    deshabilitaPK("ticMinutoAlta,ticHoraAlta".split(","));
  }
  formsLoaded();
}
function cargaComplemento(){
  catTipocamb.setOnUpdate(avisoOperacionCatalogo);
  var dia = GI("ticDiaAltaReg").value.length < 2?"0" + GI("ticDiaAltaReg").value : GI("ticDiaAltaReg").value;
  var mes = GI("ticMesAltaReg").value.length < 2?"0" + GI("ticMesAltaReg").value : GI("ticMesAltaReg").value;
  var ano = GI("ticAnoAltaReg").value;
  GI("ticFechaAlta").value = dia + "/" + mes + "/" + ano;
  GI("txtHoraMinuto").value = formatString(GI("ticHoraAlta").value,"0",2,"Izquierda") + ":" + formatString(GI("ticMinutoAlta").value,"0",2,"Izquierda");
}

function destazaFecha(){
  GI("ticDiaAltaReg").value = GI("ticFechaAlta").value.split("/")[0];
  GI("ticMesAltaReg").value = GI("ticFechaAlta").value.split("/")[1];
  GI("ticAnoAltaReg").value = GI("ticFechaAlta").value.split("/")[2];
  hideWaitLayer();
}

function ejecutaOperacionTiposCambio(){
  if(modo == OPER_ALTA){
    if(fvCatTipocamb.checkForm()){
      showWaitLayer();
      loadElement(GI("ticMinutoAlta"));
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatTipocamb.checkForm()){
      showWaitLayer();
      catTipocamb.setOnUpdate(avisoOperacionCatalogo);
      catTipocamb.modificaCatalogo();
      onButtonClickPestania('Tesoreria.TiposCambio.PrincipalCatalogoTiposCambio','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catTipocamb.setOnUpdate(avisoOperacionCatalogo);
    catTipocamb.bajaCatalogo(false);
    onButtonClickPestania('Tesoreria.TiposCambio.PrincipalCatalogoTiposCambio','');
    hideWaitLayer();
  }
}
function asignaHoraMinuto(obj, result){
  resultado = JSON.parse(result)[0];
  if(isDefinedAndNotNull(resultado.minuto)){
    GI("ticMinutoAlta").value = resultado.minuto;
    GI("ticHoraAlta").value = resultado.hora;
    GI("txtHoraMinuto").value = GI("ticHoraAlta").value + ":" + GI("ticMinutoAlta").value;
    verificaTipoCambio();
  }
}
function verificaTipoCambio(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiTipCam\",\"Pais\":" + GI("ticNumPais").value +  ",\"DiaAlta\":" + GI("ticDiaAltaReg").value + ",\"MesAlta\":" + GI("ticMesAltaReg").value + ",\"AnoAlta\":" + GI("ticAnoAltaReg").value + ",\"Minuto\":" + GI("ticMinutoAlta").value + ",\"Hora\":" + GI("ticHoraAlta").value + "}";
    makeAjaxRequest(url, "HTML", validaTipoCambio, null);
  }
}

function validaTipoCambio(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Tipo de Cambio ya existe!");
  }else{
    catTipocamb.setOnUpdate(avisoOperacionCatalogo);
    catTipocamb.altaCatalogo();
    onButtonClickPestania('Tesoreria.TiposCambio.PrincipalCatalogoTiposCambio','');
  }
  hideWaitLayer();
}

function isValidDate(date){
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

function setupFechaAlta(){
  Calendar.setup({
      inputField     :    "ticFechaAlta",
      button         :    "ticFechaAlta",
      ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",format of the input field
      showsTime      :    false,
      timeFormat     :    "24",
      onUpdate       :    destazaFecha,
      disableFunc    :    isValidDate,
      date           :    fechaDefault,
      weekNumbers    :    false,
      cache          :    true,
      step           :    1
  });
}
