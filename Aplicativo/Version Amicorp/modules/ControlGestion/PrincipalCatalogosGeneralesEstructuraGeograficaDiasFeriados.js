var catDiasFeriados = new Catalogo("mx.com.inscitech.fiducia.domain.Feriados");

showWaitLayer();

var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroDiasFeriados\",\"Dia\":0,\"Mes\":0,\"Ano\":0,\"Pais\":0}");

initForms();

var tablaDatosDiasFeriadosData = new Array();
tablaDatosDiasFeriadosData[0] = "paiNomPais,150px";
tablaDatosDiasFeriadosData[1] = "ferFecDia,70px";
tablaDatosDiasFeriadosData[2] = "ferFecMes,70px";
tablaDatosDiasFeriadosData[3] = "ferFecAno,80px";
tablaDatosDiasFeriadosData[4] = "ferDescDiaFer,250px";
tablaDatosDiasFeriadosData[5] = "ferCveStFeriado,90px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoDiasFeriados = new FormValidator();
var fechaFeriado = new Date();
var CONSULTAR = 3;

function cargaPrincipalCatalogosGeneralesEstructuraGeograficaDiasFeriados() {
  onButtonClick("ControlGestion.PrincipalCatalogosGeneralesEstructuraGeograficaDiasFeriados","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catDiasFeriados.getCatalogo());
}


////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados)
function cargaMantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvContenido").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoDiasFeriados.setup({
    formName      : "frmMantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catDiasFeriados.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR)
    catDiasFeriados.buscaCatalogoPK(false);
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
    deshabilitaPK("ferNumPais,txtFechaFeriado".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados"));         //Deshabilita objetos (excepto botones)
  }
  
  GI("txtFechaFeriado").value=formatString(GI("ferFecDia").value,"0",2,"Izquierda") + "/" + formatString(GI("ferFecMes").value,"0",2,"Izquierda") + "/" + GI("ferFecAno").value;
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
}

function AltaOModificaInfo() {
  
  if(operacion==OPER_ALTA && fvMantenimientoDiasFeriados.checkForm())//Se trata de una alta
  {
    
    if(GI('checProyeccion').checked){proyectaFeriados();
    }
    else{
    verificaExistenciaRegistro();
        
    }
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoDiasFeriados.checkForm())//Se trata de una modificación
  {
    catDiasFeriados.setOnUpdate(operacionExitosa);
    showWaitLayer();
    catDiasFeriados.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catDiasFeriados.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catDiasFeriados);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalCatalogosGeneralesEstructuraGeograficaDiasFeriados();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("ferNumPais").value!=-1 && GI("ferFecDia").value!="" && GI("ferFecMes").value!="" && GI("ferFecAno").value!="")
  {
    showWaitLayer();
    validacionAlta.Dia = GI("ferFecDia").value;
    validacionAlta.Mes = GI("ferFecMes").value;
    validacionAlta.Ano = GI("ferFecAno").value;
    validacionAlta.Pais = GI("ferNumPais").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("El día feriado en ese país ya existe, verifique");
    GI("txtFechaFeriado").value="";
    GI("ferFecDia").value="";
    GI("ferFecMes").value="";
    GI("ferFecAno").value="";
    GI("ferNumPais").selectedIndex=0;
  }
  else{  
    catDiasFeriados.setOnUpdate(operacionExitosa);
    catDiasFeriados.altaCatalogo();   
  }
  hideWaitLayer();
}

//Funciones para la funcionalidad de la Fecha Indice
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}


function isValidDateSpecial(date)
{
  var today = new Date();
  if(date>today)
    return false;
  else
    return false;
}

//Descompone la fecha obtenida del calendario a sus respectivas cajas de texto
function descomponeFecha(objOriginal,objDia,objMes,objAno)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  objDia.value=fecha[0];
  objMes.value=fecha[1];
  objAno.value=fecha[2];
  
  //verificaExistenciaRegistro();
}


function proyectaFeriados()
{
var recorrido=0;

if(GI('checRecorre').checked){recorrido=1;}
  
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"proyectaFeriados\",\"Recorrido\":"+eval(recorrido)+",\"Dia\":"+eval(GI("ferFecDia").value)+",\"Mes\":"+eval(GI("ferFecMes").value)+",\"AnoFinal\":"+eval(GI("ferFecAno").value)+",\"Pais\":1,\"Descripcion\":\""+GI("ferDescDiaFer").value+"\",\"Estatus\":\""+GI("ferCveStFeriado").value+"\"}";
   

  makeAjaxRequest(url, "HTML", terminaProyectaFeriados, null); 
}

function terminaProyectaFeriados(obj,result)
{
  var res = JSON.parse(result).resultado;
  hideWaitLayer();
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
        operacionExitosa();
      break;
      case 1:alert("Existen errores!");
      break;
      default:alert("Ocurrió un error inesperado");
    }
  }else{
    alert("Ocurrió un error inesperado");
  }
    
}