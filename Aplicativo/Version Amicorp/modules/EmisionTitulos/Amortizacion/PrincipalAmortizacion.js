
hideWaitLayer(); 

var cmbFormaAmortizacionParam = JSON.parse("{\"Indice\":504,\"orderDescripcion\":\"S\"}");
var cmbTipoAmortizacionParam = JSON.parse("{\"Indice\":528,\"orderDescripcion\":\"S\"}");

var oldColor = GI("txtPrograma").style.backgroundColor;
pkInfo2 = null;
var arrTblDat0 = new Array();
var arrTblDat = new Array();
var arrTblDat2 = new Array();
var arrTblDat3 = new Array();

arrTblDat0[0] = "eeacIdPeriodo,70px";
arrTblDat0[1] = "eeacTipoAmortizacion,150px";
arrTblDat0[2] = "eeacPeriodicidad,100px";
arrTblDat0[3] = "eeacFecInicioAmort,70px";
arrTblDat0[4] = "eeacFecFinAmort,70px";
arrTblDat0[5] = "eeacImpAmort,100px,right";

arrTblDat[0] = "eeadIdAmortizacion,70px";
arrTblDat[1] = "eeadFecAmort,70px";
arrTblDat[2] = "eeadImpAmortizacion,100px,right";

arrTblDat2[0] = "eeciIdCapInte,70px";
arrTblDat2[1] = "eeciFecCapInte,70px";
arrTblDat2[2] = "eeciImpCapInte,100px,right";

arrTblDat3[0] = "eeapIdAmortizacion,70px";
arrTblDat3[1] = "eeapFecAmort,70px";
arrTblDat3[2] = "eeapImpAmortizacion,100px,right";


function despliegaPantallaPrincipalAmortizacion(){
  GI("dvTitulo").innerHTML = "Amortización";
  GI("txtPrograma").id = "eeacIdPrograma";
  GI("txtFideicomiso").id = "eeacIdFideicomiso";
  GI("txtEmision").id = "eeacIdEmision";
  cat5.getCatalogo().eeacIdPrograma = pkInfo.eemiIdPrograma;
  cat5.getCatalogo().eeacIdFideicomiso = pkInfo.eemiIdFideicomiso;
  cat5.getCatalogo().eeacIdEmision = pkInfo.eemiIdEmision;
  GI("paramPrograma").value = pkInfo.eemiIdPrograma;
  GI("paramFideicomiso").value = pkInfo.eemiIdFideicomiso;
  GI("paramEmision").value = pkInfo.eemiIdEmision;
  //setCalendar2Obj("eeacFecAmort",emptyDisableFunc);// funcion setCalendar2Obj 
  //setCalendar2Obj("txtFechaFinPer",emptyDisableFunc);// funcion setCalendar2Obj
  GI("cmdConsultarPrincipal").onclick = "";
  
   fechasPeriodo(GI('txtFecIni').value,GI('txtFecFin').value);
  
   cal.manageFields("eeacFecInicioAmort","eeacFecInicioAmort", "%d/%m/%Y");
   cal.manageFields("eeacFecFinAmort","eeacFecFinAmort", "%d/%m/%Y");
   cal.manageFields("txtFechaFinPer","txtFechaFinPer", "%d/%m/%Y");
  
   
  initForms();
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR)
  {
    if(modo == OPER_CONSULTAR){
      deshabilitaObjetos(GI("frmDatos"));
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar,cmdLimpiar,cmdAlta,cmdModificar,cmdBaja");
    
}

var once = true;

function asignaValues2ObjHTMLAmortizacion(){
   if(once)
   {
      once=false;

        //cat5.setOnUpdate(emptyOnUpdateFunc);//funcion emptyOnUpdateFunc no existe
        /*if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA)
        {  
          cat5.buscaCatalogoPK(false);
        }*/
        formsLoaded();
        //consulta automatica de las tablas de amortizacion y capitalizacion
        var botonTemp = GI("cmdCancelar");
        SA(botonTemp,"ref","emision.conETPriAmor");
        SA(botonTemp,"fun","loadTableElement");
        SA(botonTemp,"tabla","tblReg0");
        consultar(botonTemp, GI("frmDatos"), false);
        
        SA(botonTemp,"ref","emision.conETPriCapInt");
        SA(botonTemp,"fun","loadTableElement");
        SA(botonTemp,"tabla","tblReg2");
        consultar(botonTemp, GI("frmDatos"), false);
        
        SA(botonTemp,"ref","emision.conETPriAmoAnt");
        SA(botonTemp,"fun","loadTableElement");
        SA(botonTemp,"tabla","tblReg3");
        consultar(botonTemp, GI("frmDatos"), false);
        
        
        dvOperacion('frmDatos');
        
        // consulta fecha inicial amortizacion
        consultaFechaIni('emision.verETExiAmor',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","eeacFecFinAmort");  
        
        setTimeout("formatoComasMonto('eeacImpCapitalizacion,eeacImpAmort')",1000);
   }
}

function ejecutaOperacionAmortizacion(modo2){
  
    limpiaComasMonto('eeacImpCapitalizacion,eeacImpAmort');
  if(fvCat.checkForm()){
    //cat5.setOnUpdate(operacionCatalogo);
    
    
    showWaitLayer();
    switch(modo2){
      case OPER_ALTA:
        consultaSecuencial('emision.verETExiAmor',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","eeacIdPeriodo");
      break;
      case OPER_MODIFICAR:
        cat5.modificaCatalogo();
        operacionCatalogo();
      break;
      case OPER_BAJA:
        cat5.bajaCatalogo(false);
        operacionCatalogo();
      break;
      default:
          //alert("consultar");
        break;
    }
  }
}

function operacionCatalogo(){
  //alert("Operacion realizada exitosamente!");
  //cargaDetalleParametrosCalculo(2);
  setTimeout('operacionAmortizacionCapitalizacion()',2000);
  
  GI('cmdModify').style.visibility = "hidden";
  GI('cmdDrop').style.visibility = "hidden";
  
  hideWaitLayer();
}

function limpiaDatosAmortizacion(objTable0,objTable, objTable2, objTable3){
  resetTable(objTable0);
  resetTable(objTable);
  resetTable(objTable2);
  resetTable(objTable3);
  limpiaTxts("txtSec,txtImporte,txtFechaFinPer,tasaAmorAnt");
  limpiaTxts("eeacIdPeriodo,eeacImpAmort,eeacFecInicioAmort,eeacFecFinAmort,eeacPjeTasa,eeacAmortTitulosChk");
  
  GI("rdTipoAAP").value = "on";
  GI("rdTipoAAP").checked = false;
  GI("rdTipoCI").checked = false;
  GI("rdTipoAA").checked = false;
  GI("txtSec").style.backgroundColor = oldColor;
  GI("txtImporte").style.backgroundColor = oldColor;
  GI("txtFechaFinPer").style.backgroundColor = oldColor;
  GI("rdTipoAAP").style.backgroundColor = oldColor;
  RemoveOWAlert(GI("txtSec"));
  RemoveOWAlert(GI("txtImporte"));
  RemoveOWAlert(GI("txtFechaFinPer"));
  RemoveOWAlert(GI("rdTipoAAP"));
  habilitaPK("txtSec".split(","));
  GI("rdTipoAAP").disabled = false;
  GI("rdTipoCI").disabled = false;
  GI("rdTipoAA").disabled = false;
  pkInfo2 = null;
}

function estableceMantenimientoTablas(strRdMaster, objRdActual){
  asignaValueRadio2Master(strRdMaster,objRdActual);
  
  
  // fecha inicial radios
  
  if(GI("rdTipoAAP").value == "AA")
    consultaFechaIni('emision.verETExiAmoAdi',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtFechaFinPer"); 
  else if(GI("rdTipoAAP").value == "CI")
    consultaFechaIni('emision.verETExiCapInt',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtFechaFinPer"); 
  else
    consultaFechaIni('emision.verETExiAmoAnt',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtFechaFinPer"); 
   
} 

function clickTabla2(pk){
  pkInfo2 = pk;
  GI("rdTipoAAP").value = pk.tipoReg;
  if(pk.tipoReg == "AA"){
    cloneObject(pk,cat6.getCatalogo());
    GI("txtSec").value = pk.eeadIdAmortizacion;
    GI("txtImporte").value = pk.eeadImpAmortizacion;
    GI("txtFechaFinPer").value = pk.eeadFecAmort;
    resetTable(GI("tblReg2"));
    resetTable(GI("tblReg3"));
  }else if(pk.tipoReg == "CI"){
    cloneObject(pk,cat7.getCatalogo());
    GI("txtSec").value = pk.eeciIdCapInte;
    GI("txtImporte").value = pk.eeciImpCapInte;
    GI("txtFechaFinPer").value = pk.eeciFecCapInte;
    resetTable(GI("tblReg"));
    resetTable(GI("tblReg3"));
  }else{
    cloneObject(pk,cat8.getCatalogo());
    GI("txtSec").value = pk.eeapIdAmortizacion;
    GI("txtImporte").value = pk.eeapImpAmortizacion;
    GI("txtFechaFinPer").value = pk.eeapFecAmort;
    resetTable(GI("tblReg"));
    resetTable(GI("tblReg2"));
  }
  
  resetTable(GI("tblReg0"));
  
  cargaRadiosConMaster("rdTipoAAP","rdTipoCI,rdTipoAA");
  deshabilitaPK("txtSec".split(","));
  GI("rdTipoAAP").disabled = true;
  GI("rdTipoCI").disabled = true;
  GI("rdTipoAA").disabled = true;
  
  
    GI('cmdModify').style.visibility = "hidden";
    GI('cmdDrop').style.visibility = "hidden";
  
    formatoComasMonto('txtImporte'); 
}



function clickTabla3(pk){
  pkInfo2 = pk;
    
    GI('cmdModify').style.visibility = "visible";
    GI('cmdDrop').style.visibility = "visible";
    
    cloneObject(pk,cat5.getCatalogo());
    
    GI("eeacIdPeriodo").value = pk.eeacIdPeriodo;
    GI("eeacTipoAmortizacion").value = pk.eeacTipoAmortizacion;
    GI("eeacPeriodicidad").value = pk.eeacPeriodicidad;
    GI("eeacFecInicioAmort").value = pk.eeacFecInicioAmort;
    GI("eeacFecFinAmort").value = pk.eeacFecFinAmort;
    GI("eeacImpAmort").value = pk.eeacImpAmort;
    GI("eeacPjeTasa").value = pk.eeacPjeTasa;
    GI("eeacAmortTitulosChk").checked = pk.eeacAmortTitulos==1?true:false;
    
    
    resetTable(GI("tblReg"));
    resetTable(GI("tblReg2"));
    resetTable(GI("tblReg3"));
    
    
    deshabilitaPK("eeacIdPeriodo".split(","));
  
  GI("rdTipoAAP").disabled = true;
  GI("rdTipoCI").disabled = true;
  GI("rdTipoAA").disabled = true;
  
  formatoComasMonto('eeacImpAmort'); 
}

function ejecutaOperacionAmortizacionCapitalizacion(modo2)
{  
   
    limpiaComasMonto('txtImporte');
    
  GI("txtSec").style.backgroundColor = oldColor;
  GI("txtImporte").style.backgroundColor = oldColor;
  GI("txtFechaFinPer").style.backgroundColor = oldColor;
  GI("rdTipoAAP").style.backgroundColor = oldColor;
  RemoveOWAlert(GI("txtSec"));
  RemoveOWAlert(GI("txtImporte"));
  RemoveOWAlert(GI("txtFechaFinPer"));
  RemoveOWAlert(GI("rdTipoAAP"));
  //cat6.setOnUpdate(operacionAmortizacionCapitalizacion);
  //cat7.setOnUpdate(operacionAmortizacionCapitalizacion);
  //cat8.setOnUpdate(operacionAmortizacionCapitalizacion);
  if(modo2 != OPER_BAJA){
    /*if(GI("txtSec").value == ""){
      fvCat.alertAndFocus(GI('txtSec'), GI('txtSec').message);
    }else*/
    if(GI("txtFechaFinPer").value == ""){
      fvCat.alertAndFocus(GI('txtFechaFinPer'), GI('txtFechaFinPer').message);
    }else if(GI("txtImporte").value == ""){
      fvCat.alertAndFocus(GI('txtImporte'), GI('txtImporte').message);
    }else if(GI("rdTipoAAP").value == "on"){
      fvCat.alertAndFocus(GI('rdTipoAAP'), GI('rdTipoAAP').message);
    }else{
      switch(modo2){
        case OPER_ALTA:
          showWaitLayer();
          var objExisteRegistroParam = JSON.parse("{}");
          if(GI("rdTipoAAP").value == "AAP"){
            cat8.getCatalogo().eeapIdPrograma = pkInfo.eemiIdPrograma;
            cat8.getCatalogo().eeapIdFideicomiso = pkInfo.eemiIdFideicomiso;
            cat8.getCatalogo().eeapIdEmision = pkInfo.eemiIdEmision;          
            cat8.getCatalogo().eeapIdAmortizacion = GI("txtSec").value;
            cat8.getCatalogo().eeapImpAmortizacion = GI("txtImporte").value;
            cat8.getCatalogo().eeapFecAmort = GI("txtFechaFinPer").value;
            cat8.getCatalogo().eeapStEmiamap = "ACTIVO";
            //cat8.getCatalogo().eeapTasaAnti = GI("tasaAmorAnt").value;
            cat8.getCatalogo().eeapPjeAmortizacion = GI("tasaAmorAnt").value;
            
            
            objExisteRegistroParam.id = "emision.verETExiAmoAnt";
          }else if(GI("rdTipoAAP").value == "CI"){
            cat7.getCatalogo().eeciIdPrograma = pkInfo.eemiIdPrograma;
            cat7.getCatalogo().eeciIdFideicomiso = pkInfo.eemiIdFideicomiso;
            cat7.getCatalogo().eeciIdEmision = pkInfo.eemiIdEmision;
            cat7.getCatalogo().eeciIdCapInte = GI("txtSec").value;
            cat7.getCatalogo().eeciImpCapInte = GI("txtImporte").value;
            cat7.getCatalogo().eeciFecCapInte = GI("txtFechaFinPer").value;
            cat7.getCatalogo().eeciStEmicaint = "ACTIVO";
            //cat7.getCatalogo().eeciTasaAnti = GI("tasaAmorAnt").value;
            cat7.getCatalogo().eeciPjeCapInte = GI("tasaAmorAnt").value;
            
            objExisteRegistroParam.id = "emision.verETExiCapInt";
          }else{
            cat6.getCatalogo().eeadIdPrograma = pkInfo.eemiIdPrograma;
            cat6.getCatalogo().eeadIdFideicomiso = pkInfo.eemiIdFideicomiso;
            cat6.getCatalogo().eeadIdEmision = pkInfo.eemiIdEmision;
            cat6.getCatalogo().eeadIdAmortizacion = GI("txtSec").value;
            cat6.getCatalogo().eeadImpAmortizacion = GI("txtImporte").value;
            cat6.getCatalogo().eeadFecAmort = GI("txtFechaFinPer").value;
            cat6.getCatalogo().eeadStEmiamad = "ACTIVO";
            //cat6.getCatalogo().eeadTasaAnti = GI("tasaAmorAnt").value;
            cat6.getCatalogo().eeadPjeAmortizacion = GI("tasaAmorAnt").value;
            
            objExisteRegistroParam.id = "emision.verETExiAmoAdi";
          }
          objExisteRegistroParam.Secuencial = GI("txtSec").value;
          objExisteRegistroParam.Programa = pkInfo.eemiIdPrograma;
          objExisteRegistroParam.Fideicomiso = pkInfo.eemiIdFideicomiso;
          objExisteRegistroParam.Emision = pkInfo.eemiIdEmision;  
          //verificaExisteRegistroGen(objExisteRegistroParam,realizaOperacionAmortizacionCapitalizacion); // funcion no existe
          
          // lineas provisionales-----------------------------------------------
          
          if(GI("rdTipoAAP").value == "AA")
            consultaSecuencial('emision.verETExiAmoAdi',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtSec"); 
          else if(GI("rdTipoAAP").value == "CI")
            consultaSecuencial('emision.verETExiCapInt',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtSec"); 
          else
            consultaSecuencial('emision.verETExiAmoAnt',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","txtSec"); 
           
                    
          // lineas provisionales-----------------------------------------------
        break;
        case OPER_MODIFICAR:
          if(isDefinedAndNotNull(pkInfo2)){
            showWaitLayer();
            if(pkInfo2.tipoReg == "AA"){
              cat6.getCatalogo().eeadImpAmortizacion = GI("txtImporte").value;
              cat6.getCatalogo().eeadFecAmort = GI("txtFechaFinPer").value;
              //cat6.getCatalogo().eeadTasaAnti = GI("tasaAmorAnt").value;
              cat6.getCatalogo().eeadPjeAmortizacion = GI("tasaAmorAnt").value;
              cat6.modificaCatalogo(false);
            }else if(pkInfo2.tipoReg == "CI"){
              cat7.getCatalogo().eeciImpCapInte = GI("txtImporte").value;
              cat7.getCatalogo().eeciFecCapInte = GI("txtFechaFinPer").value;
              //cat7.getCatalogo().eeciTasaAnti = GI("tasaAmorAnt").value;
              cat7.getCatalogo().eeciPjeCapInte = GI("tasaAmorAnt").value;
              cat7.modificaCatalogo(false);
            }else{
              cat8.getCatalogo().eeapImpAmortizacion = GI("txtImporte").value;
              cat8.getCatalogo().eeapFecAmort = GI("txtFechaFinPer").value;
              //cat8.getCatalogo().eeapTasaAnti = GI("tasaAmorAnt").value;
              cat8.getCatalogo().eeapPjeAmortizacion = GI("tasaAmorAnt").value;
              cat8.modificaCatalogo(false);
            }
            
          setTimeout('operacionAmortizacionCapitalizacion()',2000);
          }
          else
          {
            alert("Debe seleccionar un registro de la tabla!");
          }
            
        break;
      }
    }
  }else{
    if(isDefinedAndNotNull(pkInfo2)){
      showWaitLayer();
      if(pkInfo2.tipoReg == "AA")
        cat6.bajaCatalogo(false);
      else if(pkInfo2.tipoReg == "CI")
        cat7.bajaCatalogo(false);
      else
        cat8.bajaCatalogo(false);
        
          setTimeout('operacionAmortizacionCapitalizacion()',2000);
    }else
      alert("Debe seleccionar un registro de la tabla!");
  }
}

function realizaOperacionAmortizacionCapitalizacion(bolRealizaOperacion){
  if(bolRealizaOperacion){
    if(GI("rdTipoAAP").value == "AA")
      cat6.altaCatalogo(false);
    else if(GI("rdTipoAAP").value == "CI")
      cat7.altaCatalogo(false);
    else
      cat8.altaCatalogo(false);
  }else
    hideWaitLayer();
}

function operacionAmortizacionCapitalizacion(){
  
  //cat6.setOnUpdate(avisoOperacionCatalogo);
  //cat7.setOnUpdate(avisoOperacionCatalogo);
  //cat8.setOnUpdate(avisoOperacionCatalogo);
  //alert("Operacion realizada exitosamente!");
  limpiaDatosAmortizacion(GI("tblReg0"),GI("tblReg"),GI("tblReg2"),GI("tblReg3"));
  habilitaPK("txtSec".split(","));
  habilitaPK("eeacIdPeriodo".split(","));
  GI("rdTipoAAP").disabled = false;
  GI("rdTipoCI").disabled = false;
  GI("rdTipoAA").disabled = false;
  //consulta automatica de las tablas de amortizacion y capitalizacion
  var botonTemp = GI("cmdCancelar");
  SA(botonTemp,"ref","emision.conETPriAmor");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg0");
  consultar(botonTemp, GI("frmDatos"), false);
  
  SA(botonTemp,"ref","emision.conETPriAmoAdi");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg");
  consultar(botonTemp, GI("frmDatos"), false);
  
  SA(botonTemp,"ref","emision.conETPriCapInt");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg2");
  consultar(botonTemp, GI("frmDatos"), false);
  
  SA(botonTemp,"ref","emision.conETPriAmoAnt");
  SA(botonTemp,"fun","loadTableElement");
  SA(botonTemp,"tabla","tblReg3");
  consultar(botonTemp, GI("frmDatos"), false);
  
  // consulta fecha inicial amortizacion
  consultaFechaIni('emision.verETExiAmor',"eeacIdPrograma","eeacIdFideicomiso","eeacIdEmision","eeacFecFinAmort");  
        
  
  hideWaitLayer();
}


// secuenciales ------

function consultaSecuencial(qryStr,strPrograma,strFideicomiso,strEmision,strPeriodo)
{
  var objSecAmor = JSON.parse("{}");
  objSecAmor.id = qryStr;
  
  objSecAmor.Programa = GI(strPrograma).value;
  objSecAmor.Fideicomiso = GI(strFideicomiso).value;
  objSecAmor.Emision = GI(strEmision).value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objSecAmor);
  makeAjaxRequest(url,"html",consultaSecuencialRes,strPeriodo);
}

function consultaSecuencialRes(strPeriodo,result)
{
  var resIdSec = JSON.parse(result)[0].secPeriodo;
  var resFecIni= JSON.parse(result)[0].fecInicio;
  GI(strPeriodo).value = resIdSec;
  
  if(strPeriodo=="eeacIdPeriodo")
  {
    GI("eeacFecInicioAmort").value = Number(resIdSec)>1?resFecIni:GI('txtFecIni').value;
    cat5.altaCatalogo();
  }
  else
  {
     if(GI("rdTipoAAP").value == "AA")
     {
        cat6.getCatalogo().eeadIdAmortizacion = GI(strPeriodo).value;
        cat6.altaCatalogo(false);
     }else if(GI("rdTipoAAP").value == "CI")
     {
        cat7.getCatalogo().eeciIdCapInte = GI(strPeriodo).value;
        cat7.altaCatalogo(false);
     }
     else
     {
        cat8.getCatalogo().eeapIdAmortizacion = GI(strPeriodo).value;
        cat8.altaCatalogo(false);  
     }
  }
  
  operacionCatalogo();
}

// fechas iniciales----

function consultaFechaIni(qryStr,strPrograma,strFideicomiso,strEmision,strFecFin)
{
  var objSecAmor = JSON.parse("{}");
  objSecAmor.id = qryStr;
  
  objSecAmor.Programa = GI(strPrograma).value;
  objSecAmor.Fideicomiso = GI(strFideicomiso).value;
  objSecAmor.Emision = GI(strEmision).value;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objSecAmor);
  makeAjaxRequest(url,"html",consultaFechaIniRes,strFecFin);
}

function consultaFechaIniRes(strFecFin,result)
{
  var resIdSec = JSON.parse(result)[0].secPeriodo;
  var resFecIni = JSON.parse(result)[0].fecInicio;
  
  var calFecIni =  Number(resIdSec)>1?resFecIni:GI('txtFecIni').value;
  
  fechasPeriodo(calFecIni,GI('txtFecFin').value);
  GI(strFecFin).value = calFecIni;
    
  cal.manageFields(strFecFin,strFecFin, "%d/%m/%Y");
}

//calendarios (validación periodos)

var fechaDefault = new Date();
function setFechaCal()
{}


var valfecIni;
var valFecFin;

var cal;

function fechasPeriodo(fecIni,fecFin) // establece periodo programa
{
  valfecIni = fecIni;
  valFecFin = fecFin;
  
   cal = CalendarExtended.setup({					
      showTime: 12,    
      date           :    fechaDefault,
      disabled    :    isValidDate,
      onSelect: function(cal) { cal.hide() ; },
      animation: false
    });
}


function isValidDate(date) // valida periodo del progrma
{
  svalfecIni = valfecIni.split("/");// dia mes año
  svalFecFin = valFecFin.split("/"); // dia mes año
  
  var fini = 'undefined'
  var ffin = 'undefined'
  
  if(svalfecIni.length==3)
      fini = new Date(svalfecIni[2],svalfecIni[1]-1,svalfecIni[0]);
  if(svalfecIni.length==3)
      ffin = new Date(svalFecFin[2],svalFecFin[1]-1,svalFecFin[0]);
  
  var cadId = "true";
  
  if(fini=='undefined'&&ffin=='undefined')
     cadId = "false";
  if(fini!='undefined'&&ffin=='undefined')
      cadId += "&&date<fini";
  if(fini=='undefined'&&ffin!='undefined')
      cadId += "&&date>ffin";
  if(fini!='undefined'&&ffin!='undefined')
      cadId += "&&(date<fini||date>ffin)";
  
      if(eval(cadId))
        return true;
      else
        return false;
}

// fin calendario