// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')

  pestanias[0] = new pestania('Contabilidad/SaldosSAT/PrincipalSaldosSAT','Saldos SAT');
  pestanias[1] = new pestania('Contabilidad/UtilidadPerdidaFiscalSAT/PrincipalUtilidadPerdidaFiscalSAT','Utilidad/Perdida');
  pestanias[2] = new pestania('Contabilidad/ArchivoSAT/PrincipalArchivoSAT','Archivo SAT');
  pestanias[3] = new pestania('Contabilidad/ParametrizacionArchivosSAT/PrincipalParamArchSat','Parametrización');
  pestanias[4] = new pestania('Contabilidad/Bitacora/PrincipalBitacora','Bitácora');

var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);

