// JavaScript Document

var superPestanias = new Array(); //pestañas horizontales
var pestanias = new Array(); //pestañas verticales
// new pestania('urlpantalla','titulo')

  //Fideicomisos
  pestanias[0] = new pestania('Administracion/PrincipalFideicomisos','Fideicomisos');
  pestanias[1] = new pestania('Administracion/PrincipalContactosFideicomisos','Contactos');
  pestanias[2] = new pestania('Administracion/PrincipalFideicomitentes','Fideicomitentes');
  pestanias[3] = new pestania('Administracion/PrincipalFideicomisarios','Fideicomisarios');
  pestanias[4] = new pestania('Administracion/PrincipalTerceros','Terceros');
  pestanias[5] = new pestania('Administracion/PrincipalSubCuentas','Subcuentas');
  pestanias[6] = new pestania('Tesoreria/ContratosInversion/PrincipalCatalogoContratosInversion','Contratos de Inversión');
  pestanias[7] = new pestania('Administracion/PrincipalFinalidadesContrato','Finalidades');
  
  superPestanias[0] = new superPestania(pestanias,'Fideicomisos');
  pestanias = new Array();
  
  //Comités Técnicos
  pestanias[0] = new pestania('Administracion/PrincipalComiteTecnico','Comités Técnicos');
  pestanias[1] = new pestania('Administracion/PrincipalCalendarioSesionesComiteTecnico','Calendarios de Sesiones');
  //pestanias[2] = new pestania('Administracion/PrincipalMiembrosComiteTecnico','Miembros');
  
  superPestanias[1] = new superPestania(pestanias,'Comités Técnicos');
  pestanias = new Array();
  
  //Constitución/Extinción
  pestanias[0] = new pestania('ControlGestion/PrincipalConstitucion','Ficha Constitución');
  pestanias[1] = new pestania('ControlGestion/PrincipalExtincionControlGestion','Extinción');
  
  superPestanias[2] = new superPestania(pestanias,'Constitución/Extinción');
  pestanias = new Array();

  //Encuesta
  pestanias[0] = new pestania('ControlGestion/PrincipalEncuestaOpcionesControlGestion','Opciones');
  pestanias[1] = new pestania('ControlGestion/PrincipalPersonalizaEncuestaControlGestion','Personalizar');
  
  superPestanias[3] = new superPestania(pestanias,'Encuesta');
  pestanias = new Array();
  
  //Agenda
  pestanias[0] = new pestania('Administracion/Agenda/PrincipalAgenda','Agenda');
  
  superPestanias[4] = new superPestania(pestanias,'Agenda');
  pestanias = new Array();
  
  //Otros
  //pestanias[0] = new pestania('Otros/PoliticasInversion/PrincipalPoliticasInversion','Políticas de Inversión');
  pestanias[0] = new pestania('Otros/Productos/PrincipalProductos','Productos');
  pestanias[1] = new pestania('Otros/Productos/ProductoSerie/PrincipalProductoSerie','Producto Serie');
  //pestanias[3] = new pestania('Otros/OperacionesRelevantes/PrincipalOperacionesRelevantes','Reporte PLD');
  pestanias[2] = new pestania('Otros/SeguimientoProyecto/PrincipalSeguimientoProyecto','Seguimiento Proyecto');
  pestanias[3] = new pestania('Otros/ClonacionKYC/PrincipalClonacionKYC','Clonación KYC');
  pestanias[4] = new pestania('Vinta/InternaPreocupantes/PrincipalParametrosContrasena','Interna Preocupante');
  superPestanias[5] = new superPestania(pestanias,'Otros');
  pestanias = new Array();

  //Solicitudes NO Monetarias
 pestanias[0] = new pestania('Administracion/CharolaSolicitudAdmon/CharolaSolicitudAdmon','Charola de Solicitud');
   
  superPestanias[6] = new superPestania(pestanias,'Charola de Solicitud');
  pestanias = new Array();

  //reportes administracion
 pestanias[0] = new pestania('Administracion/Reportes/PrincipalInformacionGerencial','Informacion Gerencial');
 pestanias[1] = new pestania('Otros/ActividadesRelevantes/PrincipalActividadesRelevantes','Reglas de Transaccionalidad');
 pestanias[2] = new pestania('Otros/OperacionesRelevantesCreditos/PrincipalOperacionesRelevantes','Informes PLD');
 pestanias[3] = new pestania('Interfases/InterfaseValuacion/PrincipalInterfaseValuacion','Personas Bloqueadas');
 pestanias[4] = new pestania('Otros/PrincipalSubCuentas','Cambio Riesgo Manual');   
 
  superPestanias[6] = new superPestania(pestanias,'PLD');
  
  pestanias = new Array();

  //Charola Solicitud No Monetaria
 pestanias[0] = new pestania('Administracion/CharolaSolicitudAdmon/CharolaSolicitudAdmon','Instrucciones No Monetarias');
   
  superPestanias[7] = new superPestania(pestanias,'WorkFlow');
  
  pestanias = new Array();
  
  
escribeSuperPantalla(superPestanias);

  

  