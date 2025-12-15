// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  //Operación
  pestanias[0] = new pestania('CuentasIndividuales/CuentasIndividuales/PrincipalFideicomisosCuentasIndividuales','Selección de Fideicomiso');
  pestanias[1] = new pestania('CuentasIndividuales/MovimientosCuentas/PrincipalMovimientosCuentas','Movimientos');
  pestanias[2] = new pestania('CuentasIndividuales/TraspasoCuentas/PrincipalTraspasoCuentas','Traspasos');
  pestanias[3] = new pestania('CuentasIndividuales/CargaMasivaMovimientos/PrincipalCargaMasivaMovimientos','Carga Masiva');
  pestanias[4] = new pestania('CuentasIndividuales/Reportes/PrincipalReportesCuentasIndividuales','Reportes');
  
  
  superPestanias[0] = new superPestania(pestanias,'Operación');
  pestanias = new Array();
  
  //Consultas
  pestanias[0] = new pestania('CuentasIndividuales/CierreMensual/PrincipalCierreMensual','Cierre Mensual');
  pestanias[1] = new pestania('CuentasIndividuales/FideicomisosCuentasIndividuales/PrincipalFideicomisosCuentasIndividuales','Consulta de Fideicomisos');
  pestanias[2] = new pestania('CuentasIndividuales/SaldosInversionista/PrincipalSaldosInversionista','Consulta de Saldos');
  
  superPestanias[1] = new superPestania(pestanias,'Consultas');
  pestanias = new Array();
  
  //Catálogos
  pestanias[0] = new pestania('CuentasIndividuales/DefinicionEstructura/PrincipalCatalogoDefinicionEstructura','Definición de Estructura');
  pestanias[1] = new pestania('CuentasIndividuales/DatosOperacion/PrincipalCatalogoDatosOperacion','Datos de Operación');
  pestanias[2] = new pestania('CuentasIndividuales/DefinicionNiveles/PrincipalDefinicionNiveles','Definición de Niveles');
  
  superPestanias[2] = new superPestania(pestanias,'Catálogos');
  pestanias = new Array();
  
  //pestanias[0] = new pestania('CuentasIndividuales/SaldosObjetivos/PrincipalSaldosObjetivos');

escribeSuperPantalla(superPestanias);
