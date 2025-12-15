
function getEventosFeeder()
{ 
  var objEventosFeeder = JSON.parse("{}");
  objEventosFeeder.id = "qryConsultaAgendaFeeder";
  //objEventosFeeder.numUsu = ""+ctxUser;
  objEventosFeeder.fecEvento = ctxFeccont;
  objEventosFeeder.order = "s";
  
  var url = ctxRoot+"/getRef.do?json="+JSON.stringify(objEventosFeeder);
  
  makeAjaxRequest(url,"html",getEventosFeederRes,null);
}

function getEventosFeederRes(obj,result)
{
  var feedEventos = JSON.parse(result);
  var nfeeds = feedEventos.length;
  var nfeedsuser = 0;
  
  var dvFeeder = "<div class='rel'>";
  dvFeeder += "<div id='dvFeederHead'>Eventos ("+nfeeds+")</div>";
  
  dvFeeder += "<div id='dvFeederScroll'><div class='rel'>";
  
  for(s=0;s<nfeeds;s++)
  {
    var feedEvento = feedEventos[s]; 
    
    var binvolucrado = (feedEvento.eageStrUsuarios.indexOf(','+ctxUser+',')>-1);
    var beventofin = (feedEvento.eageIdSubfolio==feedEvento.eageFinEventos);
    if(binvolucrado||beventofin)
    {
      nfeedsuser++;
      
      dvFeeder += "<div class='dvFeederEvent' style='top:"+((nfeedsuser-1)*50)+"px;'>";
      
      dvFeeder += "<table class='dvFeederEventTable'><tr>";
      dvFeeder += "<td class='dvFeederFecha"+(feedEvento.eageCveStatus=='PENDIENTE'?'Red':'')+"' align='left'>"+feedEvento.eageFecEvento+"</td>";
      dvFeeder += "<td rowspan=2 align='left' valign='top'>"+feedEvento.eageDesEvento+(beventofin?"<b> (ULTIMO EVENTO)</b> ":"")+"</td>";
      dvFeeder += "</tr><tr>";
      dvFeeder += "<td align='left'><b>"+feedEvento.eageIdFolio+"</b></td>";
      dvFeeder += "</tr></table>";
      
      dvFeeder += "</div>";
    }
  }
  
  dvFeeder += "</div></div>";
  dvFeeder += "</div>";
  
  GI("dvFeeder").innerHTML=dvFeeder;
  GI("dvFeederHead").innerHTML="Eventos ("+nfeedsuser+")";
  
}

getEventosFeeder();