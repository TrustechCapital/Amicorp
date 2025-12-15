function toplink(tabla,llave,campos,valores,opcion)
{
	this.tabla = tabla;
	this.llave = llave;
	this.campos = campos;
	this.valores = valores;
	this.opcion = opcion;
	return this;
}
function toplinkConsultar(tabla,campos,llave)
{
	tlcampos = campos.split(",");
	tlllave = llave.split(",");
	
	var scampos = '*';//cadena campos que selleccionara
    for(i=0;i<tlcampos.length;i++)
    {
      if(i==0)
      {
        scampos += '||'+tlcampos[i]+'||*';
      }
      else
      {
        scampos += ',*||'+tlcampos[i]+'||*';
      }
    }  
    
  var sllave = "";//cadena llave de la consulta
    for(i=0;i<tlllave.length;i++)
    {
      if(i==0)
      {
        sllave += tlllave[i]+' ';
      }
      else
      {
        sllave += ' and '+tlllave[i];
      }
    }  
  
  var tlink = new toplink(tabla,sllave,scampos,'',0);
  toplinkPaquete(tlink);

}

function toplinkPaquete(objtoplink)
{
	var surl = "\"id\":\"ejefunToplink\",";
		surl += "\"tabla\":\""+objtoplink.tabla+"\",";
		surl += "\"llave\":\""+objtoplink.llave+"\",";
		surl += "\"campos\":\""+objtoplink.campos+"\",";
		surl += "\"valores\":\""+objtoplink.valores+"\",";
		surl += "\"opcion\":"+objtoplink.opcion;
	var url = ctxRoot+"/executeRef.do?json={"+surl+"}";
  
  //alert(url);
	makeAjaxRequest(url,'HTML',toplinkPaqueteRespuesta,objtoplink)
}

function toplinkPaqueteRespuesta(objtoplink,result)
{
  
	//alert(result);
	var res = JSON.parse(result).RESULTADO;
	switch(opcion)
	{
		case 0:
			alert(res);
			break;
		case 1:
		case 2:
		case 3:
			alert(res)
			break;
		default:
			alert("ocurrió un error inesperado");
			break;
	}
	
}