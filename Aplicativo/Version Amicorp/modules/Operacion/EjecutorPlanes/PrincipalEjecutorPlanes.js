showWaitLayer();
initForms();
var fvPlan = new FormValidator();
var cmbPlanesParam = JSON.parse("{}");

fvPlan.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function destazaFecha(){
  SA(GI("cmbPlanes"),"ref","conNomPla");
  cmbPlanesParam.Dia = eval(GI("txtFechaContable").value.split("/")[0]);
  cmbPlanesParam.Mes = eval(GI("txtFechaContable").value.split("/")[1]);
  cmbPlanesParam.Ano = eval(GI("txtFechaContable").value.split("/")[2]);
  cmbPlanesParam.Hora = eval(GI("txtHoraMinuto").value);
  loadElement(GI("cmbPlanes"));
}

function ejecutaPlan(){
  if(fvPlan.checkForm()){
    showWaitLayer();
    
     //if(GI("cmbPlanes").value=="PLAN CIERRE MENSUAL")
     //   historicos();
    
    var objPlan = new Object();
    objPlan.nombre = GI("cmbPlanes").value;
    var objEjecutorParam = JSON.parse("{\"id\":\"ejeFunInvocaPlanes\"}");
    objEjecutorParam.Plan = GI("cmbPlanes").value;
    objEjecutorParam.Usuario = 603;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(objEjecutorParam);
    makeAjaxRequest(url, "HTML", validaEjecutaPlan, objPlan);
  }
}

function validaEjecutaPlan(obj, result){
  var resultado = JSON.parse(result)[0];
    switch(eval(resultado)){
      case 0:
        alert("Proceso concluido satisfactoriamente!");
          
        onButtonClickPestania("Operacion.EjecutorPlanes.PrincipalEjecutorPlanes","");
      break;
      case 1:alert("No existen Rutinas asignadas al Plan!");break;
      case 2:alert("Existen Rutinas pendientes por ejecutar para este Plan!");break;
      case 3:alert("No se proyecto correctamente la Fecha de próxima ejecución de este Plan!");break;
      case 4:alert("El Usuario no existe!");break;
      default:alert("Ocurrió un error inesperado!");
    }
  hideWaitLayer();
}

//--------------historicos-------------------
function historicos()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"historicos\",\"fecha\":\""+GI("txtFechaContable").value+"\"}";
  makeAjaxRequest(url, "HTML", resultadoHistoricos, null); 
}

function resultadoHistoricos(obj, result)
{ 
  var res = JSON.parse(result).resultado;
  
  if(isDefinedAndNotNull(res)){
    switch(eval(res))
    {
      case 0:
            //alert("Operación Exitosa!!");
            break;
      default:
            alert("Error en historicos");
            break;
    }
  }
    //alert("Ocurrió un error inesperado");
} 

//--------------historicos-------------------

 