var catPresupuestoAnualHonorarios = new Catalogo("mx.com.inscitech.fiducia.domain.Preshono");

var sumaTotalPresupuesto = 0;
var presupuestoIntroducido = false;

var consultaDatosInformativos = JSON.parse("{\"id\":\"muestraDatosFideicomisos\",\"NumFideicomiso\":0}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
var validacionExistenciaRegistro = JSON.parse("{\"id\":\"verificaExistenciaRegistroPreshono\",\"numContrato\":0,\"anoRegistro\":0}");

var tablaPresupuestoAnualHonorariosData = new Array();
tablaPresupuestoAnualHonorariosData[0] = "prhNumContrato,60px";
tablaPresupuestoAnualHonorariosData[1] = "ctoNomContrato,200px";
tablaPresupuestoAnualHonorariosData[2] = "prhTotalAno,90px,right";
tablaPresupuestoAnualHonorariosData[3] = "prhEnePres,60px,right";
tablaPresupuestoAnualHonorariosData[4] = "prhFebPres,60px,right";
tablaPresupuestoAnualHonorariosData[5] = "prhMarPres,60px,right";
tablaPresupuestoAnualHonorariosData[6] = "prhAbrPres,60px,right";
tablaPresupuestoAnualHonorariosData[7] = "prhMayPres,60px,right";
tablaPresupuestoAnualHonorariosData[8] = "prhJunPres,60px,right";
tablaPresupuestoAnualHonorariosData[9] = "prhJulPres,60px,right";
tablaPresupuestoAnualHonorariosData[10] = "prhAgoPres,60px,right";
tablaPresupuestoAnualHonorariosData[11] = "prhSepPres,60px,right";
tablaPresupuestoAnualHonorariosData[12] = "prhOctPres,60px,right";
tablaPresupuestoAnualHonorariosData[13] = "prhNovPres,60px,right";
tablaPresupuestoAnualHonorariosData[14] = "prhDicPres,60px,right";
tablaPresupuestoAnualHonorariosData[15] = "prhComentario,200px";
tablaPresupuestoAnualHonorariosData[16] = "prhCveStPreshon,100px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var CONSULTAR = 3;

formsLoaded();

function cargaPrincipalPresupuestoAnualHonorarios() {
  operacion = 0;
  numPantalla = 0;
  pkInfo = null;
  onButtonClickPestania("Honorarios.PrincipalPresupuestoAnualHonorarios","");
}


function cargaMantenimientoPresupuestoAnualHonorarios(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Honorarios/MantenimientoPresupuestoAnualHonorarios.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  if(numPantalla==1)
  {
    //No permitir editar el campo informativo de la página de mantenimiento:
    //1. Nombre 
    SA(GI("frmPresupuestoAnualHonorariosMantenimiento").txtNomFiso, "LKD", "true");
    SA(GI("frmPresupuestoAnualHonorariosMantenimiento").txtNomFiso, "disabled", "true");
    
    loadCatalogo();
  }
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catPresupuestoAnualHonorarios.getCatalogo());
}

function loadCatalogo() {
  catPresupuestoAnualHonorarios.setOnUpdate(catLoaded);
  SA(GI("prhEnePres"),"value","0");
    SA(GI("prhFebPres"),"value","0");
    SA(GI("prhMarPres"),"value","0");
    SA(GI("prhAbrPres"),"value","0");
    SA(GI("prhMayPres"),"value","0");
    SA(GI("prhJunPres"),"value","0");
    SA(GI("prhJulPres"),"value","0");
    SA(GI("prhAgoPres"),"value","0");
    SA(GI("prhSepPres"),"value","0");
    SA(GI("prhOctPres"),"value","0");
    SA(GI("prhNovPres"),"value","0");
    SA(GI("prhDicPres"),"value","0");
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catPresupuestoAnualHonorarios.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function verificaSumaTotales() {
  var sumTotales = 0;
  
  sumTotales += eval(GI("prhEnePres").value);
  sumTotales += eval(GI("prhFebPres").value);
  sumTotales += eval(GI("prhMarPres").value);
  sumTotales += eval(GI("prhAbrPres").value);
  
  sumTotales += eval(GI("prhMayPres").value);
  sumTotales += eval(GI("prhJunPres").value);
  sumTotales += eval(GI("prhJulPres").value);
  sumTotales += eval(GI("prhAgoPres").value);
  
  sumTotales += eval(GI("prhSepPres").value);
  sumTotales += eval(GI("prhOctPres").value);
  sumTotales += eval(GI("prhNovPres").value);
  sumTotales += eval(GI("prhDicPres").value);
  if(sumTotales == eval(GI("prhTotalAno").value))
    AltaOModificaInfo();
  else
    alert("No coincide el presupuesto Anual con el desglosado por Meses, Verifique");
}

function AltaOModificaInfo() {
  catPresupuestoAnualHonorarios.setOnUpdate(operacionExitosa);
  if(operacion==OPER_ALTA)//Se trata de una alta
  {
    if(GI("prhNumContrato").value!="" && GI("prhAnoRegistro").value!="")
      catPresupuestoAnualHonorarios.altaCatalogo();
    else
      alert("Hace falta que coloque un número de fideicomiso o el año de registro");
  }
  else if(operacion==OPER_MODIFICAR)//Se trata de una modificación
    catPresupuestoAnualHonorarios.modificaCatalogo();
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("prhNumContrato,prhAnoRegistro".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmPresupuestoAnualHonorariosMantenimiento"));                  //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //Mostrar el nombre del fiso (informativo)
  mostrarDatosInformativos(3);
  formsLoaded();
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalPresupuestoAnualHonorarios();
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catPresupuestoAnualHonorarios.setOnUpdate(operacionExitosa);
    eliminaCatalogo(catPresupuestoAnualHonorarios);
  }
}


////////////////////////////////////////////////////////////////////////////
function mostrarDatosInformativos(parametroPantalla) {
  GI("txtNomFiso").value="";
  
  validacionAlta.numContrato = GI("prhNumContrato").value;
  validacionAlta2.numContrato = GI("prhNumContrato").value;
  validacionExistenciaRegistro.numContrato = GI("prhNumContrato").value;
  validacionExistenciaRegistro.anoRegistro = GI("prhAnoRegistro").value;
  consultaDatosInformativos.NumFideicomiso = GI("prhNumContrato").value;
  
  if(parametroPantalla==2 && GI("prhNumContrato").value!="" && GI("prhAnoRegistro").value!="")
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, null);
  }
  else if(parametroPantalla==3)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, null);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("prhNumContrato").value="";
    GI("prhAnoRegistro").value="";
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat == 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionExistenciaRegistro);
    makeAjaxRequest(url, "HTML", verificaExistenciaRegistro, null);
  }
  else
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("prhNumContrato").value="";
    GI("prhAnoRegistro").value="";
  }
}

function verificaExistenciaRegistro(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].prhNumRegistro == 0)
  {
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(consultaDatosInformativos);
    makeAjaxRequest(url, "HTML", insertaDatosInformativos, null);
  }
  else
  {
    alert("Ya existe un registro con ese número de fideicomiso en el mismo año");
    GI("prhNumContrato").value="";
    GI("prhAnoRegistro").value="";
  }
}

function insertaDatosInformativos(obj, result) {
  var objResult = JSON.parse(result);
  GI("txtNomFiso").value=objResult[0].ctoNomContrato;
}


function presupuestoTotalActivado(valor){
    if(valor==""){
    presupuestoIntroducido = false;
    //alert("presupuestoIntroducido = "+presupuestoIntroducido);
    sumaTotalPresupuesto=0
    SA(GI("prhEnePres"),"value","0");
    SA(GI("prhFebPres"),"value","0");
    SA(GI("prhMarPres"),"value","0");
    SA(GI("prhAbrPres"),"value","0");
    SA(GI("prhMayPres"),"value","0");
    SA(GI("prhJunPres"),"value","0");
    SA(GI("prhJulPres"),"value","0");
    SA(GI("prhAgoPres"),"value","0");
    SA(GI("prhSepPres"),"value","0");
    SA(GI("prhOctPres"),"value","0");
    SA(GI("prhNovPres"),"value","0");
    SA(GI("prhDicPres"),"value","0");
    
    }
    else
    presupuestoIntroducido = true;
}

function sumaPresupuesto(valor){
    //alert("presupuestoIntroducido = "+presupuestoIntroducido);
    if(!(presupuestoIntroducido)) {
          if(valor=="")
            sumaTotalPresupuesto +=0;
          else{ 
          sumaTotalPresupuesto += eval(valor);
          SA(GI("prhTotalAno"),"value",sumaTotalPresupuesto);
          }
    }
}