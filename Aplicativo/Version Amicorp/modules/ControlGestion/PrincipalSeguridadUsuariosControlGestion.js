var catUsuarios = new Catalogo("mx.com.inscitech.fiducia.domain.Usuarios");
catUsuarios.dateFormat = "dd/MM/YYYY";

catUsuarios
showWaitLayer();
var clavesMayor = JSON.parse("{\"mayor2000\":2000,\"orderPuesto\":\"s\"}");
//var clavesMayor = JSON.parse("{\"mayor2000\":2000}");
var paramPerfil = JSON.parse("{\"orderPerfil\":\"s\"}");
var paramPuesto = JSON.parse("{\"orderPuesto\":\"s\"}");
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo30 = JSON.parse("{\"llaveClave\":30}");

var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaRegistroUsuarios\",\"numUsuario\":0}");

var recibeContra = JSON.parse("{\"id\":\"contraDefault\"}");

initForms();

var tablaDatosUsuariosData = new Array();
tablaDatosUsuariosData[0] = "usuNumUsuario,50px";
tablaDatosUsuariosData[1] = "perNomUsuario,200px";
tablaDatosUsuariosData[2] = "usuNomUsuario,100px";
tablaDatosUsuariosData[3] = "usuNomPuesto,200px";
tablaDatosUsuariosData[4] = "usuCveStUsuario,80px";

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var fvMantenimientoUsuarios = new FormValidator();
var CONSULTAR = 3;

function cargaPrincipalSeguridadUsuariosControlGestion() {
  onButtonClickPestania("ControlGestion.PrincipalSeguridadUsuariosControlGestion","");
  hideWaitLayer();
}

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catUsuarios.getCatalogo());
}

////////////////////////////////////////////////////////////////////
//CARGA LA SEGUNDA PANTALLA (MantenimientoSeguridadUsuariosControlGestion)
function cargaMantenimientoSeguridadUsuariosControlGestion(tipoPantalla) {
  if ((tipoPantalla==OPER_MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/ControlGestion/MantenimientoSeguridadUsuariosControlGestion.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantalla, null);
  }
}

function despliegaPantalla(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoUsuarios.setup({
    formName      : "frmMantenimientoSeguridadUsuariosControlGestion",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
}

function loadCatalogo() {
  catUsuarios.setOnUpdate(catLoaded);
  if(operacion==OPER_MODIFICAR || operacion==CONSULTAR){
    catUsuarios.buscaCatalogoPK(false);
    //SA(GI("usuNumUsuario"),"ref","muestraDatosPersonalOrdenado");
    //loadElement(GI("usuNumUsuario"));
  }
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    
       // SA(GI("usuNumUsuario"),"ref","muestraDatosPersonalOrdenadoSinUsuarios");
        //loadElement(GI("usuNumUsuario"));
   funRecibeContra();
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==OPER_MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    deshabilitaPK("usuNumUsuario".split(","));
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmMantenimientoSeguridadUsuariosControlGestion"));         //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  //cargaRadiosConMaster("usuPtceGpot","usuPtceGpot2");
  
  formsLoaded();
}

function AltaOModificaInfo() {
   
  if(operacion==OPER_ALTA && fvMantenimientoUsuarios.checkForm())//Se trata de una alta
  {
    showWaitLayer();    
    manttoCatalogo(1);
    
    deshabilitaPK("usuNumUsuario".split(","));
    
  }
  else if(operacion==OPER_MODIFICAR && fvMantenimientoUsuarios.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    funRecibeContra();
    manttoCatalogo(2);
  }
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalSeguridadUsuariosControlGestion();
  hideWaitLayer();
}

//Verificar que el registro aún no exista
function verificaExistenciaRegistro() {
  if(operacion==OPER_ALTA && GI("usuNumUsuario").value != -1)
  {
    showWaitLayer();
//    deshabilitaPK("usuTipoUsuario".split(","));
    validacionAlta.numUsuario = GI("usuNumUsuario").value;
    
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificacionAlta, null);
  }
}

function verificacionAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    alert("La Persona ya es un Usuario, verifique");
    GI("usuNumUsuario").value=-1;
  }
  hideWaitLayer();
}

function funRecibeContra() {
  
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(recibeContra);
       
    makeAjaxRequest(url, "HTML", funRecibeContra2, null);
 
}

function funRecibeContra2(obj, result) {
  var resu = JSON.parse(result);  
    GI("usuPassword").value=resu[0].pasDef; 
}





/////////////////////////////////////////////////////////////////////////////
//La eliminación de un registro de Usuario implica la eliminación de registros en otras tablas
function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
    realizarDeletes();
}

function realizarDeletes(){
    var numUsuario = pkInfo.usuNumUsuario;
    var objDeleteParam = JSON.parse("{\"id\":\"delDato\",\"NumUsuario\":" + numUsuario + "}");
    
    showWaitLayer();
    for(var i=0; i<7; i++)
    {
      objDeleteParam.id = eval("'delDato" + i + "'");
      var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(objDeleteParam);
      makeAjaxRequest(url, "HTML", verificaEliminacionesUsuarios, i + "== 6");
    }
}

function verificaEliminacionesUsuarios(obj, result) {
  if(eval(obj)) {
    manttoCatalogo(3);
  }
}

/////////////////////////////////////////////////////////////////////////////
//Obtiene el Nombre del Puesto a partir del Número del mismo
function obtieneNomPuesto(objCmbNumPuesto) {
  if(objCmbNumPuesto.value == -1)
    GI("usuNomPuesto").value = "";
  else
    GI("usuNomPuesto").value = objCmbNumPuesto.options[objCmbNumPuesto.selectedIndex].text;
    
//alert(GI("usuNomPuesto").value);
}

function convertirMayusculas( objeto ) {
   var strMayusculas = objeto.value;
   objeto.value = strMayusculas.toUpperCase();
   }
   
   
   
function asignaToken() {
   var token;
   //alert(GI("usuNumPuesto").value);
   if(GI("usuNumPuesto").value==3000 || GI("usuNumPuesto").value==3002 || GI("usuNumPuesto").value==3005)
      Token=0; 
    else
      Token=1;  
      
  GI("usuToken").value=Token;
  }
   
   


//SECCION PARA DAR MANTTO A LOS CATALOGOS MANUALMENTE
/*Opciones
1 Alta
2 Modificacion
3 Baja
*/
var vgContenedorDatos=null;
function manttoCatalogo(opcion){      
    vgContenedorDatos=JSON.parse("{\"id\":\"ejemanttousuarios\"}");
    var USU_NUM_USUARIO  = 0
    var USU_NOM_USUARIO  = ''
    var USU_TIPO_USUARIO  = ''
    var USU_NUM_PUESTO  = 0
    var USU_NOM_PUESTO  = ''
    var USU_PASSWORD  = ''
    var USU_CVE_ST_USUARIO  = ''
     
     if(opcion!=3)
     {
       USU_NUM_USUARIO  = GI("usuNumUsuario").value  
       USU_NOM_USUARIO  = GI("usuNomUsuario").value  
       USU_TIPO_USUARIO  = GI("usuTipoUsuario").value  
       USU_NUM_PUESTO  = GI("usuNumPuesto").value 
       USU_NOM_PUESTO  = GI("usuNomPuesto").value
       USU_PASSWORD  = GI("usuPassword").value  
       USU_CVE_ST_USUARIO  = GI("usuCveStUsuario").value       
     }
     else
     {
       USU_NUM_USUARIO = pkInfo.usuNumUsuario;
     }
          vgContenedorDatos.Opcion=eval(opcion);
          vgContenedorDatos.usunumusuario = eval(USU_NUM_USUARIO)
          vgContenedorDatos.usunomusuario = USU_NOM_USUARIO
          vgContenedorDatos.usutipousuario = USU_TIPO_USUARIO
          vgContenedorDatos.usunumpuesto = eval(USU_NUM_PUESTO)
          vgContenedorDatos.usunompuesto = USU_NOM_PUESTO
          vgContenedorDatos.usupassword = USU_PASSWORD
          vgContenedorDatos.usucvestusuario = USU_CVE_ST_USUARIO

          var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(vgContenedorDatos);//executeRef
          //alert(url);
          makeAjaxRequest(url, "HTML", resultadoMantenimiento, null);
  }
  function resultadoMantenimiento(objTabla, result) {
    //alert(result);
    var resultado =JSON.parse(result).result;
    if(resultado==0){
      operacionExitosa();
    }
    else{
      alert("Ocurrio un Error inesperado");        
    } 
    hideWaitLayer();
  }