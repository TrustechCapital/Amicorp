var catTraspinterfid = new Catalogo("mx.com.inscitech.fiducia.domain.Traspinterfid");

showWaitLayer();

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroEstado\",\"numEstado\":0,\"numPais\":0}");
var validacionFoseg = JSON.parse("{\"id\":\"verificaExistenciaFoseg\",\"numFiso\":0}");

initForms();

var tablaDatosFideicomisosData = new Array();
tablaDatosFideicomisosData[0] = "fiso,100";
tablaDatosFideicomisosData[1] = "nombre,630";
tablaDatosFideicomisosData[2] = "estatus,270";

var tablaDatosTraspasosData = new Array();
tablaDatosTraspasosData[0] = "usuario,435";
tablaDatosTraspasosData[1] = "tifCtoOrigen,150";
tablaDatosTraspasosData[2] = "tifCtoInterOrigen,170";
tablaDatosTraspasosData[3] = "tifCtoDestino,140";
tablaDatosTraspasosData[4] = "tifCtoInterDestino,115";


pkInfo = null;
var pkInfoFisos=null;
var pkInfoTraspasos=null;
var fvPrincipalTraspasos = new FormValidator();

var parametroComboEstado;
var usarSetValuesFormObject=false;

//Variables para almacenar los valores de los combos antes de modificar un registro cargado en ellos desde la tabla traspasos
var usuarioAnt=null;
var ctoOrigenAnt=null;
var ctoInterOrigenAnt=null;
var ctoDestinoAnt=null;
var ctoInterDestinoAnt=null;


//Agregando la funcionalidad del required
fvPrincipalTraspasos.setup({
  formName      : "frmPrincipalTraspasoInterFideicomisosControlGestion",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

//Cargar la tabla Fideicomisos
function cargaTablaFideicomisos() {
  consultar(GI("hdFideicomisos"), GI('frmPrincipalTraspasoInterFideicomisosControlGestion'), false);
  consultar(GI("hdTraspasos"), GI('frmPrincipalTraspasoInterFideicomisosControlGestion'), false);
  
  //Deshabilitar componentes
  GI("rdSi").disabled=true;
  GI("rdNo").disabled=true;
  GI("cmdModificar1").disabled=true;
  GI("cmdAceptar1").disabled=true;
  GI("cmdCancelar1").disabled=true;
  
  GI("cmdModificar2").disabled=true;
  GI("cmdBorrar").disabled=true;
  GI("cmdAceptar2").disabled=true;
  GI("cmdCancelar2").disabled=true;
  
  formsLoaded();
}


function cargaPrincipalTraspasoFideicomisosControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalTraspasoInterFideicomisosControlGestion","");
}

function clickTablaFisos(pk) {
  pkInfo = pk;
  pkInfoFisos=pk;
}

function clickTablaTraspasos(pk) {
  pkInfo = pk;
  pkInfoTraspasos=pk;
  
  //Desactivar botón Agregar
  GI("cmdAsignar").disabled=true;
  //Activar botones Modificar y Borrar
  GI("cmdModificar2").disabled=false;
  GI("cmdBorrar").disabled=false;
}


/*function buscarRegistros() {
  if(fvPrincipalEstados.checkForm())
    consultar(GI("Aceptar"), GI("frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados"), false);
}*/

////////////////////////////////////////////////////////////////////
//Cuando el combo Fideicomiso origen cambia
function cambiaFideicomiso(objCombo,parametro2)
{
  cargaComboContratoInversionOrigen(objCombo,parametro2);  //Carga el combo Contrato de Inversion
  cargaComboUsuarios(objCombo,parametro2);           //Carga el combo Usuarios
  cargaComboFideicomisoDestino(objCombo,parametro2); //Carga el combo Fideicomisos Destino
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Contrato de Inversion Origen luego de haber elegido alguna opción del combo Fideicomiso Origen
function cargaComboContratoInversionOrigen(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  var orderBy="s";
  parametroComboContratoInversion = JSON.parse("{\"claveFisoOrigen\": " +objCombo.value+ ",\"order\": \"" +orderBy+ "\"}");
  SA(GI("tifCtoInterOrigen"),"next","asignaContratoInversionOrigen");
  loadElement(GI("tifCtoInterOrigen"));
}

function asignaContratoInversionOrigen(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catTraspinterfid.getCatalogo());
  else
    GI("tifCtoInterOrigen").selectedIndex=0;
  
  formsLoaded();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Usuarios luego de haber elegido alguna opción del combo Fideicomiso Origen
function cargaComboUsuarios(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  var orderBy="s";
  parametroComboUsuarios = JSON.parse("{\"claveFisoOrigen\": " +objCombo.value+ ",\"order\": \"" +orderBy+ "\"}");
  SA(GI("tifUsuario"),"next","asignaUsuarios");
  loadElement(GI("tifUsuario"));
}

function asignaUsuarios(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catTraspinterfid.getCatalogo());
  else
    GI("tifUsuario").selectedIndex=0;
  
  formsLoaded();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Fideicomisos Destino luego de haber elegido alguna opción del combo Fideicomiso Origen
function cargaComboFideicomisoDestino(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  var orderBy="s";
  parametroComboFideicomisoDestino = JSON.parse("{\"claveFisoOrigen\": " +objCombo.value+ ",\"order\": \"" +orderBy+ "\"}");
  SA(GI("tifCtoDestino"),"next","asignaFideicomisosDestino");
  loadElement(GI("tifCtoDestino"));
}

function asignaFideicomisosDestino(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(catTraspinterfid.getCatalogo());
    cargaComboContratoInversionDestino(GI("tifCtoDestino"),true);    
  }
  else
  {
    GI("tifCtoDestino").selectedIndex=0;
    cargaComboContratoInversionDestino(GI("tifCtoDestino"),false);
  }
  
  formsLoaded();
}

////////////////////////////////////////////////////////////////////
//Funciones para cargar el combo Contrato de Inversion Destino luego de haber elegido alguna opción del combo Fideicomiso Destino
function cargaComboContratoInversionDestino(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  var orderBy="s";
  parametroComboContratoInversionDestino = JSON.parse("{\"claveFisoOrigen\": " +objCombo.value+ ",\"order\": \"" +orderBy+ "\"}");
  SA(GI("tifCtoInterDestino"),"next","asignaContratoInversionDestino");
  loadElement(GI("tifCtoInterDestino"));
}

function asignaContratoInversionDestino(){
  if(usarSetValuesFormObject)
  {
    setValuesFormObject(catTraspinterfid.getCatalogo());
    
    //Almacenando los valores actuales de los combos
    usuarioAnt=GI("tifUsuario").value;
    ctoOrigenAnt=GI("tifCtoOrigen").value;
    ctoInterOrigenAnt=GI("tifCtoInterOrigen").value;
    ctoDestinoAnt=GI("tifCtoDestino").value;
    ctoInterDestinoAnt=GI("tifCtoInterDestino").value;
    //alert("Usuario: "+usuarioAnt+"   CtoOrigen: "+ctoOrigenAnt+"    Inv.Origen: "+ctoInterOrigenAnt+"    ctoDestino: "+ctoDestinoAnt+"   InterDestino:"+ctoInterDestinoAnt);
  }
  else
    GI("tifCtoInterDestino").selectedIndex=0;
  
  formsLoaded();
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN ASIGNAR
function botonAsignar() {
  RA(GI("txtNumFiso"), "required");
  RA(GI("txtNumFiso"), "message");
  if(fvPrincipalTraspasos.checkForm())
  {
    SA(GI("txtNumFiso"),"required","");
    SA(GI("txtNumFiso"),"message","El Número de Fideicomiso es un dato obligatorio");
    
    var fisoOrigen = GI("tifCtoOrigen").value;
    var ctoInversionOrigen = GI("tifCtoInterOrigen").value;
    var usuario = GI("tifUsuario").value;
    var fisoDestino = GI("tifCtoDestino").value;
    var ctoInversionDestino = GI("tifCtoInterDestino").value;
    
    var objInsertaTraspinterfid = JSON.parse("{\"id\":\"insertaDatoTraspinterfid\",\"Usuario\":" + usuario +
                                                                                ",\"FisoOrigen\":" + fisoOrigen + 
                                                                                ",\"CtoInversionOrigen\":"  + ctoInversionOrigen  + 
                                                                                ",\"FisoDestino\":"  + fisoDestino  + 
                                                                                ",\"CtoInversionDestino\":"  + ctoInversionDestino  + 
                                                                                "}");
    
    var urlTraspinterfid = ctxRoot + "/doRef.do?json=" + JSON.stringify(objInsertaTraspinterfid);
    makeAjaxRequest(urlTraspinterfid, "HTML", insertandoTraspinterfid, null);
    //operacionExitosa();
  }
}

function insertandoTraspinterfid(obj, result) {
  consultar(GI("hdTraspasos"), GI('frmPrincipalTraspasoInterFideicomisosControlGestion'), false);
  operacionExitosa();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  GI("tifCtoOrigen").selectedIndex=0;
  cambiaFideicomiso(GI("tifCtoOrigen"),false);
}

////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN MODIFICAR2
function botonModificar2() {
  pkInfo = pkInfoTraspasos;     //Preparando para abrir el catálogo
  cloneObject(pkInfoTraspasos,catTraspinterfid.getCatalogo());
  
  catTraspinterfid.setOnUpdate(catLoadedTraspinterfid); //Abriendo el catálogo
  catTraspinterfid.buscaCatalogoPK(false);
}

function catLoadedTraspinterfid() {
  //Activar botones Aceptar2 y Cancelar2
  GI("cmdAceptar2").disabled=false;
  GI("cmdCancelar2").disabled=false;
  
  //Desactivar botones Asignar, Modificar2 y Borrar
  GI("cmdAsignar").disabled=true;
  GI("cmdModificar2").disabled=true;
  GI("cmdBorrar").disabled=true;
  cambiaFideicomiso(GI("tifCtoOrigen"),true); //Cargando los valores del catálogo en todos los combos
  
  formsLoaded();
}

////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN ACEPTAR2
function botonAceptar2() {
  RA(GI("txtNumFiso"), "required");
  RA(GI("txtNumFiso"), "message");
  if(fvPrincipalTraspasos.checkForm())
  {
    SA(GI("txtNumFiso"),"required","");
    SA(GI("txtNumFiso"),"message","El Número de Fideicomiso es un dato obligatorio");
    
    var usuarioNuevo = GI("tifUsuario").value;
    var ctoOrigenNuevo = GI("tifCtoOrigen").value;
    var ctoInterOrigenNuevo = GI("tifCtoInterOrigen").value;
    var ctoDestinoNuevo = GI("tifCtoDestino").value;
    var ctoInterDestinoNuevo = GI("tifCtoInterDestino").value;
    
    var objModificaTraspinterfid = JSON.parse("{\"id\":\"modificaDatoTraspinterfid\",\"UsuarioNuevo\":" + usuarioNuevo +
                                                                                  ",\"CtoOrigenNuevo\":" + ctoOrigenNuevo + 
                                                                                  ",\"CtoInterOrigenNuevo\":"  + ctoInterOrigenNuevo  + 
                                                                                  ",\"CtoDestinoNuevo\":"  + ctoDestinoNuevo  + 
                                                                                  ",\"CtoInterDestinoNuevo\":"  + ctoInterDestinoNuevo  + 
                                                                                  
                                                                                  ",\"UsuarioAnt\":"  + usuarioAnt  + 
                                                                                  ",\"CtoOrigenAnt\":"  + ctoOrigenAnt  + 
                                                                                  ",\"CtoInterOrigenAnt\":"  + ctoInterOrigenAnt  + 
                                                                                  ",\"CtoDestinoAnt\":"  + ctoDestinoAnt  + 
                                                                                  ",\"CtoInterDestinoAnt\":"  + ctoInterDestinoAnt  + 
                                                                                  "}");
    
    var urlTraspinterfid = ctxRoot + "/doRef.do?json=" + JSON.stringify(objModificaTraspinterfid);
    makeAjaxRequest(urlTraspinterfid, "HTML", modificandoTraspinterfid, null);
    //operacionExitosa();
  }
}

function modificandoTraspinterfid(obj, result) {
  //Desactivar botones Aceptar2 y Cancelar2
  GI("cmdAceptar2").disabled=true;
  GI("cmdCancelar2").disabled=true;
  
  //Activar botón Asignar
  GI("cmdAsignar").disabled=false;
  
  //Actualizar la tabla de Traspasos
  consultar(GI("hdTraspasos"), GI('frmPrincipalTraspasoInterFideicomisosControlGestion'), false);
  
  operacionExitosa();
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN CANCELAR
function botonCancelar2() {
  //Desactivar botones Aceptar2 y Cancelar2
  GI("cmdAceptar2").disabled=true;
  GI("cmdCancelar2").disabled=true;
  
  //Activar boton Asignar
  GI("cmdAsignar").disabled=false;
  
  //Limpia Combos
  GI("tifCtoOrigen").selectedIndex=0;
  cambiaFideicomiso(GI("tifCtoOrigen"),false);
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN BORRAR
function botonBorrar() {
  if(confirm("¿Desea borrar el registro?")==true)
  {
    //Desactivar botones Modificar2 y Borrar
    GI("cmdModificar2").disabled=true;
    GI("cmdBorrar").disabled=true;
    
    //Activar boton Asignar
    GI("cmdAsignar").disabled=false;
    
    pkInfo = pkInfoTraspasos;     //Preparando para abrir el catálogo
    cloneObject(pkInfoTraspasos,catTraspinterfid.getCatalogo());
    
    catTraspinterfid.setOnUpdate(antesDeOperacionExitosa);
    eliminaCatalogo(catTraspinterfid);
  }
}

function antesDeOperacionExitosa() {
  consultar(GI("hdTraspasos"), GI('frmPrincipalTraspasoInterFideicomisosControlGestion'), false);
  operacionExitosa();
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN FLECHA
function botonFlecha() {
  //Remover el required para los combos
  removerRequired("tifCtoOrigen,tifCtoInterOrigen,tifUsuario,tifCtoDestino,tifCtoInterDestino");
  
  if(fvPrincipalTraspasos.checkForm())
  {
    //Colocando el Required para los combos
    asignarRequired("tifCtoOrigen,tifCtoInterOrigen,tifUsuario,tifCtoDestino,tifCtoInterDestino");
    SA(GI("tifCtoOrigen"),"message","El Fideicomiso Origen es un dato obligatorio");
    SA(GI("tifCtoInterOrigen"),"message","El Contrato de Inversion Origen es un dato obligatorio");
    SA(GI("tifUsuario"),"message","El Usuario es un dato obligatorio");
    SA(GI("tifCtoDestino"),"message","El Fideicomiso Destino es un dato obligatorio");
    SA(GI("tifCtoInterDestino"),"message","El Contrato de Inversión Destino es un dato obligatorio");
    
    //Verificar si es Foseg
    validacionFoseg.numFiso = GI("txtNumFiso").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionFoseg);
    makeAjaxRequest(url, "HTML", verificacionFoseg, null);
  }
}

function verificacionFoseg(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].isFoseg > 0)
  {
    //Activar boton Modificar1 y Cancelar1
    GI("cmdModificar1").disabled=false;
    GI("cmdCancelar1").disabled=false;
    
    var consultaEstInterfid = JSON.parse("{\"id\":\"muestraEstInterfid\",\"numFiso\":0}");
    consultaEstInterfid.numFiso=GI("txtNumFiso").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaEstInterfid);
    makeAjaxRequest(url, "HTML", verificacionEstInterfid, null);
  }
  else
  {
    //Desactivar botones Modificar1, Aceptar1 y Cancelar1
    GI("cmdModificar1").disabled=true;
    GI("cmdAceptar1").disabled=true;
    GI("cmdCancelar1").disabled=true;
    
    //Desactivar radio-botones Si y No
    GI("rdSi").disabled=true;
    GI("rdNo").disabled=true;
  }
}

function verificacionEstInterfid(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoEstInterfid == "SI")
    GI("rdSi").checked=true;
  else
    GI("rdNo").checked=true;
}

function removerRequired(strObjs) {
  arrObjs = strObjs.split(",");
  for(var i = 0;i < arrObjs.length; i++)
  {
    RA(GI(arrObjs[i]),"required");
    RA(GI(arrObjs[i]),"message");
  }
}

function asignarRequired(strObjs) {
  arrObjs = strObjs.split(",");
  for(var i = 0;i < arrObjs.length; i++)
    SA(GI(arrObjs[i]),"required","");
}

////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN MODIFICAR1
function botonModificar1() {
  //Activar radio-botones Si y No, y botón Aceptar1
  GI("rdSi").disabled=false;
  GI("rdNo").disabled=false;
  GI("cmdAceptar1").disabled=false;
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN ACEPTAR1
function botonAceptar1() {
  var numFiso = GI("txtNumFiso").value;
  var estInterfid=null;
  
  if(GI("rdSi").checked)
    estInterfid='SI';
  else
    estInterfid='NO';
  
  var objModificaTraspinterfidContrato = JSON.parse("{\"id\":\"modificaDatoTraspinterfidContrato\",\"EstInterfid\":\"" + estInterfid +
                                                                                                "\",\"NumFiso\":" + numFiso + 
                                                                                                  "}");
  
  var urlTraspinterfidContrato = ctxRoot + "/doRef.do?json=" + JSON.stringify(objModificaTraspinterfidContrato);
  makeAjaxRequest(urlTraspinterfidContrato, "HTML", modificandoTraspinterfidContrato, null);
}

function modificandoTraspinterfidContrato(obj, result) {
  botonCancelar1();
  operacionExitosa();
}


////////////////////////////////////////////////////////////////////
//PROGRAMACION DEL BOTÓN CANCELAR1
function botonCancelar1() {
  //Desactivar botones Modificar1, Aceptar1 y Cancelar1
  GI("cmdModificar1").disabled=true;
  GI("cmdAceptar1").disabled=true;
  GI("cmdCancelar1").disabled=true;
  
  //Desactivar radio-botones Si y No
  GI("rdSi").disabled=true;
  GI("rdNo").disabled=true;
}






//Verificar que el registro aún no exista
/*function verificaExistenciaRegistro() {
  if(operacion==1 && GI("edoNumPais").value!=-1 && GI("edoNumEstado").value!="")
  {
    validacionAlta.numEstado = GI("edoNumEstado").value;
    validacionAlta.numPais = GI("edoNumPais").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El estado ya existe, verifique");
    GI("edoNumPais").selectedIndex=0;
    GI("edoNumEstado").value="";
  }
}
*/

