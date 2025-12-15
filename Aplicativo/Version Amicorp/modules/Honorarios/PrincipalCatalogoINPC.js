var catINPCHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Inpc");

var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaRegistroINPC\",\"Ano\":0,\"Mes\":0}");

var tablaINPCHonorariosData = new Array();
tablaINPCHonorariosData[0] = "inpcAno,150px";
tablaINPCHonorariosData[1] = "inpcMes,150px";
tablaINPCHonorariosData[2] = "inpcImporte,110px,right";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoINPC = new FormValidator();
var CONSULTAR = 3;

formsLoaded();

function cargaPrincipalINPCHonorarios() {
  onButtonClickPestania("Honorarios.PrincipalCatalogoINPC","");
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catINPCHonorarios.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogoINPC)
function cargaMantenimientoINPCHonorarios(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoCatalogoINPC.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  
  //Agregando la funcionalidad del required
  fvMantenimientoINPC.setup({
    formName      : "frmINPCHonorariosMantenimiento",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  
  loadCatalogo();
}

function loadCatalogo() {
  catINPCHonorarios.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catINPCHonorarios.buscaCatalogoPK(false);
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
    deshabilitaPK("inpcAno,inpcMes".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmINPCHonorariosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  catINPCHonorarios.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA && fvMantenimientoINPC.checkForm())//Se trata de una alta
    catINPCHonorarios.altaCatalogo();
  else if(operacion==OPER_MODIFICAR && fvMantenimientoINPC.checkForm())//Se trata de una modificación
    catINPCHonorarios.modificaCatalogo();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalINPCHonorarios();
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catINPCHonorarios.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catINPCHonorarios);
  }
}

////////////////////////////////////////////////////////////////////////////
function verificaAltaRegistro() {
  if(GI("inpcAno").value!="" && GI("inpcMes").value!="")
  {
    validacionExistenciaRegistro.Ano = GI("inpcAno").value;
    validacionExistenciaRegistro.Mes = GI("inpcMes").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificaExistenciaRegistro, null);
  }
}

function verificaExistenciaRegistro(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].inpcNumRegistro != 0)
  {
    alert("Ya existe un registro con ese Año y Mes");
    GI("inpcAno").value="";
    GI("inpcMes").value="";
  }
}