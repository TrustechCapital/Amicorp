
showWaitLayer();

// combos
var cmbFideicomisoTrac = JSON.parse("{}");
var indicesCombo662 = JSON.parse("{\"Indice\":662}");
var indicesCombo661 = JSON.parse("{\"Indice\":661,\"orderDescripcion\":\"S\"}");


// Pantalla
var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;


//calendarios
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("afecha","afecha", "%d/%m/%Y");
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

initForms();
fechaTrack(GI("afecha"));
formsLoaded();

//consultaProcedimiento(4042);//procedimiento

function limpiar(objForma){
  RF(objForma);
  GI('tablaPrecioTrac').style.visibility = "hidden";
  GI('nNaftracs').style.visibility = "hidden";
  
  fechaTrack(GI("afecha"));
  pkInfo = null;
}

function clickTabla(pk) {
  pkInfo = pk;
}

//botones

function funAplicaPrecio()
{
  if(fvMantenimiento.checkForm()&&confirm("¿Esta seguro que desea aplicar el precio?"))
  {
    var surl = "\"id\":\"ejeFunAplicaPrecios\",";
    surl += "\"fiso\":"+GI('fiso').value+",";
    surl += "\"fecha\":\""+GI('afecha').value+"\",";
    surl += "\"precioCer\":"+GI('precioNaf').value+",";
    surl += "\"precioNaf\":"+GI('precioNaf').value+",";
    surl += "\"nNaftracs\":"+GI('nNaftracs').value+",";
    surl += "\"opcion\":"+GI('tipoPrecio').value+"";
    url = ctxRoot + "/executeRef.do?json={"+surl+"}";
    
    
    makeAjaxRequest(url,"HTML",funAplicaPrecioResp,null);
  }
}

function funAplicaPrecioResp(obj,result)
{
  
  var res = JSON.parse(result).RESULTADO;
  switch(res)
  {
    case 0:
          alert("¡Operación Exitósa!");
          limpiar(frmDatos);
          break;
    case 1:
          alert("¡No hay operaciones en este Día!");
          limpiar(frmDatos);
          break;
    case 2:
          alert("¡No hay Precios Cargados!");
          limpiar(frmDatos);
          break;
    default:
          alert("¡Ocurrió un Error inesperado!");
          break;
  }
}


function cambiaCaptura(obj)// ocultar /actualizar pantalla
{

  if(obj.selectedIndex!=0)//selecciona correctamente
  {
    if(GI('fiso').selectedIndex==0&&GI('fiso').options.length>0)
      GI('fiso').selectedIndex = 1;
      
    GI('lfideicomiso').innerHTML = GI('fiso').options[GI('fiso').selectedIndex].text;
    GI('tablaPrecioTrac').style.visibility = "visible";
    
        if(obj.value==1)//precio teórico
        {
            
            GI('lprecioNaf').innerHTML = 'Precio Teórico de Naftrac';
            GI('lnNaftracs').innerHTML = 'Número de Naftracs'
            GI('nNaftracs').style.visibility = "visible";
            
            GI('precioNaf').value = '';
            GI('nNaftracs').value = '';
        
        }
        else if(obj.value==2)//precio de cierre
        {
            
            
            GI('lprecioNaf').innerHTML = 'Precio de Cierre de Naftrac';
            GI('lnNaftracs').innerHTML = '&nbsp;'
            GI('nNaftracs').style.visibility = "hidden";
            
            GI('precioNaf').value = '';
            GI('nNaftracs').value = 0;
        }
  }
  else
  {
    GI('tablaPrecioTrac').style.visibility = "hidden";
  }
  
  
    
}