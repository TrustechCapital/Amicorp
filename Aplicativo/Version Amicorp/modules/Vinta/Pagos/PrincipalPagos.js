// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')

  pestanias[0] = new pestania('Vinta/RecepcionPagos/PrincipalRecepcionPagos','Operaci&oacute;n');
  pestanias[1] = new pestania('Vinta/AutorizacionPagos/PrincipalAutorizacionPagos','Autorizar Operaciones');
  pestanias[2] = new pestania('Vinta/ClasificacionPLD/PrincipalClasificacionPLD','Clasificacion PLD');  
  
var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);
