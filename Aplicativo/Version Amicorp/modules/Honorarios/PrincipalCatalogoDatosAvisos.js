var catDatosAvisosHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.DatosAvisos");
catDatosAvisosHonorarios.dateFormat = "dd/MM/YYYY";

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaRegistroDatosAvisos\",\"numContrato\":0}");

var tablaDatosAvisosHonorariosData = new Array();
tablaDatosAvisosHonorariosData[0] = "davNumContrato,85px";
tablaDatosAvisosHonorariosData[1] = "davDirigidoA,300px";
tablaDatosAvisosHonorariosData[2] = "davCargo,300px";
tablaDatosAvisosHonorariosData[3] = "davCiudadEdo,200px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoDatosAvisos = new FormValidator();
var CONSULTAR = 3;

formsLoaded();

function cargaPrincipalDatosAvisosHonorarios() {
  onButtonClickPestania("Honorarios.PrincipalCatalogoDatosAvisos","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catDatosAvisosHonorarios.getCatalogo());
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catDatosAvisosHonorarios.setOnUpdate(operacionExitosa);
    catDatosAvisosHonorarios.bajaCatalogo(false);
  }
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogoDatosAvisos)
function cargaMantenimientoDatosAvisosHonorarios(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoCatalogoDatosAvisos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoDatosAvisos.setup({
    formName      : "frmDatosAvisosHonorariosMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}


function loadCatalogo() {
  catDatosAvisosHonorarios.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catDatosAvisosHonorarios.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("davNumContrato".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosAvisosHonorariosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catDatosAvisosHonorarios.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoDatosAvisos.checkForm())//Se trata de una alta
    catDatosAvisosHonorarios.altaCatalogo();
  else if(operacion==OPER_MODIFICAR && fvMantenimientoDatosAvisos.checkForm())//Se trata de una modificación
    catDatosAvisosHonorarios.modificaCatalogo();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalDatosAvisosHonorarios();
}

////////////////////////////////////////////////////////////////////////////
function verificarAltaPk() {
  if(GI("davNumContrato").value!="")
  {
    validacionAlta.numContrato = GI("davNumContrato").value;
  
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, null);
  }
}
  

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    validacionAlta2.numContrato = GI("davNumContrato").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("davNumContrato").value="";
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    validacionExistenciaRegistro.numContrato = GI("davNumContrato").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificaExistenciaRegistro, null);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("davNumContrato").value="";
  }
}

function verificaExistenciaRegistro(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].davNumRegistro != 0)
  {
    alert("Ya existe un registro con ese número de fideicomiso");
    GI("davNumContrato").value="";
  }
}