// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')

  pestanias[0] = new pestania('Contabilidad/CedulaFiscal/PrincipalCedulaFiscalRegimenFiscal','Cédula Fiscal');
  pestanias[1] = new pestania('Contabilidad/ObligacionesFiscales/PrincipalObligacionesFiscalesRegimenFiscal','Obligaciones Fiscales');
  pestanias[2] = new pestania('Contabilidad/TratamientoFiscal/PrincipalTratamientoFiscalRegimenFiscal','Tratamiento Fiscal');

var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);

