showWaitLayer();

var regresaFechaContable = JSON.parse("{\"id\":\"devuelveFechaContable\"}");

var tablaInterfasesSICAData = new Array();
tablaInterfasesSICAData[0] = "assNumCtam,82";
tablaInterfasesSICAData[1] = "assNumScta,55";
tablaInterfasesSICAData[2] = "assNumSscta,60";
tablaInterfasesSICAData[3] = "assNumSsscta,63";
tablaInterfasesSICAData[4] = "saldoInicial,115";////////Tiene que ser estático en ceros
tablaInterfasesSICAData[5] = "assCargos,125";
tablaInterfasesSICAData[6] = "assAbonos,130";
tablaInterfasesSICAData[7] = "assEnte,120";
tablaInterfasesSICAData[8] = "assSalFinal,120";

var fvPrincipalSICA = new FormValidator();

//Variables para la fecha conciliar
var Ano=null;
var Mes=null;
var Dia=null;
var isValidar=null;
var fechaConciliar = new Date();

//Agregando la funcionalidad del required
fvPrincipalSICA.setup({
  formName      : "frmPrincipalInterfaseSICA",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

Calendar.setup({
  inputField     :    "txtFechaConciliar",   // id of the input field
  button         :    "txtFechaConciliar",
  ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
  showsTime      :    false,
  timeFormat     :    "24",
  onUpdate       :    setFechaCal,
  disableFunc    :    isValidDate,
  date           :    fechaConciliar,
  weekNumbers    :    false,
  cache          :    true,
  step           :    1
});


var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(regresaFechaContable);
makeAjaxRequest(url, "HTML", vaciaFechaConciliar, null);

/////////////////////////////////////////////////////////////////////////////
//Función para cargar la pantalla principal
function cargaPrincipalInterfaseSICA() {
  onButtonClick("Contabilidad.InterfaseSICA.PrincipalInterfaseSICA","");
}

/////////////////////////////////////////////////////////////////////////////
//Funnción para colocar la Fecha Contable en las cajas de texto destinadas para ello
function vaciaFechaConciliar(obj, result) {
  var objResult = JSON.parse(result);
  
  Dia=objResult[0].fcoDiaApliConta;
  Mes=objResult[0].fcoMesApliConta;
  Ano=objResult[0].fcoAnoApliConta;
  
  //Vaciar datos en Fecha a Conciliar
  GI("txtFechaConciliar").value=objResult[0].fcoDiaApliConta+"/"+objResult[0].fcoMesApliConta+"/"+objResult[0].fcoAnoApliConta;
  
  formsLoaded();
}

/////////////////////////////////////////////////////////////////////////////
//Funcion que se ejecuta cuando se da click en el botón validar o transferir
function botonValidarTransferir(isValidarLocal) {
  isValidar=isValidarLocal;
  
  //Para ambas (Validar y Transferencia)
  var objParametros = JSON.parse("{\"id\":\"funcionInterfaseInvocaSICA\"}");
  eval("objParametros.Fecha='" + GI("txtFechaConciliar").value +"'");
  eval("objParametros.Usuario=300");
  
  if(isValidar) //Ejecuta lo referente a Validar
    eval("objParametros.Opcion=2");
  else //Ejecuta lo referente a Transferencia
    eval("objParametros.Opcion=3");
  
  showWaitLayer();
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
  makeAjaxRequest(url, "HTML", respuestaFuncionInterfaseSICA, null);
}

function respuestaFuncionInterfaseSICA(obj, result){
  var res=JSON.parse(result).resultado;
    
  if(res==-1)
    alert("Ocurrió un error");
  else if(res==0 && isValidar) //Si el proceso fue satisfactorio y fue Validar
    consultaX();
  else  //Si el proceso fue satisfactorio y fue Transferencia
  {
    SA(GI("tablaInterfasesSICA"), "keys", "assNumCtam");
    consultar(GI("hdInterfasesSICA"), GI('frmPrincipalInterfaseSICA'), false);
  }
  
  hideWaitLayer();
}


//Llenar la tabla con datos de Validar
function consultaX(){
  var objConsultaPrincipalParam = JSON.parse("{\"id\":\"ejeFunDevuelveInfo\"}");
  objConsultaPrincipalParam.Tipo = 2;
  objConsultaPrincipalParam.Fideicomiso = 0;
  objConsultaPrincipalParam.Ano = Ano;
  objConsultaPrincipalParam.Mes = Mes;
  objConsultaPrincipalParam.Opcion = 0;
  var urlX = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objConsultaPrincipalParam);
  makeAjaxRequest(urlX, "HTML", cargaTablaPrincipal, GI("tablaInterfasesSICA"));
}

function cargaTablaPrincipal(objTabla, result){
  //var resultado = JSON.parse(result)[0];
  var resultado=JSON.parse(result).resultado;
  alert(resultado);
  if(isDefinedAndNotNull(resultado)){
    resultado = resultado.substring(1,resultado.length);
    var auxArreglo = new Array;
    var arrDatos = resultado.split(";");
    for(i=0; i < arrDatos.length; i++){
      auxArreglo[i] = new Object();
      auxArreglo[i].assNumCtam = eval(arrDatos[i].split("-")[1]);
      auxArreglo[i].assNumScta = eval(arrDatos[i].split("-")[2]);
      auxArreglo[i].assNumSscta = eval(arrDatos[i].split("-")[3]);
      auxArreglo[i].sicSalInicial = eval(arrDatos[i].split("-")[0]);
      auxArreglo[i].assCargos = arrDatos[i].split("-")[9];
      auxArreglo[i].assAbonos = eval(arrDatos[i].split("-")[10]);
      auxArreglo[i].assEnte = eval(arrDatos[i].split("-")[8]);
      auxArreglo[i].assSalFinal = eval(arrDatos[i].split("-")[11]);
    }
    SA(GI("tablaInterfasesSICA"), "keys", "assNumCtam");
    loadTable(objTabla, auxArreglo, tablaInterfasesSICAData, GA(objTabla, "keys"), GA(objTabla, "fun"), true);
  }else
    alert("Error al cargar la Validación");
  hideWaitLayer();
}


/////////////////////////////////////////////////////////////////////////////
//Funcion para direccionar al mantenimiento
function botonMantenimiento() {
  loadDynamicJS (ctxRoot + "/modules/Contabilidad/InterfaseSICA/PrincipalMantenimientoInterfasesSICA.js");
}

/////////////////////////////////////////////////////////////////////////////
//Funciones para integrar la funcionalidad de la fecha
function setFechaCal()
{}

function isValidDate(date)
{
  var today = new Date();
  if(date>today)
    return true;
  else
    return false;
}

/////////////////////////////////////////////////////////////////////////////
//Funcion para recuperar dd/mm/yyyy cuando se elige del calendario
function descomponeFechaConciliar(objOriginal)
{
  var fecha=objOriginal.value;
  fecha=fecha.toString();
  fecha=fecha.split("/");
  
  Dia=fecha[0];
  Mes=fecha[1];
  Ano=fecha[2];
}


