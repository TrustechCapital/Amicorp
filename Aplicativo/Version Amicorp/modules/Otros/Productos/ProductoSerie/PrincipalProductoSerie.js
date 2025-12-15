showWaitLayer();

var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");
var paramProdesta  = JSON.parse("{\"order\":\"s\"}");
var paramProducto  = JSON.parse("{\"order\":\"s\"}");

function cargaProducto(objProdesta)
{
  paramProducto  = JSON.parse("{\"NumProdestaProd\":"+objProdesta.value+",\"order\":\"s\"}");
  loadElement(GI('fpsIdProducto'));
} 

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FProductoSerie");
var fvCat = new FormValidator();
var strIdPK = "fpsIdProdEsta,fpsIdProducto";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
var pkInfoProd = null;

var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "fpsCveProdEsta,200px";
arrTblDat[1] = "fpsIdProducto,100px";
arrTblDat[2] = "fpsCveProducto,200px";
arrTblDat[3] = "fpsNumSerie,100px";
arrTblDat[4] = "fpsCveStSerie,80px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


initForms();

function clickTabla(pk)
{
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma)
{
  regresar();
}

// mantenimiento prodesta -----------------

function cargaMantenimientoProductoSerie(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Otros/Productos/ProductoSerie/MantenimientoProductoSerie.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoProductoSerie, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA)
  {
    ejecutaOperacion();
  }
}
function despliegaPantallaMantenimientoProductoSerie(obj, result) {
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
  {
    paramProducto  = JSON.parse("{\"NumProdestaProd\":-1,\"order\":\"s\"}");
    muestraObjs("cmdAceptar,cmdCancelar");
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
  onButtonClickPestania("Otros.Productos.ProductoSerie.PrincipalProductoSerie","");
}

