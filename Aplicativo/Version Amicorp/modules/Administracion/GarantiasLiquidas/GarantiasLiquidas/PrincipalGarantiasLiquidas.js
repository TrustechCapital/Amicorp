// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  //Interfases
  pestanias[0] = new pestania('Administracion/GarantiasLiquidas/CargaMasiva/PrincipalCargaGarantiasLiquidas','Carga Masiva');
  pestanias[1] = new pestania('Administracion/GarantiasLiquidas/CargaMasiva/InterfaseClientes/PrincipalInterfaseClientes','Clientes');
  pestanias[2] = new pestania('Interfases/InterfaseFideicomisos/PrincipalInterfaseFideicomisos','Fideicomisos');
  
  superPestanias[0] = new superPestania(pestanias,'Interfases');
  
  pestanias = new Array();
  
  
  //Operativas
  pestanias[0] = new pestania('Administracion/GarantiasLiquidas/PrincipalGarantiasLiquidas','Operación');
  superPestanias[1] = new superPestania(pestanias,'Operativas');
  pestanias = new Array();

escribeSuperPantalla(superPestanias);

  // pestañas fuera
//Administracion/GarantiasLiquidas/Disposiciones/PrincipalDisposiciones
//Administracion/GarantiasLiquidas/Creditos/PrincipalCreditos








