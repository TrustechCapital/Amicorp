var catAvisos = new Catalogo("mx.com.inscitech.fiducia.domain.ParamGlobal");

var verificarExistenciaAviso = JSON.parse("{\"id\":\"verificaExistenciaRegistroAviso\"}");

var fvInternetAvisos = new FormValidator();

//Agregando la funcionalidad del required
fvInternetAvisos.setup({
  formName      : "frmInternetAvisos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(verificarExistenciaAviso);
makeAjaxRequest(url, "HTML", verificacionExistenciaAviso, null);


//Funciones
function verificacionExistenciaAviso(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].existeRegistro > 0)
  {
    deshabilitaPK("cmdAlta".split(","));
    loadCatalogo();
  }
  else
    deshabilitaPK("cmdModificar,cmdBaja".split(","));
}

function loadCatalogo() {
  pkInfo=new Object;
  pkInfo.paramClave=GI("paramClave").value;
  
  catAvisos.setOnUpdate(catLoaded);
  catAvisos.buscaCatalogoPK();
}

function catLoaded() {
  formsLoaded();
}

function cargaInternetAvisos() {
  onButtonClickPestania("ControlGestion.InternetAvisos","");
}

function eliminarRegistro() {
  catAvisos.setOnUpdate(operacionExitosa);
  eliminaCatalogo(catAvisos);
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaInternetAvisos();
}

function altaAviso() {
  if(fvInternetAvisos.checkForm())
  {
    catAvisos.setOnUpdate(operacionExitosa);
    catAvisos.altaCatalogo();
  }
}

function modificaAviso() {
  if(fvInternetAvisos.checkForm())
  {
    catAvisos.setOnUpdate(operacionExitosa);
    catAvisos.modificaCatalogo();
  }
}
