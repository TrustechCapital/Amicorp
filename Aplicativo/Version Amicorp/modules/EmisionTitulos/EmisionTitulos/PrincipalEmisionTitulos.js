// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  
  //Programas
  //pestanias[0] = new pestania('EmisionTitulos/Fideicomisos/PrincipalFideicomisos','Fiduciario Emisor');
  //pestanias[1] = new pestania('EmisionTitulos/Emisores/PrincipalEmisores','Emisores');
  pestanias[0] = new pestania('EmisionTitulos/EmisoresFideicomiso/PrincipalEmisoresFideicomiso','Emisor');
  pestanias[1] = new pestania('EmisionTitulos/Programas/PrincipalProgramas','Programas');
  
    superPestanias[0] = new superPestania(pestanias,'Programas');
    pestanias = new Array();
   
  //Emisiones
  
    //emisiones
  pestanias[0] = new pestania('EmisionTitulos/DatosGeneralesEmisiones/PrincipalDatosGenerales',' Datos Generales Emisiones');
  pestanias[1] = new pestania('EmisionTitulos/ParametrosCalculo/PrincipalParametrosCalculo','Parámetros de Cálculo');
  pestanias[2] = new pestania('EmisionTitulos/Calificaciones/PrincipalCalificaciones','Calificaciones');
  pestanias[3] = new pestania('EmisionTitulos/AvisosAutoridades/PrincipalAvisosAutoridades','Avisos Autoridades');
  pestanias[4] = new pestania('EmisionTitulos/ParametrosImpresion/PrincipalParametrosImpresion','Parametros de Impresión');
   
  
    superPestanias[1] = new superPestania(pestanias,'Emisiones');
    pestanias = new Array();
    
  //Operación
  pestanias[0] = new pestania('EmisionTitulos/CalculoIntereses/PrincipalCalculoIntereses','Cálculo de Intereses');
  pestanias[1] = new pestania('EmisionTitulos/CalendarioPagos/PrincipalCalendarioPagos','Calendario de Pagos');
  /*
    pestanias[2] = new pestania('TRACs/Polizas/PrincipalOperativasPolizas','Polizas por Fideicomiso');
    pestanias[3] = new pestania('EmisionTitulos/VencimientoAnticipado/PrincipalVencimientoAnticipado','Vencimiento Anticipado');// no existe
    pestanias[4] = new pestania('EmisionTitulos/GeneracionArchivos/PrincipalGeneracionArchivos','Generacion Archivos EMISNET');// no existe
    pestanias[5] = new pestania('EmisionTitulos/ReestructuracionTasasPonderadas/PrincipalReestructuracionTasasPonderadas','Reestructuración de Tasas Ponderadas');// no existe
  */
  
  pestanias[2] = new pestania('EmisionTitulos/InterfaseVector/PrincipalInterfaseVector','Carga Indices');
  
    superPestanias[2] = new superPestania(pestanias,'Operación');
    pestanias = new Array();
    
    
  // Reporte Distribución
  
  pestanias[0] = new pestania('EmisionTitulos/ReporteDistribucion/PrincipalReporteDistribucion','Reporte de Distribución');
  pestanias[1] = new pestania('EmisionTitulos/DatosGeneralesEmisiones/PrincipalDatosGenerales','Datos Generales Reporte');
  //pestanias[2] = new pestania('EmisionTitulos/FlujoCobranza/PrincipalFlujoCobranza','Flujo de Cobranza');
  //pestanias[3] = new pestania('EmisionTitulos/EstadisticaMorosidad/PrincipalEstadisticaMorosidad','Estadística de Morosidad');

    superPestanias[3] = new superPestania(pestanias,'Reportes');
    pestanias = new Array();
   
  // Consultas
  
  //pestanias[0] = new pestania('EmisionTitulos/ConsultaCalendarioPagos/PrincipalConsultaCalendarioPagos','Calendario de Pagos');
  //pestanias[1] = new pestania('EmisionTitulos/PrecioPromedioTasas/PrincipalConsultaPrecioPromedioTasas','Precio Promedio de Tasas');//no existe
  //pestanias[2] = new pestania('EmisionTitulos/Eventos/PrincipalConsultaEventos','Eventos');//no existe
  pestanias[0] = new pestania('EmisionTitulos/Agenda/PrincipalAgenda','Agenda');

    superPestanias[4] = new superPestania(pestanias,'Consultas');
    pestanias = new Array();
    
  //Asambleas
  pestanias[0] = new pestania('EmisionTitulos/Asamblea/PrincipalAsamblea','Asamblea');
  pestanias[1] = new pestania('EmisionTitulos/ActaAsamblea/PrincipalActaAsamblea','Acta de Asamblea');
  
    //superPestanias[5] = new superPestania(pestanias,'Asambleas');
    pestanias = new Array();

  //Catálogos
  
  pestanias[0] = new pestania('EmisionTitulos/Formulas/PrincipalFormulas','Formulas');
  pestanias[1] = new pestania('EmisionTitulos/Indices/PrincipalCatalogoIndices','Índices');
  pestanias[2] = new pestania('EmisionTitulos/Autoridades/PrincipalCatalogoAutoridades','Autoridades');
  pestanias[3] = new pestania('EmisionTitulos/IndicesOficiales/PrincipalIndicesOficiales','Índices Oficiales');
  pestanias[4] = new pestania('EmisionTitulos/RepresentacionComun/PrincipalRepComun','Representacion Comun');
  //pestanias[3] = new pestania('EmisionTitulos/RegistroTasas/PrincipalCatalogoRegistroTasas','Registro de Tasas');//no existe
  
    superPestanias[5] = new superPestania(pestanias,'Catálogos');
    pestanias = new Array();

escribeSuperPantalla(superPestanias);

// FUNCIONES COMUNES RC----------------

function upperRC(objRC)// r -> R
{
   objRC.value = objRC.value.toUpperCase();
}

function numIdRC(idRC) // R0'sX -> X
{
  return Number(idRC.toUpperCase().replace("R",""));
}

function existeIdRC(objRC) // nuevo secuencial tomado de ID RC (R0'sX)
{
  showWaitLayer();
  
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conEmisorRepresComun\",\"IdEmisor\":"+numIdRC(objRC.value)+"}";

  makeAjaxRequest(url, "HTML", existeIdRCRes, objRC);
}

function existeIdRCRes(objRC, result) 
{
  var res = JSON.parse(result);
  if(res.length==0&&objRC.value!='')
  {
    alert("¡No existe la Representación Común!");
    objRC.focus();
  }
  hideWaitLayer();
}


/// ----------- Comas Monto ---------------

function limpiaComasMonto(splitCampos)
{
  var campos = splitCampos.split(",");
  for(k=0;k<campos.length;k++)
  {
      while(GI(campos[k]).value.indexOf(",")>-1)
        GI(campos[k]).value = GI(campos[k]).value.replace(",","");
   }
}

function formatoComasMonto(splitCampos)
{
  var campos = splitCampos.split(",");
  for(k=0;k<campos.length;k++)
  {
      var campoDec = true;
      if(GI(campos[k]).decimales!="undefined")
      {
        if(GI(campos[k]).decimales=="false")
          campoDec = false;
      }
  
      GI(campos[k]).value = addCommas(GI(campos[k]).value,campoDec);
   }
}

function formatoMonto(objMonto)
{
   limpiaComasMonto(objMonto.id);
   formatoComasMonto(objMonto.id);
}  

function addCommas(nStr,bDec)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0]!=''?x[0]:'0';
  if(bDec)// tiene decimales
    x2 = x.length > 1? '.' + x[1] : '.00';
  else
    x2 = '';
    
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) 
  {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

//----------------- R0's -----------------

 function formaEmisorR(strIdEmisor) // agrega R0's
 {
    objIdEmisor = GI(strIdEmisor);
    vIdEmisor = eval(objIdEmisor.value);
    
    strCero = 'R';
    
    for(i=1000;i>=vIdEmisor&&vIdEmisor>1;i=i/10)
    {
        strCero += '0'
    }
    
    if(vIdEmisor<=1)// 0 y 1
       strCero += '000'
    
    objIdEmisor.value=strCero+objIdEmisor.value;
 }
 
 
 function formaEmisorSinR(strIdEmisor) // quita R0's
 {
    objIdEmisor = GI(strIdEmisor);
    objIdEmisor.value=Number(objIdEmisor.value.replace("R","").replace("r",""));
 }
/*
$(document).ready(function() {
   $(".idRC").blur(
    function() {
     alert("id RC");
   }
   );
 });

function isIdRC(pNum)
{
  regNum = /^\d*\.?\d*$/;// /^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,2}){0,1}$/; //Formato numeros con punto decimal

  if(regNum.exec(pNum))
		return true;
	return false;
}
*/

// ------------------------------------------------------