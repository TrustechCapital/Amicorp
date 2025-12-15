var catOpertran = new Catalogo("mx.com.inscitech.fiducia.domain.Opertran");

var strIdPK = "traAnoMovto,traMesMovto,traDiaMovto,traEntidadFin";
var arrIdPK = strIdPK.split(",");
var fvConsultaTransferencia= new FormValidator();
pkInfo = null;

var arrTblTransferencia =  new Array();
fvConsultaTransferencia.setup({
  formName      : "frmTransferencia",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

arrTblTransferencia[0] = "traNumContrato,80";
arrTblTransferencia[1] = "traNumSecReg,80";
arrTblTransferencia[2] = "traTipoMovimient,150";
arrTblTransferencia[3] = "traContratoInter,100";
arrTblTransferencia[4] = "traNomPizarra,100";
arrTblTransferencia[5] = "traNumSerie,100";
arrTblTransferencia[6] = "traNumCupon,50";
arrTblTransferencia[7] = "traCveStTransfe,80";
arrTblTransferencia[8] = "traNomFile,150";

var fncValidaTransferencia = JSON.parse("{\"id\":\"conArcPlaTAS\"}");


//modificar
var fechaDefault = new Date(); 
var vgDisplay="";
initForms();
GI("paramInterfaceID").value = 0;

function setFechaCal() { 
  GI("paramFechaAnt").value = GI("paramFecha").value;
}

function isValidDate(date) { 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

Calendar.setup({
    inputField     :    "paramFecha",   // id of the input field
    button         :    "paramFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechaDefault,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});                   

function cambiaPantallaTAS(obj, result) {
  obj.innerHTML = result;
  SA(GI("paramFecha"), "readonly", "true");
  GI("txtMensaje").value=vgDisplay;
  hideWaitLayer();
}

function fileUploaded() {  
  var objInterface = GI("dvInterface");
  var url = ctxRoot + "/modules/Tesoreria/Interfaces/TasAplicar.do";
 
  GI("frameUpload").onreadystatechange = function() {};
  hide("frameUpload");
  hide("frmTas");
  
  removeFrame("frameUpload");
  
  makeAjaxRequest(url, "HTML", cambiaPantallaTAS, objInterface);
}

function frameSubmit(forma) {
  //if(fv.checkFrom())
  if(GI("paramFecha").value=="" ||
  !(eval(GI("paramInterfaceID").value)==1||
  eval(GI("paramInterfaceID").value)==2||
  eval(GI("paramInterfaceID").value)==3||
  eval(GI("paramInterfaceID").value)==4)){  
    alert("Debe seleccionar la Fecha y la Interfase");
  }
  else{  
    GI("frameUpload").onreadystatechange = fileUploaded;
    forma.document.getElementById("fechaTas").value = GI("paramFecha").value;
    forma.submit();
    showWaitLayer();
  }  
}

function aplicarTas() {
  showWaitLayer();
  bIndicaTermino=0;
   var parametrosTAS = JSON.parse("{\"id\":\"exeTAS\"}");
      parametrosTAS.InterfaceID = eval(GI("paramInterfaceID").value);
      parametrosTAS.Fecha = GI("paramFecha").value;
      parametrosTAS.FechaAnt = GI("paramFecha").value;
      parametrosTAS.MesAbierto = 0;
      parametrosTAS.Usuario = eval(GI("paramUsuario").value);
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(parametrosTAS);
  //descomponeFecha(GI("paramFecha"));
  makeAjaxRequest(url, "HTML", imprimeResultado, null);
  iniciarProcesoParaGenerarPorcentajesDeTiempoTranscurrido();//--------------------------------------------------------------------------------INICIA TIMMER
}

function VeriificaEstado() {
  var parametrosTAS = getParameters(GI("frmTas"));
  var fecha = GI("paramFecha").value.split("/");
  parametrosTAS.opcion = parseInt(GI("paramInterfaceID").value);
  parametrosTAS.ano = parseInt(fecha[2]);
  parametrosTAS.mes = parseInt(fecha[1]);
  parametrosTAS.dia = parseInt(fecha[0]);
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(parametrosTAS);
  makeAjaxRequest(url, "HTML", muestraResultado, null);
}

function muestraResultado(obj, result) {
  var datosEstado = JSON.parse(result);
  var objInterface = GI("dvInterface");
  var objTablaResult = GI("tablaDatosEstatus");
  
  var tbody = objTablaResult.lastChild;
  var tipoRenglon = 1;
  var i = 0;
  
  for(i = 0; i < 2; i++)
    tbody.removeChild(tbody.lastChild);

  for(var i = 0; i < datosEstado.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    
    for(k in item) {
      var col = createElement("td", fila);
      col.innerHTML = ""+item[k];
    }
    
    fila.className = "renglon" + tipoRenglon;
    
    if(tipoRenglon == 1)
      tipoRenglon = 2;
    else
      tipoRenglon = 1;    
  }
  
  setTimeout("VeriificaEstado()", 3000);
}

function imprimeResultado(obj, result) {
   //alert(result);
  //stopCount();//--------------------------------------------------------------------------------------------------------------------------------------FIN TIMMER
  setTimeout("detener()",9000);
}
var iInterfase;
function cambiaInterface(claseIf) {
  var datosClase = claseIf.split(":");
  var objProcessor = frameUpload.document.getElementById("processor");
  objProcessor.value = datosClase[0];
  GI("paramInterfaceID").value = datosClase[1];
  iInterfase=GI("paramInterfaceID").value;
  verificarDuplicidadArchivoYprocesar();  
  //alert("objProcessor: " + objProcessor.value + " paramInterfaceID: " + GI("paramInterfaceID").value);
}


//VARIABLES GLOBALES TIMMER----------------------------------
    var vgDia;
    var vgMes;
    var vgAnio;
    var vgTotalOperaciones=0;
    var vgTotOpeAgrup=0;
    var vgContOperTotal = new Array();
    var vgSaldoOperTotal = new Array();
    var vgTipoOperTotal = new Array();
    var vgProporcionXtipoOper = new Array();
    var vgXtipoOper = new Array();
    var vgAuxcontOperActual = new Array();
    var vgTotPorcXtipoOpe = new Array();
    var vgSaldoTot = new Array();
    var porcTimer = 0;
    var vgHayResultado;
    var vgYaSehaVerificado = false;
    var vgcanttotreg=0;
//-----------------------------------------------------------
var fecha;
var fecha2;
function descomponeFecha(objOriginal)
{
  fecha2=objOriginal.value;
  fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  vgDia=fecha[0];
  vgMes=fecha[1];
  vgAnio=fecha[2];
  
  verificarDuplicidadArchivoYprocesar();
  /*else
    GI("frameUpload").style.visibility="visible";*/
    
}


//***********************************************************PROCESO PARA EL TIMMER**************************************************************
//***********************************************************************************************************************************************
/////////////////////DETENER PROCESO///////////////////////////////////////////////////////////////////////
  function stopCount() {
      clearTimeout();
      //GI("txtProgreso").value="100 %";
      porcTimer = 0;
      //inicializamos todas las variables globales
      for(x=0;x<vgTotOpeAgrup;x++){
          vgContOperTotal[x] = 0;
          vgSaldoOperTotal[x] = 0;
          vgTipoOperTotal[x] = 0;
          vgProporcionXtipoOper[x] = 0;
          vgXtipoOper[x] = 0;
          vgAuxcontOperActual[x] = 0
          vgTotPorcXtipoOpe[x] = 0
          vgSaldoTot[x] = 0
      }
      vgTotOpeAgrup=0;
      vgTotalOperaciones=0;
      vgcanttotreg=0;
      vgYaSehaVerificado = false;
  }
////////////////////INICIAR PROCESO//////////////////////////////////////////////////////////////////////////
  function iniciarProcesoParaGenerarPorcentajesDeTiempoTranscurrido() {
      obtenerTotalOperaciones();
  }
//OBTENEMOS EL TOTAL DE OPERACIONES QUE HAN DE SER PROCESADAS, PARA DEFINIR EL 100%
  function obtenerTotalOperaciones(){
      var objTotalOperaciones = JSON.parse("{\"id\":\"qryTotalOperaciones\"}");
      objTotalOperaciones.anio = vgAnio;
      objTotalOperaciones.mes = vgMes;
      objTotalOperaciones.dia = vgDia;
      objTotalOperaciones.Interfase = eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTotalOperaciones);
      makeAjaxRequest(url, "HTML", muestraTotalOperaciones, null);
  }
  function muestraTotalOperaciones(obj,result){
       var res = JSON.parse(result)[0];
       vgTotalOperaciones = res.totOper;//NUMERO TOTAL DE Operaciones variable global
       GI("txtNumTotalOperaciones").value=vgTotalOperaciones;
       GI("txtNumTotalOperaciones").value=formatNumber(GI("txtNumTotalOperaciones").value);
       obtenerTotalOperacionesAgrupadasConSaldo();
  }
//OBTENEMOS EL TOTAL DE TODOS LOS TIPOS DE OPERACIONES QUE TOMAREMOS COMO PARAMETRO 
//PARA DEFINIR EL 100% DE CADA UNO
  function obtenerTotalOperacionesAgrupadasConSaldo(){
  var objTotalTipoOperacionesAgrupadas = JSON.parse("{\"id\":\"qryoTotalTipoOperacionesAgrupadas2\"}");
      objTotalTipoOperacionesAgrupadas.anio = vgAnio;
      objTotalTipoOperacionesAgrupadas.mes = vgMes;
      objTotalTipoOperacionesAgrupadas.dia = vgDia;
      objTotalTipoOperacionesAgrupadas.Interfase = eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTotalTipoOperacionesAgrupadas);
      makeAjaxRequest(url, "HTML", muestraTotalTipoOperacionesAgrupadas, null);
  }
  function muestraTotalTipoOperacionesAgrupadas(obj,result){
       var res = JSON.parse(result)[0];
       vgTotOpeAgrup = res.totOperAgr;//NUMERO TOTAL DE registros con Operaciones  ya agrupadas y con saldo total, variable global
       obtenerTodosLosValoresDeLasOperacionesAgrupadas();
  }
//OBTENER TODA LA INFORMACION REFERENTE AL TIPO DE OPERACIONES 
  function obtenerTodosLosValoresDeLasOperacionesAgrupadas(){
  var objTodosLosValoresDeLasOperacionesAgrupadas = JSON.parse("{\"id\":\"qryoTodosLosValoresDeLasOperacionesAgrupadas\"}");
      objTodosLosValoresDeLasOperacionesAgrupadas.anio = vgAnio;
      objTodosLosValoresDeLasOperacionesAgrupadas.mes = vgMes;
      objTodosLosValoresDeLasOperacionesAgrupadas.dia = vgDia;
      objTodosLosValoresDeLasOperacionesAgrupadas.Interfase = eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTodosLosValoresDeLasOperacionesAgrupadas);
      makeAjaxRequest(url, "HTML", muestraInformacionPorTipoOperacion, null);
  }
  function muestraInformacionPorTipoOperacion(obj,result){
       //alert(result)
       var todosLosValores= JSON.parse(result);
       for(fila=0;fila<vgTotOpeAgrup;fila++){
          vgContOperTotal[fila]=todosLosValores[fila].cont;//total de operaciones procesadas por tipo
          vgTipoOperTotal[fila]=todosLosValores[fila].tipo;//tipo de operacion
       }
     for(x=0;x<vgTotOpeAgrup;x++){
          //inicializamos variables auxiliares
          vgAuxcontOperActual[x] = 0//VARIABLE AUX QUE SIRVE PARA CONTROLAR QUE SOLO SE PROCESE UNICAMENTE SOBRE LAS OPERACIONES QUE HAN CAMBIADO
          vgTotPorcXtipoOpe[x] = 0
          vgSaldoTot[x] = 0
          vgcanttotreg+=vgContOperTotal[x]
          vgProporcionXtipoOper[x]=obtenerPorcentajePorTiPoOper(vgTotalOperaciones,vgContOperTotal[x])//vgTotalOperaciones
    } 
    /*var res = 0
    for(x=0;x<vgTotOpeAgrup;x++){
      res += vgProporcionXtipoOper[x];
    }
    alert("vgTotalOperaciones = "+vgTotalOperaciones+" vgTotOpeAgrup = "+vgTotOpeAgrup+" res ="+res);*/
    timedCount();//INICIA EL PROCESO RECURSIVO QUE REFRESCARA LOS DISPLAYS CON EL PORCENTAJE TRANSCURRIDO
  }
  function obtenerPorcentajePorTiPoOper(totalOperaciones,totOpeAgrupadas){
         var porc=(totOpeAgrupadas*100)/totalOperaciones;
         return porc;
  }
  function timedCount(){
      var objValoresTablaTemporal = JSON.parse("{\"id\":\"qryoTodosLosValoresDeLasOperacionesAgrupadasActuales\"}");
      objValoresTablaTemporal.anio = vgAnio;
      objValoresTablaTemporal.mes = vgMes;
      objValoresTablaTemporal.dia = vgDia;
      objValoresTablaTemporal.Interfase = eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objValoresTablaTemporal);
      makeAjaxRequest(url, "HTML", muestraValoresTablaTemporal, null);
  }
  function muestraValoresTablaTemporal(obj,result){
      var ContOperActual = new Array();
      var SaldoOperActual = new Array();
      var TipoOperActual = new Array();
      var queryTrajoResultados
      var todosLosValores= JSON.parse(result);
      var fix=0;
       //SI EL QUERY FUÉ CORRECTO PERO NO TRAJO NINGUN RESULTADO, LA VARIABLE RESULT MUESTRA: "codigoError":"0","tipoError":"SUCCESS" QUE SE DEBE CONTROLAR
     //alert("vgYaSehaVerificado ="+vgYaSehaVerificado);
      //if(!vgYaSehaVerificado){//la verificacion solo debe hacerse una sola vez
          queryTrajoResultados = JSON.stringify(todosLosValores)////////////////////////////////////////////////////////////////
          queryTrajoResultados=queryTrajoResultados.toString();
          for(i=0;i<queryTrajoResultados.length;i++){
              if(queryTrajoResultados.indexOf("codigoError")!=-1){//SI EL RESULT ARROJA codigoError ES PORQUE EL QUERY ESTA VACIO 
                 vgHayResultado=false
                 break;
              }
              else{// EL RESULT ES UNA MATRIZ CON TODOS LOS RESULTADOS DE LA CONSULTA
                vgHayResultado=true
              }
          }
         //vgYaSehaVerificado=true;
     // }//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //alert("vgHayResultado = "+vgHayResultado);
      //if(vgHayResultado){
        //alert("vgTotOpeAgrup = "+vgTotOpeAgrup);
         for(fila=0;fila<vgTotOpeAgrup;fila++){//vgTotOpeAgrup
            if(todosLosValores[fila]==null||todosLosValores[fila]==""||todosLosValores[fila]==" "){
                  fix++;
                  continue;
            }
            else{
                  if(vgHayResultado){
                      ContOperActual[fila]=todosLosValores[fila].cont;//cuenta el numero de operaciones actuales que han sido procesadas deacuerdo a su tipo
                      SaldoOperActual[fila]=todosLosValores[fila].saldo;//saldo que arroja la operacion actual
                      TipoOperActual[fila]=todosLosValores[fila].tipo;//muestra el tipo de la operacion actual
                  }
                  else{
                      ContOperActual[fila]=0;//cuenta el numero de operaciones actuales que han sido procesadas deacuerdo a su tipo
                      SaldoOperActual[fila]=0;//saldo que arroja la operacion actual
                      TipoOperActual[fila]=0;//muestra el tipo de la operacion actual
                  }
          }
         }
         var cantregparcial=0;
         for(y=0;y<(vgTotOpeAgrup-fix);y++){
            recuperarDatosArray(ContOperActual[y],SaldoOperActual[y],TipoOperActual[y],y)
            cantregparcial+=ContOperActual[y]
         }
         porcTimer=trunc((cantregparcial*100)/vgcanttotreg,2);
         
          //alert("porcTimer = "+porcTimer);
          GI("txtProgreso").value= porcTimer+"%";
         
      //}
      if(bIndicaTermino==0)
        t=setTimeout("timedCount()",5000);//ITERAMOS A LA FUNCION timedCount()
      /*else{
        var objValoresOperProcesadas = JSON.parse("{\"id\":\"qryoTodosLosValoresDeLasOperacionesSinAgrupadarActuales\"}");
        objValoresOperProcesadas.anio = vgAnio;
        objValoresOperProcesadas.mes = vgMes;
        objValoresOperProcesadas.dia = vgDia;
        objValoresOperProcesadas.Interfase = eval(GI("paramInterfaceID").value);
        var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objValoresOperProcesadas);
        makeAjaxRequest(url, "HTML", muestraResultadoFinal, null);      
      }*/
      //else alert("No hay operaciones disponibles")
  }
  function muestraResultadoFinal(obj,result){
       var res = JSON.parse(result)[0];
       alert((res.cont*100)/vgcanttotreg);
       GI("txtProgreso").value= ((res.cont*100)/vgcanttotreg)+"%";
  }      
  function trunc(num, ndec) { 
    var fact = Math.pow(10, ndec); // 10 elevado a ndec 
  
    /* Se desplaza el punto decimal ndec posiciones, 
      se trunca el número y se vuelve a colocar 
      el punto decimal en su sitio. */ 
    return parseInt(num * fact) / fact; 
  } 
  
  
  function recuperarDatosArray(contOperActual,saldoOperAct,tipoOpActual,indice){
     //alert("contOperActual = "+contOperActual);
     calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual);
/*     switch(tipoOpActual){
          case 2: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 3: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 4: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 5: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 6: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 12: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 13: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 14: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 15: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 16: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 22: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 23: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          case 26: calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual); break;
          
    }*/
  }
  
  
 function calculaPorcentaje(contOperActual,saldoOperAct,indice,tipoOpActual){
 var y=0;
   /* if(contOperActual!=vgAuxcontOperActual[indice]){//operar unicamente con las operaciones que acaban de ser procesadas
        for(y=0;y<vgTotOpeAgrup;y++){
          if(vgTipoOperTotal[y]==tipoOpActual){//arreglo de tipos de operacion
            vgAuxcontOperActual[indice]=contOperActual;
            vgTotPorcXtipoOpe[indice]=Math.round(((contOperActual*vgProporcionXtipoOper[y])/vgContOperTotal[indice])+vgTotPorcXtipoOpe[indice],3);
            GI("txt"+tipoOpActual).value=vgTotPorcXtipoOpe[indice]+" %";
            //alert(GI('txtPrc'+(indice+1)).id)
            vgSaldoTot[indice]=saldoOperAct;
            GI("txtSaldo"+tipoOpActual).value=vgSaldoTot[indice];
          }  
        }  
    }
    */
    for(y=0;y<vgTotOpeAgrup;y++){//
      if(vgTipoOperTotal[y]==tipoOpActual){//arreglo de tipos de operacion
          vgTotPorcXtipoOpe[y]=trunc((contOperActual*100)/vgContOperTotal[y],2);
          GI("textTot"+tipoOpActual).value=vgContOperTotal[y];
          GI("textTot"+tipoOpActual).value=formatNumber(GI("textTot"+tipoOpActual).value);
          GI("txt"+tipoOpActual).value=vgTotPorcXtipoOpe[y]+" %";
          GI("txt"+tipoOpActual).value;
          vgSaldoTot[indice]=saldoOperAct;
          GI("txtSaldo"+tipoOpActual).value=vgSaldoTot[y];  
          GI("txtSaldo"+tipoOpActual).value=formatNumber(GI("txtSaldo"+tipoOpActual).value,'$');
          break;
      }
    }
    
 }
 
 function formatNumber(num,prefix){
prefix = prefix || '';
num += '';
var splitStr = num.split('.');
var splitLeft = splitStr[0];
var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : '';
var regx = /(\d+)(\d{3})/;
while (regx.test(splitLeft)) {
splitLeft = splitLeft.replace(regx, '$1' + ',' + '$2');
}
return prefix + splitLeft + splitRight;
}

function unformatNumber(num) {
return num.replace(/([^0-9\.\-])/g,'')*1;
} 

  

 function iniciarArreglosAuxiliaresParaElTimmer(indice){
    for(x=0;x<indice;x++) {
        vgAuxcontOperActual[x] = 0
        vgTotPorcXtipoOpe[x] = 0
        vgSaldoTot[x] = 0
    }
 }


//**********************************************************************FIN**********************************************************************
//***********************************************************************************************************************************************
var arreglo = new Array();

function arreglos(){
 arreglo[25]=4;
 //alert(arreglo[25]);
}
var bIndicaTermino;
function detener(){
  hideWaitLayer();
  stopCount();
  bIndicaTermino=1;
  //iniciarProcesoParaGenerarPorcentajesDeTiempoTranscurrido();
  //consultaArchivo();
  if(GI('txtProgreso').value=='100%'){
    alert("Se ha ejecutado la aplicacion de forma correcta!");
  }else{
  
    alert("Se ha procesado el "+GI('txtProgreso').value+" de la interfase");
  }
  onButtonClickPestania('Tesoreria.Interfaces.PrincipalTAS','');
}

function clickTabla(){}

function verificarDuplicidadArchivoYprocesar(){
  var objTotalTipoOperacionesAgrupadas = JSON.parse("{\"id\":\"qryoTotalTipoOperacionesAgrupadas\"}");
      objTotalTipoOperacionesAgrupadas.anio = vgAnio;
      objTotalTipoOperacionesAgrupadas.mes = vgMes;
      objTotalTipoOperacionesAgrupadas.dia = vgDia;
      objTotalTipoOperacionesAgrupadas.Interfase = eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTotalTipoOperacionesAgrupadas);
      makeAjaxRequest(url, "HTML", verificar, null);
  }
  function verificar(obj,result){
       var res = JSON.parse(result)[0];
       var TotOpeAgrup = res.totOperAgr;//NUMERO TOTAL DE registros con Operaciones  ya agrupadas y con saldo total, variable global
       if(TotOpeAgrup==0){
            vgDisplay="ARCHIVO SUBIDO CORRECTAMENTE"
            GI("frameUpload").style.visibility="visible";
       }     
       else {
            vgDisplay="EXISTEN OPERACIONES SIN PROCESAR"
        //SA(GI("btnEliminar"),"enabled","true");
        GI("frameUpload").style.visibility="hidden";

          //se verifica si existen registros pendientes por aplicar
        var objTotalTipoOperacionesAgrupadasPendientes = JSON.parse("{\"id\":\"qryoTotalTipoOperacionesAgrupadasSinProcesar\"}");
        objTotalTipoOperacionesAgrupadasPendientes.anio = vgAnio;
        objTotalTipoOperacionesAgrupadasPendientes.mes = vgMes;
        objTotalTipoOperacionesAgrupadasPendientes.dia = vgDia;
        objTotalTipoOperacionesAgrupadasPendientes.Interfase = eval(GI("paramInterfaceID").value);
        var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTotalTipoOperacionesAgrupadasPendientes);
        makeAjaxRequest(url, "HTML", verificarPendientes, null);          
      }
  }

  function verificarPendientes(obj,result){
       var res = JSON.parse(result)[0];
       var TotOpeAgrup = res.totOperAgr;//NUMERO TOTAL DE registros con Operaciones  ya agrupadas y con saldo total, variable global
       if(TotOpeAgrup!=0){
            fileUploaded();
       }     
       else
            alert("Este archivo ya ha sido procesado, elija otra fecha");
  }  
  
  
  function procesoEliminar(){
    if(GI("paramFecha").value=="" ||
    !(eval(GI("paramInterfaceID").value)==1||
    eval(GI("paramInterfaceID").value)==2||
    eval(GI("paramInterfaceID").value)==3||
    eval(GI("paramInterfaceID").value)==4)){  
      alert("Debe seleccionar la Fecha y la Interfase");
    }
    else{
  //se verifica si existen registros pendientes por aplicar
        var objTotalTipoOperacionesAgrupadasPendientes = JSON.parse("{\"id\":\"qryoTotalTipoOperacionesAgrupadasConProcesar\"}");
        objTotalTipoOperacionesAgrupadasPendientes.anio = vgAnio;
        objTotalTipoOperacionesAgrupadasPendientes.mes = vgMes;
        objTotalTipoOperacionesAgrupadasPendientes.dia = vgDia;
        objTotalTipoOperacionesAgrupadasPendientes.Interfase = eval(GI("paramInterfaceID").value);
        var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objTotalTipoOperacionesAgrupadasPendientes);
        makeAjaxRequest(url, "HTML", verificarPendientesAntesDeEliminar, null);
    }    
  }
  
  function verificarPendientesAntesDeEliminar(obj,result){
       var res = JSON.parse(result)[0];
       var TotOpeAgrup = res.totOperAgr;//NUMERO TOTAL DE registros con Operaciones  ya agrupadas y con saldo total, variable global
       if(TotOpeAgrup==0){
            eliminar();
       }else{
            alert("No se puede eliminar debido a que existen movimientos pendientes");
      }
  }  
  
  
  function eliminar(){
      var objqryEliminarRegistros = JSON.parse("{\"id\":\"qryEliminarRegistros\"}");
      objqryEliminarRegistros.anio = vgAnio;
      objqryEliminarRegistros.mes = vgMes;
      objqryEliminarRegistros.dia = vgDia;
      objqryEliminarRegistros.Interfase=eval(GI("paramInterfaceID").value);
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objqryEliminarRegistros);
        makeAjaxRequest(url, "HTML", eliminandoOpertran, null);
  }
  
  function eliminandoOpertran(obj,result){
      resultado = JSON.parse(result)[0]
      alert("Eliminación efectuada correctamente");

  }

function consultaArchivo(){
    if(GI("paramFecha").value=="" ||
    !(eval(GI("paramInterfaceID").value)==1||
    eval(GI("paramInterfaceID").value)==2||
    eval(GI("paramInterfaceID").value)==3||
    eval(GI("paramInterfaceID").value)==4)){  
      alert("Debe seleccionar la Fecha y la Interfase");
    }
    else{
      GI("paramAnio").value = vgAnio;
      GI("paramMes").value = vgMes;
      GI("paramDia").value = vgDia;
      GI("paramInterfase").value = eval(iInterfase);    
      var botonTemp = GI("btnConsultaArchivo");
      SA(botonTemp,"ref","qryConsultaTransferencia");
      SA(botonTemp,"fun","loadTableElement");
      SA(botonTemp,"tabla","tblTransferenciaPri");
      consultar(botonTemp, GI("frmTas"), false);    
      /*var urlCliente = "modules/Tesoreria/Interfaces/PrincipalTransferencia.do";
      makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoFReporte, null);
      loadDynamicJS(ctxRoot + "/modules/Tesoreria/Interfaces/PrincipalTransferencia.js");*/
    }
}

function despliegaPantallaMantenimientoFReporte(obj, result) {
  GI("dvPantalla").innerHTML = result;
  //GI("dvContenido").innerHTML = result;

    GI("paramAnio").value = vgAnio;
    GI("paramMes").value = vgMes;
    GI("paramDia").value = vgDia;
    GI("paramInterfase").value = eval(iInterfase);
    GI("paramFecha").value = fecha2;
}

function ejecutaResultadoTransferencia(){
var interfase;
  if(GI("paramFecha").value=="" ||
  !(eval(GI("paramInterfaceID").value)==1||
  eval(GI("paramInterfaceID").value)==2||
  eval(GI("paramInterfaceID").value)==3||
  eval(GI("paramInterfaceID").value)==4)){  
    alert("Debe seleccionar la Fecha y la Interfase");
  }
  else
  {
      showWaitLayer();
      fncValidaTransferencia.tipoId = 1;
      fncValidaTransferencia.Archivo = "ERROR_TAS_"+fecha[2]+fecha[1]+fecha[0];
      fncValidaTransferencia.colData = "arpDescripcion";
      
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(fncValidaTransferencia);
      makeAjaxRequest(url, "HTML", sugerirNombreArchivo, null);     
  }
}

function sugerirNombreArchivo(obj , result){
  var resultado = JSON.parse(result)[0];
    delete fncValidaTransferencia.id;
    fncValidaTransferencia.queryId = "conArcPlaTAS";
    fncValidaTransferencia.fileName = "ERROR_TAS_"+fecha[2]+fecha[1]+fecha[0]+".txt";
    var url = ctxRoot + "/generarArchivoInterfase.do?json=" + JSON.stringify(fncValidaTransferencia);
    var liga = GI("ligaArchivo");
    liga.href = url;
    liga.click();
    alert("Proceso concluido satisfactoriamente!");
    onButtonClickPestania('Tesoreria.Interfaces.PrincipalTAS','');
    hideWaitLayer();
}

function Limpiar()
{
  GI("paramFecha").value="";
  GI("slcReportes").value=-1;
  GI("paramAnio").value = 0;
  GI("paramMes").value = 0;
  GI("paramDia").value = 0;
  GI("paramInterfase").value = 0;    
  var botonTemp = GI("btnConsultaArchivo");
  SA(botonTemp,"ref","qryConsultaTransferencia");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblTransferenciaPri");
  consultar(botonTemp, GI("frmTas"), false);   
  onButtonClickPestania('Tesoreria.Interfaces.PrincipalTAS','');
}