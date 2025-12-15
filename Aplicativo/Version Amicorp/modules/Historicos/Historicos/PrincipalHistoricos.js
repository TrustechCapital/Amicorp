// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')

  pestanias[0] = new pestania('Historicos/ConsultaFideicomisos','Fideicomisos');
  pestanias[1] = new pestania('Historicos/ConsultaFideicomitentes','Fideicomitentes');
  pestanias[2] = new pestania('Historicos/ConsultaFideicomisarios','Fideicomisarios');
  pestanias[3] = new pestania('Historicos/ConsultaTerceros','Terceros');
  pestanias[4] = new pestania('Historicos/ConsultaComiteTecnico','Comité Técnico');
  pestanias[5] = new pestania('Historicos/ConsultaFinalidades','Finalidades del Contrato');
  pestanias[6] = new pestania('Historicos/DetalleExtincion','Detalle de Extinción');
  
  
var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);

