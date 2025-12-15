// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  // Garantias
  pestanias[0] = new pestania('ControlGestion/PrincipalBienesFideicomitidos','Bienes Fideicomitidos');
  pestanias[1] = new pestania('Garantias/Garantias/PrincipalGarantias','Garantias');
  
  superPestanias[0] = new superPestania(pestanias,'Garantias');
  pestanias = new Array();
  
  // Derechos de Cobro
  pestanias[0] = new pestania('Garantias/DerechosCobro/PrincipalDerechosCobro','Derechos de Cobro');
  //pestanias[2] = new pestania('Garantias/BienesGar/PrincipalBienesGar','Bienes en Garantia');
  
  superPestanias[1] = new superPestania(pestanias,'Derechos de Cobro');
  pestanias = new Array();
  
  // Desarrollos Inmobiliarios
  pestanias[0] = new pestania('Garantias/Inmuebles/PrincipalUnidades','Individualización de Inmuebles');
  pestanias[1] = new pestania('Garantias/Inmuebles/Adquirentes/PrincipalAdquirentes','Adquirentes');
  pestanias[2] = new pestania('Garantias/Inmuebles/Liberacion/PrincipalUnidadesLiberacion','Liberaciones');
  pestanias[3] = new pestania('Garantias/Inmuebles/CargaMasiva/PrincipalCargaMasiva','Carga Masiva de Inmuebles');
  pestanias[4] = new pestania('Garantias/Inmuebles/CargaDuplicar/PrincipalCargaDuplicar','Generación de Fideicomisos');
  
  
  
  superPestanias[2] = new superPestania(pestanias,'Desarrollos Inmobiliarios');
  pestanias = new Array();
  
  
  // Control Accionario
  pestanias[0] = new pestania('Garantias/ControlAccionario/PrincipalRegistroAcciones','Registro de Acciones');
  pestanias[1] = new pestania('Garantias/ControlAccionario/Adquirentes/PrincipalDerechos','Derechos');
  pestanias[2] = new pestania('Garantias/ControlAccionario/EntradasSalidas/PrincipalEntradasSalidas','Entradas y Salidas');
  
  
  superPestanias[3] = new superPestania(pestanias,'Control Accionario');
  pestanias = new Array();
  

escribeSuperPantalla(superPestanias);

  