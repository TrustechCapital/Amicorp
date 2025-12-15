// JavaScript Document

var superPestanias = new Array(); //pesta�as horizontales
var pestanias = new Array(); //pesta�as verticales
// new pestania('urlpantalla','titulo')

  //Prospecto/Proyecto
  //pestanias[0] = new pestania('Formalizacion/PrincipalProspectos','Prospectos');
  pestanias[0] = new pestania('Formalizacion/PrincipalProspectosAnteproyecto','Proyectos');
  pestanias[1] = new pestania('Formalizacion/PrincipalProspectosFideicomitentes','Fideicomitentes');
  pestanias[2] = new pestania('Formalizacion/PrincipalProspectosFideicomisarios','Fideicomisarios');
  pestanias[3] = new pestania('Formalizacion/PrincipalProspectosHonorarios','Honorarios');
  
  superPestanias[0] = new superPestania(pestanias,'Proyecto');
  pestanias = new Array();
  
  //Poderes/Notarios
  pestanias[0] = new pestania('Formalizacion/PrincipalProspectosPoderes','Poderes');
  pestanias[1] = new pestania('Formalizacion/PrincipalProspectosNotarios','Notarios');
  
  superPestanias[1] = new superPestania(pestanias,'Poderes/Notarios');
  pestanias = new Array();
  
  //KYC
  pestanias[0] = new pestania('KYC/Conceptos/PrincipalConceptos','Conceptos');
  
  superPestanias[2] = new superPestania(pestanias,'KYC');
  pestanias = new Array();

escribeSuperPantalla(superPestanias);

  









