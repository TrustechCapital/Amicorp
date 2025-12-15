var catRub = new Catalogo("mx.com.inscitech.fiducia.domain.FRubrorep");
var catCueRub = new Catalogo("mx.com.inscitech.fiducia.domain.FCuencoRubro");
var catOperRub = new Catalogo("mx.com.inscitech.fiducia.domain.FOperarubro");

//showWaitLayer();

initForms();


arrRubDat = new Array();
arrRubDat[0] = "facoIdAgrupacion,53px";
arrRubDat[1] = "facoNombreAgrupacion,400px";
arrRubDat[2] = "facoEsEtiqueta,40px";
arrRubDat[3] = "facuNombreImpreso,400px";

  

var fvcatRub = new FormValidator();
var strIdPK = "facoIdAgrupacion";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var modo2 = 0;
var pkInfo2 = null;
pkInfo = null;


var OperacionesSeleccionadas = true;

fvcatRub.setup({
  formName      : "frmMantenimientoAgrupaciones",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});


function clickTabla(pk){
  cloneObject(pk,catRub.getCatalogo());
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  catRub = new Catalogo("mx.com.inscitech.fiducia.domain.FRubrorep");
  catCueRub = new Catalogo("mx.com.inscitech.fiducia.domain.FCuencoRubro");
  catOperRub = new Catalogo("mx.com.inscitech.fiducia.domain.FOperarubro");
  pkInfo = null;
}

function cargaMantenimiento(Modo){
  modo = Modo;
  if((isDefinedAndNotNull(pkInfo) || Modo == OPER_ALTA) && Modo != OPER_BAJA){
    //showWaitLayer();
    
    var urlCliente = "modules/Contabilidad/Agrupaciones/MantenimientoAgrupaciones.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaMantenimientoAgrupaciones, null);
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Agrupaciones/funcionalidadAgrupaciones.js");
    loadDynamicJS(ctxRoot + "/modules/Contabilidad/Agrupaciones/funcionalidadAgrupacionesParaCuentas.js");
    //loadDynamicJS(ctxRoot + "/modules/Contabilidad/Agrupaciones/MantenimientoEstructuraCatalogoGuias.js");
  }else if(isDefinedAndNotNull(pkInfo) && Modo == OPER_BAJA){
    ejecutaOperacionRubro();
  }
  else alert("No has seleccionado ningun registro de la tabla");
}

function despliegaPantallaMantenimientoAgrupaciones(obj, result) {
  GI("dvPantalla").innerHTML = result;
  if(modo == OPER_CONSULTAR || modo == OPER_MODIFICAR){
     //alert(pkInfo.facoNombreAgrupacion);
     GI("paramIdAgrupacion").value=pkInfo.facoIdAgrupacion;
    //deshabilitaPK(arrIdPK);
    if(modo == OPER_CONSULTAR){
      //deshabilitaObjetos(GI("frmMantenimientoAgrupaciones"));
      //deshabilitaObjetos("facoIdAgrupacion,facoNombreAgrupacion,facoEsEtiqueta,facuNombreImpreso");
      SA(GI("facoIdAgrupacion"),"disabled","true");
      SA(GI("facoNombreAgrupacion"),"disabled","true");
      SA(GI("facoEsEtiqueta"),"disabled","true");
      SA(GI("facuNombreImpreso"),"disabled","true");
      muestraObjs("cmdAlta,cmdModificar,cmdBaja,cmdConsultar,dvCuentas,dvRubros");
      GI("cmdCancelar").value = "Regresar";
      muestraObj("cmdCancelar");
      alert("cons2");
    }
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    muestraObjs("cmdAceptar,cmdCancelar");
  asignaValues2ObjHTML();
}
function asignaValues2ObjHTML(){
  alert(modo2+" "+modo3);
  if(isDefinedAndNotNull(pkInfo) && modo != OPER_ALTA){
     alert("cons3");
    catRub.setOnUpdate(cargaComplementoAgrupacion);
    alert("3.2");
    catRub.buscaCatalogoPK(false);
  }else{
    /*var objSecuencialParam = JSON.parse("{}");
    objSecuencialParam.id = "asiValSecGui";
    asignaSecuencial(GI("gunNumGuia"),objSecuencialParam);*/
    hideWaitLayer();
  }
}
function cargaComplementoAgrupacion(){
  alert("cons3.5");
  catRub.setOnUpdate(avisoOperacionCatalogo);
  if(modo2 == 0||modo3==0){
     alert("cons4");
    //GI("paramNumGuia").value = GI("gunNumGuia").value;
    var botonTemp = GI("cmdCancelar");
    SA(botonTemp,"ref","conParamCta");
    SA(botonTemp,"fun","loadTableElement");
    SA(botonTemp,"tabla","tblCuentas");
    consultar(botonTemp, GI("frmMantenimientoAgrupaciones"), false);
    var botonTemp2 = GI("cmdCancelar");
    SA(botonTemp2,"ref","conParamGrup");
    SA(botonTemp2,"fun","loadTableElement");
    SA(botonTemp2,"tabla","tblRubros");
    consultar(botonTemp2, GI("frmMantenimientoAgrupaciones"), false);
    if(modo != OPER_CONSULTAR)
      GI("cmdConsultar").onclick = "";
    
    alert("cons5");
    formsLoaded();
  }
}

function ejecutaOperacionRubro(){
  if(modo == OPER_ALTA){
    if(fvcatRub.checkForm()){
      //showWaitLayer();
      verificaRubro();
    }
  }else if(modo == OPER_MODIFICAR){
    if(fvcatRub.checkForm()){
      //showWaitLayer();
      catRub.setOnUpdate(avisoOperacionCatalogo);
      catRub.modificaCatalogo();
      onButtonClickPestania("Contabilidad.Agrupaciones.PrincipalAgrupaciones","");
      hideWaitLayer();
    }
  }else if(modo == OPER_BAJA){
    //showWaitLayer();
    verificaRubro();
  }
}
function verificaRubro(){
  if(modo == OPER_ALTA){
    var url = ctxRoot + "/getRef.do?json={\"id\":\"verExistRubro\",\"IdAgrupacion\":" + GI("facoIdAgrupacion").value + "}";
    makeAjaxRequest(url, "HTML", validaOperacionRubro, 1);
  }
  if(modo == OPER_BAJA){  
    var url = ctxRoot + "/getRef.do?json={\"id\":\"RubTieneDependen\",\"IdAgrup\":" + catRub.getCatalogo().facoIdAgrupacion + "}";
    makeAjaxRequest(url, "HTML", validaOperacionRubro, 2);
  }
}

function validaOperacionRubro(obj, result){
  alert(result);
  resultado = JSON.parse(result)[0];
  switch(obj){
    case 1:
      if(resultado.yaExisteRubro != 0){
        alert("El Registro ya existe!");
        hideWaitLayer();
      }else{
        catRub.setOnUpdate(avisoOperacionCatalogo);
        catRub.altaCatalogo();
        onButtonClickPestania("Contabilidad.Agrupaciones.PrincipalAgrupaciones","");
        hideWaitLayer();
      }
    break;
    case 2:
      if(resultado.tieneDependencias != 0){
        alert("No se puede dar de baja una Guía que mantenga Transacciones dependientes!");
        hideWaitLayer();
      }else{
        /*var url = ctxRoot + "/doRef.do?json={\"id\":\"delEstGui\",\"NumGuia\":" + catRub.getCatalogo().gunNumGuia + "}";
        makeAjaxRequest(url, "HTML", validaOperacionRubro , 3);*/
        catRub.setOnUpdate(avisoOperacionCatalogo);
        catRub.bajaCatalogo(false);
        onButtonClickPestania("Contabilidad.Agrupaciones.PrincipalAgrupaciones","");
        hideWaitLayer();
      }
    break;
    /*case 3:
      catRub.setOnUpdate(avisoOperacionCatalogo);
      catRub.bajaCatalogo(false);
      onButtonClickPestania("Contabilidad.Agrupaciones.PrincipalAgrupaciones","");
      hideWaitLayer();
    break;*/
  }
}

function activaFuncionalidadDelTipoAgrupacion(rad){
    if(rad==1){
        operacionesSeleccionadas=true;
        asignaEtiqueta("dvTitulo","Cuentas asignadas a este Rubro");
        SA(GI("dvTablaRubros"),"disabled","true");
       //muestraObjs("dvTablaCuentas");
        SA(GI("dvTablaCuentas"),"disabled");
    }
    else{
        operacionesSeleccionadas=false;
        asignaEtiqueta("dvTitulo","Agrupaciones asignados a este Rubro");
        SA(GI("dvTablaCuentas"),"disabled","true");
        //muestraObjs("dvTablaRubros");
        SA(GI("dvTablaRubros"),"disabled");
    }
}