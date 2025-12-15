showWaitLayer();

var clavesCombo36  = JSON.parse("{\"llaveClave\":36}");
var clavesCombo37  = JSON.parse("{\"llaveClave\":37}");
var clavesCombo23  = JSON.parse("{\"llaveClave\":23}");
var clavesCombo18  = JSON.parse("{\"llaveClave\":18}");



var cat = new Catalogo("mx.com.inscitech.fiducia.domain.Prodesta");
var catProd = new Catalogo("mx.com.inscitech.fiducia.domain.Producto");
var fvCat = new FormValidator();
var strIdPK = "proNumProdEsta";
var arrIdPK = strIdPK.split(",");
var strIdPKProd = "prlNumProducto";
var arrIdPKProd = strIdPKProd.split(",");
var modo = 0;
pkInfo = null;
var pkInfoProd = null;

var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "proNumProdEsta,50px";
arrTblDat[1] = "proNomProdEsta,200px";
arrTblDat[2] = "proTipoNegocio,200px";
arrTblDat[3] = "proClasifProd,200px";
arrTblDat[4] = "proCveStProdest,100px";

var arrTblDatProd = new Array();
arrTblDatProd[0] = "prlNumProducto,50px";
arrTblDatProd[1] = "prlNomProducto,200px";
arrTblDatProd[2] = "prlTipoNegocio,200px";
arrTblDatProd[3] = "prlClasifProd,200px";
arrTblDatProd[4] = "prlNomenclatura,100px";
arrTblDatProd[5] = "prlCveStProduct,100px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


initForms();

function consultaProd(btnAceptar)
{
  consultar(btnAceptar, frmDatos, false);
  
  GI('tbProductos').style.visibility="hidden";
  GI('hdProductos').style.visibility="hidden";
}

function clickTabla(pk)
{
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
  
  GI('tbProductos').style.visibility="visible";
  GI('hdProductos').style.visibility="visible";
  GI('paramNumProdestaProd').value = pkInfo.proNumProdEsta;
  GI('cmdAceptarProd').click();

}


function clickTablaProd(pk)
{
  cloneObject(pk,catProd.getCatalogo());
  pkInfoProd = pk;
}


function limpiar(objForma)
{
  regresar();
}

// mantenimiento prodesta -----------------

function cargaMantenimientoProdesta(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Otros/Productos/MantenimientoProductos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProdesta, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA)
  {
    ejecutaOperacion();
  }
}
function despliegaPantallaMantenimientoProdesta(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  initForms(); 
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
}


function previoEjecutaOperacion(objPantallaProd)
{
  if(modo == OPER_ALTA||modo == OPER_MODIFICAR)
  {
    showWaitLayer();
  
    if(objPantallaProd=="PRODESTA")
      consultaCuentas();
    else if(objPantallaProd=="PRODUCTO") 
      consultaCuentasProd();
  }
}

function ejecutaOperacion()
{
  if(modo == OPER_ALTA)
  {
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      showWaitLayer();
      cat.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    cat.setOnUpdate(validaAvisoOperacionCatalogo);
    cat.bajaCatalogo(false);
    
  }
}


function asignaValues2ObjHTML(){
  if(once)
  {
   once = false;
     if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
     {
       cat.setOnUpdate(catLoaded);
       cat.buscaCatalogoPK(false);
     }else{
       formsLoaded();
     }
   }
}

//-----------------------------------------

// mantenimiento producto -----------------

function cargaMantenimientoProducto(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfoProd) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Otros/Productos/MantenimientoEstructuraProductos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProducto, null);
  }else if(isDefinedAndNotNull(pkInfoProd) && Modo == OPER_BAJA)
  {
    ejecutaOperacionProd();
  }
}
function despliegaPantallaMantenimientoProducto(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  GI('prlNumProdEsta').value = pkInfo.proNumProdEsta;
  
  initForms(); 
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
   
    deshabilitaPK(arrIdPKProd);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
}


function ejecutaOperacionProd()
{
  
  if(modo == OPER_ALTA){
    if(fvCat.checkForm()){
      showWaitLayer();
      catProd.setOnUpdate(validaAvisoOperacionCatalogo);
      catProd.altaCatalogo();  
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvCat.checkForm()){
      catProd.setOnUpdate(validaAvisoOperacionCatalogo);
      showWaitLayer();
      catProd.modificaCatalogo();
    }
  }else if(modo == OPER_BAJA){
    showWaitLayer();
    catProd.setOnUpdate(validaAvisoOperacionCatalogo);
    catProd.bajaCatalogo(false);
    
  }
}

function asignaValues2ObjHTMLProd(){
  if(once)
  {
   once = false;
     if(isDefinedAndNotNull(pkInfoProd) && modo != OPER_ALTA)
     {
       catProd.setOnUpdate(catLoaded);
       catProd.buscaCatalogoPK(false);
     }else
     {
      // hereda datos de f_prodesta
        consultaProdesta();
      
     }
   }
}

//-----------------------------------------

var once=true;


function catLoaded() 
{
   hideWaitLayer();
}


function validaAvisoOperacionCatalogo()
{
  alert("Operación realizada exitosamente!");
  regresar();
  hideWaitLayer();
}  
  
function regresar()
{
  onButtonClickPestania("Otros.Productos.PrincipalProductos","");
}

 // hereda valores de prodesta  a producto-----

function consultaProdesta()
{
  var objProdesta = JSON.parse("{}");
  objProdesta.id = "qryProdesta";
  objProdesta.NumProdesta = pkInfo.proNumProdEsta;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objProdesta);
  
  makeAjaxRequest(url,"html",consultaProdestaRes,null);
}

function consultaProdestaRes(obj,result)
{
  var res = JSON.parse(result)[0];
  
  if(isDefinedAndNotNull(res))
  {
    GI("prlTipoNegocio").value = res.proTipoNegocio;
    GI("prlClasifProd").value = res.proClasifProd;
    GI("prlCtamResult").value = res.proCtamResult;
    GI("prlSctaResult").value = res.proSctaResult;
    GI("prlSsctaResult").value = res.proSsctaResult;
    GI("prlSssctaResult").value = res.proSssctaResult;
    GI("prlNumCtamAcept").value = res.proCtamAcept;
    GI("prlNumSctaAcept").value = res.proSctaAcept;
    GI("prlSsctaAcept").value = res.proSsctaAcept;
    GI("prlSssctaAcept").value = res.proSssctaAcept;
    GI("prlCtamServic").value = res.proCtamServic;
    GI("prlSctaServic").value = res.proSctaServic;
    GI("prlSsctaServic").value = res.proSsctaServic;
    GI("prlSssctaServic").value = res.proSssctaServic;
    GI("prlCveSujeto30Chk").checked = (res.proCveSujeto30==1);
    GI("prlSujeArt28Chk").checked = (res.proCveSujeto28==1);
    GI("prlTipoCliente").value = res.proCveTipClient;
    GI("prlCveTipoPers").value = res.proCveTipPers;
    GI("prlCvePriTitu").value = res.proCvePriTitu;
    GI("prlImpMinAper").value = res.proImpMinApert;
    GI("prlImpHonAcep").value = res.proImpHonAcepta;
    GI("prlImpHonManejo").value = res.proImpHonManejo;
    GI("prlNumMesResg").value = res.proNumMesResg;
    GI("prlCveStProduct").value = res.proCveStProdest;
    
  }
  
  formsLoaded();
} 
 
//--- consulta que las cuentas insertadas sean válidas --------

var existeCuenta = true;

function consultaCuentas()
{
  existeCuenta = true;
  
  if(existeCuenta)
    consultaCuenta(GI('proCtamResult'),GI('proSctaResult'),GI('proSsctaResult'),GI('proSssctaResult'));
  setTimeout("if(existeCuenta)consultaCuenta(GI('proCtamAcept'),GI('proSctaAcept'),GI('proSsctaAcept'),GI('proSssctaAcept'));",1000);
  setTimeout("if(existeCuenta)consultaCuenta(GI('proCtamServic'),GI('proSctaServic'),GI('proSsctaServic'),GI('proSssctaServic'));",2000);
  
  setTimeout("hideWaitLayer();if(existeCuenta)ejecutaOperacion()",3000);
}   

function consultaCuentasProd()
{
  existeCuenta = true;
  
  if(existeCuenta)
    consultaCuenta(GI('prlCtamResult'),GI('prlSctaResult'),GI('prlSsctaResult'),GI('prlSssctaResult'));
  setTimeout("if(existeCuenta)consultaCuenta(GI('prlNumCtamAcept'),GI('prlNumSctaAcept'),GI('prlSsctaAcept'),GI('prlSssctaAcept'));",1000);
  setTimeout("if(existeCuenta)consultaCuenta(GI('prlCtamServic'),GI('prlSctaServic'),GI('prlSsctaServic'),GI('prlSssctaServic'));",2000);
  
  setTimeout("hideWaitLayer();if(existeCuenta)ejecutaOperacionProd()",3000);
}

function consultaCuenta(objCtam,objScta,objSscta,objSsscta)
{
  objCtam.value = objCtam.value==""?0:objCtam.value;
  objScta.value = objScta.value==""?0:objScta.value;
  objSscta.value = objSscta.value==""?0:objSscta.value;
  objSsscta.value = objSsscta.value==""?0:objSsscta.value;

  var objCuenta = JSON.parse("{}");
  objCuenta.id = "conPriCatCueCount";
  objCuenta.NumCtam = objCtam.value;
  objCuenta.NumScta = objScta.value;
  objCuenta.NumSscta = objSscta.value;
  objCuenta.NumSsscta = objSsscta.value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objCuenta);
  
  makeAjaxRequest(url,"html",consultaCuentaRes,objCtam);
}


function consultaCuentaRes(objCtam,result)
{
  var res = JSON.parse(result)[0].length;
  
  if(isDefinedAndNotNull(res))
  {
    if(Number(res)==0)
    {
      alert("No existe número de cuenta");
      existeCuenta = false;
      objCtam.focus();
    }
  }  
}