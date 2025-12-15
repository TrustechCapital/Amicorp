// JavaScript Document

var fncInterfase = JSON.parse("{\"id\":\"funConcilia\"}");
var objArchivosPlanosParam = JSON.parse("{\"id\":\"conArcPla\"}");
var dvFechaParam = JSON.parse("{\"id\":\"ejeFunRegresaFechaAnterior\"}");

var statusOperacion = "SI";
var statusFinanciera = "NO";

var concilian = 0;// variables reporte concilai valores
var noconcilian=0;

var tablaConceptosData = new Array();
tablaConceptosData[0] = "fcaDescripcion,170px";
tablaConceptosData[1] = "fccConcepto1,100px";
tablaConceptosData[2] = "fccNumero1,30px";
tablaConceptosData[3] = "fccConcepto2,140px";
tablaConceptosData[4] = "fccNumero2,30px";
tablaConceptosData[5] = "fccConcepto3,100px";
tablaConceptosData[6] = "fccNumero3,30px";
tablaConceptosData[7] = "fccConcepto4,100px";
tablaConceptosData[8] = "fccNumero4,30px";
tablaConceptosData[9] = "fccConcepto5,110px";
tablaConceptosData[10] = "fccNumero5,30px";
tablaConceptosData[11] = "fccConcepto6,100px";
tablaConceptosData[12] = "fccNumero6,30px";

var tablaConceptosConsulta = new Array();
tablaConceptosConsulta[0] = "folio,50px";
tablaConceptosConsulta[1] = "fideicomiso,100px";
tablaConceptosConsulta[2] = "fecha,100px";
tablaConceptosConsulta[3] = "instruccion,100px";
tablaConceptosConsulta[4] = "tipo,100px";
tablaConceptosConsulta[5] = "importe,100px";
tablaConceptosConsulta[6] = "moneda,150px";
tablaConceptosConsulta[7] = "status,150px";
//concilia valores------
var tablaConciliaValuacion = new Array();
tablaConciliaValuacion[0] = "fcvaFideicomiso,50px";
tablaConciliaValuacion[1] = "fcvaSubcuenta,50px";
tablaConciliaValuacion[2] = "fcvaCtoInver,50px";
tablaConciliaValuacion[3] = "fcvaSaldoTotalP,150px";
tablaConciliaValuacion[4] = "fcvaSaldoTotalF,150px";
tablaConciliaValuacion[5] = "fcvaSaldoTotalC,150px";
tablaConciliaValuacion[6] = "fcvaDiferencia,150px";
tablaConciliaValuacion[7] = "fcvaComentario,200px";
tablaConciliaValuacion[8] = "fcvaCveStatus,100px";
//------


var tablaConciliaData = new Array();
tablaConciliaData[0] = "fcdStatus,100px";
tablaConciliaData[1] = "fcdIdSecuencial,100px";
tablaConciliaData[2] = "fcdDato1,100px";
tablaConciliaData[3] = "fcdValor1,100px";
tablaConciliaData[4] = "fcdDatoc1,100px";
tablaConciliaData[5] = "fcdValorc1,100px";
tablaConciliaData[6] = "fcdDato2,100px";
tablaConciliaData[7] = "fcdValor2,100px";
tablaConciliaData[8] = "fcdDatoc2,100px";
tablaConciliaData[9] = "fcdValorc2,100px";
tablaConciliaData[10] = "fcdDato3,100px";
tablaConciliaData[11] = "fcdValor3,100px";
tablaConciliaData[12] = "fcdDatoc3,100px";
tablaConciliaData[13] = "fcdValorc3,100px";
tablaConciliaData[14] = "fcdDato4,100px";
tablaConciliaData[15] = "fcdValor4,100px";
tablaConciliaData[16] = "fcdDatoc4,100px";
tablaConciliaData[17] = "fcdValorc4,100px";
tablaConciliaData[18] = "fcdDato5,100px";
tablaConciliaData[19] = "fcdValor5,100px";
tablaConciliaData[20] = "fcdDatoc5,100px";
tablaConciliaData[21] = "fcdValorc5,100px";
tablaConciliaData[22] = "fcdDato6,100px";
tablaConciliaData[23] = "fcdValor6,100px";
tablaConciliaData[24] = "fcdDatoc6,100px";
tablaConciliaData[25] = "fcdValorc6,100px";

var fvInterfase = new FormValidator();
var fechaDefault = new Date();

initForms();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

cal.manageFields("fechaHidden","fechaHidden", "%d/%m/%Y");
cal.manageFields("paramFecha","paramFecha", "%d/%m/%Y");



function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

fvInterfase.setup({
  formName      : "frmDatosInterfase",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function asignaFechaValor(){
  dvFechaParam.Fecha = GI("paramFechaValor").value;
  var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(dvFechaParam);
  makeAjaxRequest(url, "HTML", asignaEtiquetas, null);
}
function asignaEtiquetas(obj, result){
  var resultado = JSON.parse(result)[0];
  formsLoaded();
}

var aux_conc = 0;
function conciliaOpe()
{
  if(aux_conc==0)
    GI("fechaHidden").value = GI("paramFecha").value;
  
  //if(GI("fechaHidden").value == GI("paramFecha").value)
    funConcept();

  if(aux_conc==1)
    consultar(GI('cmdOperacion'), GI('frmDatosInterfase'), false);
  aux_conc=1;  
}

function funConcept()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"funConceptConcilia\",\"fecha\":\""+GI("paramFecha").value+"\"}";
  makeAjaxRequest(url, "HTML", resultadoConcept, null); 
}

function resultadoConcept(obj, result)
{ 
  var res = JSON.parse(result).resultado;
  
  if(isDefinedAndNotNull(res)){
    switch(eval(res))
    {
      case 0:
            //alert("Operación Exitosa!!");
            consultar(GI('cmdOperacion'), GI('frmDatosInterfase'), false);
            break;
      default:
            alert("Error en Conceptos Conciliacion");
            break;
    }
  }else
    alert("Ocurrió un error inesperado");
    
   GI("cmdConsultar").click();
} 



function funConcilia()
{
  var url = ctxRoot + "/executeRef.do?json={\"id\":\"funConcilia\",\"fecha\":\""+GI("paramFecha").value+"\",\"archivo\":\""+GI("txtNomArch").value+"\",\"layout\":"+GI("selectIdConci").value+"}";
  
  if(GI("paramFecha").value!=""&&GI("selectIdConci").value!="")
  {
    showWaitLayer();
    makeAjaxRequest(url, "HTML", resultadoConcilia, null); 
  }
  else
  {
    alert("Seleccione Fecha y Conciliación");
  }
}

function resultadoConcilia(obj, result)
{ 
  
  var res = JSON.parse(result).resultado;
  
  hideWaitLayer();
  if(isDefinedAndNotNull(res)){
    switch(eval(res))
    {
      case 0:
            //alert("Operación Exitosa!!");
            consultar(GI('cmdConcilia'), GI('frmDatosInterfase'), false);
            statusFinanciera = "SI";
            break;
      default:
            alert("Error en Conciliacion");
            break;
    }
  }else
  {
    alert("Ocurrió un error inesperado");
  }
} 

function pestaña(obj1,obj2,div1,div2,div3,div4)
{
  div1.style.visibility = "visible";
  div2.style.visibility = "hidden";
  div3.style.visibility = "visible";
  div4.style.visibility = "hidden";

  obj1.style.color = "#0A5796";
  obj2.style.color = "#cccccc";
  obj1.style.cursor = "default";
  obj2.style.cursor = "pointer";
  
  if(obj1.id=="tit2")
  {
      loadElement(GI("cmbBanco"));
  }
  //obj1.style.font = "12px";
  //obj2.style.font = "12px";
}





///------------- conciliacion operaciones--------------------------------
function loadTableElementConcilia(objTabla, result) {
  var jsonArray = JSON.parse(result);
  var arWidth = eval(GA(objTabla, "dataInfo"));
  loadTableConcilia(objTabla, jsonArray, arWidth, GA(objTabla, "keys"), GA(objTabla, "fun"), true);
  hideWaitLayer();
}


var valorFila = "";

function loadTableConcilia(table, dataArray, fieldsArray, keyValue, nombreFuncion, createRadio) {

  var tbody = table.lastChild;
  var tipoRenglon = 1;
  var s = 0;
  
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
  
  for(var i = 0; i < dataArray.length; i++) 
  {
    var fila = createElement("tr", tbody);
    var item = dataArray[i];
    var valorItem = "";
    
    tipoRenglon = 1;//renglon en blanco
    
    if(createRadio ) {
      var tdRadioWidth = GA(table, "radioWidth");
      var colRadio = createElement("td", fila);
      var radio = createElement("<input type='radio' name='" + table.id + "Rdo" + "'/>", colRadio);
      radio.className = "radio";
      if(isDefinedAndNotNull(tdRadioWidth)) colRadio.width = tdRadioWidth;
    }
    
    for(var j = 0; j < fieldsArray.length; j++) {
      var fieldInfo = fieldsArray[j].split(",");
      var fieldWidth = "";
      //if(fieldInfo.length == 2)
        fieldWidth = ""+fieldInfo[1];
     
      for(k in item) {
        if(fieldInfo[0] == String(k)) {
          var col = createElement("td", fila);
          
          if(fieldInfo.length == 3)
            SA(col,"align","right");
            
            col.style.color = "black";
            
            if(String(k)=='fcaDescripcion'&&item[k]!="")
              valorFila = item[k];
            
            if(String(k).substring(0,String(k).length-1)=='fccConcepto'&&item[k]!=""&&valorFila!="EVENTOS AGENDA"&&""+item[k]!="null")
            {
              col.value = item[k]+"/"+valorFila;
              col.style.cursor = "pointer";
              col.onmouseover = function() { cambiaColorCelda(this); }
              col.onmouseout = function() { cambiaColorCelda(this); }
              
              col.valMer = valorFila=="VALUACION MERCADO"?true:false;
              
              col.onclick = function() { consultaConceptConcilia(this);}
            }
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
          valorItem += "\"" + kName + "\":" + item[k] + ",";
        else
          valorItem += "\"" + kName + "\":\"" + item[k] + "\",";
      }
    }
    
    valorItem = valorItem.substring(0, valorItem.length - 1);    
    SA(fila, "valorItem", valorItem);

    
    fila.id = valorItem.split(":")[1];

    if(fila.id=='"EVENTOS AGENDA"')
    {
      if(eval(dataArray[s].fccNumero1)>0)// hay pendientes
        tipoRenglon = 2;
      if(eval(dataArray[s].fccNumero2)>0)// hay activos
        tipoRenglon = 3;
    }
    if(fila.id=='"DEPOSITOS"')
    {
      if(eval(dataArray[s].fccNumero1)>0||eval(dataArray[s].fccNumero2)>0||eval(dataArray[s].fccNumero3)>0||eval(dataArray[s].fccNumero4)>0)// hay depositos volando
        tipoRenglon = 3;
    }
    if(fila.id=='"RETIROS"')
    {
       if(eval(dataArray[s].fccNumero1)>0||eval(dataArray[s].fccNumero2)>0||eval(dataArray[s].fccNumero3)>0||eval(dataArray[s].fccNumero4)>0)// hay retiros volando
        tipoRenglon = 3;
    }
    if(fila.id=='"TRASPASOS"')
    {
       if(eval(dataArray[s].fccNumero1)>0||eval(dataArray[s].fccNumero2)>0||eval(dataArray[s].fccNumero3)>0||eval(dataArray[s].fccNumero4)>0)// hay retiros volando
        tipoRenglon = 3;
    }
    if(fila.id=='"VALUACION MERCADO"')
    {
       if(eval(dataArray[s].fccNumero2)>0)// hay valores no conciliados
        tipoRenglon = 3;
        
      concilian = eval(dataArray[s].fccNumero1);
      noconcilian = eval(dataArray[s].fccNumero2);
    }
      
    if(tipoRenglon!=1)
      statusOperacion = "NO";
      
    fila.className = "renglonConcilia" + tipoRenglon;
    fila.onmouseover = function() { cambiaColorFila(this); }
    fila.onmouseout = function() { cambiaColorFila(this); }
    /*fila.onclick = function() { 
      try { this.firstChild.firstChild.checked = true; } catch(ex) {}
      var fun = eval(nombreFuncion);
      if(isDefinedAndNotNull(fun))
        fun(JSON.parse("{"+GA(this, "valorItem")+"}"));
    }
    */
    SA(fila, "colorOriginal", fila.className); 
  s++;
  }
}

function consultaConceptConcilia(col)
{
  var valor = col.value.split("/")[0];
  var fila = col.value.split("/")[1];
  var valMer = col.valMer;
  
  if(valor=='ACTIVOS')
    valor = 'ACTIVO';
  if(valor=='ENVIAR A FIDUCIA')
    valor = 'ENVIO A FIDUCIA';
  if(valor=='EN TRANSITO')
    valor = 'TRANSITO';
  if(valor=='AUTORIZADOS')
    valor = 'AUTORIZADA';
  if(valor=='CONTABILIZADOS')
    valor = 'NO CONTABILIZADA';
  if(valor=='RECHAZADOS')
    valor = 'RECHAZADA';
    
    
  if(fila=='DEPOSITOS')
    fila = 'DEPOSITO';
  if(fila=='RETIROS')
    fila = 'RETIRO';
  if(fila=='TRASPASOS')
    fila = 'TRASPASO';
    
  if(valor=='CONCILIADOS')
    valor = 'CONCILIADO';
  if(valor=='NO CONCILIADOS')
    valor = 'NO CONCILIADO';
  
  var cadenota = "";
  
  if(valMer)
  {
    cadenota += '<input type="button" value="Reporte" name="cmdReporte" id="cmdReporte" align="left" class="boton" onclick="reporteConciliaValores();"/>' 
    cadenota += '<table cellspacing="0" cellpadding="0" border="0">'
    cadenota += '<tr align="left" class="cabeceras">'
    cadenota += '<td width="23px" align="center">&nbsp;</td>'
    cadenota += '<td width="50px">Fiso</td>'
    cadenota += '<td width="50px">SubCta</td>'
    cadenota += '<td width="50px">CtoInver</td>'
    cadenota += '<td width="150px">Total Protego</td>'
    cadenota += '<td width="150px">Total FiduciaWeb</td>'
    cadenota += '<td width="150px">Total Contabilidad</td>'
    cadenota += '<td width="150px">Diferencia</td>'
    cadenota += '<td width="200px">Comentario</td>'
    cadenota += '<td width="100px">Estatus</td>'
    cadenota += '</tr> </table>'
    cadenota += '<div style="height:150px;overflow:auto;width:1073px;">'
    cadenota += '<table id="tablaConsultaConceptos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConciliaValuacion" keys="" fun="" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>'
    cadenota += '</div>'
    cadenota += '<input type="BUTTON" id="cmdConsultaConcilia" name="cmdConsultaConcilia" value="consulta concilia" class="boton" ref="consultaConciliaVal" fun="loadTableElement" tabla="tablaConsultaConceptos" onclick="consultar(this,retForm(), false);" style="visibility:hidden;position:absolute;"/>'
    cadenota += '<input type="text" id="paramStatus" name="paramStatus" size="30"  maxlength="30" style="width:150px;visibility:hidden;position:absolute;"/>'
    cadenota += '<input type="text" id="paramorderExtend" name="paramOrderVal" size="30" value="s" maxlength="30" style="width:150px;visibility:hidden;position:absolute;"/>'
    
     GI("contDet").style.left = -80;
    GI("conDetallada").innerHTML = cadenota;
    GI("paramStatus").value = valor;
    consultar(GI('cmdConsultaConcilia'), GI('frmDatosInterfase'), false);
  }
  else
  {
    
    var funKeys = ' fun="" keys="" ';
    var tipoMovto;
    if(fila=='DEPOSITO'||fila=='RETIRO'||fila=='TRASPASO') // depositos y retiros contabilizados
    {
      tipoMovto = fila=='DEPOSITO'?0:(fila=='RETIRO'?1:2);
      cadenota += '<input type="button" value="Ver Ficha" name="cmdFicha" id="cmdFicha" align="left" class="boton" onclick="reponeFichaMovto('+tipoMovto+');"/>' 
      
      funKeys = ' fun="clickTabla" '
      funKeys += ' keys="folio" ';
    
    }
    
    
  
    cadenota += '<table cellspacing="0" cellpadding="0" border="0" style="width:830px;"><tr align="left" class="cabeceras">'
    cadenota += '<td width="23px" align="center">&nbsp;</td>'
    cadenota += '<td width="50px">Folio</td>'
    cadenota += '<td width="100px">Fideicomiso</td>'
    cadenota += '<td width="100px">Fecha</td>'
    cadenota += '<td width="100px">Instrucción</td>'
    cadenota += '<td width="100px">Tipo Instrucción</td>'
    cadenota += '<td width="100px">Importe</td>'
    cadenota += '<td width="150px">Moneda</td>'
    cadenota += '<td width="150px">Estatus</td>'
    cadenota += '</tr></table>'
    cadenota += '<div style="height:150px;overflow:auto;width:830px;">'
    cadenota += '<table id="tablaConsultaConceptos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConceptosConsulta" '+funKeys+' radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>'
    cadenota += '</div>'
    cadenota += '<input type="BUTTON" id="cmdConsultaConcilia" name="cmdConsultaConcilia" value="consulta concilia" class="boton" ref="consultaConciliacionExtend" fun="loadTableElement" tabla="tablaConsultaConceptos" onclick="consultar(this, retForm(), false);" style="visibility:hidden;position:absolute;"/>'
    cadenota += '<input type="text" id="paramEstatus" name="paramEstatus" size="30"  maxlength="30" style="width:150px;visibility:hidden;position:absolute;"/>'
    cadenota += '<input type="text" id="paramorderExtend" name="paramorderExtend" size="30" value="s" maxlength="30" style="width:150px;visibility:hidden;position:absolute;"/>'
    cadenota += '<input type="text" id="paramTipo" name="paramTipo" size="30"  maxlength="30" style="width:150px;visibility:hidden;position:absolute;"/>'
    
    GI("contDet").style.left = -50;
    GI("conDetallada").innerHTML = cadenota;
    GI("paramEstatus").value = valor;
    GI("paramTipo").value = fila;  
    consultar(GI('cmdConsultaConcilia'), GI('frmDatosInterfase'), false);
  }
  
}

function retForm()
{
  return GI('frmDatosInterfase');
}

function cambiaColorCelda(col)
{
  var color = col.style.color;
  if(color=="black")
    col.style.color = "blue";
  else
    col.style.color = "black";
}

pkInfo = null;

function clickTabla(pk)
{
  pkInfo = pk;
}

//-------------- conciliacion financiera----------------------------------------------------

function ejecutaFuncion(){
  if(GI("paramFecha").value==""||GI("txtNomArch").value=="")
  {  
    alert("Debe seleccionar la Fecha y el Archivo");
  }
  else
  {
    if(fvInterfase.checkForm())
    {
                
        borrarArchivo();
         
         // ejecutaStoreInterfase();    
    }
  }
}
  

function frameSubmit(forma) {

  forma.document.getElementById("fechaConciliacion").value = GI("paramFecha").value;
  forma.document.getElementById("nombreConciliacion").value = GI("txtNomArch").value;
  forma.document.getElementById("idBanco").value = GI("cmbBanco").value;
  forma.document.getElementById("idInterfase").value = GI("cmbInterfase").value;
  forma.submit();
}

function ejecutaStoreInterfase(){
    fncInterfase.fecha = GI("paramFecha").value;
    fncInterfase.nomArchivo = GI("txtNomArch").value;
    var url = ctxRoot + "/executeRef.do?json=" + JSON.stringify(fncInterfase);
   // alert(url)
    makeAjaxRequest(url, "HTML", validaStoreInterfase, null);
  }


function validaStoreInterfase(obj, result)
{
  var res = JSON.parse(result).RESULTADO;
  if(isDefinedAndNotNull(res)){
    switch(eval(res)){
      case 0:
          alert("Operación exitosa")
          document.getElementById("cmdLimpiar").click();
      break;
      case 1:alert("Cargue el archivo correcto antes de al vaciar los Precios!");break;
      default:alert("Ocurrió un error inesperado");
    }
  }else
    alert("Ocurrió un error inesperado");
  hideWaitLayer();
}


function fileUploaded() {  
 alert("Archivo Cargado correctamente")
 /* 
  var objInterface = GI("dvInterface");
  var url = ctxRoot + "/modules/Interfases/InterfseVauacion/TasAplicar.do";
 
 GI("frameUpload").onreadystatechange = function() {};
  hide("frameUpload");
  hide("frmTas");
  
  removeFrame("frameUpload");
  
  makeAjaxRequest(url, "HTML", cambiaPantallaTAS, objInterface);*/
}
/*

function cambiaPantallaTAS(obj, result) {
  obj.innerHTML = result;
  SA(GI("paramFecha"), "readonly", "true");
  GI("txtMensaje").value=vgDisplay;
  hideWaitLayer();
}*/



//-------------------------------------------------codigo para nuevos reportes

function ObtenReporte(obj,result) {
 
    var idqry = "getRepConcilia";
    var link = GI('linkReporte');
   
    if(obj.excel==0){
    var cadenota='{"Estructura":"1","sendToJSP":"true","urlReporte":"/modules/Operacion/Conciliacion/ReporteConciliacion.jsp","id":"'+idqry+'"}'        
    }else{
    var cadenota='{"Estructura":"1","sendToJSP":"true","urlReporte":"/modules/Operacion/Conciliacion/ReporteConciliacionExcel.jsp","id":"'+idqry+'"}'        
    link.target='_self';
    }
    
    var url = ctxRoot + "/imprimirReporte.do?json=" + cadenota;
        
    link.href=url;
    link.click();
      
 
}


function ejecutaReporte(excel) {

    var idsp = "repRepConcilia";
    var objeto=new Object();
    objeto.excel=excel;
    var cadenota='{"id":"'+idsp+'","Fecha":"'+GI('paramFecha').value+'"}';        
    
    var url = ctxRoot + "/execRefReporte.do?json="+cadenota;
          
    makeAjaxRequest(url, "HTML", ObtenReporte,objeto);
  
}


function borrarArchivo()
{
   var nomArchivo = GI("paramFecha").value.replace("/","").replace("/","")+""+((eval(GI("cmbBanco").value)*1000)+eval(GI("cmbInterfase").value));
  
   var url = ctxRoot+"/doRef.do?json={\"id\":\"borraArcPla\",\"Archivo\":\""+nomArchivo+"\"}";
      makeAjaxRequest(url,"HTML",subeArchivo,null);
}

function subeArchivo(obj,resp)
{
   showWaitLayer();
    GI("frameUpload").onreadystatechange = hideFrame;
    
   frameSubmit(document.frameUpload.frmConciliacion);
}

function hideFrame() 
{ 
  GI("frameUpload").onreadystatechange = null;
  hideWaitLayer();
  consultaArchivos(GI("cmdConsultar"));
}


function subirArchivo()
{
   var vfecha = (GI('paramFecha').value.split('/')[0]+GI('paramFecha').value.split('/')[1]+GI('paramFecha').value.split('/')[2]); 
   var vfile = GI('txtNomArch').value.substring(0,8);
   
   if((vfecha!=vfile) && GI('txtNomArch').value!='')
   {
      alert('El archivo no coincide con la fecha');
      document.frameUpload.location=GI('ruta').value+'/modules/Operacion/Conciliacion/ConciliacionUpload.do';
   }
   else
   {
      GI('ocultaArchivo').value='1';
      ejecutaFuncion();
      }
}

// Autorizar Conciliacion

function confirmar()
{
    
    var url = ctxRoot +"/getRef.do?json={\"id\":\"consultaConciliadosFinan\",\"Fecha\":\""+GI("paramFecha").value+"\"}";
    makeAjaxRequest(url,"HTML",confirmarResp,null);
}

function confirmarResp(obj,result)
{
  var res = JSON.parse(result)[0].cuenta;
  
  var operaciones = true;
  var finanzas = true;
  
    if(statusOperacion == "NO")
      operaciones = false;
      
    if(statusFinanciera=="NO")
      finanzas = false;
    if(res>0)
      finanzas = false;
  
  if(operaciones&&finanzas)
  { 
    autoriza();
  }
  else
  {
    if(confirm("Faltan operaciones por conciliar, ¿desea autorizar la conciliacion para este día?"))
    {
     autoriza();
    }
  }
}

function autoriza()
{
  var url = ctxRoot+"/doRef.do?json={\"id\":\"actualizaCierreConcilia\",\"Fecha\":\""+GI("paramFecha").value+"\"}"
    makeAjaxRequest(url,"HTML",autorizaResp,null)
} 

function autorizaResp(obj,result)
{
  alert("Conciliación Autorizada")
}

// CONCILIACION VALORES

function reporteConciliaValores()
{
	var fecha  = GI("paramFecha").value;
	var conciliados = concilian+"-"+noconcilian
	var cadenota='{"sendToJSP":"true","urlReporte":"/modules/Operacion/Conciliacion/ReporteConciliaValores.jsp","Order":"s","id":"getRepConciliaValores","Fecha":"'+fecha+'"}'    
    
    var url = ctxRoot + "/imprimirReporte.do?fechaReporte='"+fecha+"'&concilia='"+conciliados+"'&json="+cadenota;
    var link = GI('linkReporteNew');
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();  
}

function reponeFichaMovto(tipoMovto)
{
  if(pkInfo==null)
  {
    alert("¡Seleccione Movimiento!")
  }
  else// seleccionó movimiento
  {
      var surl = '{';
      surl+='"sendToJSP":"true",';    
      surl+='"urlReporte":"/modules/Operacion/Conciliacion/ReposicionFicha.jsp",';
      
      if(tipoMovto==0)// deposito
        surl+='"id":"repReposicionFichaDeposito",'; 
      else if(tipoMovto==1)// retiro
        surl+='"id":"repReposicionFichaRetiro",';  
      else if(tipoMovto==2)// traspaso
        surl+='"id":"repReposicionFichaTraspaso",';  
      
      surl+='"folio":'+pkInfo.folio+'';
      surl+='}';   
      
      var url = ctxRoot + "/imprimirReporte.do?json="+surl;
      var link = GI('linkReporteNew');
      link.href=url;
      link.click();
      document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
}

// Archivos Concilia Bancos

var pkInfoArchivos;

var tablaArchivosData = new Array();
tablaArchivosData[0] = "idBanco,80px";
tablaArchivosData[1] = "idInterfase,80px";
tablaArchivosData[2] = "nomBanco,100px";
tablaArchivosData[3] = "nomInterfase,200px";

function consultaArchivos(obj)
{
 GI("paramNombre").value = GI("paramFecha").value.replace("/","").replace("/","");
  consultar(obj, GI('frmDatosInterfase'), false);
  pkInfoArchivos = null;
}

function clickTablaArchivos(pk)
{
  pkInfoArchivos = pk;
  
  var nomArchivo = GI("paramFecha").value.replace("/","").replace("/","")+""+((pkInfoArchivos.idBanco*1000)+pkInfoArchivos.idInterfase);
  
  if(confirm("Desea Borrar el archivo: "+nomArchivo))
   {
      var url = ctxRoot+"/doRef.do?json={\"id\":\"borraArcPla\",\"Archivo\":\""+nomArchivo+"\"}";
      makeAjaxRequest(url,"HTML",clickTablaArchivosResp,null);
   }
}

function clickTablaArchivosResp(obj,result)
{
   alert("¡Archivo Eliminado!");
   GI("cmdConsultar").click();
}