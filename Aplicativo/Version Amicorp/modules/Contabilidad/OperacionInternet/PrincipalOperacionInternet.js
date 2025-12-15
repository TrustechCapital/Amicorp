// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')
  
  pestanias[0] = new pestania('Tesoreria/InstruccionesInternetRecibidas/PrincipalInstruccionesInternetRecibidas','Instrucciones Internet');
  pestanias[1] = new pestania('Tesoreria/InstruccionesInternetSWIFT/PrincipalInstruccionesInternetSWIFTAceptadas','Instrucciones SWIFT');
  pestanias[2] = new pestania('Contabilidad/InstruccionesInternetContabilizacion/PrincipalInstruccionesInternetContabilizacion','Contabilizar Instrucciones Internet');
  pestanias[3] = new pestania('Contabilidad/CancelacionOperacionesInternet/PrincipalCancelacionOperacionesInternet','Cancelación Operaciones Internet');
  pestanias[4] = new pestania('Tesoreria/CancelacionInstruccionesInternet/PrincipalCancelacionInstruccionesInternet','Cancelación Movimientos Internet');
  pestanias[5] = new pestania('ControlGestion/InternetAvisos','Avisos por Internet');
  
var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);

