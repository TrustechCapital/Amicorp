var catConceptos = new Catalogo("mx.com.inscitech.fiducia.domain.FConkyc");

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;
var nivelPantalla;

var cmbTipoPersona = JSON.parse("{\"Indice\":580,\"orderDescripcion\":\"s\"}");
var cmbTipoDato = JSON.parse("{\"Indice\":570,\"orderDescripcion\":\"s\"}");
var cmbCriterio = JSON.parse("{\"Indice\":581,\"orderDescripcion\":\"s\"}");
var cmbSecuencias = JSON.parse("{\"Indice\":582,\"orderDescripcion\":\"s\"}");
var cmbStatus = JSON.parse("{\"llaveClave\":31}");

var pkInfo = null;
var fvcatConceptos = new FormValidator();

initForms();


function clickTabla(pk,tipoPantalla)
{
  pkInfo = pk;
  cloneObject(pk,catConceptos.getCatalogo());
  if(tipoPantalla!=4){
    cargaMantenimientoConceptos(tipoPantalla,'');
  }else
  {
  
    if(confirm("Se eliminara este concepto con todos sus subconceptos, desea continuar?")){eliminarRegistro();}
  }
}

fvcatConceptos.setup({
  formName      : "frmMantenimientoConceptos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


//segunda pantalla
var solo_categoria;
function cargaMantenimientoConceptos(tipoPantalla,nivel)
{
    operacion = tipoPantalla;
    nivelPantalla=nivel;    
    GI("divManejoConceptos").style.visibility='hidden';
    var urlCliente = ctxRoot + "/modules/KYC/Conceptos/MantenimientoConceptos.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoConceptos, null);  
}


function despliegaPantallaMantenimientoConceptos(obj, result)
{  
  GI("divManejoConceptos").innerHTML = result;   
  initForms(); 
}

function loadCatalogo()
{

var camposMantenimiento= new Array('tituloMantenimiento','trconpIdPersona','trconpIdConcepto','trconpIdSconcepto','trconpIdSsconcepto','trconpSecuencia','trconpTipoDato','trconpTabla','trObligatorio');


for(i=1;i<5;i++){
       GI(camposMantenimiento[i]).style.visibility='hidden';
       GI(camposMantenimiento[i]).style.position='absolute';
    } 
    
  catConceptos.setOnUpdate(catLoaded);
  if(operacion==MODIFICAR || operacion==CONSULTAR)
  {   
    catConceptos.buscaCatalogoPK(false); 
    
    GI(camposMantenimiento[0]).innerHTML='Modificar Concepto';  
    
    if(solo_categoria==1){
    GI(camposMantenimiento[0]).innerHTML='Modificar Categoria ';
        for(i=5;i<camposMantenimiento.length;i++){
         GI(camposMantenimiento[i]).style.visibility='hidden';
         GI(camposMantenimiento[i]).style.position='absolute';
         }
    }
    
  }
  else
  {
    
    GI(camposMantenimiento[0]).innerHTML='Nuevo '+nivelPantalla;
    
        
    
    if(solo_categoria==1){
    GI(camposMantenimiento[0]).innerHTML='Nueva Categoria en '+nivelPantalla;
        for(i=5;i<camposMantenimiento.length;i++){
         GI(camposMantenimiento[i]).style.visibility='hidden';
         GI(camposMantenimiento[i]).style.position='absolute';
         }
    }
    
    GI('conpIdPersona').value=GI('paramTipoPersona').value;
    
    if(nivelPantalla=='Concepto'){
    
      if(GI('new'+nivelPantalla).value=="undefined")// objeto indefinido
        GI('conpIdConcepto').value=GA(GI('new'+nivelPantalla),'Max');
      else 
        GI('conpIdConcepto').value=1; // primer concepto
        
      GI('conpIdSconcepto').value=0;
      GI('conpIdSsconcepto').value=0;
    } 
        
    if(nivelPantalla=='Subconcepto'){
      GI('conpIdConcepto').value=GA(GI('new'+nivelPantalla),'ConceptoPadre');
      GI('conpIdSconcepto').value=GA(GI('new'+nivelPantalla),'Max');
      GI('conpIdSsconcepto').value=0;
    } 
    
    if(nivelPantalla=='Subsubconcepto'){
      GI('conpIdConcepto').value=GI('conceptoSelected').value;
      GI('conpIdSconcepto').value=GA(GI('new'+nivelPantalla),'ConceptoPadre');
      GI('conpIdSsconcepto').value=GA(GI('new'+nivelPantalla),'Max');
    } 
    
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar y Cancelar
    formsLoaded();
     
  }
  GI("divManejoConceptos").style.visibility='visible';
}

function catLoaded()
{  
  if(operacion==MODIFICAR)//Si se trata de una modificación, no permitir modificar la PK
  {   
    deshabilitaPK("conpIdConcepto,conpIdSconcepto,conpIdSsconcepto".split(","));
    muestraObjs("cmdAceptar"); //Mostrar el botón Aceptar
  }
  else if(operacion==CONSULTAR)//Si se trata de una consulta, deshabilitar
  {   
    deshabilitaObjetos(GI("frmMantenimientoConceptos"));  //Deshabilita objetos (excepto botones) 
  }
      
  if(GI("conpObligatorio").value==1)
    GI("conpObligatorioCheck").checked=true;
  if(GI("conpRenovar").value==1)
    GI("conpRenovarCheck").checked=true;
  if(GI("conpBase").value==1)
    GI("conpBaseCheck").checked=true;      
  
  formsLoaded();
}

function AltaOModificaInfo()
{
    if(GI("conpObligatorioCheck").checked)
      GI("conpObligatorio").value=1;
    else
      GI("conpObligatorio").value=0;
    if(GI("conpRenovarCheck").checked)
      GI("conpRenovar").value=1;
    else
      GI("conpRenovar").value=0;
    if(GI("conpBaseCheck").checked)
      GI("conpBase").value=1;  
    else
      GI("conpBase").value=0;

  if(operacion==ALTA)//Se trata de una alta
  {
    showWaitLayer();
    catConceptos.altaCatalogo();
    operacionExitosa();
  }
  else if(operacion==MODIFICAR)//Se trata de una modificación
  {
    showWaitLayer();
    catConceptos.modificaCatalogo();
    operacionExitosa();
  }  
}


function eliminarRegistro()
{
  if(pkInfo!=null)
  {     
    var url = ctxRoot + "/executeRef.do?json={\"id\":\"borraConceptoKYC\",\"Persona\":\""+pkInfo.conpIdPersona+"\",\"Concepto\":"+pkInfo.conpIdConcepto+",\"Sconcepto\":"+pkInfo.conpIdSconcepto+",\"Ssconcepto\":"+pkInfo.conpIdSsconcepto+"}";  
 
    makeAjaxRequest(url, "HTML", recuperaBorrado, null);    
  }
}


function recuperaBorrado(obj,result)
{

  var resultado = JSON.parse(result).resultado; 
 if(resultado==1){
    alert('Existen datos en el KYC de estos conceptos. Imposible borrar!')    
  }
  else{
    operacionExitosaBorrar()
  }
}


function operacionExitosa()
{
    hideWaitLayer();
    alert("Operacion exitosa");
    
    if(GI("conceptoSelected").value!=0&&GI("sconceptoSelected").value!=0&&GI("ssconceptoSelected").value!=0)// se verifica cuales pestañas estaban seleccionadas
    {
      
      GI("ssconceptoSelected").value=0;
      consultaConceptosGenerales('Subsubconcepto');
    }
    if(GI("conceptoSelected").value!=0&&GI("sconceptoSelected").value!=0&&GI("ssconceptoSelected").value==0)
    {
      GI("sconceptoSelected").value=0;
      consultaConceptosGenerales('Subconcepto');
    }
    if(GI("conceptoSelected").value!=0&&GI("sconceptoSelected").value==0&&GI("ssconceptoSelected").value==0)
    {
      GI("conceptoSelected").value=0;
      consultaConceptosGenerales('Concepto');
    }  
    
    
    GI('divManejoConceptos').innerHTML = '<div style="color: #CCCCCC;font-size: 40px;font-weight: bold;"> CONCEPTOS GENERALES KYC</div>'; // se recarga el panel de modificación
}

function operacionExitosaBorrar()
{
    hideWaitLayer();
    alert("Operacion exitosa");
    onButtonClickPestania("KYC.Conceptos.PrincipalConceptos","");
}

function cambiaConcepto()
{
  GI("conpIdSconcepto").value = 0;
  GI("conpIdSsconcepto").value = 0;
}


//para cargar hijos 
var objComboParamAlt;
            
function cargaComboKYC(item,hijo)
{            
  if(item.selectedIndex>0)
  {               
      var combohijo=GI(hijo); 
      SA(eval(combohijo), "param","objComboParamAlt");
      
      if(hijo.indexOf('Subconcepto')!=-1){   objComboParamAlt = JSON.parse("{\"tipoPersona\":\""+GI('paramTipoPersona').value+"\",\"concepto\":\""+item.value+"\",\"ssconcepto\":0,\"order\":\"s\"}");   }
      else{      objComboParamAlt = JSON.parse("{\"tipoPersona\":\""+item.value+"\",\"sconcepto\":0,\"order\":\"s\"}");       }
      RA(combohijo,"next");
      loadElement(combohijo);
      combohijo.style.visibility='visible';
   }         
}

// KYC con pestañas


function consultaConceptosGenerales(nivelConcepto)
{
  var objConcepto=new Object();  
  objConcepto.Nivel=nivelConcepto;  
  
  var url;
  if(nivelConcepto=='Concepto'){
     url = ctxRoot + "/getRef.do?json={\"id\":\"conceptosGeneralesKYC\",\"Persona\":\""+GI('personaSelected').value+"\",\"Sconcepto\":0,\"Ssconcepto\":0}";   
  }  
  if(nivelConcepto=='Subconcepto'){
     url = ctxRoot + "/getRef.do?json={\"id\":\"conceptosGeneralesKYC\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GI('conceptoSelected').value+",\"SconceptoNo\":0,\"Ssconcepto\":0}";   
  }  
  if(nivelConcepto=='Subsubconcepto'){
     url = ctxRoot + "/getRef.do?json={\"id\":\"conceptosGeneralesKYC\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GI('conceptoSelected').value+",\"Sconcepto\":"+GI('sconceptoSelected').value+",\"SsconceptoNo\":0}";   
  } 
  
  makeAjaxRequest(url, "HTML", recuperaConceptosGenerales, objConcepto);  
} 

function recuperaConceptosGenerales(obj,result)
{
  var resultado = JSON.parse(result); 
  

  
  var tbody = GI(obj.Nivel+'s').lastChild;    
  
  while(tbody.hasChildNodes()){
    tbody.removeChild(tbody.lastChild);
  } 
  
  var fila = createElement("tr", tbody);
  fila.id = 'fila'+obj.Nivel;
  
  if(resultado.length!=0){  

  var keyValue='conpIdPersona,conpIdConcepto,conpIdSconcepto,conpIdSsconcepto';  
  //se generan dinamicamente los conceptos principales representados por pestañas 
  
  for(var i = 0; i < resultado.length; i++)
  { 
    var nConcepto = resultado[i];
    var valorItem = "";    
    var col = createElement("td", fila);
    var colAux = createElement("td", fila);
    col.id=(obj.Nivel+(i+1));
    
    colAux.innerHTML='<table cellpadding="0" cellspacing="0"><tr><td><img id="borra'+col.id+'" src="'+ctxRoot+'/imagenes/BORRARSobre.png"/></td></tr><tr><td><img id="modif'+col.id+'" align="bottom" src="'+ctxRoot+'/imagenes/MODIFICARSobre.png"/></td></tr></table>';
 
  
    if(nConcepto.conpNombre.length>17){col.innerHTML=nConcepto.conpNombre.substring(0,18)+'...';}else{col.innerHTML=nConcepto.conpNombre;}
    
    var delIcon=GI('borra'+col.id);
    
    var modIcon=GI('modif'+col.id);
    
    
    col.title=nConcepto.conpNombre+': '+((nConcepto.conpComentario!=null)?nConcepto.conpComentario:''); 
    colAux.className='pesConceptoGeneralBotonesKYC';
    col.className='pesConceptoGeneralKYC';
    
    if(obj.Nivel=='Concepto'){
       SA(col, "ide", nConcepto.conpIdConcepto); 
      }
      if(obj.Nivel=='Subconcepto'){
       SA(col, "ide", nConcepto.conpIdSconcepto); 
      }
    if(obj.Nivel=='Subsubconcepto'){
       SA(col, "ide", nConcepto.conpIdSsconcepto); 
      }
    
    siSubconceptos(obj,GI(col.id));    
    col.onmouseover = function() { cambiaClassFila(this); }
    col.onmouseout = function() { cambiaClassFila(this); }    
    
    //Se arma una cadena JSON con los nombres de los campos y los valores de PK    
    for(k in nConcepto){
      var kName = String(k);      
      if(keyValue.indexOf(kName) != -1)
      {      
        if(typeof(nConcepto[k])=="number"){valorItem += "\"" + kName + "\":" + nConcepto[k] + ",";}
        else{valorItem += "\"" + kName + "\":\"" + nConcepto[k] + "\",";}  
      }
    }
   
    valorItem = valorItem.substring(0, valorItem.length - 1);
    SA(col, "valorItem", valorItem);    
    SA(delIcon, "valorItem", valorItem); 
    SA(modIcon, "valorItem", valorItem);
    
    SA(col, "claseOriginal", col.className);
    SA(col, "siSeleccionada","NO");
   
   
   
   // se asigna el evento onCLick por cada boton borrar
   delIcon.onclick=function(){    
    var fun = eval('clickTabla');        
          fun(JSON.parse("{"+GA(this, "valorItem")+"}"),4);        
   }
   
   modIcon.onclick=function(){     
     if(GA(GI((this.id.replace('modif',''))),'tieneHijos')>0){
      solo_categoria=1;
     }else{
      solo_categoria=0;}
      
    var fun = eval('clickTabla');        
          fun(JSON.parse("{"+GA(this, "valorItem")+"}"),2);        
   }
   
    // se asigna el evento onCLick por cada celda
    col.onclick = function(){
      var cont=1;
      this.siSeleccionada="SI"; 
      if(obj.Nivel=='Concepto'){
        GI('conceptoSelected').value=GA(this,'ide');
      }
      if(obj.Nivel=='Subconcepto'){
        GI('sconceptoSelected').value=GA(this,'ide');
      }
      if(obj.Nivel=='Subsubconcepto')
      {
        GI('ssconceptoSelected').value=GA(this,'ide');
      }
        
      while(isDefinedAndNotNull(GI(obj.Nivel+cont))){        
        if((obj.Nivel+cont)!=this.id){                        
          var claseOriginal = GA(GI(obj.Nivel+cont), "claseOriginal");
          GI(obj.Nivel+cont).className = claseOriginal;
          GI(obj.Nivel+cont).siSeleccionada="NO";
        } 
          cont++;
      }   
      
      
         
      consultaConceptosGenerales('Sub'+(obj.Nivel).toLowerCase());
      /*if(GA(this,'tieneHijos')>0){// consulta los conceptos hijos      
        consultaConceptosGenerales('Sub'+(obj.Nivel).toLowerCase());      
      }else{// prepara la pkInfo para que al presionar sobre el concepto haga la consulta del concepto                         
        var fun = eval('clickTabla');
        if(isDefinedAndNotNull(fun))
          fun(JSON.parse("{"+GA(this, "valorItem")+"}"),3);
        consultaConceptosGenerales('Sub'+(obj.Nivel).toLowerCase());
      } 
      */
      
    } 

  }    
   
 } 
 
 // SE agrega una pestaña adicional que es la encargada de crear nuevos conceptos
  if(obj.Nivel!='Subsubconcepto'){
   
    var col = createElement("td", fila);
    
    
    col.innerHTML='<table cellpadding="0" cellspacing="0"><tr><td id="new'+obj.Nivel+'">Nuevo '+obj.Nivel+'</td></tr><tr><td id="newCat'+obj.Nivel+'">Nueva Categoria</td></tr></table>'
    col_sup=GI('new'+obj.Nivel);    
    col_sup.className='pesNuevoConceptoGeneralKYC';
    SA(col_sup, "claseOriginal", col_sup.className);
    SA(col_sup, "siSeleccionada","NO");
    col_sup.onmouseover = function() { cambiaClassFila(this); }
    col_sup.onmouseout = function() { cambiaClassFila(this); }
    
    col_sup.onclick=function(){solo_categoria=0;consultaMaxConcepto(obj);cargaMantenimientoConceptos(1,obj.Nivel)}
    col_inf=GI('newCat'+obj.Nivel);    
    col_inf.className='pesNuevaCategoriaGeneralKYC';
    SA(col_inf, "claseOriginal", col_inf.className);
    SA(col_inf, "siSeleccionada","NO");
    col_inf.onmouseover = function() { cambiaClassFila(this); }
    col_inf.onmouseout = function() { cambiaClassFila(this); }
    col_inf.onclick=function(){solo_categoria=1;consultaMaxConcepto(obj);cargaMantenimientoConceptos(1,obj.Nivel)} 
    
  }else{
    var col = createElement("td", fila);
    col.innerHTML='Nuevo '+obj.Nivel;
    col.id='new'+obj.Nivel;
    col.className='pesNuevoConceptoGeneralKYC';
    SA(col, "claseOriginal", col.className);
    SA(col, "siSeleccionada","NO");
    col.onmouseover = function() { cambiaClassFila(this); }
    col.onmouseout = function() { cambiaClassFila(this); }
    col.onclick=function(){solo_categoria=0;consultaMaxConcepto(obj);cargaMantenimientoConceptos(1,obj.Nivel)}
  }
    
  
  GI(obj.Nivel+'s').width=((168+30)*(resultado.length+1))-30;
  
}	


function siSubconceptos(objConcepto,idCon)
{
  var url;  
  if(objConcepto.Nivel=='Concepto'){
    url = ctxRoot + "/getRef.do?json={\"id\":\"tieneSubconceptos\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GA(idCon,'ide')+",\"SconceptoNo\":0,\"Ssconcepto\":0}";
  }  
  if(objConcepto.Nivel=='Subconcepto'){
    url = ctxRoot + "/getRef.do?json={\"id\":\"tieneSubconceptos\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GI('conceptoSelected').value+",\"Sconcepto\":"+GA(idCon,'ide')+",\"SconceptoNo\":0,\"SsconceptoNo\":0}";
  }
  
  makeAjaxRequest(url, "HTML", confirmaSiSubconceptos, idCon);
  
}

function confirmaSiSubconceptos(obj,result)
{
  var resultado = JSON.parse(result)[0];  
  SA(obj,'tieneHijos',resultado.nSubconceptos);
}


function consultaMaxConcepto(objConcepto)
{
  var url;  
  if(objConcepto.Nivel=='Concepto'){
    url = ctxRoot + "/getRef.do?json={\"id\":\"maximoConceptos\",\"Persona\":\""+GI('personaSelected').value+"\"}";
  }  
  if(objConcepto.Nivel=='Subconcepto'){
    url = ctxRoot + "/getRef.do?json={\"id\":\"maximoConceptos\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GI('conceptoSelected').value+"}";
  }
  if(objConcepto.Nivel=='Subsubconcepto'){
    url = ctxRoot + "/getRef.do?json={\"id\":\"maximoConceptos\",\"Persona\":\""+GI('personaSelected').value+"\",\"Concepto\":"+GI('conceptoSelected').value+",\"Sconcepto\":"+GI('sconceptoSelected').value+"}";
  }
  
  makeAjaxRequest(url, "HTML", recuperaMaxConcepto, objConcepto);  
}

function recuperaMaxConcepto(obj,result)
{

  var resultado = JSON.parse(result)[0]; 
  
  if(obj.Nivel=='Concepto'){  
    SA(GI('new'+obj.Nivel),'Max',parseInt(resultado.maxConcepto)+1);
  }
  if(obj.Nivel=='Subconcepto'){  
    SA(GI('new'+obj.Nivel),'Max',parseInt(resultado.maxSconcepto)+1);
    SA(GI('new'+obj.Nivel),'ConceptoPadre',GI('conceptoSelected').value);
  }
 
  if(obj.Nivel=='Subsubconcepto'){  
    SA(GI('new'+obj.Nivel),'Max',parseInt(resultado.maxSsconcepto)+1);    
    SA(GI('new'+obj.Nivel),'ConceptoPadre',GI('sconceptoSelected').value);
  } 
}






function limpiaConceptos()
{
  var nConcept=new Array('Conceptos','Subconceptos','Subsubconceptos');  
  for(i=0;i<nConcept.length;i++){
    var tbody = GI(nConcept[i]).lastChild;     
    while(tbody.hasChildNodes()){
      tbody.removeChild(tbody.lastChild);
    }
  }  
  
  GI("conceptoSelected").value=0;
  GI("sconceptoSelected").value=0;
  GI("ssconceptoSelected").value=0;
}

function obtenClave(obj)//regresa la clave del combo Criterio de seleccion
{
  if(obj.selectedIndex != 0)
  {
      var url = ctxRoot + "/getRef.do?json={\"id\":\"conETDatInd\",\"Indice\":581,\"orderDescripcion\":\"s\"}";
      makeAjaxRequest(url,"HTML",obtenClaveRes,obj.selectedIndex);
  }
  else
  {
    GI('conpClave').value = 0;
  }
}

function obtenClaveRes(ind,result)
{
  res = JSON.parse(result)[ind-1].eindIdSubindice;
  GI("conpClave").value= res;
}
