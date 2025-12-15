showWaitLayer();

var cmbStatusParam = JSON.parse("{\"chido\":31}");
initForms();

var catEntescon = new Catalogo("mx.com.inscitech.fiducia.domain.Entescon");
var fvCatEntescon = new FormValidator();
var strIdPK = "entNumContrato,entNumEnteCont,entCveStEntes";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var arrTblConEntDat = new Array();
pkInfo = null;

arrTblConEntDat[0] = "entNumContrato,100px";
arrTblConEntDat[1] = "entNumEnteCont,100px";
arrTblConEntDat[2] = "entNomTipoEnte,100px";
arrTblConEntDat[3] = "entCveStEntes,100px";

fvCatEntescon.setup({
  formName      : "frmMantenimientoEntesConceptos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catEntescon.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catEntescon = new Catalogo("mx.com.inscitech.fiducia.domain.Entescon");
  pkInfo = null;
}

function cargaMantenimientoEntesConceptosContInst(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Contabilidad/Conceptos/MantenimientoEntesConceptosContInst.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoEntesConceptosContInst, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionEntesConceptos();
  }
}

function despliegaPantallaMantenimientoEntesConceptosContInst(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    deshabilitaPK("entTipoEnte".split(","));
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoEntesConceptos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValores2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catEntescon.setOnUpdate(cargaComplemento);
    catEntescon.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}
function cargaComplemento(){
  var tipoEnte = eval(GI("entTipoEnte").value);
  switch(tipoEnte){
    case 1:
      muestraObj("entNumContrato");
      muestraObj("div1");
      SA(GI("entNumContrato"),"required","true");
      asignaEtiqueta("div1","Fideicomiso");
    break;
    case 2:
      muestraObj("entNumContrato");
      muestraObj("div1");
      muestraObj("entNumTipo");
      muestraObj("div2");
      asignaEtiqueta("div1","Fideicomiso");
      SA(GI("entNumContrato"),"required","true");
      asignaEtiqueta("div2","Fideicomisario");
      SA(GI("entNumTipo"),"required","true");
    break;
    case 3:
      muestraObj("entNumContrato");
      muestraObj("div1");
      muestraObj("entNumTipo");
      muestraObj("div2");
      asignaEtiqueta("div1","Fideicomiso");
      SA(GI("entNumContrato"),"required","true");
      asignaEtiqueta("div2","Tercero");
      SA(GI("entNumTipo"),"required","true");
    break;
    case 4:
      muestraObj("entNumTipo");
      muestraObj("div2");
      asignaEtiqueta("div2","Área Nafin");
      SA(GI("entNumTipo"),"required","true");
    break;
    case 5:
      muestraObj("entNumTipo");
      muestraObj("div2");
      asignaEtiqueta("div2","Banco");
      SA(GI("entNumTipo"),"required","true");
    break;
    case 6:
      muestraObj("entNumTipo");
      muestraObj("div2");
      asignaEtiqueta("div2","Banco de México");
      SA(GI("entNumTipo"),"required","true");
    break;
  }
  formsLoaded();
}

function cargaObjTipoEnte(objComboTipoEnte){
  showWaitLayer();
  GI("entNumContrato").value = "0";
  GI("entNumTipo").value = "";
  ocultaObj("div1");
  ocultaObj("div2");
  ocultaObj("entNumContrato");
  ocultaObj("entNumTipo");
  RA(GI("entNumContrato"),"required");
  RA(GI("entNumTipo"),"required");
  if(objComboTipoEnte.selectedIndex == 0){
    ocultaObj("div1");
    ocultaObj("div2");
    ocultaObj("entNumContrato");
    ocultaObj("entNumTipo");
    hideWaitLayer();
  }else
    cargaComplemento();
}

function ejecutaOperacionEntesConceptos(){
  if(modo == OPER_ALTA){
    if(fvCatEntescon.checkForm()){
      showWaitLayer();
      verificaExisteEnte();
    }
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    if(fvCatEntescon.checkForm()){
      catEntescon.setOnUpdate(avisoOperacionCatalogo);
      catEntescon.modificaCatalogo();
      onButtonClick("Contabilidad.Conceptos.PrincipalEntesConceptosContInst","");
    }
    hideWaitLayer();
  }else if(modo == OPER_BAJA){
    catEntescon.setOnUpdate(avisoOperacionCatalogo);
    catEntescon.bajaCatalogo(false);
    onButtonClick("Contabilidad.Conceptos.PrincipalEntesConceptosContInst","");
  }
}

function verificaExisteEnte(){
  var NumContrato = GI("entNumContrato").value;
  var NumEnteCont = GI("entNumEnteCont").value;
  var CveStEntes = GI("entCveStEntes").value;
  var parametros = "\"NumContrato\":" + NumContrato + ",\"NumEnteCont\":" + NumEnteCont + ",\"CveStEntes\":\"" + CveStEntes+ "\"";
  var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiEntCon\"," + parametros + "}";
  makeAjaxRequest(url, "HTML", verificaOperacionEntesConceptos, null);
  hideWaitLayer();
}

function verificaOperacionEntesConceptos(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Ente asignado ya existe!");
    hideWaitLayer();
  }else{
    catEntescon.setOnUpdate(avisoOperacionCatalogo);
    catEntescon.altaCatalogo();
    onButtonClick("Contabilidad.Conceptos.PrincipalEntesConceptosContInst","");
    hideWaitLayer();
  }
}