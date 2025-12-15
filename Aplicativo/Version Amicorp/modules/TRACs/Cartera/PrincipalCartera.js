//var catTracs = new Catalogo("mx.com.inscitech.fiducia.domain.FCartera");

showWaitLayer();

var ALTA = 1;
var MODIFICAR = 2;
var CONSULTAR = 3;

var cmbFideicomisoTrac = JSON.parse("{}");

var tablaCarteraData = new Array();
tablaCarteraData[0] = "temIdFolio,50px";
tablaCarteraData[1] = "temFecMovto,80px";
tablaCarteraData[2] = "temIdSerie,80px";
tablaCarteraData[3] = "temIdPizarra,80px";
tablaCarteraData[4] = "temCerCirculacion,100px";
tablaCarteraData[5] = "temCerCreados,100px";
tablaCarteraData[6] = "temCerRedimidos,100px";
tablaCarteraData[7] = "temPrecioTeorico,80px";
tablaCarteraData[8] = "temValorCanasta,100px";
tablaCarteraData[9] = "temValorActivos,100px";
tablaCarteraData[10] = "temNumUnidad,100px";
tablaCarteraData[11] = "temCuentaGastos,80px";

//--calendario
var fechaDefault = new Date();
var cal = CalendarExtended.setup({					
		showTime: 12,    
    date           :    fechaDefault,
    disableFunc    :    isValidDate,
		onSelect: function(cal) { cal.hide() ; },
    animation: false
})
function setFechaCal(){}
function isValidDate(date){ 
  var today = new Date();
  if(date > today)
    return true;
  else
    return false;
}

cal.manageFields("paramfecha", "paramfecha", "%d/%m/%Y");

fechaTrack(GI("paramfecha"));

//--calendario



function consultarCartera()//consulta f_track
{
  var surl = "\"id\":\"consultaCarteraTRACs\",";
  surl += "\"fiso\":"+GI('paramfiso').value+",";
  surl += "\"fecha\":\""+GI('paramfecha').value+"\"";
  
  var url= ctxRoot+"/getRef.do?json={"+surl+"}";
  makeAjaxRequest(url,"HTML",consultarCarteraResp,null);
}

function consultarCarteraResp(obj,result)//asigna valores a la cartera
{
  var res = JSON.parse(result)[0];
                   
  var cartera = new carteraTrac(fecTrac,
                                res.temIdSerie,
                                res.temIdPizarra,
                                res.temCerCirculacion,
                                res.temCerCreados,
                                res.temCerRedimidos,
                                res.temValorCanasta,
                                res.temNumTracs,
                                res.temNumUnidad,
                                res.temValorActivos,
                                res.temCuentaGastos,
                                null,null,res.temNumTitulos,res.temPrecioTra,res.temValorActivos,null,null,null,null,null
                                );
  llenaCartera(cartera);
                                
}

function llenaCartera(cartera)
{
    //cartera
    GI('carFideicomiso').innerHTML = GI('paramfiso').options[GI('paramfiso').selectedIndex].text;
    GI('carFecha').innerHTML = cartera.fecha;
    GI('carPizarra').innerHTML = cartera.pizarra; 
    GI('carSerie').innerHTML = cartera.serie;
    GI('carCerCirculacion').innerHTML = cartera.ncer;
    GI('carCerCreados').innerHTML = cartera.ncercre;
    GI('carCerRedimidos').innerHTML = cartera.ncerred;
    GI('carValCanasta').innerHTML = cartera.vcanasta;
    GI('carNumNaftracs').innerHTML = cartera.naftracs;
    GI('carCerUnidad').innerHTML = cartera.nceruni;
    GI('carValActivos').innerHTML = cartera.vactivos;
    GI('carCtaGastos').innerHTML = cartera.cuenta;
    
    //tabla A
    GI('anumTitulos').innerHTML = cartera.titulosA;
    GI('aprecioNaftrac').innerHTML = cartera.precioA;
    GI('avalorMercado').innerHTML = cartera.vmercadoA;
    
    
    GI('arcCartera').style.visibility = 'visible';
    
}

function carteraTrac(fecha,serie,pizarra,ncer,ncercre,ncerred,vcanasta,naftracs,nceruni,vactivos,cuenta,
                    emisoraA,serieA,titulosA,precioA,vmercadoA,contratoB,serieB,contratosB,precioB,vcontableB)
{
    this.fecha = fecha;//ficha
    this.serie = serie;
    this.pizarra = pizarra;
    this.ncer = ncer;
    this.ncercre = ncercre;
    this.ncerred = ncerred;
    this.vcanasta = vcanasta;
    this.naftracs = naftracs;
    this.nceruni = nceruni;
    this.cuenta = cuenta;
    this.vactivos = vactivos;
    
    this.emisoraA = emisoraA;//tabla A
    this.serieA = serieA;
    this.titulosA = titulosA;
    this.precioA = precioA;
    this.vmercadoA = vmercadoA;
    
    this.contratoB = contratoB;//tabla B
    this.serieB = serieB;
    this.contratosB = contratosB;
    this.precioB = precioB;
    this.vcontableB = vcontableB;

    return this;
}	

var fvMantenimiento = new FormValidator();

fvMantenimiento.setup({
  formName      : "frmDatos",
  tipoAlert     : 1,
  alertFunction : BaloonAlert,
  sendObjToAlert: true
});

pkInfo=null;

initForms();
formsLoaded();

