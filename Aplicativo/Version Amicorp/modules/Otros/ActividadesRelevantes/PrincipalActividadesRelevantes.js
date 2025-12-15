showWaitLayer();

var clavesCombo31  = JSON.parse("{\"llaveClave\":31,\"orderDescripcion\":\"s\"}");
var clavesCombo702  = JSON.parse("{\"llaveClave\":702,\"orderDescripcion\":\"s\"}");
var clavesCombo703  = JSON.parse("{\"llaveClave\":703,\"orderDescripcion\":\"s\"}");
var clavesCombo704  = JSON.parse("{\"llaveClave\":704,\"orderDescripcion\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FActividadesRelevantes");
var fvCat = new FormValidator();
var strIdPK = "farIdTipoOperacion,farIdContrato,farTipoNegocio,farNumTipoPersona,farTipoPersona";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "farTipoNegocio,200px";
arrTblDat[1] = "farIdContrato,80px";
arrTblDat[2] = "farCveTipoOperacion,200px";
arrTblDat[3] = "farTipoPersona,200px";
arrTblDat[4] = "farNumTipoPersona,80px";
arrTblDat[5] = "farValidaDeposito,80px";
arrTblDat[6] = "farValidaRetiro,80px";
arrTblDat[7] = "farValidaDepositoEftvo,80px";
arrTblDat[8] = "farCveStActividad,150px";

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

function cargaMantenimientoActividadesRelevantes(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/Otros/ActividadesRelevantes/MantenimientoActividadesRelevantes.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoActividadesRelevantes, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA)
  {
    ejecutaOperacion();
  }
}
function despliegaPantallaMantenimientoActividadesRelevantes(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms(); 
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
 //alert(modo) 

    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
    else
    {
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA )
    muestraObjs("cmdAceptar,cmdCancelar");
    
  deshabilitaCampos("txtMoneda"); // deshabilita campo moneda
}


function ejecutaOperacion()
{
    //alert("llego aki")
  if(modo == OPER_ALTA)
  {
    //se validan los datos a insertar
    //1. si es un Fiso que exista el Fiso y este activo
    if(GI("farTipoNegocio").value=="FIDEICOMISO"){
        verificacionActivo(GI("farIdContrato"));
    }
    else {//se valida el credito
    //2. si es un credito que exista el num de credito    
        verificacioncredito(GI("farIdContrato"));
    }
    //alert(GI("farIdContrato").value)
    //if(GI("farIdContrato").value!=""){        
        //3. de acuerdo al tipo de persona    
        if(GI("farTipoPersona").value=="FIDEICOMITENTE" ||
        GI("farTipoPersona").value=="FIDEICOMISARIO" ||
        GI("farTipoPersona").value=="CLIENTE"){
        var validacionAlta2;
        //alert(GI("farTipoPersona").value)    
            //3.1 Fideicomitente que exista el no
            if(GI("farTipoPersona").value=="FIDEICOMITENTE"){
                    validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaFideicomitenteAdmon2\",\"fideicomitente\":\""
                    + GI("farNumTipoPersona").value + "\"}");
                    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
                    makeAjaxRequest(url, "HTML", funcionVerificacionPers, GI("farNumTipoPersona"));            
            }
            //3.2 Fideicomisario que exista el no
            else if(GI("farTipoPersona").value=="FIDEICOMISARIO"){
                    validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaFideicomisarioAdmon2\",\"beneficiario\":\""
                    + GI("farNumTipoPersona").value + "\"}");
                    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
                    makeAjaxRequest(url, "HTML", funcionVerificacionPers, GI("farNumTipoPersona"));            
            }
            //3.2 Cliente que exista el no
            else if(GI("farTipoPersona").value=="CLIENTE"){
                    validacionAlta2 = JSON.parse("{\"id\":\"verificaExistenciaCliente2\",\"cliente\":"
                    + GI("farNumTipoPersona").value + "}");
                    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
                    //alert(url)
                    makeAjaxRequest(url, "HTML", funcionVerificacionPers, GI("farNumTipoPersona"));            
            }
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
//alert("aki 2")
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
   obtenerMonedaFiso(GI('farIdContrato'));// moneda fideicomiso

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
  onButtonClickPestania("Otros.ActividadesRelevantes.PrincipalActividadesRelevantes","");
}




/*--FIDEICOMISO--*/

function verificacionActivo(txtFiso) 
{
  if(txtFiso.value != "" && !(GI("farTipoPersona").value=="FIDEICOMITENTE" ||
        GI("farTipoPersona").value=="FIDEICOMISARIO" || GI("farTipoPersona").value=="CLIENTE" ) )
  {
    //alert("valor fiso "+eval(txtFiso.value))
    if(eval(txtFiso.value)!=0){
        var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":" + txtFiso.value + "}");
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
        makeAjaxRequest(url, "HTML", funcionVerificacionActivo, txtFiso);        
    }
    else{
        obtenerMonedaFiso(txtFiso);
    }
  }else{
    asignaEtiqueta("nomFideicomiso","");
  }  
}

function funcionVerificacionActivo(txtFiso,result) {
  var objResult = JSON.parse(result);
  //alert("VALIDA ACTIVO FISO"+objResult)
  if(objResult!=null && objResult!=""){
      if(objResult[0].ctoCveStContrat != 0)
      {
        alert("El Fideicomiso no está ACTIVO");
        txtFiso.value="";
        asignaEtiqueta("nomFideicomiso","");
      }
      else{
        consultaNombreFideicomiso("nomFideicomiso",txtFiso);
        obtenerMonedaFiso(txtFiso);// moneda fideicomiso
      }  
  }
  else{
      alert("El Fideicomiso no existe")
  }
}

/*---------------*/


// moneda fideicomiso

function obtenerMonedaFiso(txtFiso)
{
  if(txtFiso.value==""){  return; }

  if(eval(txtFiso.value)==0){
      if(fvCat.checkForm()&&modo == OPER_ALTA){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }           
  }
  else{    
      var objConsultaMoneda = JSON.parse("{}");
      objConsultaMoneda.id = "muestraMonedaAnteproyecto";
      objConsultaMoneda.numFiso = txtFiso.value;
      
      var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objConsultaMoneda);
      
      makeAjaxRequest(url,"html",obtenerMonedaFisoRes,GI('txtMoneda'));
  }  
}

function obtenerMonedaFisoRes(obj,result)
{
  var res = JSON.parse(result);

  if(res)
  {
    obj.value = res[0].antMoneda;
  }
  else
  {
    obj.value = "MONEDA NACIONAL";
  }
  
    if(fvCat.checkForm()&&modo == OPER_ALTA){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }     
}

//valida credito

function verificacioncredito(txtFiso) 
{
  if(txtFiso.value != "" &&  !(GI("farTipoPersona").value=="FIDEICOMITENTE" ||
        GI("farTipoPersona").value=="FIDEICOMISARIO" || GI("farTipoPersona").value=="CLIENTE" ) ) 
  {
    if(eval(txtFiso.value)!=0){
        var validacionAltaCredito = JSON.parse("{\"id\":\"verificaCredito\",\"numCredito\":\"" + txtFiso.value + "\"}");
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAltaCredito);
        makeAjaxRequest(url, "HTML", funcionVerificacionCredito, txtFiso);        
    }
    else{
        obtenerMonedaCredito(txtFiso);
    }
  }else{
    asignaEtiqueta("nomFideicomiso","");    
  }  
}

function funcionVerificacionCredito(txtFiso,result) {
  var objResult = JSON.parse(result);
  if(objResult!=null && objResult!=""){  
      if(objResult[0].idCredito == 0)
      {
        alert("El Credito no existe");
        txtFiso.value="";
        asignaEtiqueta("nomFideicomiso","");
      }
      else{
            obtenerMonedaCredito(txtFiso);// moneda credito
      }
  }    
}

// moneda credito

//recupera producto en caso de que sea credito
function recupera_producto(txtcredito) {
    if(txtcredito.value != "" &&  GI("farTipoNegocio").value=="CREDITO"  ) {
      var objConsultaMoneda = JSON.parse("{}");
      objConsultaMoneda.id = "muestraProductoCredito";
      objConsultaMoneda.numCredito = txtcredito.value;
      
      var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objConsultaMoneda);
      
      makeAjaxRequest(url,"html",obtenerProductoFisoCre,null);        
    }
	else{
		if(GI("farIdContrato").value!=0){
			deshabilitaCampos("farTipoPersona,farNumTipoPersona");
		}
		else{
			habilitaCampos("farTipoPersona,farNumTipoPersona");
		}
	}
}

function obtenerProductoFisoCre(obj,result)
{
  var res = JSON.parse(result);
//alert(res)
  if(res!=null && res!="")
  {
    asignaEtiqueta("nomFideicomiso",res[0].descripcion);
  }
  else
  {
    asignaEtiqueta("nomFideicomiso","");
  }  
}

function obtenerMonedaCredito(txtFiso)
{
  if(txtFiso.value==""){  return; }

  if(eval(txtFiso.value)==0){
      if(fvCat.checkForm()&&modo == OPER_ALTA){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }           
  }
  else{
      var objConsultaMoneda = JSON.parse("{}");
      objConsultaMoneda.id = "muestraMonedaCredito";
      objConsultaMoneda.numCredito = txtFiso.value;
      
      var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objConsultaMoneda);
      
      makeAjaxRequest(url,"html",obtenerMonedaFisoCre,GI('txtMoneda'));      
  }  
}

function obtenerMonedaFisoCre(obj,result)
{
  var res = JSON.parse(result);

  if(res)
  {
    obj.value = res[0].imonedaCred;
  }
  else
  {
    obj.value = "MONEDA NACIONAL";
  }
  
    if(fvCat.checkForm()&&modo == OPER_ALTA){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }     
}

//fin validacion credito

//validaciones

function funcionVerificacionPers(txtFiso,result) {
  //alert(result)
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro == 0)
  {
    alert("La persona NO esta registrada en el sistema");
    txtFiso.value="";
  }
  else {
    if(fvCat.checkForm()){
      showWaitLayer();
      cat.setOnUpdate(validaAvisoOperacionCatalogo);
      cat.altaCatalogo();  
    }
  }
}
