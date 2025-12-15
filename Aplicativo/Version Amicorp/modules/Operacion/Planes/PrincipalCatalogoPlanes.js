var catPlanes = new Catalogo("mx.com.inscitech.fiducia.domain.Planes");

showWaitLayer();

var cmbPeriodicidadParam = JSON.parse("{\"chido\":52}");

var strIdPK = "plaCveFaseProd";
var arrIdPK = strIdPK.split(",");
var fvCatPlanes = new FormValidator();
var tblRegPlaDat = new Array();
var fechaDefault = new Date();
var modo = 0;
pkInfo = null;

initForms();

tblRegPlaDat[0] = "plaCveFaseProd,200"
tblRegPlaDat[1] = "plaDescFaseProd,500"; 
tblRegPlaDat[2] = "plaCvePerAplica,100";

fvCatPlanes.setup({
  formName      : "frmDatos2",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});
Calendar.setup({
      inputField     :    "Fecha",
      button         :    "Fecha",
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
function setCalendario(){
Calendar.setup({
      inputField     :    "Fecha",
      button         :    "Fecha",
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
function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catPlanes.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catPlanes = new Catalogo("mx.com.inscitech.fiducia.domain.Planes");
  pkInfo = null;
}

function cargaMantenimientoCatalogoPlanes(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Operacion/Planes/MantenimientoCatalogoPlanes.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoPlanes, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionPlan();
  }
}

function despliegaPantallaMantenimientoCatalogoPlanes(obj, result) {
  GI("dvPantalla").innerHTML = result;
  setCalendario();
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos2"));
      GI("cmdAceptar").disabled = true;
    }
  }
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catPlanes.setOnUpdate(cargaComplemento);
    catPlanes.buscaCatalogoPK(false);
  }else if(modo == OPER_ALTA){
    loadElement(GI("Fecha"));
  }
}
function cargaComplemento(){
  catPlanes.setOnUpdate(avisoOperacionCatalogo);
  cargaChecks("plaCveChControl");
  armaFecha();
  hideWaitLayer();
}
function destazaFecha(){
  if(GI("Fecha").value != ""){
    GI("plaDiaAplicacion").value = GI("Fecha").value.split("/")[0];
    GI("plaMesAplicacion").value = GI("Fecha").value.split("/")[1];
    GI("plaAnoAplicacion").value = GI("Fecha").value.split("/")[2];
  }
  hideWaitLayer();
}
function armaFecha(){
  var dia = GI("plaDiaAplicacion").value.length < 2?"0" + GI("plaDiaAplicacion").value : GI("plaDiaAplicacion").value;
  var mes = GI("plaMesAplicacion").value.length < 2?"0" + GI("plaMesAplicacion").value : GI("plaMesAplicacion").value;
  var ano = GI("plaAnoAplicacion").value;
  GI("Fecha").value = dia + "/" + mes + "/" + ano;
}
function ejecutaOperacionPlan(){
  if(modo == OPER_ALTA){
    if(fvCatPlanes.checkForm()){
      showWaitLayer();
      verificaPlan();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatPlanes.checkForm()){
      showWaitLayer();
      catPlanes.setOnUpdate(avisoOperacionCatalogo);
      catPlanes.modificaCatalogo();
      onButtonClickPestania('Operacion.Planes.PrincipalCatalogoPlanes','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    verificaPlan();
  }
}
function verificaPlan(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiPla\",\"Nombre\":\"" + GI("plaCveFaseProd").value + "\"}";
    makeAjaxRequest(url, "HTML", validaPlan, modo);
  }else if(modo == OPER_BAJA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiRutAsiPla\",\"Nombre\":\"" + catPlanes.getCatalogo().plaCveFaseProd + "\"}";
    makeAjaxRequest(url, "HTML", validaPlan, modo);
  }
}

function validaPlan(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Plan ya existe!");
      }else{
        catPlanes.setOnUpdate(avisoOperacionCatalogo);
        catPlanes.altaCatalogo();
        onButtonClickPestania('Operacion.Planes.PrincipalCatalogoPlanes','');
      }
    break;
    case OPER_BAJA:
      if(resultado[0].existeRegistro != 0){
        alert("No se puede dar de baja un Plan que mantenga rutinas asignadas!");
      }else{
        catPlanes.setOnUpdate(avisoOperacionCatalogo);
        catPlanes.bajaCatalogo(false);
        onButtonClickPestania('Operacion.Planes.PrincipalCatalogoPlanes','');
      }
    break;
  }
  hideWaitLayer();
}

function isValidDate(date){
/*
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
*/
}
