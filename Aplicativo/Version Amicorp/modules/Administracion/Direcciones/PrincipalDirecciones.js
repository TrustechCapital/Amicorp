var cat = new Catalogo("mx.com.inscitech.fiducia.domain.Direcci");

var strIdPK = "dirNumContrato,dirCvePersFid,dirNumPersFid,dirNumSecDirecc";
var arrIdPK = strIdPK.split(",");
var modo2 = 0;
var pkInfo2 = null;
var cmbTipoDomicilioParam = JSON.parse("{\"chido\":19}");
var cmbEstadosParam = JSON.parse("{\"clavePaisCat\":-1}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var arrTblDat = new Array();

arrTblDat = new Array();
arrTblDat[0] = "dirNumSecDirecc,40px";
arrTblDat[1] = "dirNomAtencion,300px";
arrTblDat[2] = "dirDireccion,300px";

function clickTabla2(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo2 = pk;
}

function cargaMantenimientoDirecciones(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo2) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var objDatosDirecciones = new Object();
    objDatosDirecciones.Fideicomiso = GI("paramFideicomiso").value;
    objDatosDirecciones.nomFideicomiso = GI("nomFideicomiso").innerHTML;
    objDatosDirecciones.Fideicom = GI("paramFideicom").value;
    objDatosDirecciones.fidNomFideicom = GI("fidNomFideicom").value;
    var urlCliente = "modules/Administracion/Direcciones/MantenimientoDirecciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoDirecciones, objDatosDirecciones);
  }else if(isDefinedAndNotNull(pkInfo2) && Modo == OPER_BAJA){
    ejecutaOperacionDireccion();
  }
}

function despliegaPantallaMantenimientoDirecciones(obj, result) {
  GI("dvContenido").innerHTML = result;
  GI("dirNumContrato").value = obj.Fideicomiso;
  asignaEtiqueta("nomFideicomiso",obj.nomFideicomiso);
  GI("dirNumPersFid").value = obj.Fideicom;
  GI("fidNomFideicom").value = obj.fidNomFideicom;
  deshabilitaPK("dirNumContrato,dirNumPersFid,fidNomFideicom".split(","));
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
  if(isDefinedAndNotNull(pkInfo2) && modo != OPER_ALTA){
    cat.setOnUpdate(cargaCmbEstados);
    cat.buscaCatalogoPK(false);
  }else{
    asignaSecuencialDireccion();
  }
}
function cargaCmbEstados(){
  cmbEstadosParam.clavePais = cat.getCatalogo().dirNumPais;
  SA(GI("dirNumEstado"),"next","cargaComplementoDireccion");
  loadElement(GI("dirNumEstado"));
}
function cargaComplementoDireccion(){
  SA(GI("dirNumEstado"),"next","hideWaitLayer");
  cat.setOnUpdate(avisoOperacionCatalogo);
  GI("dirNomPais").value = cat.getCatalogo().dirNomPais;
  GI("dirNumEstado").value = cat.getCatalogo().dirNumEstado;
  GI("dirNomEstado").value = cat.getCatalogo().dirNomEstado;
  formsLoaded();
}

function asignaSecuencialDireccion(){
  var objSecuencial = GI("dirNumSecDirecc");
  var objSecuencialParam = JSON.parse("{}");
  objSecuencialParam.id = "asiValSecDirFid";
  objSecuencialParam.Fideicomiso = GI("dirNumContrato").value;
  objSecuencialParam.TipoPersona = GI("dirCvePersFid").value;
  objSecuencialParam.Fideicom = GI("dirNumPersFid").value;
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objSecuencialParam);
  makeAjaxRequest(url, "HTML", asignaValorSecuencialDireccion, objSecuencial);
}

function asignaValorSecuencialDireccion(obj, result){
  resultado = JSON.parse(result)[0];
  obj.value = resultado.numSecuencial;
  formsLoaded();
}

function asignaDatosObjs(objCmb){
  if(objCmb.id == "dirNumPais"){
    showWaitLayer();
    GI("dirNomPais").value = objCmb.options[objCmb.selectedIndex].text;
    limpiaCombos("dirNumEstado");
    limpiaTxts("dirNomEstado");
    cmbEstadosParam.clavePais = objCmb.value;  
    loadElement(GI("dirNumEstado"));
  }else{
    GI("dirNomEstado").value = objCmb.options[objCmb.selectedIndex].text;
  }
}
function cargaPrincipalDirecciones2(){
  showWaitLayer();
  pkInfo2 = null;
  var objDatosFideicomitente = new Object();
  objDatosFideicomitente.NumContrato = GI("dirNumContrato").value;
  objDatosFideicomitente.NomContrato = GI("nomFideicomiso").innerHTML;
  objDatosFideicomitente.NumFideicomitente = GI("dirNumPersFid").value;
  objDatosFideicomitente.NomFideicomitente = GI("fidNomFideicom").value;
  var urlCliente = "modules/Administracion/Direcciones/PrincipalDirecciones.do";
  makeAjaxRequest(urlCliente, "HTML", despliegaPantallaPrincipalDirecciones, objDatosFideicomitente);
}

function ejecutaOperacionDireccion(){
  cat.setOnUpdate(verificaOperacionDireccion);
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.altaCatalogo();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    cat.bajaCatalogo(false);
  }
}
function verificaOperacionDireccion(){
  alert("Operacion realizada exitosamente!");
  if(modo == OPER_BAJA)
    consultar(GI("cmdRegresar"), GI("frmDatos"), false);
  else
    cargaPrincipalDirecciones2();
  hideWaitLayer();
}