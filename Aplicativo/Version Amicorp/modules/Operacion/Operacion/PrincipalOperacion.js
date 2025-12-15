// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  
  //Conciliación
  pestanias[0] = new pestania('Operacion/Conciliacion/PrincipalInterfaseConciliacion','Conciliación');
  pestanias[1] = new pestania('Operacion/Control/PrincipalControl','Control');


    superPestanias[0] = new superPestania(pestanias,'Conciliación');
    pestanias = new Array();
    
  //Inicio/Cierre Día
  pestanias[0] = new pestania('Operacion/EjecutorPlanes/PrincipalEjecutorPlanes','Ejecución');
    superPestanias[1] = new superPestania(pestanias,'Inicio/Cierre Día');
    pestanias = new Array();
  
  //Iniciar/Cerrar Sistema
  pestanias[0] = new pestania('Operacion/AbrirSistema/PrincipalAbrirSistema','Abrir Sistema');
  pestanias[1] = new pestania('Operacion/CerrarSistema/PrincipalCerrarSistema','Cerrar Sistema');
 
    superPestanias[2] = new superPestania(pestanias,'Iniciar/Cerrar Sistema');
    pestanias = new Array();
  
  //Catálogos
  pestanias[0] = new pestania('Operacion/Planes/PrincipalCatalogoPlanes','Planes de Operación');
  pestanias[1] = new pestania('Operacion/Conciliacion/LayoutBancos/PrincipalLayoutBancos','Layout Bancos');
  pestanias[2] = new pestania('EmisionTitulos/Indices/PrincipalCatalogoIndices','Índices');
 
    superPestanias[3] = new superPestania(pestanias,'Catálogos');
    pestanias = new Array();
  
  //Sistema Externo
  pestanias[0] = new pestania('Operacion/Planes/PrincipalCatalogoPlanes','Planes de Operación');
 
  //  superPestanias[4] = new superPestania(pestanias,'Sistema Externo');
    pestanias = new Array();
  

escribeSuperPantalla(superPestanias);
