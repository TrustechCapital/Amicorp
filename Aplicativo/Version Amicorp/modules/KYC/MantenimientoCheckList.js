
var objComboParam;
var objComboParamAlt;

var objComboParamAltInicial;

var resultadosGlobal;
var longitud;


function consultaDatosKYC()
{  
  var url = ctxRoot +"/executeRef.do?json={\"id\":\"ejeFunOrganizaConceptos\",\"Persona\":\"" + GI('paramPersona').value + "\",\"fideicomiso\":" +GI("paramFideicomiso").value +",\"tipo\":" +GI("paramTipPersona").value + ",\"id_tipo\":" +GI("paramNumPersona").value + ",\"TConcepto\":" +GI("paramConcepto").value + "}";

  makeAjaxRequest(url, "HTML", recuperaValores, null);
}

function recuperaValores(obj, result)
{
  var parametros=JSON.parse("{\"id\":\"consultaDatosKYC\"}");
   
  var url = ctxRoot + "/doRef.do?json=" + JSON.stringify(parametros);
   makeAjaxRequest(url, "HTML", generaBloques, null);
}

var fechaDefault = new Date();

var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})

function isValidDate(date){ 
  var today = new Date();
  if(date == today) return true;
  else return false;
}

var objComboParamConceptos;

var parametro1 = 0;// pais
var parametro2 = 0;//estado
var parametro3 = 0;//actividad

function generaBloques(obj, result)
{


//,\"TPersona\":\"" + GI('paramPersona').value + "\"
objComboParamConceptos = JSON.parse("{\"Proyecto\":" + GI('paramFideicomiso').value + ",\"NumPersona\":" + GI('paramTipPersona').value + ",\"Tipo\":" + GI('paramNumPersona').value + "}");        

var comboCambiaConceptos=GI('cmbCambiaConcepto'); 

SA(eval(comboCambiaConceptos), "param","objComboParamConceptos");
SA(eval(comboCambiaConceptos), "keyValue","conpIdConcepto");
SA(eval(comboCambiaConceptos), "theValue","conpNombre");      
SA(eval(comboCambiaConceptos), "ref","consultaCheckList");     
loadElement(comboCambiaConceptos);  


longitud = JSON.parse(result).length;

resultadosGlobal=JSON.parse(result);

  for(i=longitud;i<60;i++)//se eliminan los elementos que no se utilizan
	{
    GI("divSubconcepto"+i).innerHTML = "";
    GI("divSubconcepto"+i).style.position = 'absolute';
  }
  
  
	for(i=0;i<longitud;i++)
	{
    var resultados=JSON.parse(result)[i];
		if(i==0)
		{ 			
      GI('NombreConcepto').innerHTML=resultados.ftcpEtiqueta;      
		}
		else
		{	
      if(resultados.ftcpObligatorio=="1"){
        GI('etiSubconcepto'+i).innerHTML=resultados.ftcpEtiqueta+"<font color='red' size='4'>*</font>";
      }
      else
      {
        GI('etiSubconcepto'+i).innerHTML=resultados.ftcpEtiqueta;
      }
      
      //agregar calendario
      if(resultados.ftcpTipoFecha==1){      
        cal.manageFields('paramSubconcepto'+i,'paramSubconcepto'+i, "%d/%m/%Y");
      }
      
      var valorcampo=resultados.ftcpValorCapturado;
      
      if(valorcampo==null || valorcampo==""){valorcampo=" ";}
      
      /* por si es categoria*/
      if(resultados.ftcpHijos==1){
      GI('etiSubconcepto'+i).innerHTML="<font size='4'>"+GI('etiSubconcepto'+i).innerHTML+"</font>";
      GI('paramSubconcepto'+i).style.visibility='hidden';
      GI('Agregar'+i).style.visibility='hidden';
      
      }
      else
      {
      GI('separador'+i).style.visibility='visible';
      }
      
      
      GI('paramSubconcepto'+i).value=valorcampo; 
      
      GI('divSubconcepto'+i).style.visibility='visible';
       
      if(resultados.ftcpTipoFecha==1)
      {
        //GI('paramSubconcepto'+i).onBlur = validaFecha(GI('paramSubconcepto'+i)); 
      }   
         
      if(resultados.ftcpExiste==1){GI('checkSubconcepto'+i).checked=true;}
      else{GI('checkSubconcepto'+i).checked=false;}
            
      if(resultados.ftcpLista==1){
      
        showWaitLayer();
        
        var combo=GI('cmbSubconcepto'+i);
        GI('paramSubconcepto'+i).style.position="absolute"; 
        GI('cmbSubconcepto'+i).style.position="relative"; 
        GI('paramSubconcepto'+i).value="";  
        //alert(resultados.ftcpEtiqueta)
        if(resultados.ftcpEtiqueta=='DELEGACION O MUNICIPIO'||resultados.ftcpEtiqueta=='ENTIDAD FEDERATIVA')//si es parte del domicilio
        {
                    parametro2 = resultados.ftcpEtiqueta=="ENTIDAD FEDERATIVA"?valorcampo:parametro2;//estado
                    alert(parametro2);
                    var parametrosKycDomicilio ="{\"numConcept\":" + resultados.ftcpIdConceptos + ",\"menor\":" + ((resultados.ftcpEtiqueta=="ENTIDAD FEDERATIVA")?-100+parametro1*100:parametro2*10000) + ",\"mayor\":" + ((resultados.ftcpEtiqueta=="ENTIDAD FEDERATIVA")?parametro1*100:10000+parametro2*10000) + "}";
              
                    objComboParam = JSON.parse(parametrosKycDomicilio);                    
                    
                    //eval("GI('cmbSubconcepto" + i + "').selectedIndex = 0;")           
                    SA(eval(combo), "keyValue","ftcvIdConcValor");
                    SA(eval(combo), "theValue","ftcvValor");      
                    SA(eval(combo), "ref","consultaCombosKYCDomicilio");     
                    loadElement(combo);      
        }
        else// se hace consulta exclisiva para los estados y municipios
        {
                    parametro1 = resultados.ftcpEtiqueta=="PAIS"?valorcampo:parametro1;// pais
                    
                    objComboParam = JSON.parse("{\"numConcept\":" + resultados.ftcpIdConceptos + "}");                    
                    //eval("GI('cmbSubconcepto" + i + "').selectedIndex = 0;")           
                    SA(eval(combo), "keyValue","ftcvIdConcValor");
                    SA(eval(combo), "theValue","ftcvValor");      
                    SA(eval(combo), "ref","consultaCombosKYC");     
                    loadElement(combo);
                   
        }
                    
                    GI('paramSubconcepto'+i).style.visibility='hidden';
                    combo.style.visibility='visible';
                    GI('paramSubconcepto'+i).disabled=true;
                    GI('paramSubconcepto'+i).value=valorcampo; 
                    
           
          if(resultados.ftcpEtiqueta=='GIRO MERCANTIL'){//en caso de ser giro mercantil
          
          var comboextra=GI('cmbSubconceptoAlt'+i);   
          
          comboextra.style.visibility='visible';
          objComboParamAltInicial = JSON.parse("{\"Actividad\":\""+valorcampo+"\"}");   
          RA(eval(comboextra), "param");
          SA(eval(comboextra), "param","objComboParamAltInicial");
            SA(eval(comboextra), "keyValue","actNumSrama");
            SA(eval(comboextra), "theValue","actNomRama");      
            SA(eval(comboextra), "ref","consultaActividades");     
            loadElement(comboextra);  
            cargaValorCombo('cmbSubconceptoAlt'+i,valorcampo,'0');
          
          }
          else
          {                    
             combo.value=valorcampo;
             cargaValorCombo('cmbSubconcepto'+i,valorcampo,'0');
          }
      }
      else
      {
        GI('paramSubconcepto'+i).disabled=false
      }  
      
      
    }
    
	}	
  
  GI('cmdGuardar').style.visibility = 'visible';
	GI('divResultados').style.visibility='visible';
}

function cargaValorCombo(objeto,valor,tiempo)
{

        var obj = GI(objeto);
        var stiempo = eval(tiempo);
        
        if(stiempo<10)
        {
                stiempo++;
                setTimeout("cargaValorCombo('"+objeto+"','"+valor+"','"+stiempo+"')",100);
        }
        else
        {
                for(s=0;s<obj.options.length;s++)
                {
                        //alert("_"+obj.options[s].text.replace(/^\s*|\s*$/g,"").replace(" ","")+"="+valor+"_")
                        if(obj.options[s].value.replace(/^\s*|\s*$/g,"").replace(" ","")==valor||obj.options[s].value.replace(/^\s*|\s*$/g,"")==valor)
                        {
                                obj.selectedIndex=s;
                                
                                if(objeto.indexOf('cmbSubconceptoAlt')!=-1)
                                    pasaValor(objeto);
                        }
                }
                hideWaitLayer();
            
        }
}

var contadorObligatorios=0;

function mandaDatosKYC(siQuierenSeguirle)
{ 
contadorObligatorios=0;

  for(i=1;i<longitud;i++)
	{
    var valsubconcepto;
    var valsubsubconcepto;
    var valcheck=0;
    var valurl=GI('urlSubconcepto'+(i)).value;
 
    var ideconcepto=String((resultadosGlobal[i].ftcpIdConceptos));
    
    if(ideconcepto.length==1){valsubconcepto=ideconcepto.charAt(0);valsubsubconcepto=0;}
    if(ideconcepto.length==2){valsubconcepto=ideconcepto.charAt(0);valsubsubconcepto=ideconcepto.charAt(1);}
    if(ideconcepto.length==3){valsubconcepto=ideconcepto.substring(0,2);valsubsubconcepto=ideconcepto.charAt(2);}
     
    var url = ctxRoot +"/executeRef.do?json={\"id\":\"ejeFunActualizaDatosKYC\",\"persona\":\"" + GI('paramPersona').value + "\",\"fideicomiso\":"+ GI('paramFideicomiso').value + ",\"tipo\":" + GI('paramTipPersona').value +",\"id_tipo\":" + GI('paramNumPersona').value + ",\"concepto\":"+GI('paramConcepto').value + ",\"subconcepto\":"+ eval(valsubconcepto)+",\"subsubconcepto\":" + valsubsubconcepto + ",\"valor\":\"" +GI('paramSubconcepto'+(i)).value+"\",\"sicheck\":"+ valcheck +",\"url\":\""+ valurl+"\"}";

    makeAjaxRequest(url, "HTML", RegistraDatosKYC, null);
     
    if(GI('paramSubconcepto'+(i)).value==" "||GI('paramSubconcepto'+(i)).value=="" || GI('paramSubconcepto'+(i)).value==null||GI('paramSubconcepto'+(i)).value.indexOf("Seleccione")!=-1)
    {
      if(resultadosGlobal[i].ftcpObligatorio!=0)
      {
        contadorObligatorios++;
      }
    }
  }
  
  //if(contadorObligatorios==0){
  var url2 = ctxRoot +"/executeRef.do?json={\"id\":\"ejeFunValidaObligatorioKYC\",\"persona\":\"" + GI('paramPersona').value + "\",\"fideicomiso\":"+ GI('paramFideicomiso').value + ",\"tipo\":" + GI('paramTipPersona').value +",\"id_tipo\":" + GI('paramNumPersona').value + ",\"concepto\":"+GI('paramConcepto').value + ",\"obligatorios\":"+contadorObligatorios+"}";
    
      makeAjaxRequest(url2, "HTML", RegistraObligatorioKYC, null); 
   
    
  //}
  
  
  
}

function RegistraDatosKYC(obj, result){



}

function RegistraObligatorioKYC(obj, result){


alert("Concepto actualizado exitosamente");
 cargaCheckList()
}


function pasaValor(ide)
{

  if(ide.indexOf('cmbSubconceptoAlt')==-1){
    
      if(GI('cmbSubconceptoAlt'+ide.replace('cmbSubconcepto','')).style.visibility=='hidden')
      {
         var temp=eval(ide.replace('cmbSubconcepto',''));
         var etiqueta = GI('etiSubconcepto'+temp).innerHTML.replace("<font color='red' size='4'>*</font>","");
          if(etiqueta.indexOf('PAIS')!=-1||etiqueta.indexOf('ENTIDAD FEDERATIVA')!=-1)
          {
              var comboextra=GI('cmbSubconcepto'+eval(temp+1));
              SA(eval(comboextra), "param","objComboParamAlt");
              RA(eval(comboextra), "keyValue");   
              SA(eval(comboextra), "keyValue","ftcvIdConcValor");
              
              parametro1 = GI(ide).value;
              
              var numConcept = eval(temp+1);
              var menor = ((etiqueta.indexOf('ENTIDAD FEDERATIVA')==-1)?eval(-100+parametro1*100):eval(parametro1*10000));
              var mayor = ((etiqueta.indexOf('ENTIDAD FEDERATIVA')==-1)?eval(parametro1*100):eval(10000+parametro1*10000));
              
              var parametrosKycDomicilio ="{\"numConcept\":"+numConcept+"0,\"menor\":" + menor + ",\"mayor\":" + mayor + "}";
              objComboParamAlt = JSON.parse(parametrosKycDomicilio); 
              loadElement(comboextra); 
          }           
              GI('paramSubconcepto'+temp).value=GI(ide).options[GI(ide).selectedIndex].value;
      }
      else{
         var comboextra=GI('cmbSubconceptoAlt'+ide.replace('cmbSubconcepto','')); 
         SA(eval(comboextra), "param","objComboParamAlt");
         RA(eval(comboextra), "keyValue");   
         SA(eval(comboextra), "keyValue","actNumSrama");
          objComboParamAlt = JSON.parse("{\"numRama\":"+GI(ide).value+"}");                            
          loadElement(comboextra);  
      }
  }else
  {
        var combo=ide.replace('Alt',''); 
        var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaActividadesPadre\",\"numSubRama\":\""+GI(ide).value+"\"}";
        var temp=ide.replace('cmbSubconceptoAlt','');
        GI('paramSubconcepto'+temp).value=GI(ide).value;
        makeAjaxRequest(url,"HTML",comboPadre,combo);     
  }
  
}

function comboPadre(obj,result)
{
    var res = JSON.parse(result)[0].padre;
    cargaValorCombo(obj,res,'0');
}

//-------------------------------------------------codigo para mostrar documentos

function muestraDocumento(url) {
    alert(url)
    var link = GI('linkReporte');
    link.href=url;
    link.click();
    document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
    hideWaitLayer();  
}

function validaFecha(obj)
{
  alert("Valida")
   var expReg = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
   
   if((!obj.value.match(expReg))||campo.value=='')
    alert("Error de Formato")
}