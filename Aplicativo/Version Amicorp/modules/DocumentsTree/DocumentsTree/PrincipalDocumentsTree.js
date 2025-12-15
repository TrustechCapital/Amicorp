// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  //Parametrizacion de Arbol
  pestanias[0] = new pestania('DocumentsTree/parametrizacion','Parametrizacion');
  pestanias[1] = new pestania('DocumentsTree/manejoArchivos','Manejo de Archiveros');
  pestanias[2] = new pestania('DocumentsTree/ManejoExpedientes/PrincipalManejoExpedientes','Prestamos de Expedientes');
  
  superPestanias[0] = new superPestania(pestanias,'Archiveros');
    

escribeSuperPantalla(superPestanias);

  

  