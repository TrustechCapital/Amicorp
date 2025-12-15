<!-- EnvioInfo.jsp  -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%@ page import="java.text.*,java.util.*,java.lang.*"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Envío de Información</title>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String nomFiso = "";
    String nombre = "";
    
    String calle = "";
    String num_interno = "";
    String num_externo = "";
    String colonia = "";
    String deleg_muni = "";
    String ciu_pobla = "";
    String pais = "";
    String cod_postal = "";
    String ent_fed = "";

    
 /*  if(consulta.size()>0){
      registro = (java.util.Map)consulta.get(0);    
      
     
    }
  */  
%>

<!--
<table border='0' bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>		
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;">DIVISION FIDUCIARIA</div></td>
				</tr>
        <tr> 
          <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7"></td>
        </tr>
        <tr>
         <td>
           &nbsp;
        </td>
        </tr>
        	<tr><td height='23' align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
				  <%=nomFiso%>
				</td></tr>
        <tr><td></td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
				</tr>
			</table>
		</td>
		</tr>
</table>   
-->
<table style="position:absolute; top:0; left:0;"><tr><td>

  <%
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
              nomFiso=(registro.get("feiNomFide")!=null)?(String)registro.get("feiNomFide"):"";
              nombre = (registro.get("feiNombre")!=null)?(String)registro.get("feiNombre"):"";
              calle = (registro.get("feiCalle")!=null)?(String)registro.get("feiCalle")+" ":"";
              num_interno = (registro.get("feiNumInterno")!=null)?"Int. "+(String)registro.get("feiNumInterno"):"";
              num_externo = (registro.get("feiNumExterno")!=null)?"No. "+(String)registro.get("feiNumExterno")+ ", ":"";
              colonia = (registro.get("feiColonia")!=null)?"Col. "+(String)registro.get("feiColonia") + ", ":"";
              deleg_muni = (registro.get("feiDelMun")!=null)?(String)registro.get("feiDelMun"):"";
              ciu_pobla = (registro.get("feiCiuPob")!=null)?(String)registro.get("feiCiuPob")+" ":"";
              cod_postal = (registro.get("feiCodPostal")!=null)?"C.P. "+(String)registro.get("feiCodPostal"):"";
              pais = (registro.get("feiPais")!=null)?(String)registro.get("feiPais") + ", ":"";
              ent_fed = (registro.get("feiEntFed")!=null)?(String)registro.get("feiEntFed"):"";
                  
              //Obtener datos de la BD
          //  
  %>

  <table border='0' bordercolor='#000000' bgcolor='#FFFFFF'>
      <tr>		
      <td>
        <table width='612'>
          <tr>
            <td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
          </tr>
          <tr>
            <td><div align='center' style="font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
          </tr>
          <tr>
           <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
             <%= nomFiso%>
           </td>
          </tr>
            <tr><td >&nbsp;
          </td></tr>
          <tr><td></td></tr>
        </table>
      </td>
      <td>
        <table> 
          <tr>
            <td width='151' height='91'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
          </tr>
        </table>
      </td>
      </tr>
  </table>     
  
<table border="0" cellspacing="1" cellpadding="1" style="font-family: Arial;	font-size:13px;position:absolute;left:70; width:300;">
    <tr><td><%=nombre%></td></tr>
    <tr><td><%=calle%><%=num_externo%><%=num_interno%></td></tr>
    <tr><td><%=colonia%><%=deleg_muni%></td></tr>
    <tr><td><%=ciu_pobla%><%=cod_postal%></td></tr>
    <tr><td><%=pais%><%=ent_fed%></td></tr>
</table>


<table><tr><td height="560">&nbsp;</td></tr></table>
  <%}%>

</td></tr></table>  


</body>
</html>