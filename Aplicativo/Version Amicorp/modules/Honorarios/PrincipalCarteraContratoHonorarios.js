//var catCarteraHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Cartera");
//var catPagosHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Pagoshon");
var catDetalleHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Detcart");

var consultaDatosInformativos = JSON.parse("{\"id\":\"totalPagosProvision\",\"numContrato\":0,\"cvePersFid\":0,\"numPersFid\":0,\"cveTipoHono\":0,\"fecCalcHono\":0,\"numSecuencial\":0}");
/*var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaRegistroPreshono\",\"numContrato\":0,\"anoRegistro\":0}");
*/

var tablaCarteraHonorariosData = new Array();
tablaCarteraHonorariosData[0] = "carCvePersFid,120px";
tablaCarteraHonorariosData[1] = "carNumPersFid,60px";
tablaCarteraHonorariosData[2] = "carCveTipoHono,195px";
tablaCarteraHonorariosData[3] = "carImpHonor,95px,right";
tablaCarteraHonorariosData[4] = "carImpHonor30,90px,right";
tablaCarteraHonorariosData[5] = "carImpHonor60,90px,right";
tablaCarteraHonorariosData[6] = "carImpHonor90,90px,right";
tablaCarteraHonorariosData[7] = "carEjerAnoCurso,95px,right";
tablaCarteraHonorariosData[8] = "carEjerAnoAnte,100px,right";

var tablaComposicionCarteraHonorariosData = new Array();
tablaComposicionCarteraHonorariosData[0] = "decCvePersFid,120px";
tablaComposicionCarteraHonorariosData[1] = "decNumPersFid,50px";
tablaComposicionCarteraHonorariosData[2] = "decCveTipoHono,215px";
tablaComposicionCarteraHonorariosData[3] = "decFecCalcHono,160px";
tablaComposicionCarteraHonorariosData[4] = "decNumSecuencial,125px";
tablaComposicionCarteraHonorariosData[5] = "decImpOrigHonor,90px,right";
tablaComposicionCarteraHonorariosData[6] = "decImpRemHonor,95px,right";
tablaComposicionCarteraHonorariosData[7] = "decCveCalifHono,85px,right";

var operacion = 0;
var numPantalla = 0;
var pkInfo1 = null;
var pkInfo2 = null;
pkInfo = null;

formsLoaded();

function cargaPrincipalCarteraContratoHonorarios() {
  onButtonClickPestania("Honorarios.PrincipalCarteraContratoHonorarios","");
}

function cargaPrincipalComposicionCarteraHonorarios() {
  if(pkInfo==null && pkInfo1==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    showWaitLayer();
    numPantalla = 1;
    if(pkInfo1==null)
      pkInfo1 = pkInfo;
    pkInfo = null;
    var urlCliente = ctxRoot + "/modules/Honorarios/PrincipalComposicionCarteraContratoHonorarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function cargaConsultarCarteraContratoHonorarios() {
  if (pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    numPantalla = 2;
    pkInfo2 = pkInfo;
    pkInfo = null;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Honorarios/PrincipalConsultarCarteraContratoHonorarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  if(numPantalla==1)
  {
    //No permitir editar el campo visible: Número de Contrato (Num. Fid.)
    SA(GI("frmComposicionCarteraHonorariosConsulta").paramNumCto, "LKD", "true");
    SA(GI("frmComposicionCarteraHonorariosConsulta").paramNumCto, "disabled", "true");
    
    GI("paramNumCto").value = pkInfo1.carNumContrato;
    GI("paramCvePersFid").value = pkInfo1.carCvePersFid;
    GI("paramNumPersFid").value = pkInfo1.carNumPersFid;
    GI("paramCveTipoHono").value = pkInfo1.carCveTipoHono;
    consultar(GI("hdRegistrosComposicionCartera"), GI('frmComposicionCarteraHonorariosConsulta'), false);
    formsLoaded();
  }
  if(numPantalla==2)
  {
    //initForms();
    loadCatalogo();
  }
}

function clickTabla(pk) {
  pkInfo = pk;
}

function loadCatalogo() {
  catDetalleHonorarios.setOnUpdate(catLoaded);
  
  //Asignar llave primaria a la pantalla Composicion Cartera Contrato
  GI("decCveTipoHono").value = pkInfo2.decCveTipoHono;
  GI("decNumPersFid").value = pkInfo2.decNumPersFid;
  GI("decCvePersFid").value = pkInfo2.decCvePersFid;
  GI("decNumContrato").value = pkInfo2.decNumContrato;
  GI("decFecCalcHono").value = pkInfo2.decFecCalcHono;
  GI("decNumSecuencial").value = pkInfo2.decNumSecuencial;
  catDetalleHonorarios.buscaCatalogoPK();
}

function catLoaded() {
  deshabilitaObjetos(GI("frmConsultarCarteraContrato"));                  //Deshabilita objetos (excepto botones)
  //Mostrar el nombre del fiso (informativo)
  mostrarDatosInformativos();
  formsLoaded();
}

function mostrarDatosInformativos() {
  consultaDatosInformativos.numContrato = GI("decNumContrato").value;
  consultaDatosInformativos.cvePersFid = GI("decCvePersFid").value;
  consultaDatosInformativos.numPersFid = GI("decNumPersFid").value;
  consultaDatosInformativos.cveTipoHono = GI("decCveTipoHono").value;
  consultaDatosInformativos.fecCalcHono = GI("decFecCalcHono").value;
  consultaDatosInformativos.numSecuencial = GI("decNumSecuencial").value;
  
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
  makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  
  if(objResult[0].pagImpPago != null)
    GI("pagImpPago").value=objResult[0].pagImpPago;
  else
    GI("pagImpPago").value = 0;
}