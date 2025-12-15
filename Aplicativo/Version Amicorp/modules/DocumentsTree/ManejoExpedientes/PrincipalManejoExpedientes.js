showWaitLayer();

var cmbCategorias = JSON.parse("{\"order\":\"s\"}");
var statusUsuActivo = JSON.parse("{\"statusUsu\":0,\"order\":\"s\"}");
var cmbStatusArchivo = JSON.parse("{\"Indice\":700,\"orderDescripcion\":\"S\"}");


var fvCat = new FormValidator();
var strIdPK = "preSecuencial,docIdDocumento,docEstatus";
var arrIdPK = strIdPK.split(",");
var modo = 0;
pkInfo = null;

var objCmbOrigenGlobal = null;

var arrTblDat = new Array();
arrTblDat[0] = "docIdDocumento,100px";
//arrTblDat[1] = "expIdExpediente,100px";
//arrTblDat[2] = "docUrl,300px";
arrTblDat[1] = "expIdFideicomiso,100px";
arrTblDat[2] = "docNombre,200px";
arrTblDat[3] = "preFechaPrestamo,100px";
arrTblDat[4] = "preFechaVencimientoPrestamo,100px";
arrTblDat[5] = "preFechaEntrega,100px";
arrTblDat[6] = "docEstatus,100px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("docFechaVencimientoPrestamo", "docFechaVencimientoPrestamo", "%d/%m/%Y");

function setFechaCal(){}

function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}


initForms();

function clickTabla(pk)
{
  pkInfo = pk;
  
    if(pkInfo.docEstatus=="DISPONIBLE"){
        RA(GI("btnPrestar"),"disabled");
        SA(GI("btnDevolver"),"disabled","disabled");
    }else if(pkInfo.docEstatus=="PRESTADO"){
        SA(GI("btnPrestar"),"disabled","disabled");
        RA(GI("btnDevolver"),"disabled");
    }else{
        SA(GI("btnPrestar"),"disabled","disabled");
        SA(GI("btnDevolver"),"disabled","disabled");
    }
}

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
  borraCombos("paramNumFiso,paramNumIntermediario,paramTipoMerca");
}

var once=true;

function catLoaded() 
{
   hideWaitLayer();
}

// actualiza status archivos

function solicitaDatos(tipoAccion)
{

  if(tipoAccion=="prestar"){
    GI("datosPrestamo").style.display="block";
  }else{
    devuelveDocumento();
  }
}


function prestaDocumento()
{
  var objFuncion = pkInfo;
  if(fvCat.checkForm()){
      objFuncion.id = "registraPrestamoDocumento";
      objFuncion.docEjecutivoPrestamo = GI('docEjecutivoPrestamo').value;
      objFuncion.docFechaVencimientoPrestamo = GI('docFechaVencimientoPrestamo').value;
      objFuncion.docEjecutivoPrestamo = GI('docEjecutivoPrestamo').value;
      objFuncion.docNotaPrestamo = GI('docNotaPrestamo').value;
      
      var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objFuncion);
      showWaitLayer();
      makeAjaxRequest(url,"html",prestaDocumentoRes,null);
  }
}

function prestaDocumentoRes(obj,result)
{  
  hideWaitLayer();
  var objFuncion = pkInfo;
  objFuncion.id = "actualizaEstatusDocumento";
  objFuncion.docEstatus = "PRESTADO";
  var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objFuncion);
  makeAjaxRequest(url,"html",function(){GI("datosPrestamo").style.display="none";GI("cmdAceptar").click()},null);
}


function devuelveDocumento()
{
  var objFuncion = pkInfo;
  objFuncion.id = "devuelveDocumento";
  var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objFuncion);
  showWaitLayer();
  makeAjaxRequest(url,"html",devuelveDocumentoRes,null);
}

function devuelveDocumentoRes(obj,result)
{

  hideWaitLayer();
  var objFuncion = pkInfo;
  objFuncion.id = "actualizaEstatusDocumento";
  objFuncion.docEstatus = "DISPONIBLE";
  var url = ctxRoot + "/executeRef.do?json="+JSON.stringify(objFuncion);
  makeAjaxRequest(url,"html",function(){    GI("cmdAceptar").click()    },null);
}