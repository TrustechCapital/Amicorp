// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  //Carátulas
  pestanias[0] = new pestania('TRACs/Cartera/PrincipalCartera','Composición de Cartera');
  pestanias[1] = new pestania('TRACs/Resumen/PrincipalResumen','Resumen Mensual');
  
    superPestanias[0] = new superPestania(pestanias,'Carátulas');
    pestanias = new Array();
    
  //Creaciones/Redenciones
  pestanias[0] = new pestania('TRACs/Creaciones/PrincipalCreaciones','Creaciones');
  pestanias[1] = new pestania('TRACs/Redenciones/PrincipalRedenciones','Redenciones');
  pestanias[2] = new pestania('TRACs/Sembrado/PrincipalSembrado','Sembrado');
  //pestanias[2] = new pestania('TRACs/Cancelaciones/PrincipalCancelaciones','Cancelaciones');
  
    superPestanias[1] = new superPestania(pestanias,'Creaciones/Redenciones');
    pestanias = new Array();
  
  //Operación
  
  pestanias[0] = new pestania('TRACs/Confirmaciones/PrincipalConfirmaciones','Confirmaciones');
  pestanias[1] = new pestania('TRACs/Precios/PrincipalPrecios','Carga de Precios');
  pestanias[2] = new pestania('TRACs/OperacionesCustodio/PrincipalOperacionesCustodio','Operaciones con Custodio');
  pestanias[3] = new pestania('TRACs/ComprasVentas/PrincipalComprasVentas','Compras y Ventas');
  pestanias[4] = new pestania('TRACs/Futuros/PrincipalFuturos','Futuros');
  pestanias[5] = new pestania('TRACs/Polizas/PrincipalOperativasPolizas','Pago de Gastos');
  pestanias[6] = new pestania('TRACs/Valuacion/PrincipalValuacion','Valuación');
  pestanias[7] = new pestania('TRACs/TraspasoTitulos/PrincipalTraspasoTitulos','Traspaso Títulos');
  
    superPestanias[2] = new superPestania(pestanias,'Operación');
    pestanias = new Array();
  
  //Líneas de Crédito
  
  pestanias[0] = new pestania('TRACs/LineasCreditoOperacion/PrincipalLineasCreditoOperacion','Operación');
  pestanias[1] = new pestania('TRACs/LineasCredito/PrincipalLineasCredito','Catálogo');
  
    superPestanias[3] = new superPestania(pestanias,'Líneas Crédito');
    pestanias = new Array();
    
  //Consultas
  
  pestanias[0] = new pestania('Tesoreria/PosicionContratos/PrincipalConsultaPosicionContratos','Posición por Fideicomiso');
  pestanias[1] = new pestania('TRACs/Movimientos/PrincipalMovimientos','Movimientos ETFs');
  pestanias[2] = new pestania('Contabilidad/Asientos/PrincipalConsultaAsientos','Asientos');
  pestanias[3] = new pestania('Contabilidad/Movimientos/PrincipalConsultaMovimientos','Movimientos');
  pestanias[4] = new pestania('Contabilidad/SaldosFideicomiso/PrincipalConsultaSaldosFideicomiso','Saldos por Fideicomiso');
  
    superPestanias[4] = new superPestania(pestanias,'Consultas');
    pestanias = new Array();
  
  //Reportes
  pestanias[0] = new pestania('TRACs/Reportes/PrincipalReportes','Reportes ETFs');
  pestanias[1] = new pestania('Contabilidad/Reportes/PrincipalReportes','Reportes Contabilidad');
  
    superPestanias[5] = new superPestania(pestanias,'Reportes');
    pestanias = new Array();
  
  //Interfases
  pestanias[0] = new pestania('TRACs/Interfases/Protego/PrincipalProtego','Protego');
  pestanias[1] = new pestania('TRACs/Interfases/Santander/PrincipalSantander','Custodio');
  pestanias[2] = new pestania('TRACs/Interfases/BolsaMexicana/PrincipalBolsaMexicana','Bolsa Mexicana');
  pestanias[3] = new pestania('TRACs/Interfases/Nafin/PrincipalNafin','Nafin');
  pestanias[4] = new pestania('TRACs/Interfases/RepresentanteComun/PrincipalRepresentanteComun','Representante Común');
  pestanias[5] = new pestania('TRACs/Interfases/Futuros/PrincipalFuturos','Futuros');
  
  superPestanias[6] = new superPestania(pestanias,'Interfases');
  pestanias = new Array();  
  
   //Catálogos
   
  pestanias[0] = new pestania('TRACs/Acreditaciones/PrincipalAcreditaciones','Acreditaciones');
  pestanias[1] = new pestania('TRACs/Acreditados/PrincipalAcreditados','Acreditados');
  pestanias[2] = new pestania('TRACs/Parametros/PrincipalParametros','Parámetros');
  
    superPestanias[7] = new superPestania(pestanias,'Catálogos');
    pestanias = new Array();

escribeSuperPantalla(superPestanias);

  var fechaTrac=new Date();
  var diames=fechaTrac.getDate();
  var diasemana=fechaTrac.getDay();
  var mes=fechaTrac.getMonth();
  var ano=fechaTrac.getFullYear();
  
  var textosemana = ["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"];
  var textomes = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
  var sfecTrac = textosemana[diasemana]+" "+diames+" de "+textomes[mes]+" de "+ano;
  
  GI("fecTrac").innerHTML = sfecTrac;
  var smes = (((mes+1)<10)?"0"+(mes+1):(mes+1))
  var sdiames = ((diames<10)?"0"+diames:diames)
  var fecTrac = sdiames+"/"+smes+"/"+ano; 
  
  function fechaTrack(obj)//poner fecha a campo input
  {
      obj.value = fecTrac;
  }
  
iniciaDiaTrack();//inicia Dia Tracks

function iniciaDiaTrack()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"ejeFunIniciaDiaTrack\",\"fecha\":\""+fecTrac+"\",\"usuario\":"+ctxUser+"}";
  makeAjaxRequest(url,"HTML",iniciaDiaTrackResp,null);
}

function iniciaDiaTrackResp(obj,result)
{
  var res = JSON.parse(result).RESULTADO;
  
  switch(res)
  {
    case 0:
          break;
    default:
          alert("¡Error inicio Día!");
          break;
  }
}
