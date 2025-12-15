var catAgenda = new Catalogo("mx.com.inscitech.fiducia.domain.FEventos");
catAgenda.dateFormat = "dd/MM/YYYY";
//showWaitLayer();
var fechaDefault = new Date();
var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var REPORTE = 4;
var clavesCombo31 = JSON.parse("{\"llaveClave\":31}");
var clavesCombo52 = JSON.parse("{\"llaveClave\":52}");
var clavesCombo630= JSON.parse("{\"llaveClave\":630}");
var clavesCombo7= JSON.parse("{\"llaveClave\":7}");
var statusUsuActivo = JSON.parse("{\"statusUsu\":0,\"order\":\"s\"}");
var i=0; 

pkInfo = null;
var fvcatAgenda = new FormValidator();

var posicionCalendarios=''+((screen.width-1000)/2)+'px';
GI('mosaico_calendarios').style.left=posicionCalendarios;

initForms();

var tablaAgendaData = new Array();
tablaAgendaData[0] = "eageIdFolio,60px";
tablaAgendaData[1] = "eageFideicomiso,80px";
tablaAgendaData[2] = "eageFecEvento,80px";
tablaAgendaData[3] = "eageFecFinEvento,80px";
tablaAgendaData[4] = "eageDesEvento,510px";
tablaAgendaData[5] = "eagePeriodicidad,100px";
tablaAgendaData[6] = "eageNumEventos,50px";
tablaAgendaData[7] = "eageCveStatus,100px";


var tablaAgendaProyecciones = new Array();
tablaAgendaProyecciones[0] = "eageIdFolio,60px";
tablaAgendaProyecciones[1] = "eageFolioPadre,60px";
tablaAgendaProyecciones[2] = "eageIdSubfolio,60px";
tablaAgendaProyecciones[3] = "eageFideicomiso,100px";
tablaAgendaProyecciones[4] = "eageFecEvento,100px";
tablaAgendaProyecciones[5] = "eageDesEvento,580px";
tablaAgendaProyecciones[6] = "eageCveStatus,100px";

function clickTabla(pk) {
  pkInfo = pk;
  cloneObject(pk,catAgenda.getCatalogo());
  
  // seleccione folio origen y consulta proyecciones
  
  GI("paramFolioOrigen").value = pk.eageIdFolio;
  GI("cmdAceptar2").click();
}

function clickTablaProy(pk) {
  pkInfo = pk;
  cloneObject(pk,catAgenda.getCatalogo());
}


fvcatAgenda.setup({
  formName      : "frmDatosMantenimientoAgenda",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

function limpiar(objForma){
  RF(objForma);
  catAgenda = new Catalogo("mx.com.inscitech.fiducia.domain.FEventos");
  asignaEtiqueta("nomFideicomiso","");
  pkInfo = null;
}


function setFechaCal()
{
}
function isValidDate(date){ 
  var today = new Date();
  if(date == today) return true;
  else return false;
}



//------------------------------------------------- para cargar dias feriados al calenario

var feriados;
var hay_feriados=0;

function consultaFeriados()
{
  
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conFecFeriados\"}";
  
  makeAjaxRequest(url, "HTML", recuperaFeriados, null);
  
} 

function recuperaFeriados(obj,result)
{
var matrizFeriados=JSON.parse(result);
var nferiados=matrizFeriados.length;
feriados=new Array(nferiados);
  for(i=0;i<nferiados;i++)
  {
    feriados[i]=new Array(matrizFeriados[i].fechaferiado,matrizFeriados[i].descferiado,'FERIADOS');
  } 
  
  hay_feriados=1;
  cal.redraw();
  
  if(GI('incluir_personalizados').value!=0){
    consultaFeriadosPersonalizado();
  }
  
}		

// esta funcion necesita de un arreglo para funcionar
// en la primera posicion va la fecha en este formato yyyymmdd
// en el segundo la descripcion del evento
// en el tercero el nombre de la clase css que se le quiere asignar
// el archivo css es el de la siguiete ruta : View\public_html\js\calendarExtended\css\extras.css

function getDateInfo(date, wantsClassName) {
  var as_number = CalendarExtended.dateToInt(date);
  if(hay_feriados!=0){
    for(i=0;i<feriados.length;i++){
      if (as_number==feriados[i][0]){
        return {
      
          klass   : feriados[i][2],
          tooltip : "<div style='text-align: center'>"+feriados[i][1]+"</div>"
        };
      }
    }
  }
};


var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    dateInfo : getDateInfo,
    animation: false
})

cal.manageFields("paramfecEvento", "paramfecEvento", "%d/%m/%Y");
cal.manageFields("paramfecFinEvento", "paramfecFinEvento", "%d/%m/%Y");

var diaact=(String(fechaDefault.getDate()).lenght==1)?("0"+fechaDefault.getDate()):fechaDefault.getDate();
var mesact=(String((fechaDefault.getMonth()+1)).length==1)?("0"+(fechaDefault.getMonth()+1)):(fechaDefault.getMonth()+1);
var fechaact=diaact+"/"+mesact+"/"+fechaDefault.getFullYear();

SA(GI('paramfecEvento'),'fechaInicial',fechaact)

//Funciones para la segunda pantalla
function cargaMantenimientoAgenda(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR || tipoPantalla==REPORTE) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    if(tipoPantalla==REPORTE)
    {
      
    }
    else
    {
      operacion = tipoPantalla;
      numPantalla = 1;
      //showWaitLayer();
      var urlCliente = ctxRoot + "/modules/Administracion/Agenda/MantenimientoAgenda.do";
      makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAgenda, null);
    }
  }
  
}

function despliegaPantallaMantenimientoAgenda(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  hay_feriados=0;
  cal.manageFields("eageFecEvento", "eageFecEvento", "%d/%m/%Y");
  cal.manageFields("eageFecFinEvento", "eageFecFinEvento", "%d/%m/%Y");
}

function loadCatalogo(){
  catAgenda.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR){
    catAgenda.buscaCatalogoPK(false);
   }else
  {
    ejecutaAsignaFolio();
    deshabilitaPK("eageIdFolio".split(","));
    GI("eageNumUsuario").value=userInfo.userId;
      muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    //formsLoaded();
  }
  muestraUsuario();
}

function catLoaded() {
  
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    GI("eageUsuModificacion").value=userInfo.userId;
    GI("eageFecModificacion").value= (fechaDefault.getDate()<10?"0":"")+fechaDefault.getDate()+"/"+((fechaDefault.getMonth()+1)<10?"0":"")+(fechaDefault.getMonth()+1)+"/"+fechaDefault.getFullYear();
  
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("eageIdFolio".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoAgenda"));                  //Deshabilita objetos (excepto botones)
  }
  
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  consultaNombreFideicomiso("nomFideicomiso",GI("eageFideicomiso"));
  formsLoaded();
  muestraUsuario();
  
  // validciones mantenimiento
  if(GI("eagePeriodoEspecialChk").checked)
    periodosEpeciales(GI("eagePeriodoEspecialChk"));
  
  validaDiaPeriodicidad(GI("eagePeriodicidad"));
}

function AltaOModificaInfo(){
  
  if(GI("eageNumEventos").value==""||GI("eageNumEventos").value=="0")
  {
    GI("eageNumEventos").value = "1";
  }
  
  if(operacion==ALTA && fvcatAgenda.checkForm())//Se trata de una alta
  {
    GI('eageFecModificacion').value= GI('eageFecEvento').value;
    GI('eageUsuModificacion').value= GI('eageNumUsuario').value;
    showWaitLayer();
    catAgenda.altaCatalogo();
    //if(GI("eageNumEventos").value != "1"){
    if(GI("eageFecFinEvento").value != ""){
      do_something(i); 
    }else{
      operacionExitosaYMandarCorreo();
    }
  }
  else if(operacion==MODIFICAR && fvcatAgenda.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catAgenda.modificaCatalogo();
    
    if(GI('eageFolioPadre').value==0)
      borraEventosProyectados(GI('eageIdFolio').value,'MODIFICAR');
    else
      operacionExitosaYMandarCorreo();
  }
}

function proyectaagenda2()
{
  proyectaAgenda();

}
//modificacion sabado
function proyectaAgendaboton()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"proyectaAgenda\",\"folio\":"+eval(pkInfo.eageIdFolio)+",\"numEventos\":"+eval(pkInfo.eageNumEventos)+",\"periodicidad\":\""+pkInfo.eagePeriodicidad+"\",\"fecha\":\""+pkInfo.eageFecEvento+"\"}";
  
  makeAjaxRequest(url, "HTML", terminaProyAgenda, null); 
}


function proyectaAgenda()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"proyectaAgenda\",\"folio\":"+eval(GI("eageIdFolio").value)+",\"numEventos\":"+eval(GI("eageNumEventos").value)+",\"periodicidad\":\""+GI("eagePeriodicidad").value+"\",\"fecha\":\""+GI("eageFecEvento").value+"\"}";
 
  makeAjaxRequest(url, "HTML", terminaProyAgenda, null); 
}

function terminaProyAgenda(obj,result)
{
  var res = JSON.parse(result).resultado;
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
        consultaFecha();
        operacionExitosaYMandarCorreo();
      break;
      case 1:alert("Existen errores!");
      break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
}

//modificacion sabado

function eliminarRegistro(){
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    borraEventosProyectados(pkInfo.eageIdFolio,'BORRAR');
    
    // borra evento padre (solo cambia status a BORRADO)
    if(pkInfo.eageIdFolio==pkInfo.eageFolioPadre) // evento padre
    {
      borraEventoPadre(pkInfo.eageIdFolio);
      
      /*showWaitLayer();
      eliminaCatalogo(catAgenda);*/
    }
  }
}



function operacionExitosa(){
    hideWaitLayer();
    alert("Operacion exitosa!")
    onButtonClickPestania("Administracion.Agenda.PrincipalAgenda","");
}


//--------para retrasar funciones

  
function do_something(i){ 
 if (i > 4){
 preguntaExisteFolio();
 
 return;
 }
// do soemthing 
setTimeout("loop_implementation("+i+")", 20); 
} 
  
function loop_implementation(i){ 
   i = i + 1;
   
   do_something(i); 
}

//--------para retrasar funciones


function preguntaExisteFolio()
{
  url = ctxRoot + "/getRef.do?json={\"id\":\"consultaFolioAgenda\",\"Folio\":"+eval(GI("eageIdFolio").value)+"}";
  makeAjaxRequest(url,"HTML",preguntaExisteFolioRes,null);
}

function preguntaExisteFolioRes(obj,result)
{

  i=0;
  res = JSON.parse(result)[0].cuenta;
  
  if(res==1)
    proyectaAgenda();
  else
    do_something(i); 

}


function operacionExitosaYMandarCorreo(){
    hideWaitLayer();
    //consultaFecha();   
    Correo();//operacionExitosaYMandarCorreo
    onButtonClickPestania("Administracion.Agenda.PrincipalAgenda","");
}

function cargaPrincipalAgenda() {
  onButtonClickPestania("Administracion.Agenda.PrincipalAgenda","");
}


function ejecutaAsignaFolio(){
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"asignaFolioAgenda\",\"TipoFolio\":1}";
  makeAjaxRequest(url, "HTML", asignaFolio, null);
}
function asignaFolio(obj, result){
  var resultado = JSON.parse(result)[0];
  GI("eageIdFolio").value = resultado;
  }

   function Correo(){
     idLink = "linkReporteNew"; 
     var parametrosUrl = new Object;
     parametrosUrl.sendToJSP="true";
     parametrosUrl.urlReporte="/modules/Administracion/Agenda/EnviarCorreo.jsp"
     parametrosUrl.id="muestraTextosAgenda";
     //alert(GI("eageIdFolio").value);
     parametrosUrl.numFolio=GI("eageIdFolio").value
     var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametrosUrl);
     //alert(url)
     idLink.href=url;
     window.open(url,GI("linkReporteNew").value,"width=450,height=205,scrollbars=NO");        
     //idLink.click();
     document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
  
  function enviarCorreo()
  {
    var parametrosUrl = new Object;
    idLink = "linkReporteNew"; 
    parametrosUrl.id = GI("refQry").value;
    parametrosUrl.numFolio=eval(pkInfo.eageIdFolio);
    parametrosUrl.sendToJSP=true;
    parametrosUrl.urlReporte="/jsp/Reportes/Administracion/EnviarCorreoAgenda.jsp";
    //parametrosUrl.takeParameters=false;
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametrosUrl);
    //alert(url);
    var link = GI(idLink);
    link.href=url;
    //alert(idLink);
    window.open(url,GI("linkReporteNew").value,"width=450,height=205,scrollbars=NO");   
    //link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }    
  }
  
function muestraUsuario()
{
  var url = ctxRoot + "/getRef.do?json={\"id\":\"muestraNombre\",\"numUsuario\":"+eval(GI("eageNumUsuario").value)+"}";
  makeAjaxRequest(url, "HTML", recuperaUsuario, null);
  
}  

function recuperaUsuario(obj,result)
{
  var resultado = JSON.parse(result)[0];
  GI("eageNombre").value  = resultado.perNomUsuario;  
}
  
function consultaFecha()
{
  var url = ctxRoot + "/getRef.do?json={\"id\":\"conFecCon\"}";
  makeAjaxRequest(url, "HTML", recuperaFecha, null);
} 

function recuperaFecha(obj,result)
{
  var resultado = JSON.parse(result)[0];
  if(resultado.fecha==pkInfo.eageFecEvento)
  {  
    enviarCorreo();
    alert(GI("urlReporte")); 
  } 
}

//-------------------------------------------------codigo para mosaico de calendarios

var calendar1=CalendarExtended.setup({cont: "calendar1",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar2=CalendarExtended.setup({cont: "calendar2",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar3=CalendarExtended.setup({cont: "calendar3",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar4=CalendarExtended.setup({cont: "calendar4",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar5=CalendarExtended.setup({cont: "calendar5",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar6=CalendarExtended.setup({cont: "calendar6",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar7=CalendarExtended.setup({cont: "calendar7",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar8=CalendarExtended.setup({cont: "calendar8",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar9=CalendarExtended.setup({cont: "calendar9",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar10=CalendarExtended.setup({cont: "calendar10",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar11=CalendarExtended.setup({cont: "calendar11",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });
var calendar12=CalendarExtended.setup({cont: "calendar12",bottomBar: false,animation:false,dateInfo : getDateInfo,onSelect: function(){GI('paramfecEvento').value=this.selection.print("%d/%m/%Y"); GI('cmdAceptar').click();  } });


var hay_feriadosPersonalizado=0;
var fechas='';  
var evento='';

function consultaFeriadosPersonalizado()
{ 

  var resultados=GI('tablaConsultaAgenda').lastChild.innerHTML;  
  var separados=resultados.split('eageFecEvento');  
  var separados2=resultados.split('<TD width=510>');
  var feriados_maniobre=feriados;
     
  
   
  
  if(resultados!='' && resultados!=null){
    
    if(feriados_maniobre.length!=0){
      feriados=new Array(((separados.length-1)+feriados_maniobre.length));    
    }else{
      feriados=new Array(separados.length-1);
    }
    
    if(feriados_maniobre.length!=0){
          
      for(i=0;i<separados.length-1;i++)
      {              
          var fechaaux=separados[i+1].substr(3,10).split('/')[2]+separados[i+1].substr(3,10).split('/')[1]+separados[i+1].substr(3,10).split('/')[0];
          var statusaux=separados2[i+1].split('<TD width=100>')[1].substr(0,separados2[i+1].split('<TD width=100>')[1].indexOf('</TD>'));          
          feriados[i]=new Array(fechaaux,separados2[i+1].substr(0,separados2[i+1].indexOf('</TD>')),statusaux);           
      }
      
      var cont_maniobre=0;      
      for(i=(separados.length-1);i<((separados.length-1)+feriados_maniobre.length);i++)
      {    
          feriados[i]=feriados_maniobre[cont_maniobre];  
          cont_maniobre++;        
      }
      
    }else{
      for(i=0;i<separados.length-1;i++)
      {    
          var fechaaux=separados[i+1].substr(3,10).split('/')[2]+separados[i+1].substr(3,10).split('/')[1]+separados[i+1].substr(3,10).split('/')[0]
          var statusaux=separados2[i+1].split('<TD width=100>')[3].substr(0,separados2[i+1].split('<TD width=100>')[3].indexOf('</TD>'));
          feriados[i]=new Array(fechaaux,separados2[i+1].substr(0,separados2[i+1].indexOf('</TD>')),statusaux);           
      }
    }
  
  
  
  var ano_inicial=feriados[0][0].substr(0,4);
  var mes_inicial=feriados[0][0].substr(4,2);
    
  var dias_finales=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
  
    
  calendar1.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar1.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar1.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar1.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar2.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar2.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar2.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar2.redraw();
  
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar3.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar3.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar3.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar3.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar4.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar4.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar4.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar4.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar5.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar5.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar5.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar5.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar6.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar6.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar6.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar6.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar7.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar7.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar7.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar7.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar8.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar8.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar8.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar8.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar9.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar9.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar9.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar9.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar10.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar10.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar10.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar10.redraw();
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
    
  calendar11.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar11.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar11.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar11.redraw();
  
    
  
  
  if(mes_inicial=='12'){mes_inicial='01';ano_inicial=eval(ano_inicial)+1;}else{mes_inicial=(eval(mes_inicial)+1);}
  if(String(mes_inicial).length==1){mes_inicial=('0'+mes_inicial)}
  
  calendar12.args.min=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'01');
  calendar12.args.max=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+''+dias_finales[(eval(mes_inicial)-1)]);
  calendar12.date=CalendarExtended.intToDate(ano_inicial+''+mes_inicial+'15');  
  calendar12.redraw();
    
    
  
  hay_feriados=1; 
  
  
    GI('div_resultados').style.visibility='hidden';
    GI('mosaico_calendarios').style.visibility='visible';
    GI('skinhelper-compact').rel = 'stylesheet';
    GI('skinhelper-Normal').rel = '';
    GI('skinhelper-Minis').rel = 'stylesheet';    
    GI('skinhelper-compact').disabled = false;
    
  }
  else
  {
    alert('No hay resultados')
  }
  
} 

                         

//-------------------------------------------------codigo para nuevos reportes

function ObtenReporte() {
 
    var cadenitaFecha = GI("paramfecEvento").value!=''?',"fecEvento":"'+GI("paramfecEvento").value+'"':'';
    var cadenitaUsuario = GI("paramnumUsu").selectedIndex!=0?',"numUsu":'+GI("paramnumUsu").value+',"usuMod":'+GI("paramnumUsu").value:'';
   // var cadenitaFiso = GI("paramFideicomiso").value!=''?',"paramFideicomiso":'+GI("paramFideicomiso").value:'';
    var idqry = "getRepAgenda";
    var cadenitaStatus = GI("paramStatus").selectedIndex!=0?',"Status":"'+GI("paramStatus").value+'"':'';
    
    if(cadenitaFecha==''&&cadenitaUsuario=='')
      idqry = idqry+'Todo';
    if(cadenitaFecha!=''&&cadenitaUsuario=='')
      idqry = idqry+'Fecha';
    if(cadenitaFecha==''&&cadenitaUsuario!='')
      idqry = idqry+'Usuario';
    
    if(cadenitaStatus!='')
      idqry = idqry+'Status';
    
    var cadenota='{"Estructura":"1","sendToJSP":"true","urlReporte":"/modules/Administracion/Agenda/ReporteAgenda.jsp","Order":"s","id":"'+idqry+'"'+cadenitaStatus+cadenitaUsuario+cadenitaFecha+'}'    
    
    var fecha = GI("paramfecEvento").value.indexOf("/")!=-1?"fechaReporte='"+GI("paramfecEvento").value+"'&":"";
    
    var url = ctxRoot + "/imprimirReporte.do?"+fecha+"json=" + cadenota;
    var link = GI('linkReporte');
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();  
}

// nueva funcionalidad agenda 2012 02 23

function borraEventosProyectados(nfolio,operacion)
{
  if(nfolio!=0)
  {
    var objEventos = JSON.parse("{}");
    objEventos.id = "borraEventosProyectados";
    objEventos.numFolio = nfolio;
    
    var url = ctxRoot+"/doRef.do?json="+JSON.stringify(objEventos);
    
    makeAjaxRequest(url,"html",borraEventosProyectadosRes,operacion);
  }
}

function borraEventosProyectadosRes(operacion,result)
{
  if(operacion=='MODIFICAR')
  {
    if(GI('eageFolioPadre').value==0)
      setTimeout("proyectaAgenda()",1000)
    else
      operacionExitosaYMandarCorreo();
  }
  else
  {
    operacionExitosa();
  }
  // ELSE BORRAR
  //alert(result);
}


// botón consulta agenda ---

function consultaAgenda(btnAceptar)
{
  GI('botonLista').className='ListaAgendaSobre';
  //GI('paramAtrasado').value=((GI('paramfecEvento').value!='')?'PENDIENTE':'');
  
  if(GA(GI('paramfecEvento'),"fechaInicial")==GI('paramfecEvento').value)
  {
    //btnAceptar.ref='qryConsultaAgendaAtrasados';
    btnAceptar.ref='qryConsultaAgenda';
  }
  else
  {
    btnAceptar.ref='qryConsultaAgenda';
  }
  
  
  // consulta proyecciones ? -----
  if(GI("chkQryProy").checked)
  {
    
    GI('paramFolioOrigen').value = "";
    consultaProyecciones(GI("cmdAceptar2"));
  }
  //---------------------------------
  
  consultar(btnAceptar, GI('frmDatosPrincipalAgenda'), false);
  GI('div_resultados').style.visibility='visible';
  GI('mosaico_calendarios').style.visibility='hidden';
 
}

function consultaProyecciones(btnAceptar)
{
  consultar(btnAceptar, GI('frmDatosPrincipalAgenda'), false);
}


function periodosEpeciales(chkPeriodoEspecial)
{
  switch(GI("eagePeriodicidad").value)
  {
    case 'MENSUAL':
    case 'BIMESTRAL':
    case 'TRIMESTRAL':
    case 'SEMESTRAL':
    case 'ANUAL':
      if(chkPeriodoEspecial.checked)
      {
        GI("eageDiaOrdinario").disabled = false;
        GI("eageCveDiaHabnat").disabled = false;
      
      }
      else
      {
        GI("eageDiaOrdinario").selectedIndex = 0;
        GI("eageDiaOrdinario").disabled = true;
        GI("eageCveDiaHabnat").selectedIndex = 0;
        GI("eageCveDiaHabnat").disabled = true;
      }
    break;
  default:
    alert("La proyección de Periodos Especiales solo esta disponible para las periodicidades MENSUAL,BIMESTRAL,TRIMESTRAL,SEMESTRAL y ANUAL");
    chkPeriodoEspecial.checked = false;
    
    GI("eageDiaOrdinario").selectedIndex = 0;
    GI("eageDiaOrdinario").disabled = true;
    GI("eageCveDiaHabnat").selectedIndex = 0;
    GI("eageCveDiaHabnat").disabled = true;
    break;
  }
} 

// valida día habil

function validaDia(vDia)
{
  if(vDia.value=='')
    return;
    
  var blimmenor = vDia.value<1;// limites 
  var blimmayor = vDia.value>31;
  
  if(GI('eagePeriodicidad').value=='SEMANAL')// periodicidad semanal
    blimmayor = vDia.value>7;
  
  if(blimmenor||blimmayor)// no esta entre 1 y 31 (ó 7 para SEMANAL)
  {
    alert("Día no válido");
  }
}

function validaDiaPeriodicidad(vPeriodo)
{
  switch(vPeriodo.value)
  {
    case 'MENSUAL':
    case 'BIMESTRAL':
    case 'TRIMESTRAL':
    case 'SEMESTRAL':
    case 'ANUAL':
    case 'SEMANAL':
        GI("eageDiaHabil").disabled = false;
    break;
  default:
      GI("eageDiaHabil").value = "";
      GI("eageDiaHabil").disabled = true;
    break;
  }
  
}


// eliminar eventos padre ---

function borraEventoPadre(nfolio)
{
  if(nfolio!=0)
  {
    var objEventoPadre = JSON.parse("{}");
    objEventoPadre.id = "borraEventoPadre";
    objEventoPadre.numFolio = nfolio;
    
    var url = ctxRoot+"/doRef.do?json="+JSON.stringify(objEventoPadre);
    
    makeAjaxRequest(url,"html",borraEventoPadreRes,null);
  }
}

function borraEventoPadreRes(obj,result)
{
    //operacionExitosa();
}