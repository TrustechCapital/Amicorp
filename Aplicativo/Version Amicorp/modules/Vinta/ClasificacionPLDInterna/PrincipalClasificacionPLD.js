// JavaScript Document
pkInfo = null;

var arrTblDat = new Array();
arrTblDat[0] = "iperiod,60px,right";
arrTblDat[1] = "vfechaPago,80px,center";
arrTblDat[2] = "vnRs,200px";
arrTblDat[3] = "vnivelRiesgo,150px,center";
arrTblDat[4] = "imonto,100px,right";
arrTblDat[5] = "vstatus,100px,center";

//Calendario para "Fecha"
Calendar.setup({
    inputField     :    "paramFechaInicio",   // id of the input field
    button         :    "paramFechaInicio",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    disableFunc    :    isValidDate,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

//Calendario para "Fecha"
Calendar.setup({
    inputField     :    "paramFechaFin",   // id of the input field
    button         :    "paramFechaFin",
    ifFormat       :    "%d/%m/%Y", //"%a %e/%b/%Y",       // format of the input field
    showsTime      :    false,
    timeFormat     :    "24",
    disableFunc    :    isValidDate,
    weekNumbers    :    false,
    cache          :    true,
    step           :    1
});

function isValidDate(date) {
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

function clickTabla(pk) {
  pkInfo = pk;
  GI("txtComentariosEjecutivo").value = pkInfo.vcomentarios;
  muestraObj("trSeccion");
}

function operacionClasificacionPago() {
  if(pkInfo == null) {
    alert("Debe seleccionar un registro de la tabla!");
    return;
  }
  
    var objParametros = JSON.parse("{\"id\":\"fncVintaInterna\"}");
    eval("objParametros.idPago=" + pkInfo.idPago);
    eval("objParametros.comentarios='" + GI("txtComentarios").value + "'");
      showWaitLayer();
    
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objParametros);
    //alert(url)
    makeAjaxRequest(url, "HTML", respuestaClasificacionPago);
}

function respuestaClasificacionPago(obj, result){
  var resultado = JSON.parse(result).resultado;
  if(isDefinedAndNotNull(resultado) && resultado == 0) {
    alert("Operación realizada exitosamente!");
    pkInfo = null;
    ocultaObj("trSeccion");
    GI("cmdBuscar").click();
  } else {
    alert("Ocurrió un error al realizar la operación!");
  }  
  hideWaitLayer();
}

function cargaPrincipalClasificacionPagos() {
  onButtonClickPestania("Vinta.ClasificacionPLD.PrincipalClasificacionPLD","");
}
