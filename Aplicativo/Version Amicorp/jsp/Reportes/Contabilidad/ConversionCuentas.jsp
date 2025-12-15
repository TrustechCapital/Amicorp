<!-- ConversionCuentas.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">
  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla

    BigDecimal ctami = new BigDecimal(0);
    BigDecimal sctai = new BigDecimal(0);
    BigDecimal ssctai = new BigDecimal(0);
    BigDecimal sssctai = new BigDecimal(0);
    BigDecimal ssssctai = new BigDecimal(0);
    BigDecimal sssssctai = new BigDecimal(0);
    
    BigDecimal ctamo = new BigDecimal(0);
    BigDecimal sctao = new BigDecimal(0);
    BigDecimal ssctao = new BigDecimal(0);
    BigDecimal sssctao = new BigDecimal(0);
    BigDecimal ssssctao = new BigDecimal(0);
    BigDecimal sssssctao = new BigDecimal(0);
%>



<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='738'>
				<tr>
					<td align="CENTER" class='style15'><span class="style14">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</span></td>
				</tr>
				<tr>
					<td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr>
        <td><div align='center' class='style15'><span class='style16'>CONVERSION DE CUENTAS</span></div></td>
      </tr>
      <tr><td height='23'>&nbsp;</td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
					
				</tr>
			</table>
		</td>
		</tr>
		</table> 
		


<br>
        
    <table border="1" cellspacing="0" cellpadding="1" style="font-size:8pt">
       <tr>
        <th colspan="12" nowrap align="center">CUENTAS INTERNAS</th>
        <th colspan="12" nowrap align="center">CUENTAS INSTITUCIONALES</th>
         </tr>
      <tr>
        <th colspan="2" nowrap align="center">CTA</th>
        <th colspan="2" nowrap align="center">SCTA</th>
        <th colspan="2" nowrap align="center">SSCTA</th>
        <th colspan="2" nowrap align="center">SSSCTA</th>
        <th colspan="2" nowrap align="center">SSSSCTA</th>
        <th colspan="2" nowrap align="center">SSSSSCTA</th>
        <th colspan="2" nowrap align="center" width="30">CTA</th>
        <th colspan="2" nowrap align="center">SCTA</th>
        <th colspan="2" nowrap align="center">SSCTA</th>
        <th colspan="2" nowrap align="center">SSSCTA</th>
        <th colspan="2" nowrap align="center">SSSSCTA</th>
        <th colspan="2" nowrap align="center">SSSSSCTA</th>
      </tr>

        <%
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
              //Obtener datos de la BD
              ctami =(BigDecimal)registro.get("ctamCtaClien");
              sctai =(BigDecimal)registro.get("ctamSctaClien");
              ssctai =(BigDecimal)registro.get("ctamSsctaClien");
              sssctai =(BigDecimal)registro.get("ctamSssctaClien");
              ssssctai =(BigDecimal)registro.get("ctamSsssctaClien");
              sssssctai =(BigDecimal)registro.get("ctamSssssctaClien");
              
              ctamo =(BigDecimal)registro.get("ctamCtaOrden");
              sctao =(BigDecimal)registro.get("ctamSctaOrden");
              ssctao =(BigDecimal)registro.get("ctamSsctaOrden");
              sssctao =(BigDecimal)registro.get("ctamSssctaOrden");
              ssssctao =(BigDecimal)registro.get("ctamSsssctaOrden");
              sssssctao =(BigDecimal)registro.get("ctamSssssctaOrden");
          //  }
                %>
        <tr border="0">
          <td  border="0" align="left" colspan="2" nowrap><%=ctami.intValue() != 0?ctami.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sctai.intValue() != 0?sctai.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=ssctai.intValue() != 0?ssctai.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sssctai.intValue() != 0?sssctai.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=ssssctai.intValue() != 0?ssssctai.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sssssctai.intValue() != 0?sssssctai.toString():"&nbsp;"%></td>
          
          <td align="left" colspan="2" nowrap><%=ctamo.intValue() != 0?ctamo.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sctao.intValue() != 0?sctao.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=ssctao.intValue() != 0?ssctao.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sssctao.intValue() != 0?sssctao.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=ssssctao.intValue() != 0?ssssctao.toString():"&nbsp;"%></td>
          <td align="left" colspan="2" nowrap><%=sssssctao.intValue() != 0?sssssctao.toString():"&nbsp;"%></td>
        </tr>
      <tr>
      </tr>
      <% 

      }
                %>
    </table>
  </body>
</html>