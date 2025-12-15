var catfBienesgar = new Catalogo("mx.com.inscitech.fiducia.domain.FBienesgar");
catfBienesgar.dateFormat = "dd/MM/YYYY";

//VARIABLES QUE CONTROLAN EL EVENTO DEL BOTON ACEPTAR DE LA PANTALLA PRINCIPAL

var OP_REGISTRO = 1;
var OP_REVALUACION = 3;
var OP_MODIFICAR = 2;
var OP_SALIDA = 5;
var OP_CONSULTAR = 4;
var OP_IMAGENES = 6;

var pkInfo = null;

var modo;

var usarSetValuesFormObject=false;
var parametroComboProducto;

var cmbInstrumentoParam = JSON.parse("{\"llaveClaveSec\":-1}");

var fechas = new Date();

var strIdPK = "fgrsIdFideicomiso,fgrsIdSubcuenta,forsIdGarantia";
var arrIdPK = strIdPK.split(",");

var clavesCombo38 = JSON.parse("{\"llaveClave\":38}");
var clavesCombo70b = JSON.parse("{\"chido\":70}");
var clavesCombo72 = JSON.parse("{\"llaveClave\":72}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo53 = JSON.parse("{\"llaveClave\":53}");
var clavesCombo71 = JSON.parse("{\"llaveClave\":71}");
var fechaActual = JSON.parse("{\"id\":\"regresaFechaActual\"}");

parametroComboProducto = JSON.parse("{\"llaveClave\":71}");

var clavesComboClasifBienFideicom;

initForms();

var tablaBienesGarData = new Array();
tablaBienesGarData[0] = "fgrsIdFideicomiso,110px";
tablaBienesGarData[1] = "fgrsIdSubcuenta,110px";
tablaBienesGarData[2] = "forsIdGarantia,110px";
tablaBienesGarData[3] = "forsCveTipoGarantia,110px";
tablaBienesGarData[4] = "forsCveTipoBien,110px";
tablaBienesGarData[5] = "forsImpUltValua,110px";
tablaBienesGarData[6] = "forsCveStatus,110px";

var vgContenedorDatos;

function clickTabla(pk){
  cloneObject(pk,catfBienesgar.getCatalogo());
  pkInfo = pk;
  
}

var fvcatfBienesgar = new FormValidator();



// FUNCIONES QUE CARGAN LA PANTALLA DE MANTENIMIENTO 

fvcatfBienesgar.setup({
  formName      : "frmMantenimientoBienesGar",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function cargaMantenimientoBienesGar(Modo){
    modo = Modo;
    if((isDefinedAndNotNull(pkInfo) || modo == OP_REGISTRO)){//&& Modo != OPER_BAJA
        var objVerRxisteGarantia = JSON.parse("{\"id\":\"verExisteGarantia\"}");
        var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objVerRxisteGarantia);
        makeAjaxRequest(url, "HTML", verificarYdesplegarMantenimiento, null);
    }
    else
        alert("No a has seleccionado campo alguno de la tabla");
}

function verificarYdesplegarMantenimiento(obj,result){
   var resultado = JSON.parse(result)[0];
   if(resultado.verifyExistFile==0)
        alert("No se ha encontrado ninguna garantia dada de alta");
   else{
        var urlCliente = "modules/Garantias/BienesGar/MantenimientoBienesGar.do";
        makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoBienesGar, null);
   }
}

function despliegaPantallaMantenimientoBienesGar(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  fvcatfBienesgar.setup({
    formName      : "frmMantenimientoBienesGar",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });

      // DEFINICION DE LOS CAMPOS DE TEXTOS PARA SER CONVERTIDOS EN FECHAS --------------------------------
        
  Calendar.setup({
    inputField     :    "forsFecVencimiento",   // id of the input field
    button         :    "forsFecVencimiento",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  Calendar.setup({
    inputField     :    "forsFecUltValua",   // id of the input field
    button         :    "forsFecUltValua",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDate,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
  /*Calendar.setup({
    inputField     :    "fbifFecFin",   // id of the input field
    button         :    "fbifFecFin",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });*/
  
  Calendar.setup({
    inputField     :    "txtFecha",   // id of the input field
    button         :    "txtFecha",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    onUpdate       :    setFechaCal,
    disableFunc    :    isValidDateAll,
    date           :    fechas,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
  });
  
 muestraFechaActual(); 
  // FIN DE LA DEFINICION DE FECHAS -------------------------------------------------------------------
 
 if(modo != OP_CONSULTAR){
      muestraObjs("cmdAceptar,cmdCancelar");
 }
 else  {
      SA(GI("cmdCancelar"),"value","Regresar");
      muestraObjs("cmdCancelar");
 }
    
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalBienesFideicomitidos();
  hideWaitLayer();
}

function cargaPrincipalBienesFideicomitidos() {
  onButtonClickPestania("Garantias.BienesGar.PrincipalBienesGar","");
  hideWaitLayer();
}

function loadCatalogo(){
  //alert(modo);
  catfBienesgar.setOnUpdate(catLoaded);
  if(modo!=OP_REGISTRO){//SI NO ES UN REGISTRO NUEVO
        catfBienesgar.buscaCatalogoPK(false);// MANDAR LLAMAR EL MAPEO CORRESPONDIENTE CON CADA CAMPO
        if(modo==OP_MODIFICAR){//SI ES UNA MODIFICACION, CIERTOS CAMPOS DEBEN ESTAR BLOQUEADOS
              //alert(modo);
              SA(GI("fbifImpBien"),"disabled","true");
              SA(GI("fbifMoneda"),"disabled","true");
              SA(GI("fbifImpMoneda"),"disabled","true");
              SA(GI("fbifImpUltValua"),"disabled","true");
              SA(GI("fbifFecFin"),"disabled","true");
              SA(GI("fbifFecUltValua"),"disabled","true");
              SA(GI("fbifStBien"),"disabled","true");
              
              deshabilitaPK(arrIdPK);// BLOQUEAR LOS CAMPOS DE LLAVE PRIMARIA PERTENECIENTES A LA TABLA F_BIENES
        }
        else if(modo==OP_REVALUACION){
              SA(GI("fgrsIdFideicomiso"),"disabled","true");
              SA(GI("fgrsIdSubcuenta"),"disabled","true");
              SA(GI("forsIdGarantia"),"disabled","true");
              SA(GI("forsCveTipoGarantia"),"disabled","true");
              SA(GI("forsCveTipoBien"),"disabled","true");
              SA(GI("forsIdentificacion"),"disabled","true");
              SA(GI("forsImpBien"),"disabled","true");
              SA(GI("forsMoneda"),"disabled","true");
              SA(GI("forsTextoDescrip"),"disabled","true");
              SA(GI("forsTexComentario"),"disabled","true");
              SA(GI("forsCveStatus"),"disabled","true");
              SA(GI("forsFecVencimiento"),"disabled","true");
              SA(GI("forsCveRevaluaChk"),"disabled","true");
              SA(GI("forsCvePerValua"),"disabled","true");
              SA(GI("forsNumEscritura"),"disabled","true");
              SA(GI("forsNumNotario"),"disabled","true");
              SA(GI("forsImpUltValua"),"disabled","true");
              SA(GI("forsFecUltValua"),"disabled","true");

              
        }
        else {//PARA SALIDA y CONSULTAR TODO EL FORMULARIO DEBE DE ESTAR BLOQUEADO
              //alert(modo)
              deshabilitaObjetos(GI("frmMantenimientoBienesGar"));
        }
        
  }
  else  {// SI ES REGISTRO
        GI("forsCveRevaluaChk").value="off"
        //SA(GI("fbifImpBien"),"disabled","true");
              //SA(GI("fbifMoneda"),"disabled","true");
             // SA(GI("fbifImpMoneda"),"disabled","true");
              SA(GI("forsImpUltValua"),"disabled","true");
              SA(GI("forsFecUltValua"),"disabled","true");
              /*SA(GI("fbifFecUltValua"),"disabled","true");
              SA(GI("fbifStBien"),"disabled","true");
        GI("fbifMoneda").selectedIndex = "MONEDANACIONAL";
        GI("fbifStBien").selectedIndex = "ACTIVO";
        GI("fbifStBien").selectedIndex = 1;*/
        
  }
        
}

function asignaFec(){
 if(modo==OP_REGISTRO)
    GI("fbifFecUltValua").value=GI("fbifFecInicio").value

}

function catLoaded(){
  //deshabilitaObjetos(GI("frmMantenimientoBienesGar"));
  //cargaParamComboProducto(GI("fbifIdTipoBien"),true);
  if(modo==OP_REVALUACION){
        muestraObj("importeRevaluacion");
        muestraObj("txtImporteRevaluacion");
        muestraObj("divFecha");
        muestraObj("txtFecha");
        
      }
  else if(modo==OP_CONSULTAR){
        muestraObj("tipoCambio");
        muestraObj("fbifTipoCambio");
  }
  cargaParamComboEstado(GI("forsCveTipoGarantia"),true);
  cargaParamComboEstadoP(GI("paramCveTipoGar"),true);//paramTipoBienFideicomitido
  formsLoaded();
}

//_______________________________________________________________________________________

// FUNCIONES QUE SE ENCARGAN DE LA GESTION DE LAS FECHAS


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


function isValidDateAll(date)
{
  return false;
}

//------------------------------------------------------------------------


//FUNCIONES GENERICAS DE ESTE JAVASCRPT-----------------------------


function AltaOModificaInfo() {
  catfBienesgar.setOnUpdate(operacionExitosa);
  if(modo==OP_REGISTRO && fvcatfBienesgar.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catfBienesgar.altaCatalogo();
    //actualizaImporte()
  }
  else if(modo==OP_MODIFICAR && fvcatfBienesgar.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catfBienesgar.modificaCatalogo();
    actualizaImporte()
  }
}

function actualizaImporte() {
    vgContenedorDatos=JSON.parse("{\"id\":\"ejemanttogarantias\"}");
    vgContenedorDatos.Opcion=eval(1);
    vgContenedorDatos.Fideicomiso=eval(GI("fgrsIdFideicomiso").value);
    vgContenedorDatos.Subfiso=eval(GI("fgrsIdSubcuenta").value);
    vgContenedorDatos.Garantia=eval(GI("forsIdGarantia").value);
    vgContenedorDatos.TipoGar=eval(GI("forsCveTipoGarantia").value);
    vgContenedorDatos.TipoBien=eval(GI("forsCveTipoBien").value);
    vgContenedorDatos.Importe=GI("forsImpBien").value;
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(vgContenedorDatos);//executeRef
    alert(url);
    makeAjaxRequest(url, "HTML", resultadoMantenimiento, null);      
}

function resultadoMantenimiento(objTabla, result) {
    alert(result);
    var resultado =JSON.parse(result).result;
}

//CARGA LOS COMBOS DE LA PANTALLA PRINCIPAL

  function cargaParamComboEstado(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  //alert(""+objCombo.value);
  parametroComboEstado = JSON.parse("{\"llaveClave\": \"" +objCombo.value + "\"}");
  SA(GI("forsCveTipoBien"),"next","asignaEstado");
  loadElement(GI("forsCveTipoBien"));
}

function asignaEstado(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catfBienesgar.getCatalogo());
  else
    GI("forsCveTipoBien").selectedIndex=0;
  
  formsLoaded();
}



function cargaParamComboEstadoP(objCombo,parametro2){
  usarSetValuesFormObject=parametro2;
  //alert(""+objCombo.value);
  parametroComboEstado = JSON.parse("{\"llaveClave\": \"" +objCombo.value + "\"}");
  SA(GI("paramCveTipoBien"),"next","asignaEstadoP");//paramClasFide
  loadElement(GI("paramCveTipoBien"))//paramClasFide
}

function asignaEstadoP(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catfBienesgar.getCatalogo());
  else
    GI("paramCveTipoBien").selectedIndex=0;//paramClasFide
  
  formsLoaded();
}
  
  
  
  
function siCambiaLaMoneda(){
    var numOperacion = GI("fbifMoneda").value;
    var tipoOperacion = eval(numOperacion);
    if(tipoOperacion!=1){
      muestraObj("tipoCambio");
      muestraObj("fbifTipoCambio");
    }
    else {
      ocultaObj("tipoCambio");
      ocultaObj("fbifTipoCambio");
    }
}



function actualizaComboBien() {
cargaParamComboProducto(GI("fbifIdTipoBien"),false);
}


function asignaProducto(){
  if(usarSetValuesFormObject)
    setValuesFormObject(catfBienesgar.getCatalogo());
  /*else
   alert("hola");
    GI("fbifIdCveBien").selectedIndex=0;*/
  
  formsLoaded();
}

function ejecutaFuncionParaSalidaDelBien() {
    if(confirm("Desea confirmar el procesamiento de datos?"))
     {   
      ejecutaFuncion();
    }
    else
    {
       if(modo==OP_SALIDA)
          onButtonClickPestania("Garantias.BienesFideicomitidos.PrincipalBienesFideicomitidos","");
    }   
}

function ejecutaFuncion(){
    var mesHab=null;
    if(fvcatfBienesgar.checkForm()){
    var objCargaBienesGarParam = JSON.parse("{\"id\":\"funRegistroBienesGar\"}");
    objCargaBienesGarParam.TipoOperecion=eval(modo); 
    objCargaBienesGarParam.Fideicomiso=eval(GI("fgrsIdFideicomiso").value);  
    objCargaBienesGarParam.Subfiso=eval(GI("fgrsIdSubcuenta").value);
    objCargaBienesGarParam.IdGarantia=eval(GI("forsIdGarantia").value);
    objCargaBienesGarParam.ClaveGar=eval(GI("forsCveTipoGarantia").value); 
    objCargaBienesGarParam.TipoBien=eval(GI("forsCveTipoBien").value);
    //objCargaBienesGarParam.TipoBien2=GI("fbifIdBien").value; 
    objCargaBienesGarParam.Identificacion=GI("forsIdentificacion").value;
    objCargaBienesGarParam.DescBien=GI("forsTextoDescrip").value; 
    objCargaBienesGarParam.Comentario=GI("forsTexComentario").value;  
    objCargaBienesGarParam.Importe=""+GI("forsImpBien").value;  
    objCargaBienesGarParam.Moneda=eval(GI("forsMoneda").value);
    if(GI("forsCveRevaluaChk").value=="on")
        objCargaBienesGarParam.CveRevalua=1;
    else
        objCargaBienesGarParam.CveRevalua=0;
    objCargaBienesGarParam.PerValuacion=GI("forsCvePerValua").value;// 
    objCargaBienesGarParam.ImpUltValua=GI("forsImpUltValua").value;  
    objCargaBienesGarParam.FechaUltimo=GI("forsFecUltValua").value;
    objCargaBienesGarParam.FechaVenc=GI("forsFecVencimiento").value;  
    //objCargaBienesGarParam.FechaFin=GI("forsFecUltValua").value; 
    objCargaBienesGarParam.NumEscritura=GI("forsNumEscritura").value;  
    objCargaBienesGarParam.NumNotario=GI("forsNumNotario").value;
    objCargaBienesGarParam.Valuacion=eval(GI("txtImporteRevaluacion").value); 
    objCargaBienesGarParam.FecValuacion=GI("txtFecha").value; 
    objCargaBienesGarParam.Gusuario=eval(GI("paramUsuario").value);
    if(GI("paramMesAbierto").value=="SI")
       var mesHab = 1;
    else
          mesHab = 0;
    objCargaBienesGarParam.GlMesa = mesHab;
        var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objCargaBienesGarParam);
        alert(url);
        makeAjaxRequest(url, "HTML", validaCargaFideicomitidos, null);
   }
}

function validaCargaFideicomitidos(obj, result){
  //alert(result);
  var resultado = JSON.parse(result);
  if(resultado == 1 ) {
    alert("Ocurrió un error inesperado");
  }
  else if(resultado == 2 )
  {
    alert("No existe Operación Contable");
  }
  else
  {
    alert("Proceso correcto");
    onButtonClickPestania("Garantias.BienesGar.PrincipalBienesGar","");
  }
 
 hideWaitLayer();
}


function muestraFechaActual() {
  //fechaActual.tipoFecha="CONTABLE";
  var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(fechaActual);
  makeAjaxRequest(url, "HTML", insertaFechaActual, null);
}

function insertaFechaActual(obj, result) {
  var objResult = JSON.parse(result);
  
  GI("fcoDiaDia").value=objResult[0].fcoDiaDia;
  GI("fcoMesDia").value=objResult[0].fcoMesDia;
  GI("fcoAnoDia").value=objResult[0].fcoAnoDia;
  
  GI("forsFecUltValua").value = formatString(GI("fcoDiaDia").value,"0",2,"Izquierda") + "/" + formatString(GI("fcoMesDia").value,"0",2,"Izquierda") + "/" + GI("fcoAnoDia").value;
}


function muestraValor(obj){
  if(obj.checked){
    obj.value="on";
    }
  else{ obj.value="off";}
}

