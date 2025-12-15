showWaitLayer();

var cat = new Catalogo("mx.com.inscitech.fiducia.domain.FEmirend");
var cat2 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiinte");
var cat3 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiinst");
var cat4 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiproi");
var cat5 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiamorc");
var cat6 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiamad");
var cat7 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmicaint");
var cat8 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmiamap");
var cat9 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmipago");
var cat10 = new Catalogo("mx.com.inscitech.fiducia.domain.FEmidiasf");


//var cmbFideicomisoParam = JSON.parse("{\"NumPrograma\":-1,\"order\":\"S\"}");
//var cmbEmisionParam = JSON.parse("{\"NumPrograma\":-1,\"NumFideicomiso\":-1,\"order\":\"S\"}");
var cmbFideicomisoParam = JSON.parse("{\"order\":\"S\"}");
var cmbEmisionParam = JSON.parse("{\"order\":\"S\"}");

var cmbPrograma = JSON.parse("{\"IdEmisor\":-1,\"order\":\"S\",\"Status\":\"ACTIVO\"}");
var cmbFideicomiso = JSON.parse("{\"idEmisor\":\"-1\",\"order\":\"s\"}");

var fvCat = new FormValidator();
var strIdPK = "idRC,txtPrograma,txtFideicomiso,txtEmision,txtPizarra,txtSerie,txtMoneda,txtImporteVNT,txtImporteVN,txtMontoC,txtTitulos,txtPlazo,txtFecIni,txtFecFin";
var arrIdPK = strIdPK.split(",");
var modo = 0;
var modo2 = 0;
pkInfo = null;
pkInfo2 = null;

var arrTblDat = new Array();
arrTblDat[0] = "idRc,50px";
arrTblDat[1] = "eemiIdPrograma,100px";
arrTblDat[2] = "eproNomPrograma,250px";
arrTblDat[3] = "eemiIdFideicomiso,100px";
arrTblDat[4] = "ctoNomContrato,250px";
arrTblDat[5] = "eemiCvePizarra,100px";
arrTblDat[6] = "eemiNumSerie,100px";
arrTblDat[7] = "eemiNumMoneda,100px";
arrTblDat[8] = "eemiImpEmision,100px";
arrTblDat[9] = "eemiImpNomEmision,100px";
arrTblDat[10] = "eemiNumTitulos,100px";
arrTblDat[11] = "eemiPlazo,100px";

fvCat.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

initForms();

function clickTabla(pk){
  pkInfo = pk;
}

function limpiar(objForma){
  RF(objForma);
  pkInfo = null;
  pkInfo2 = null;
}

function cargaComboSiguiente(objCmb){
  if(objCmb.id == "numEmision")
  {
     var objEmision = JSON.parse("{}");
    objEmision.id = "conETCmbEmiAsgPrgFid";
    objEmision.NumPrograma =  objCmb.value;
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objEmision);
    makeAjaxRequest(url, "HTML", cargaComboSiguienteRes, null);
  }
}

function cargaComboSiguienteRes(obj,result)
{
  resultado = JSON.parse(result)[0];
  
  GI("paramNumPrograma").value = resultado.eemiIdPrograma;
  GI("paramNumFiso").value = resultado.eemiIdFideicomiso;
  
}

function cargaDetalleParametrosCalculo(opc){
  if(opc == 1 && isDefinedAndNotNull(pkInfo)){
    showWaitLayer();
    var urlCliente = "modules/EmisionTitulos/ParametrosCalculo/MantenimientoParametrosCalculo.do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaDetalleParametrosCalculo, null);
  }else if (opc == 2)
  {
    setSaveInnerHTML('dvPantalla','MantenimientoParametrosCalculo',true);
    var radios = document.getElementsByName("rdOpcion");
    for(var j = 0; j < radios.length; j++)
			radios[j].checked = false;
         
      GI("cmdAltaPrincipal").disabled = true;
      GI("cmdModificarPrincipal").disabled = true
      GI("cmdConsultarPrincipal").disabled = true;  
    
  }
  
   
   
}

function despliegaPantallaDetalleParametrosCalculo(obj, result) {
  GI("dvPantalla").innerHTML = result;
  deshabilitaPK(arrIdPK);
  asignaValues2ObjHTML();
}

function asignaValues2ObjHTML(){
  if(isDefinedAndNotNull(pkInfo)){
    GI("txtPrograma").value = pkInfo.eemiIdPrograma;
    GI("dvPrograma").innerHTML = pkInfo.eproNomPrograma;
    
    GI("idRC").value = pkInfo.idRc;
    
    if(pkInfo.eemiIdFideicomiso==0)
    {
      GI("txtFideicomiso").value = pkInfo.eemiIdFideicomiso;
      GI("txtFideicomiso").style.visibility = "hidden";
      GI("dvFid").innerHTML = "";
      GI("dvFideicomiso").innerHTML = "";
    }
    else
    {
      GI("txtFideicomiso").value = pkInfo.eemiIdFideicomiso;
      GI("dvFideicomiso").innerHTML = pkInfo.ctoNomContrato;
   }
    GI("txtEmision").value = pkInfo.eemiIdEmision;
    GI("txtPizarra").value = pkInfo.eemiCvePizarra;
    GI("txtSerie").value = pkInfo.eemiNumSerie;
    
    GI("txtMoneda").value = pkInfo.eemiNumMoneda;
    GI("txtImporteVNT").value = pkInfo.eemiImpEmision;
    GI("txtImporteVN").value = pkInfo.eemiImpNomEmision;
    //GI("txtMontoC").value = pkInfo.eemiAlgo;
    GI("txtTitulos").value = pkInfo.eemiNumTitulos;
    GI("txtPlazo").value = pkInfo.eemiPlazo;
    
    consultaFechaEmision(GI("txtPrograma").value,GI("txtFideicomiso").value,GI("txtEmision").value);
  }
  formsLoaded();
}

function validaTipoOperacionOpcionParametrosCalculo(strRdMaster, objRdActual){
  GI("cmdAltaPrincipal").disabled = true;
  GI("cmdModificarPrincipal").disabled = true
  GI("cmdConsultarPrincipal").disabled = true;
  asignaValueRadio2Master(strRdMaster,objRdActual);
  if(objRdActual.id != "rdDiasFeriados")
  {
    var objExisteRegistroParam = JSON.parse("{}");
    objExisteRegistroParam.id = objRdActual.ref;
    objExisteRegistroParam.Programa = pkInfo.eemiIdPrograma;
    objExisteRegistroParam.Fideicomiso = pkInfo.eemiIdFideicomiso;
    objExisteRegistroParam.Emision = pkInfo.eemiIdEmision;  
    showWaitLayer();
    var url = ctxRoot + "/getRef.do?json=" + JSON.stringify(objExisteRegistroParam);
    makeAjaxRequest(url, "HTML", muestraBtnOperacionParametrosCalculo, null);
  }
  else
  {
    GI("cmdModificarPrincipal").disabled = false
    GI("cmdConsultarPrincipal").disabled = false;
    GI("cmdAltaPrincipal").disabled = false;
  }
  
  if(objRdActual.id == "rdInstrumentos"){
    showWaitLayer();
    /*cat.getCatalogo().eereIdPrograma = pkInfo.eemiIdPrograma;
    cat.getCatalogo().eereIdFideicomiso = pkInfo.eemiIdFideicomiso;
    cat.getCatalogo().eereIdEmision = pkInfo.eemiIdEmision;
    //cat.setOnUpdate(permiteCapturaInstrumentos);
    cat.buscaCatalogoPK(false);*/
    permiteCapturaInstrumentos(pkInfo.eemiIdPrograma,pkInfo.eemiIdFideicomiso,pkInfo.eemiIdEmision);
  }
}

function muestraBtnOperacionParametrosCalculo(obj, result){
  resultado = JSON.parse(result)[0];
  if(resultado.existeRegistro != 0){
    GI("cmdModificarPrincipal").disabled = false
    GI("cmdConsultarPrincipal").disabled = false;
  }else
    GI("cmdAltaPrincipal").disabled = false;
  hideWaitLayer();
}

function permiteCapturaInstrumentos(vprograma,vfiso,vemision)
{
    var objEmision = JSON.parse("{}");
  objEmision.id = "emision.verETExiTasRen";
  objEmision.Programa = vprograma;
  objEmision.Fideicomiso = vfiso;
  objEmision.Emision = vemision;
  objEmision.TipoCalculo = 1;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objEmision);
  makeAjaxRequest(url,"html",permiteCapturaInstrumentosRes,null);
  
}

function permiteCapturaInstrumentosRes(obj,result)
{
  var res = JSON.parse(result)[0];
  
  if(res.existeRegistro>0)
  {
    GI("cmdModificarPrincipal").disabled = true
    GI("cmdConsultarPrincipal").disabled = true;
    GI("cmdAltaPrincipal").disabled = true;
    alert("No puede registrar Instrumentos con el parámetro de Tasa Fija");
  }
  /*else
  {
    if(cat.getCatalogo() == null){
        GI("cmdModificarPrincipal").disabled = true
        GI("cmdConsultarPrincipal").disabled = true;
        GI("cmdAltaPrincipal").disabled = false;
    }else {
        GI("cmdModificarPrincipal").disabled = false
        GI("cmdConsultarPrincipal").disabled = false;
        GI("cmdAltaPrincipal").disabled = true;
    }
  }*/
  hideWaitLayer();
}

function cargaOpcionParametrosCalculo(Modo){
  modo = Modo;
  if(isDefinedAndNotNull(pkInfo) && fvCat.checkForm()){
    showWaitLayer();
    saveInnerHTML("dvPantalla", "MantenimientoParametrosCalculo");
    var urlCliente = "modules/EmisionTitulos/" + GI("rdOpcion").value.substring(9) + "/" + GI("rdOpcion").value + ".do";
    makeAjaxRequest(urlCliente, "HTML", despliegaPantallaOpcion, GI("rdOpcion").value);
    loadDynamicJS(ctxRoot + "/modules/EmisionTitulos/" + GI("rdOpcion").value.substring(9) + "/" + GI("rdOpcion").value + ".js");
  }
}

function despliegaPantallaOpcion(obj, result){
  GI("dvContenido2").innerHTML = result;
  initForms();
  ocultaObjs("cmdAltaPrincipal,cmdModificarPrincipal,cmdConsultarPrincipal");
  if(modo == OPER_CONSULTAR){
    deshabilitaObjetos(GI("frmDatos"));
    GI("cmdCancelar").value = "Regresar";
    muestraObj("cmdCancelar");
  }
  if(modo == OPER_ALTA || modo == OPER_MODIFICAR)
    
    muestraObjs("cmdAceptar,cmdCancelar");
  eval("despliegaPantalla" + obj + "();");
  initForms();
  hideWaitLayer();
}

// funcion pestañas

function mouse(obj,cadena)
{
  //var celdas = ['td_rdOpcion','td_rdInstrumentos','td_rdProteccionVsInflacion','td_rdAmortizacion','td_rdPagos','td_rdDiasFeriados'];
  var celdas = ['td_rdOpcion','td_rdInstrumentos','td_rdAmortizacion','td_rdPagos'];

  if(cadena=='pestaniaEmisionSobre'||cadena=='pestaniaEmision')
  {
    if(!(GI(obj.id.replace("td_","")).checked))
    {
      var img_obj = ((cadena=='pestaniaEmisionSobre')?"imagenes/PesLateralSobreEmi.png":"imagenes/PesLateralEmi.png");
      obj.style.background = "url('"+img_obj+"')";
      obj.style.backgroundRepeat = "no-repeat";
    }
  }
  else
  {
    if(GI(cadena).disabled == false)
    {
      for(s=0;s<celdas.length;s++)
      {
        if(celdas[s]!="td_"+cadena)
        {
          GI(celdas[s]).style.background = "url('imagenes/PesLateralEmi.png')";
          GI(celdas[s]).style.backgroundRepeat = "no-repeat";
        }
        
      }
        
      
      GI(cadena).click();
      
    }
  }


}

// combos dependen emisor-------------------

function cargaProgFid(comboEmisor,comboPrograma,comboFideicomiso)
{
  cmbPrograma = JSON.parse("{\"IdEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"S\",\"Status\":\"ACTIVO\"}");
   cmbFideicomiso = JSON.parse("{\"idEmisor\":"+numIdRC(comboEmisor.value)+",\"order\":\"s\"}");
   
    loadElement(comboPrograma);
    loadElement(comboFideicomiso);
   
    setTimeout("cargaProgFidValores('"+comboPrograma.id+"','"+comboFideicomiso.id+"')",2000); 
}

function cargaProgFidValores(idCmbPrograma,idCmbFideicomiso)
{

    if(GI(idCmbPrograma).options.length==1)
      {
        GI(idCmbPrograma).selectedIndex=0;
        //habilitaCampos(idCmbPrograma);
      }
     else
     {
      GI(idCmbPrograma).selectedIndex=1;
      //deshabilitaCampos(idCmbPrograma);
    }
    
    if(GI(idCmbFideicomiso).options.length==1)
      {
        
        GI(idCmbFideicomiso).selectedIndex=0;
        //habilitaCampos(idCmbFideicomiso);
      }
     else
     {
        GI(idCmbFideicomiso).selectedIndex=1;
        //deshabilitaCampos(idCmbFideicomiso);
    }   
}


// Fechas Emisión
function consultaFechaEmision(vprograma,vfiso,vemision)
{
  var objFecEmision = JSON.parse("{}");
  objFecEmision.id = "conETPriDatGen";
  objFecEmision.NumPrograma = vprograma;
  objFecEmision.NumFiso = vfiso;
  objFecEmision.NumEmision = vemision;
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objFecEmision);
  makeAjaxRequest(url,"html",consultaFechaEmisionRes,null);
}

function consultaFechaEmisionRes(obj,result)
{
  var res = JSON.parse(result);
  
  if(res.length>0)
  {
     GI('txtFecIni').value = res[0].eemiFecInicio;
     GI('txtFecFin').value = res[0].eemiFecVencimiento;
  }
}