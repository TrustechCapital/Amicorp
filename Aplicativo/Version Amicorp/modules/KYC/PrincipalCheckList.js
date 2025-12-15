//deshabilitaObjetos(GI("frmCheckList")); 

var pesSeleccionada = new Object();

pkInfo = null;


var tablaCheckList = new Array();
tablaCheckList[0] = "";
tablaCheckList[1] = "conpNombre,210px";
tablaCheckList[2] = "";
  
var contenedor = new Object();  
                
pkInfo = null;


function clickTabla(pk,item) {
  pkInfo = pk;
  cargaKYC();
}


//Funciones para cargar conceptos KYC
function cargaKYC(){
    
    contenedor.Fideicomiso = GI("paramProyecto").value;
    contenedor.IdTPersona = GI("paramTipo").value;
    contenedor.TPersona = GI("paramTPersona").value;
    contenedor.NumPersona = GI("paramNumPersona").value;
    contenedor.NomPersona = GI("paramNomPersona").value;
    contenedor.NumConcepto = pkInfo.conpIdConcepto;
    contenedor.NomConcepto = pkInfo.conpNombre;
    
    
    var urlCliente = ctxRoot + "/modules/KYC/MantenimientoCheckList.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaKYC, contenedor);
     loadDynamicJS(ctxRoot + "/modules/KYC/MantenimientoCheckList.js");
  
}

function despliegaKYC(obj, result) {
  GI("cargaConceptos").innerHTML = result;
 
  GI("paramFideicomiso").value = obj.Fideicomiso;
  GI("paramTipPersona").value = obj.IdTPersona;
  GI("paramPersona").value = obj.TPersona;
  GI("paramNumPersona").value = obj.NumPersona;
  GI("paramNombre").value = obj.NomPersona;
  GI("paramConcepto").value = obj.NumConcepto;
  GI("titleConcepto").innerHTML = obj.NomConcepto;
  consultaDatosKYC();
}

