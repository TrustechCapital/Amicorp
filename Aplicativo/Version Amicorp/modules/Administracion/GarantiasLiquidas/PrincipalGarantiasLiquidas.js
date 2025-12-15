//REGISTRO DISPOSICION,GENERAR CONSTANCIA,LIBERAR GARANTIA,DISPERCION DE INTERES

var conNumFidNomFid = JSON.parse("{}");
var fvOpcionesGarLiq= new FormValidator();
var fvConsultaGarLiq = new FormValidator();
var pesSelected = -1;

var cadSecuenciales = "";//variable que almacena los secuenciales de los beneficiarios

var tablaCreditosData = new Array();
tablaCreditosData[0] = "fcreIdCredito,50px";
tablaCreditosData[1] = "fcreLocalidad,100px";
tablaCreditosData[2] = "fcreTipoCredito,50px";
tablaCreditosData[3] = "fcreProductoCredito,200px";
tablaCreditosData[4] = "fcreImpCredito,70px";
tablaCreditosData[5] = "fcrePjeGarantia,30px";
tablaCreditosData[6] = "fcreImpGarantia,70px";
tablaCreditosData[7] = "fcreNumDisposiciones,50px";
tablaCreditosData[8] = "fcreImpDisposiciones,70px";
tablaCreditosData[9] = "fcreImpGarAport,70px";
tablaCreditosData[10] = "fcreImpGarLiberada,70px";
tablaCreditosData[11] = "fcreMoneda,50px";
tablaCreditosData[12] = "fcreFecSuscripcion,80px";
tablaCreditosData[13] = "fcreFecVencimiento,80px";

var tablaDisposicionesData = new Array();
tablaDisposicionesData[0] = "gliqIdDisposicion,100px";
tablaDisposicionesData[1] = "gliqFechaDisposicion,100px";
tablaDisposicionesData[2] = "gliqImporteDisp,100px";
tablaDisposicionesData[3] = "gliqGarLiquida,100px";
tablaDisposicionesData[4] = "gliqNumBeneficiarios,100px";
tablaDisposicionesData[5] = "gliqAccionTomada,100px";
tablaDisposicionesData[6] = "gliqCveStatus,150px";

var tablaBeneficiariosData = new Array();
tablaBeneficiariosData[0] = "glbeIdSecuencial,30px";
tablaBeneficiariosData[1] = "glbeIdBeneficiario,50px";
tablaBeneficiariosData[2] = "glbeNombreBen,200px";
//tablaBeneficiariosData[3] = "glbeImpCredito,70px";
//tablaBeneficiariosData[3] = "glbePjeGarantia,30px";
tablaBeneficiariosData[3] = "glbeImpCredito,150px";
tablaBeneficiariosData[4] = "glbeImpGarliq,150px";
tablaBeneficiariosData[5] = "glbeImpGarliqLib,60px";
tablaBeneficiariosData[6] = "glbeFolioConstancia,70px";
tablaBeneficiariosData[7] = "glbeFolioLiberacion,70px";
tablaBeneficiariosData[8] = "glbeCveStatus,50px";

fvConsultaGarLiq.setup({
  formName      : "frmConsulta",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function clickPestaniaGL(obj,cadotras)//Se da click en alguna pestaña 
{
 
  pesSelected = obj.id.replace("gar_","");
  obj.siSeleccionada= "SI";
  var otraspes = cadotras.split(",");
  
  for(s=0;s<otraspes.length;s++)
  {
      GI("gar_"+otraspes[s]).siSeleccionada = "NO";
      var claseOriginal = GA(GI("gar_"+otraspes[s]), "claseOriginal")
      GI("gar_"+otraspes[s]).className = claseOriginal;
  }
  
  switch(eval(obj.id.replace("gar_","")))
  {
    case 0: //constancia
    
        var cadenota = '<FORM name="frmOpciones" id="frmOpciones" onsubmit=""><table class="texto" style="font-size:12px;">';
        cadenota += '<tr><td ><input type="text" id="fecha1" name="fecha1" tipo="Fecha" value="" required size=10></td>';
        cadenota += '<td >Fecha <input type="hidden" id="fecha2" name="fecha2" tipo="Fecha" value="" size=10></td>';
        cadenota += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td> <td>Total Crédito:&nbsp;<input type=text id="sumImpCredito" value="0.0" size=10 required message="El Total Crédito es un campo obligatorio"/></td>';
        cadenota += '<td>Garantía Liquida:&nbsp;<input type=text id="sumImpGarliq" size=10 required value="0.0" message="La Garantía Liquida es un campo obligatorio"/></td> <td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>';
        cadenota += '<td ><input type=button class="boton" value="Aceptar" onclick="if(fvOpcionesGarLiq.checkForm())GarLiq(0,0);"/></td></tr></table></FORM><input type=hidden id="sumImpIntereses" value="0.0"/>';      
        
        GI("div_opciones").innerHTML= cadenota;
        
       opcionPestana();
        
        break;
    case 1:// carta
      var cadenota = '<FORM name="frmOpciones" id="frmOpciones" onsubmit=""><table class="texto" style="font-size:12px;">';
        cadenota += '<tr><td >Fecha Liberación:&nbsp;<input type="text" id="fecha1" name="fecha1" tipo="Fecha" size=10 required message="La Fecha de Liberación es un campo obligatorio"></td>';
        cadenota += '<td >&nbsp;<input type="hidden" id="fecha2" name="fecha2" size=10></td>';
        cadenota += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td><input type=hidden id="sumImpGarliq" value="0.0" size=10/></td>';
        cadenota += '<td>Garantía Liquida a Liberar:&nbsp;<input type=text id="sumImpCredito" size=10 required value="0.0" message="La Garantía Liquida es un campo obligatorio"/></td> <td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>';
        cadenota += '<td ><input type=button class="boton" value="Aceptar" onclick="if(fvOpcionesGarLiq.checkForm())GarLiq(1,0);"/></td></tr></table></FORM><input type=hidden id="sumImpIntereses" value="0.0"/>';      
        GI("div_opciones").innerHTML= cadenota;
      
       opcionPestana();
      break;
    case 2:
    
        //distribucion de intereses
        var cadenota = '<table class="texto" style="font-size:12px;">';
        cadenota += '<tr><td >Fecha :&nbsp;<input type="text" id="fecha1" name="fecha1" tipo="Fecha" size=10 required message="La Fecha es un campo obligatorio"/></td>';
        cadenota += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
        cadenota += '<td>Importe Intereses:&nbsp;<input type=text id="impIntereses" size=10 value="" /></td>';
        cadenota += '<td ><input type="BUTTON" value="Aplicar" id="cmdAplicar" name="cmdAplicar" class="boton" onclick="aplicarDistribucionInt();"/></td></tr></table>';      
        cadenota += '<input type=hidden id="sumImpCredito"/><input type=hidden id="sumImpGarliq"/><input type=hidden id="sumImpIntereses" value="0.0"/><input type="hidden" id="fecha2" name="fecha2" tipo="Fecha" size=10 />';
        GI("div_opciones").innerHTML = cadenota;

       opcionPestana();
      break; 
    case 3:
      GI("div_opciones").innerHTML= 'Liberación de Intereses<input type=hidden id="sumImpCredito"/><input type=hidden id="sumImpGarliq"/><input type=hidden id="sumImpIntereses" value="0.0"/>';
      break;
     case 4:
      GI("div_opciones").innerHTML= 'Reposición Constancia<input type=hidden id="sumImpCredito"/><input type=hidden id="sumImpGarliq"/><input type=hidden id="sumImpIntereses" value="0.0"/>';
      break;
     case 5://estado de cuenta
      var cadenota = '<input type="BUTTON" value="Generar" id="cmdReporte" name="cmdReporte" class="boton" onclick="reporteBeneficiario();">';
        cadenota += '<input type=hidden id="sumImpCredito"/><input type=hidden id="sumImpGarliq"/><input type=hidden id="sumImpIntereses" value="0.0"/>';
        
        GI("div_opciones").innerHTML = cadenota;
      break;
     case 6:
      var cadenota = '<FORM name="frmOpciones" id="frmOpciones" onsubmit=""><table class="texto" style="font-size:12px;">';
        cadenota += '<tr><td >&nbsp;<input type="hidden" id="fecha1" name="fecha1" tipo="Fecha" size=10></td>';
        cadenota += '<td >&nbsp;<input type="hidden" id="fecha2" name="fecha2" size=10></td>';
        cadenota += '<td><input type=hidden id="sumImpCredito" value="0.0" size=10 /></td>';
        cadenota += '<td>&nbsp;<input type=hidden id="sumImpGarliq" size=10 value="0.0"/></td> <td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>';
        cadenota += '<td ><input type=button class="boton" value="Contabilizar" onclick="GarLiq(6,0)"/></td></tr></table></FORM><input type=hidden id="sumImpIntereses" value="0.0"/>';      
        GI("div_opciones").innerHTML= cadenota;
              
     break;
    default:
      
      break;
  }
  
  GI("contenidoMinistracion").innerHTML = '<table id="tablaBeneficiarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaBeneficiariosData" keys="glbeImpCredito,glbeImpGarliq,glbeImpIntereses" fun="" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"></table>';
                                
  
}


function acumulaImportes(check,arreglo,id)//suma o resta los importes
{
  var importe =  0;
  var imp = 0;
  var importes;  
  //alert(arreglo)
  if(check)
  {
    importes = arreglo.split(';');

    for(s=0;s<importes.length;s++)
    {
        //alert(importes)
      importe=importes[s].split(":");
      //GI("sum"+importe[s].replace("glbe","")).value = 0;       
      imp=eval(GI("sum"+importe[0].replace("glbe","")).value) + eval(importe[1])
      //alert(importe[1])
      GI("sum"+importe[0].replace("glbe","")).value = imp;

    }
    
    cadSecuenciales += ","+id;
  }
  else
  {
     importes = arreglo.split(';');
    
    for(s=0;s<importes.length;s++)
    {
      importe=importes[s].split(":");
      //GI("sum"+importe[s].replace("glbe","")).value = 0;             
      imp=eval(GI("sum"+importe[0].replace("glbe","")).value) - eval(importe[1])
      GI("sum"+importe[0].replace("glbe","")).value = imp;


    }
    
     cadSecuenciales = cadSecuenciales.replace(","+id,"");
  }
//alert(GI("sumImpGarliq").value)  
}

function GarLiq(opc,folio) //menu de opciones
{
  switch(opc)
  {
    case 0:
      if(statusDisposicion=="ACTIVO")
        funcionGarliq(opc,folio);
      else
        alert("Ya se ha emitído una Constancia de esta disposición, ver Reposición de Constancias");
      break;
    case 1:
      if(statusDisposicion=="CONSTANCIA EMITIDA")
        funcionGarliq(opc,folio);
      else
        alert("No se puede Generar Carta de Liberación");
      break;
      break;
    case 6:
      funcionGarliq(opc,folio);
      break;
    
    default:
      alert("Error");
      break;
  }
}
var accionGarantiasLiquidas;


function funcionGarliq(opc,folio)// invoca a la funcion
{
    var fideicomiso = GI("paramFideicomiso").value;
    var credito = GI("paramCredito").value;
    var tipoCredito = GI("paramTipoCredito").value;
    var disposicion = GI("paramDisposicion").value;
    var fechaConst ="";
    var fecha1 =GI("fecha1").value;
      

    var fecha2 = GI("fecha2").value;
    var folio= folio;
    var usuario = GI("paramUsuario").value;
    var accion = opc;
    var ImpDisposicion = 0;
    
    //alert(GI("sumImpCredito").value)
    
    if(accion==1){
        ImpDisposicion=GI("sumImpCredito").value;
    }
    else{
        ImpDisposicion=0;
    }
    
    var cadJSON = "{\"id\":\"ejeFunGarliq\",\"fideicomiso\":"+fideicomiso+",\"credito\":\""+credito+"\",\"tipoCredito\":\""+tipoCredito+"\",\"disposicion\":"+disposicion+",\"fecha1\":\""+fecha1+"\",\"fecha2\":\""+fecha2+"\",\"folio\":"+folio+",\"usuario\":"+usuario+",\"accion\":"+accion+",\"impdisp\":\""+ImpDisposicion+"\"}";
    
    var url = ctxRoot +"/executeRef.do?json="+cadJSON;
    //alert(url)
    makeAjaxRequest(url,"HTML",respGarliq,opc);
}

function respGarliq(obj,result)//respuesta de la funcion
{
  var res = JSON.parse(result).resultado;

  if(eval(res)==0)
  {
      alert("¡Operación Exitosa!")
      switch(eval(obj))
      {
        case 0:
          generaReporte(obj);
          GI('cmdConsultarBen').click();
          GI('cmdConsultarDis').click();
          
          break;
        case 1:
          generaReporte(obj);
          GI('cmdConsultarBen').click();
          GI('cmdConsultarDis').click();
          break;
        default:
          break;
      }
  }
  else
  {
    if(eval(res)==2){
        alert("¡El Monto de la Garantia es mayor a la Disposicion!")    
    }
    if(eval(res)==-9999){
        alert("¡Operación Exitosa!") 
        GI('cmdConsultarBen').click();
        GI('cmdConsultarDis').click();        
    }
    else if(eval(res)!=2&&eval(res)!=-9999){
        alert("¡Error en Rutina FUNCIONESGARLIQ!")    
    }
    
    //switch errores
  }
}

// ----------------- sin usar -----------------------

function getFolio(opc,folio)// se obtiene el folio (Constancia y Carta)
{ 
  var obj = JSON.parse("{\"id\":\"consultaFolios\",\"folio\":"+folio+"}");
  var url = ctxRoot + "/getRef.do?json="+JSON.stringify(obj);
  makeAjaxRequest(url,"HTML",respFolio,opc);
}

function respFolio(opc,result)// respuesta de la consulta de folio
{
  var res = JSON.parse(result)[0].folio;
  
  var fideicomiso = GI("paramFideicomiso").value;
  var credito = GI("paramCredito").value;
  var disposicion = GI("paramDisposicion").value;
  
  var obj = new Object();
  obj.opc = opc;
  obj.folio = res;
  obj.longitud = cadSecuenciales.split(",").length;
  
  for(i=1;i<obj.longitud;i++)
  {
    var beneficiario = cadSecuenciales.split(",")[i];
    var url = ctxRoot + "/doRef.do?json={\"id\":\"actualizaFolio"+(opc==0?"Cons":"Lib")+"\",\"folio\":"+eval(res)+",\"fideicomiso\":"+fideicomiso+",\"credito\":\""+credito+"\",\"disposicion\":"+disposicion+",\"beneficiario\":"+eval(beneficiario)+"}";
    if (i==obj.longitud-1)
      makeAjaxRequest(url,"HTML",actualizaFolio,obj);
    else
      makeAjaxRequest(url,"HTML",actualizaFolioSin,obj);
  }
}

function actualizaFolioSin(obj,result)
{
  // nada
}

function actualizaFolio(obj,result)
{
    GarLiq(obj.opc,obj.folio);
    GI("cmdConsultarBen").click(); 
}
// ----------------- sin usar -----------------------

function generaReporte(opc)// se genera la Constancia y la Carta
{
    //alert(opc)
    obj = JSON.parse("{}");
    obj.id = "getReporteGarLiq";
    obj.urlReporte = "/modules/Administracion/GarantiasLiquidas/"+((opc==0||opc==1)?"ConstanciaGarantiasLiquidas":"CartaGarantiasLiquidas")+".jsp";
    obj.Usuario = GI("paramUsuario").value;
    obj.sendToJSP = "true";
    
    
    
    
      
    
    
    
    
    var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(obj);
   // alert(accionGarantiasLiquidas)
    if(accionGarantiasLiquidas==0){
    url += "&fechaConst="+GI("fecha1").value;
    }
    
    
    var link = GI("linkConstancia");
    link.href=url;
    link.click();
    
}

//TABLAS
function consultaDatos()
{
  
  if(fvConsultaGarLiq.checkForm()){
    consultar(GI("cmdAceptar"), GI("frmConsulta"), false);
    }
}

function clickTablaCreditos(pk) {
  pkInfo = pk;
  GI("paramCredito").value=pk.fcreIdCredito;
  GI("paramTipoCredito").value=pk.fcreTipoCredito;
  GI("cmdConsultarDis").click();
}
var statusDisposicion ="";
function clickTablaDisposicion(pk) {
  pkInfo = pk;
  GI("paramDisposicion").value=pk.gliqIdDisposicion;
  statusDisposicion = pk.gliqCveStatus;
  GI("cmdConsultarBen").click();
}

function loadTableElementGarLiq(objTabla, result) {

  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTableGarLiq(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), GA(objTabla, "fun"), true);
  hideWaitLayer();
}

var arregloFilas;

function loadTableGarLiq(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio)
{
  arregloFilas = new Array();
  var arr = 0;
  GI("selAll").disabled = false;
  
  
  var tbody = table.lastChild;
  var tipoRenglon = 1;
  
  while(tbody.hasChildNodes())
    tbody.removeChild(tbody.lastChild);
  
  if(dataArray.length <= 0) {
    var mensajeNoRecords = GA(table, "NoRecordsMsg");
    var funNoRecords = GA(table, "NoRecordsFun");
    
    if(isDefinedAndNotNull(funNoRecords))
      try { eval(funNoRecords + "();"); } catch(ex) {}

    if(isDefinedAndNotNull(mensajeNoRecords))
      alert(mensajeNoRecords);
  }
  
  for(var i = 0; i < dataArray.length; i++) {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    var valorItem = "";
    
    fila.tieneFolios = false; //variable que sirve para saber si tiene folio de constancia
    
    if(createRadio ) {
      var tdRadioWidth = GA(table, "radioWidth");
      var colRadio = createElement("td", fila);
      var radio = createElement("<input type='CHECKBOX' disabled=true id='" + table.id +""+i+"'/>", colRadio);
      radio.className = "radio";
      if(isDefinedAndNotNull(tdRadioWidth)) colRadio.width = tdRadioWidth;
    }
    
    for(var j = 0; j < fieldsArray.length; j++) 
    {
      var fieldInfo = fieldsArray[j].split(",");
      var fieldWidth = "";
      //if(fieldInfo.length == 2)
        fieldWidth = ""+fieldInfo[1];
      
      for(k in item) {
        if(fieldInfo[0] == String(k)) {
          var col = createElement("td", fila);
          
          if((fieldInfo[0]=="glbeFolioConstancia"&&pesSelected==0)||(fieldInfo[0]=="glbeFolioLiberacion"&&pesSelected==1))//si es algun campo de folios
          {
            if(""+item[k]!="null"&&""+item[k]!="0")//si no tiene folio
              fila.tieneFolios = true;
          }
          
          if(fieldInfo[0]=="glbeIdSecuencial")//guarda el id
          {
              fila.idSecuencial = item[k];
          }
          if(fieldInfo[0]=="glbeIdBeneficiario")//guarda el id
          {
              fila.idBeneficiario = item[k];
          }
          
          if(fieldInfo.length == 3)
            SA(col,"align","right");
          
          col.innerHTML = ""+item[k];
          if(col.innerHTML == "null") col.innerHTML="";    
          if(fieldWidth != "") col.width = fieldWidth;        
        }
      }
    }
    
    for(k in item) {
      var kName = String(k);
      if(keyValue.indexOf(kName) != -1) {
        if(typeof(item[k]) == "number")
          valorItem += kName+":"+item[k].replace(/^\s*|\s*$/g,"").replace(/,/g,"")+ ";";
        else
          valorItem += kName+":"+item[k].replace(/^\s*|\s*$/g,"").replace(/,/g,"")+";";
      }
    }
    
    valorItem = valorItem.substring(0, valorItem.length - 1);
    SA(fila, "valorItem", valorItem);
    fila.className = "renglon" + tipoRenglon;
    fila.onmouseover = function() { cambiaColorFila(this); }
    fila.onmouseout = function() { cambiaColorFila(this); }
    fila.onclick = function() { 
      try { 
            if(pesSelected!=-1&&!this.tieneFolios)//si hay alguna pestaña seleccionada y si no tiene ningun folio
            {
              this.firstChild.firstChild.checked=(this.firstChild.firstChild.checked?false:true); // simulacion de .click()
              acumulaImportes(this.firstChild.firstChild.checked,this.valorItem,this.idSecuencial);
            }
            
            if(this.firstChild.firstChild.checked)
              benSeleccionado= this.idBeneficiario;
            else
              benSeleccionado= 0;
          } 
      catch(ex)
      {
      }
      var fun = eval(nombreFuncion);
      if(isDefinedAndNotNull(fun))
        fun(JSON.parse("{"+GA(this, "valorItem")+"}"));
    }
    
    SA(fila, "colorOriginal", fila.className);
    
    if(tipoRenglon == 1)
      tipoRenglon = 2;
    else
      tipoRenglon = 1;
      
    cadSecuenciales = ""; // reinicia cadena de secuenciales de beneficiarios
    arregloFilas[arr] = fila;
    arr++;
  }
}

function seleccionaTodo(obj)
{
      if(obj.checked)
      {
        for(i =0;i<arregloFilas.length;i++)
        {
          
          if(!arregloFilas[i].firstChild.firstChild.checked)
            arregloFilas[i].click();
        }
      }
      else
      {
        for(i =0;i<arregloFilas.length;i++)
        {
          if(arregloFilas[i].firstChild.firstChild.checked)
            arregloFilas[i].click();
        }
      }
}

//CONSTANCIAS

var fechaDefault = new Date();

function setFechaCal() {
  //alert("se actualizo la fecha");
}

function isValidDate(date) { 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

function opcionPestana()// se carga el menu de parametros de cada pestaña
{
    fvOpcionesGarLiq.setup({
                  formName      : "frmOpciones",
                  tipoAlert     : 1,
                  alertFunction : BaloonAlert,
                  sendObjToAlert: true
    });
    
    
    
     
     if(isDefinedAndNotNull(GI("fecha1"))){
            Calendar.setup({
                inputField     :    "fecha1",   // id of the input field
                button         :    "fecha1",
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
            
      }
            
            Calendar.setup({
                inputField     :    "fecha2",   // id of the input field
                button         :    "fecha2",
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
}


initForms();







// inutiles ----------------------------------------------------------
var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

    
var contenedor = new Object();

var operacion = 0;
var numPantalla = 0;
pkInfo = null;
var benSeleccionado = 0;

///////////////////////////////////////////////////////////////////////////////
//Funciones para la primera pantalla
function cargaPrincipalTerceros() {
  onButtonClickPestania("Administracion.GarantiasLiquidas.PrincipalGarantiasLiquidas","");
}

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
}

function operacionExitosa() {
  alert("La operación se realizó correctamente");
  cargaPrincipalTerceros();
  hideWaitLayer();
}

//////////////////////////////////////////////////////////////////////////////
//Funciones para la segunda pantalla
function cargaMantenimientoTerceros(tipoPantalla) {
  if ((tipoPantalla==MODIFICAR || tipoPantalla==CONSULTAR) && pkInfo==null)
    alert("No ha seleccionado campo alguno de la tabla");
  else
  {
    operacion = tipoPantalla;
    numPantalla = 1;
    showWaitLayer();
    var urlCliente = ctxRoot + "/modules/Administracion/MantenimientoTerceros.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoTerceros, null);
  }
}

function despliegaPantallaMantenimientoTerceros(obj, result) {
  GI("dvPantalla").innerHTML = result;
  initForms();
  
  //Agregando la funcionalidad del required
  fvMantenimientoTerceros.setup({
    formName      : "frmDatosMantenimientoTerceros",
    tipoAlert     : 1,
    alertFunction : BaloonAlert,
    sendObjToAlert: true
  });
  deshabilitaPK("tserNumTercero".split(","));

}

function loadCatalogo(){

  catTerceros.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
    catTerceros.buscaCatalogoPK(false);
  else
  {
    muestraObjs("cmdAceptar,cmdCancelar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
  }
}

function catLoaded() {
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
    deshabilitaPK("terNumContrato,terNumTercero".split(","));
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {
    SA(GI("cmdCancelar"), "value", "Regresar");//Colocar la leyenda Regresar en vez de Cancelar al botón
    deshabilitaObjetos(GI("frmDatosMantenimientoTerceros"));    
    //Deshabilita objetos (excepto botones)
  }
  muestraObjs("cmdCancelar"); //Mostrar el botón Regresar
  formsLoaded();
  
   
}

function AltaOModificaInfo() {
  catTerceros.setOnUpdate(operacionExitosa);
  if(operacion==ALTA && fvMantenimientoTerceros.checkForm())//Se trata de una alta
  {
    showWaitLayer();
    catTerceros.altaCatalogo();
  }
  else if(operacion==MODIFICAR && fvMantenimientoTerceros.checkForm())//Se trata de una modificación
  {
    showWaitLayer();
    catTerceros.modificaCatalogo();
  }
}

function eliminarRegistro() {
  if(pkInfo==null)
    alert("No se ha seleccionado campo alguno de la tabla");
  else
  {
    catTerceros.setOnUpdate(operacionExitosa);
    showWaitLayer();
    eliminaCatalogo(catTerceros);
  }
}

///////////////////////
function validarPkAlta(objeto) {
  if(GI("terNumContrato").value!="")
  {
    var validacionAlta = JSON.parse("{\"id\":\"verificaExistenciaContrato\",\"numContrato\":0}");
    validacionAlta.numContrato = GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta);
    makeAjaxRequest(url, "HTML", verificarAlta, objeto);
  }
}

function verificarAlta(obj, result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoNumContrato > 0)
  {
    var validacionAlta2 = JSON.parse("{\"id\":\"verificaSeaActivo\",\"numContrato\":0}");
    validacionAlta2.numContrato = GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(validacionAlta2);
    makeAjaxRequest(url, "HTML", verificarAlta2, obj);
  }
  else
  {
    alert("El Fideicomiso no existe, verifique");
    GI("terNumContrato").value="";
    GI("terNumTercero").value="";
    obj.focus();
  }
}

function verificarAlta2(obj,result) {
  var objResult = JSON.parse(result);
  if(objResult[0].ctoCveStContrat != 0)
  {
    alert("El Fideicomiso no está ACTIVO");
    GI("terNumContrato").value="";
    GI("terNumTercero").value="";
    obj.focus();
  }
  else
  {
    
    //Agregar el número del Tercero (Incremental)
    var SecNumTercero = JSON.parse("{\"id\":\"numSecNumTercero\",\"NumFiso\":0}");
    SecNumTercero.NumFiso=GI("terNumContrato").value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(SecNumTercero);
    makeAjaxRequest(url, "HTML", agregarTercero, null);
  }
}

function agregarTercero(obj, result) {
  var objResult = JSON.parse(result);
  GI("terNumTercero").value=objResult[0].secNumTercero;
}

//reporte 

function reporteBeneficiario()
{
  var tipoReporte = 0;

  var surl ="\"Estructura\":\"1\",";
      surl +="\"sendToJSP\":\"true\",";
      if(GI('selAll').checked)// todos estan seleccionados (Muchos Reportes Individuales)
      {
        surl +="\"id\":\"qryReporteBeneficiarioGarliq\",";
        surl += "\"credito\":\""+GI("paramCredito").value+"\",";
        surl += "\"tipoCredito\":\""+GI("paramTipoCredito").value+"\",";
        surl += "\"disposicion\":\""+GI("paramDisposicion").value+"\",";
        tipoReporte = 1;
      }
      else if(benSeleccionado==0)// no seleccionaron beneficiario (Reporte General)
      {
        surl +="\"id\":\"qryReporteBeneficiarioGarliq\",";
        surl += "\"credito\":\""+GI("paramCredito").value+"\",";
        surl += "\"tipoCredito\":\""+GI("paramTipoCredito").value+"\",";
        surl += "\"disposicion\":\""+GI("paramDisposicion").value+"\",";
        tipoReporte = 2;
      }
      else//un beneficiario seleccionado (Reporte Individual)
      {
        surl +="\"id\":\"qryReporteBeneficiarioIndividualGarliq\",";
        surl += "\"beneficiario\":\""+benSeleccionado+"\",";
        tipoReporte = 3;
      }
      
      
      surl +="\"urlReporte\":\"/modules/Administracion/GarantiasLiquidas/Reportes/ReporteBeneficiarios.jsp?tipoReporte="+tipoReporte+"\",";
      surl += "\"fiso\":"+GI("paramFideicomiso").value+",";
      surl +="\"order\":\"s\"";
  
      var url = ctxRoot + "/imprimirReporte.do?json={"+surl+"}";
      
      var link = GI('linkReporte');
      link.href=url;
      link.click();
      document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
      hideWaitLayer();

}

// distribición de intereses

function aplicarDistribucionInt()
{
    if(confirm("¿Esta seguro que desea aplicar Distribución de Intereses?"))
    {
        if(confirm("¿Es una Aplicación Mensual?"))
        {
              if(GI("fecha1").value.length>0)
              {
                  var surl = "\"id\":\"ejeFunGarLiqDistInt\",";
                  surl += "\"fecha\":\""+GI("fecha1").value+"\",";
                  surl += "\"usuario\":"+ctxUser+"";
                
                  var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
              }
              else
              {
                  alert("¡Seleccione Fecha!")
                  return;
              }
        }
        else
        {
              if(GI("fecha1").value.length>0&&GI("paramFideicomiso").value!=-1&&GI("impIntereses").value.length>0)
              {
                    var surl = "\"id\":\"ejeFunGarLiqDistInt\",";
                    surl += "\"fideicomiso\":"+GI("paramFideicomiso").value+",";
                    surl += "\"credito\":"+(GI("paramCredito").value.length>0?GI("paramCredito").value:0)+",";
                    surl += "\"intereses\":"+GI("impIntereses").value+",";
                    surl += "\"fecha\":\""+GI("fecha1").value+"\",";
                    surl += "\"usuario\":"+ctxUser+"";
                    var url = ctxRoot +"/executeRef.do?json={"+surl+"}";
              }
              else
              {
                  alert("¡Seleccione Fecha, Fideicomiso, Intereses!");
                  return;
              }
        
        }
      
      showWaitLayer();
      makeAjaxRequest(url,"HTML",aplicarDistribucionIntResp,null);
    }
}

function aplicarDistribucionIntResp(obj,result)
{
    var res = JSON.parse(result).RESULTADO;
    switch(res)
    {
      case 0:
        alert("Operación ejecutada correctamente");
        break;
      case 1:
        alert("Error en Distribución de Intereses");
        break;
      default:
        alert("Ocurrió  un error inesperado");
        break;
    }
    hideWaitLayer();
}