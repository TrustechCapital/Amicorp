var catContinte = new Catalogo("mx.com.inscitech.fiducia.domain.Continte");

showWaitLayer();
var Fideicomiso = JSON.parse("{\"Fideicomiso\":0,\"order\":\"s\"}");
var cmbFormaManejoParam = JSON.parse("{\"chido\":24}");
var cmbOrigenRecursosParam = JSON.parse("{\"chido\":82}");
var cmbStatusParam = JSON.parse("{\"chido\":31}");
var fideo = JSON.parse("{\"fideso\":0}")
var subfideo = JSON.parse("{\"fideso\":0}");
var divNombreFideicomisoParam;
var strIdPK = "cprSubContrato,cprContratoInter,cprNumContrato,cprEntidadFin";
var arrIdPK = strIdPK.split(",");
var fvCatContinte = new FormValidator();
var arrTblConInvDat = new Array();
var modo = 0;
pkInfo = null;

var banco; 
var plaza;
var cuenta;

initForms();

arrTblConInvDat[0] = "cprNumContrato,82";
arrTblConInvDat[1] = "cprContratoInter,123";
arrTblConInvDat[2] = "subcuenta,206";
arrTblConInvDat[3] = "cprNomIntermed,206";
arrTblConInvDat[4] = "cprClabe,200";
arrTblConInvDat[5] = "cprCveStContint,100";
    
fvCatContinte.setup({
  formName      : "frmMantenimientoContratosInversion",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function clickTabla(pk){
  pkInfo = pk;
  cloneObject(pk,catContinte.getCatalogo());
}

function limpiar(objForma){
  RF(objForma);
  catContinte = new Catalogo("mx.com.inscitech.fiducia.domain.Continte");
  pkInfo = null;
}

function cargaMantenimientoContratosInversion(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Tesoreria/ContratosInversion/MantenimientoCatalogoContratosInversion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoCatalogoContratosInversion, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionContratosInversion();
  }
}

function despliegaPantallaMantenimientoCatalogoContratosInversion(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmMantenimientoContratosInversion"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
    catContinte.setOnUpdate(cargaComplemento);
    catContinte.buscaCatalogoPK(false);
  }else
  {
    formsLoaded();
  }
   timeback("ModCon");
}
function cargaComplemento(){

  consultaNombreFideicomiso("nomFideicomiso",GI("cprNumContrato"));
  formsLoaded();
}
function ejecutaOperacionContratosInversion(){
  if(modo == OPER_ALTA){
    if(fvCatContinte.checkForm()){
      showWaitLayer();
      verificaContratoInversion();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCatContinte.checkForm()){
      showWaitLayer();
      catContinte.setOnUpdate(avisoOperacionCatalogo);
      muestraClave();
      catContinte.modificaCatalogo();
      onButtonClickPestania('Tesoreria.ContratosInversion.PrincipalCatalogoContratosInversion','');
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catContinte.setOnUpdate(avisoOperacionCatalogo);
    catContinte.bajaCatalogo(false);
    onButtonClickPestania('Tesoreria.ContratosInversion.PrincipalCatalogoContratosInversion','');
    hideWaitLayer();
  }
}
function verificaContratoInversion(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExiConInv\",\"Contrato\":" + GI("cprNumContrato").value + ",\"Intermediario\":" + GI("cprEntidadFin").value + ",\"ContratoInversion\":" + GI("cprContratoInter").value + ",\"SubContrato\":" + GI("cprSubContrato").value + "}";
    makeAjaxRequest(url, "HTML", validaContratoInversion, null);
  }
}

function validaContratoInversion(obj, result){
  resultado = JSON.parse(result);
  if(resultado[0].existeRegistro != 0){
    alert("El Contrato de Inversión ya existe!");
  }else{
    catContinte.setOnUpdate(avisoOperacionCatalogo);
    timeback("Alta");
  }
  hideWaitLayer();
}

function CargaComboCuentas()
{
  var valor = GI("cprNumContrato").value;
  
  Fideicomiso = JSON.parse("{\"Fideicomiso\":"+((valor!="")?valor:"0")+",\"order\":\"s\"}");
  fideo = JSON.parse("{\"fideso\":"+((valor!="")?valor:"0")+",\"status\":\"AUTORIZADA\"}");
  (GI("cprSubContrato"),"param","subfideo");
  SA(GI("cprSubContrato"),"next","cprEntidadFin");
  SA(GI("cprNumCuenta"),"param","fideo");
  SA(GI("cprNumCuenta"),"next","");
   
  loadElement(GI("cprNumCuenta")); 
  loadElement(GI("cprSubContrato"));
}

function AsignaCuentas()
{
  var valor1 = GI("cprNumContrato").value;
  var valor2 = GI("cprContratoInter").value;
  var valor3 = GI("cprEntidadFin").value;
  
  var validacion = JSON.parse("{\"id\":\"consultaCuentas\"}");
  validacion.nContrato= eval(((valor1!="")?valor1:"0"));
  validacion.CInter= eval(((valor2!="")?valor2:"0"));
  validacion.eFin= eval(((valor3!="")?valor3:"0"));

  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(validacion);
  
  makeAjaxRequest(url, "HTML", yaSeParaQue, null);
  
}


function yaSeParaQue(obj,result)
{
  var valor = JSON.parse(result)[0];
  
  var cbCuenta= valor.cprNumCuenta;
  var cbSubcuenta = valor.fsctNombreSubCuenta;
  
  for(var conta = 0;conta<GI("cprNumCuenta").options.length;conta++)
  {
    if(GI("cprNumCuenta").options[conta].text==cbCuenta)
    {
      GI("cprNumCuenta").selectedIndex= conta;
    }
  }
   for(var conta = 0;conta<GI("cprSubContrato").options.length;conta++)
  {
    if(GI("cprSubContrato").options[conta].text==cbSubcuenta)
    {
      GI("cprSubContrato").selectedIndex= conta;
    }
  }
  
  
}

function muestraClave(){
   var numContrato;
  if(GI("cprNumContrato").value!=""||GI("cprNumContrato").value!=null)
     numContrato= GI("cprNumContrato").value;
  else 
    numContrato=0;
    var validacion = JSON.parse("{\"id\":\"muestraCuentaBancariaCompleta\"}");
    validacion.fiso= eval(numContrato);
    var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(validacion);
    makeAjaxRequest(url, "HTML", separate, null);  
}

function separate(obj,result)
{
    var valor = JSON.parse(result)[0];
    banco = valor.fcbaClabeCba.substring(0,3);
    plaza = valor.fcbaClabeCba.substring(3,6);
    GI("cprNumBanco").value=banco;
    GI("cprNumSucursal").value=plaza;
}

var tiempo = 0;
function timeback(opc)
{
  if(tiempo<50)
  {
    tiempo++;
    setTimeout("timeback('"+opc+"')",10);
  }
  else 
  {
    if(opc=="Alta")
    {
      catContinte.altaCatalogo();
      onButtonClickPestania('Tesoreria.ContratosInversion.PrincipalCatalogoContratosInversion','');
    }
    else if(opc=="ModCon")
    {
      CargaComboCuentas();
      AsignaCuentas();
    }
    
    tiempo=0;
  }
}
