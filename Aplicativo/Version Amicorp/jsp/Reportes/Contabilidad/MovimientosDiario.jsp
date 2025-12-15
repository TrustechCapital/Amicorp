<!-- EstadoCuenta.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%@ page import="java.text.*,java.util.*,java.lang.*"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Movimientos por Periodo</title>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;

    //Variables que contendrán los elementos de cada tupla

    BigDecimal numFiso = new BigDecimal(0);
    String nomFiso = "";
    String periodo = "";
    
    //String nomScta = "";
    
    BigDecimal folio = new BigDecimal(0);
    String scta = "";
    String cuenta = "";
    String fecha = "";
    String descripcion = "";;
    String cargos = "";
    String abonos = "";
    String saldoParcial = "";
    
    if(consulta.size()>0){
      registro = (java.util.Map)consulta.get(0);    
      numFiso=(BigDecimal)registro.get("fmdNumFideicomiso");// ajustar nombres al procedure
      nomFiso=(String)registro.get("fmdNomFideicomiso");
      periodo = (String)registro.get("fmdPeriodo");
    }      
           
%>
<table border='0' bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>		
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
        <tr> 
          <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7">MOVIMIENTOS DEL 
          <%= periodo%></td>
        </tr>
        <tr>
         <td>
           &nbsp;
        </td>
        </tr>
        	<tr><td height='23' align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
				  <%= nomFiso%>
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

<br>
    <table border="0" cellspacing="1" cellpadding="1" align="center" style="font-family: Arial;	font-size: 10px;">
       <tr>
        <th colspan="2" nowrap align="center">&nbsp;</th>
        <td  nowrap align="center">&nbsp;</td>
        <td colspan="2" nowrap align="center">&nbsp;</td>
        <th nowrap align="center"></th>
        <th colspan="2" nowrap align="center">&nbsp;</th>
         </tr>
         <tr>
        <th colspan="8" nowrap align="center" height="20"></th>
         </tr>
      <tr>
        <th  nowrap align="center">Folio</th>
        <th  nowrap align="center">Fecha</th>        
        <th  nowrap align="center" width="200">Cuenta</th>
        <th  nowrap align="center" width="200">Subcuenta</th>
        <th  nowrap align="center">Descripción</th>
        <th  nowrap align="center" width="100">Cargos</th>
        <th  nowrap align="center" width="100">Abonos</th>
        <th  nowrap align="center" width="100">Saldo Parcial</th>     
      </tr>

        <%
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
                folio = (BigDecimal)registro.get("fmdFolio");
                fecha = (String)registro.get("fmdFecha");
                scta=(String)registro.get("fmdNumSubcuenta");
                cuenta = (String)registro.get("fmdCuenta");
                descripcion = (String)registro.get("fmdDescripcion");
                cargos = (String)registro.get("fmdCargo");
                abonos = (String)registro.get("fmdAbono");
                saldoParcial = (String)registro.get("fmdSaldo");
                
              //Obtener datos de la BD
          //  
                %>
        <tr>
        <%if(descripcion.equals("SALTO")==false){%>
          <td align="center"  nowrap><%=folio%></td>
          <td align="center"  nowrap><%=fecha%></td>          
          <td align="center"  nowrap width="200"><%=cuenta%></td>
          <td align="center"  nowrap width="200"><%=scta%></td>
          <td align="left"  nowrap><%=descripcion%></td>
          <td align="right"  nowrap><%=cargos%></td>
          <td align="right" nowrap><%=abonos%></td>
          <td align="right"  nowrap><%=saldoParcial%></td>
         
        <%}else{%>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
        <%}%>
       </tr>
      <tr>
      </tr>
      <% 
      }
      %>
    </table>
  </body>
</html>