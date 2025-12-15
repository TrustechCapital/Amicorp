showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FCatfera");
var fvCat = new FormValidator();
var strIdPK = "edfaIdPais,edfaIdMes,edfaIdDia";
var arrIdPK = strIdPK.split(",");
var cmbReglaParam = JSON.parse("{\"Indice\":505}");
var cmbSemanaParam = JSON.parse("{\"Indice\":506}");
var cmbDiaSemanaParam = JSON.parse("{\"Indice\":502}");
cmbDiaSemanaParam.orderSecuencial = "s";
var modo = 0;
pkInfo = null;

var arrTblDat = new Array();
arrTblDat = new Array();
arrTblDat[0] = "edfaNomPais,150px";
arrTblDat[1] = "edfaNomMes,200px";
arrTblDat[2] = "edfaDescFecha,300px";
arrTblDat[3] = "edfaStDiasfera,100px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function clickTabla(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  cat = new Catalogo("mx.com.inscitech.fiducia.domain.FCatfera");
  pkInfo = null;
}

function cargaMantenimientoCatalogoDiasFeriados(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/DiasFeriados/MantenimientoCatalogoDiasFeriados.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoDiasFeriados, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionDiaFeriado();
  }
}

function despliegaPantallaMantenimientoCatalogoDiasFeriados(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}
function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    //cat.setOnUpdate(cargaComplementoDiaFeriado);
    cat.buscaCatalogoPK(false);
    cargaComplementoDiaFeriado();
  }else{
    formsLoaded();
  }
}
function cargaComplementoDiaFeriado(){
  //cat.setOnUpdate(avisoOperacionCatalogo);
  cargaRadiosConMaster("edfaTipoDia","rdDiaVariable");
  if(GI("edfaTipoDia").value != "0"){
    SA(GI("edfaRegla"),"required","true");
    SA(GI("edfaSemana"),"required","true");
    SA(GI("edfaDiaSemana"),"required","true"); 
    habilitaPK("edfaRegla,edfaSemana,edfaDiaSemana".split(","));
  }else
    deshabilitaPK("edfaRegla,edfaSemana,edfaDiaSemana".split(","));
  formsLoaded();
}
function estableceTipoDia(strRadioMaster,objRdActual){
  asignaValueRadio2Master(strRadioMaster,objRdActual);
  limpiaCombos("edfaRegla,edfaSemana,edfaDiaSemana");
  if(objRdActual.id == "edfaTipoDia"){
    RA(GI("edfaRegla"),"required");
    RA(GI("edfaSemana"),"required");
    RA(GI("edfaDiaSemana"),"required");
    deshabilitaPK("edfaRegla,edfaSemana,edfaDiaSemana".split(","));
  }else{
    SA(GI("edfaRegla"),"required","true");
    SA(GI("edfaSemana"),"required","true");
    SA(GI("edfaDiaSemana"),"required","true"); 
    habilitaPK("edfaRegla,edfaSemana,edfaDiaSemana".split(","));
  }
}

function ejecutaOperacionDiaFeriado(){
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      verificaDiaFeriado();
    }
  }else if(modo == OPER_MODIFICAR){
    showWaitLayer();
    if(fvCat.checkForm()){
      cat.modificaCatalogo();
      onButtonClick("EmisionTitulos.DiasFeriados.PrincipalCatalogoDiasFeriados","");
    }
    hideWaitLayer();
  }else if(modo == OPER_BAJA){
    verificaDiaFeriado();
  }
}
function verificaDiaFeriado(){
  showWaitLayer();
  var objDiaFeriadoParam = JSON.parse("{}");
  if(modo == OPER_ALTA){    
    objDiaFeriadoParam.id = "verETExiCatDiaFer";
    objDiaFeriadoParam.Pais = GI("edfaIdPais").value;
    objDiaFeriadoParam.Dia = GI("edfaIdDia").value;
    objDiaFeriadoParam.Mes = GI("edfaIdMes").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objDiaFeriadoParam);
    makeAjaxRequest(url, "HTML", validaOperacionDiaFeriado, modo);
  }
  if(modo == OPER_BAJA){    
    objDiaFeriadoParam.id = "delETDiaFer";
    objDiaFeriadoParam.Pais = pkInfo.edfaIdPais;
    objDiaFeriadoParam.Dia = pkInfo.edfaIdDia;
    objDiaFeriadoParam.Mes = pkInfo.edfaIdMes;
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDiaFeriadoParam);
    makeAjaxRequest(url, "HTML", validaOperacionDiaFeriado, modo);
  }
}

function validaOperacionDiaFeriado(obj, result){
  resultado = JSON.parse(result);
  switch(obj){
    case OPER_ALTA:
      if(resultado[0].existeRegistro != 0){
        alert("El Registro ya existe!");
      }else{
        //cat.setOnUpdate(avisoOperacionCatalogo);
        cat.altaCatalogo();
        onButtonClick("EmisionTitulos.DiasFeriados.PrincipalCatalogoDiasFeriados","");
      }
    break;
    case OPER_BAJA:
      //cat.setOnUpdate(avisoOperacionCatalogo);
      cat.bajaCatalogo(false);
      onButtonClick("EmisionTitulos.DiasFeriados.PrincipalCatalogoDiasFeriados","");
    break;
  }
  hideWaitLayer();
}