// JavaScript Document

var pestanias = new Array();

// new pestania('urlpantalla','titulo')

  pestanias[0] = new pestania('Tesoreria/Interfaces/PrincipalTAS','Valores');
  pestanias[1] = new pestania('Interfases/InterfaseSalomon/PrincipalInterfaseSalomon','Contabilidad Institucional');
  pestanias[2] = new pestania('Interfases/InterfaseMains/PrincipalInterfaseMains','Lavado de Dinero');
  pestanias[3] = new pestania('Interfases/CashWindows/PrincipalCashWindows','Cash Windows');
  //pestanias[5] = new pestania('Interfases/InterfaseCreditos/PrincipalInterfaseCreditos','Créditos');
  //pestanias[6] = new pestania('Interfases/InterfaseClientes/PrincipalInterfaseClientes','Clientes');
  
  
var objPes = new Object();
objPes.arPestanias=pestanias;
objPes.indice = 0;

iniciaPantalla(objPes,null);

