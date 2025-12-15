showWaitLayer();

var cmbStatusParam   = JSON.parse("{\"llaveClave\":31}");
var cmbTipoEmisorParam = JSON.parse("{\"NoIndice\":534,\"order\":\"s\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmisor");
var fvCat = new FormValidator();
var strIdPK = "esorIdEmsisor";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;
paramCmbIntitucion = JSON.parse("{\"order\":\"s\"}");

// ------------ EMISOR  FIDEICOMISO ------------------
var cmbFiduciarios = JSON.parse("{\"Indice\":540,\"order\":\"s\"}");
var cmbLoadParam26y27 = JSON.parse("{\"Clave1\":26,\"Clave2\":27,\"orderDescripcion\":\"s\"}");

// --------------------------------------------- ------------------


var fecha = new Date();
var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
//arrTblDat[0] = "esorIdEmsisor,120px";
arrTblDat[0] = "esorEmisor,120px";
arrTblDat[1] = "esorNombre,200px";
arrTblDat[2] = "efsoIdFideicomiso,80px";
arrTblDat[3] = "efsoComentario,200px";
arrTblDat[4] = "esorTipoEmisor,200px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


//calendarios------------
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

function setFechaCal(){}
function isValidDate(date)
{ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}
//---------------------------------------------
initForms();

function clickTabla(pk){
  cloneObject(pk,cat.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmisor");
  pkInfo = null;
  borraCombos("paramNoFiso,paramInstitucion,paramStatus");
}

function cargaMantenimientoActaAsamblea(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/EmisoresFideicomiso/MantenimientoEmisoresFideicomiso.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoEmisores, null);
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA)
  {
    bFiso = false;
    ejecutaOperacionIndice();
  }
}

function despliegaPantallaMantenimientoEmisores(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  cal.manageFields("esorFecCreacion","esorFecCreacion", "%d/%m/%Y");
  cal.manageFields("efsoFecCreacion","efsoFecCreacion", "%d/%m/%Y");
  
  initForms();
    
  deshabilitaPK("esorIdEmsisor".split(","));
  
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
    deshabilitaCampos('chkFiso,esorEmisor');
    deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }else{
      muestraObjs("cmdAceptar,cmdCancelar");
    }
  }else if(modo == OPER_ALTA ){
    //asignaSecuencial(GI("esorIdEmsisor"));
    muestraObjs("cmdAceptar,cmdCancelar");
  }  
    hideWaitLayer();
}

function asignaValues2ObjHTML(){
  if(modo != OPER_ALTA){
    cat.setOnUpdate(catLoaded);
    cat.buscaCatalogoPK(false);
  }else{
    formsLoaded();
  }
}

function catLoaded() 
{
   consultaEmisorFideicomiso();
}

function ejecutaOperacionIndice(){
   if(bFiso)
   {
         var objEmisorFid =JSON.parse( "{}");
         objEmisorFid.id = "ejeFunEmisorFideicomiso";
         
         objEmisorFid.cveChk =bFiso?1:0;
         objEmisorFid.operacion =modo == OPER_ALTA?"ALTA":modo == OPER_MODIFICAR ?"MODIFICAR":modo == OPER_BAJA ?"BORRAR":"OTRO";
         
         objEmisorFid.idEmisor =GI( "esorIdEmsisor").value;
         objEmisorFid.Emisor =GI( "esorEmisor").value;
         objEmisorFid.idFideicomiso =GI( "efsoIdFideicomiso").value;
         objEmisorFid.nomFideicomiso =GI( "efsoNomFideicomiso").value;
         objEmisorFid.fecConstitucion =GI( "efsoFecCreacion").value;
         objEmisorFid.numFiduciario =GI( "efsoNumFiduciario").value;
         objEmisorFid.nomFideicomitente =GI( "efsoNomFideicomitente").value;
         objEmisorFid.stEmifisos =GI( "efsoStFEmifisos").value;
   
         var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objEmisorFid);
         
         makeAjaxRequest(url, "HTML", funEmisorFideicomisoRes, null);
   }
   else
   {
           if(modo == OPER_ALTA){
             showWaitLayer();
             verificaIndice();
           }else if(modo == OPER_MODIFICAR ){
             showWaitLayer();
             verificaIndice();
           }else if(modo == OPER_BAJA){
             /*showWaitLayer();
             verificaIndice();*/
             
             var objEmisorFid =JSON.parse( "{}");
               objEmisorFid.id = "ejeFunEmisorFideicomiso";
               
               objEmisorFid.cveChk =1;
               objEmisorFid.operacion ="BORRAR";
               objEmisorFid.idEmisor =pkInfo.esorIdEmsisor;
         
               var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objEmisorFid);
               
               makeAjaxRequest(url, "HTML", funEmisorFideicomisoRes, null);
           }
      }
}


function verificaIndice(){
  cat.setOnUpdate(validaAvisoOperacionCatalogo);
  
  if(modo == OPER_ALTA)
      cat.altaCatalogo();
  if(modo == OPER_MODIFICAR)
    cat.modificaCatalogo();
  if(modo == OPER_BAJA)
  {
    cat.bajaCatalogo(false);
  }
}

function validaAvisoOperacionCatalogo() {
  alert("Operacion realizada exitosamente!");
  onButtonClickPestania("EmisionTitulos.EmisoresFideicomiso.PrincipalEmisoresFideicomiso","");
  hideWaitLayer();
}

////////////////////////////////////////////////////////////////////
//Funciones para asignar el Secuencial

function asignaSecuencial(objRC) // nuevo secuencial tomado de ID RC (R0'sX)
{
  GI("esorIdEmsisor").value = numIdRC(objRC.value);
  showWaitLayer();
  
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conEmisorRepresComun\",\"IdEmisor\":"+ GI("esorIdEmsisor").value+"}";
 // alert(url)
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, objRC);
}

function validaAsignaSecuencial(obj, result) 
{
  var res = JSON.parse(result);
  if(res.length>0&&!bFiso)
  {
    alert("Ya exíste el Emisor con Id RC: "+obj.value);
    obj.focus();
  }
  
  hideWaitLayer();
}

// Fideicomiso
function asignaSecuencialFideicomiso(objRC,objFiso) // nuevo secuencial tomado de ID RC (R0'sX)
{
  GI("esorIdEmsisor").value = numIdRC(objRC.value);
  showWaitLayer();
  
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conEmisorRepresComun\",\"IdEmisor\":"+ GI("esorIdEmsisor").value+",\"NumFideicomiso\":"+ objFiso.value+"}";
 // alert(url)
  makeAjaxRequest(url, "HTML", validaAsignaSecuencialFideicomiso, objFiso);
}

function validaAsignaSecuencialFideicomiso(obj, result) 
{
  var res = JSON.parse(result);
  if(res.length>0)
  {
    alert("Ya exíste el Emisor y Fideicomiso");
    obj.focus();
  }
  
  hideWaitLayer();
}


/*function asignaSecuencial(objCmb) {
  showWaitLayer();
  var url = ctxRoot + "/getRef.do?json={\"id\":\"secEmisoresRepComun\"}";
 // alert(url)
  makeAjaxRequest(url, "HTML", validaAsignaSecuencial, null);
}

function validaAsignaSecuencial(obj, result) {
//alert(result)
  var resultado = JSON.parse(result);
  //alert(resultado[0].esorIdEmsisor)
  GI("esorIdEmsisor").value = resultado[0].esorIdEmsisor;
  hideWaitLayer();
}*/

//-------------- EMISORES FIDEICOMSIO ------------------
var bFiso = false;

function dvDatos(boolFiso)
{
   bFiso = boolFiso;
   
   if(bFiso)// tiene fideicomiso
   {
      GI("dvEmisor").style.visibility= "hidden";
      GI("dvFideicomiso").style.visibility= "visible";
   }
   else// no tiene fideicomiso
   {
      GI("dvFideicomiso").style.visibility= "hidden";
      GI("dvEmisor").style.visibility= "visible";
   }
}

function funEmisorFideicomisoRes(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
   switch(eval(res))
    {
      case 0:
         validaAvisoOperacionCatalogo(); 
      break;
      default:alert("Ocurrió un error inesperado");
    }   
}

function consultaEmisorFideicomiso()
{
         var objEmisorFid =JSON.parse( "{}");
         objEmisorFid.id = "emision.conETEmisorFideicomiso";
      
         objEmisorFid.idEmisor =GI( "esorIdEmsisor").value;
         objEmisorFid.idFideicomiso =pkInfo.efsoIdFideicomiso;
         objEmisorFid.order ="s";
   
         var url = ctxRoot + "/getRef.do?json="+JSON.stringify(objEmisorFid);
         
         makeAjaxRequest(url, "HTML", consultaEmisorFideicomisoRes, null);
}

function consultaEmisorFideicomisoRes(obj,result)
{
  var jresult = JSON.parse(result)
   if(jresult.length>0)
   {
   
      var res = jresult[0];
      
      dvDatos(true);
      GI('chkFiso').checked = true;
      
      deshabilitaCampos("efsoIdFideicomiso");
      
      GI( "efsoIdFideicomiso").value = res.idFideicomiso;
      GI( "efsoNomFideicomiso").value = res.nomFideicomiso;
      GI( "efsoFecCreacion").value = res.fecConstitucion;
      GI( "efsoNumFiduciario").value = res.nomFiduciario;
      GI( "efsoNomFideicomitente").value = GI( "esorNombre").value;
      GI( "efsoStFEmifisos").value = res.stEmifisos;
      
   }
}

// Fideicomisos

function cargaFisos(objRC)
{
   
   cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(objRC.value)+",\"order\":\"s\"}");
   loadElement(GI('paramNumFideicomiso'));
}