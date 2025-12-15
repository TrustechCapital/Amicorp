<%response.setHeader("Content-Disposition","attachment; filename=\"CaendarioPagos.xls\"");%>
<%@ page contentType="application/vnd.ms-excel" %> 
<%@ page import="java.text.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<jsp:useBean id="balance" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%

DecimalFormat decFormat = new DecimalFormat("###,###,###,###,###,###,###,##0.00");
String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;
String tipoAdmin="";

%>
<%
 
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendr�n los elementos de cada tupla
    
    String meses [] = {"","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
    
    BigDecimal numRemorte = new BigDecimal(0);
    String arpDescripcion = "";
    String strCampos[];
    String strCampo="";

    
    int contador=consulta.size();
    int colspan =13;
   
%>

<html>
<head>
<title>CALENDARIO DE PAGOS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width='80%' border="0" align="center">
<tr><td colspan="<%=colspan+3%>"><hr width="960" size="1"> </td></tr>
</table>


<table border='0' align="center"  width='80%' bordercolor='#000000' >
		<tr>		
		<td>
			<table width='80%'>
				<tr>
					<td colspan="<%=colspan%>" align="CENTER"  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td  colspan="<%=colspan%>"><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
				<tr><td  colspan="<%=colspan%>" align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" align height='23'>CALENDARIO DE PAGOS</td></tr>
            </table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='5' colspan ="3"  valign="top"><div align='center'><!--img height='120' src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"--></div></td>					
				</tr>
			</table>
		</td>
	</tr>
</table>	

<table  border="0" cellpadding="1" cellspacing="0" align="center">
          <tr>
               <%
                   if(consulta.size()>0) 
                   {
                     
                     registro = (java.util.Map)consulta.get(0); 
                     
                     arpDescripcion = (String)registro.get("arpDescripcion");
                     strCampos = arpDescripcion.split(";");
                     for(int s=0;s<strCampos.length;s++)
                     {
                        strCampo = strCampos[s];
                  %>
                 <td align="center"  width="100px" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 11px;color: #FFFFFF;font-weight:bold;"><%=strCampo%></td>
                  <%
                     }
                   }
               %>
          </tr>
          <%
           for(int i = 1; i < consulta.size(); i++) 
            {  //Para cada registro
            
            
         %>
          <tr>
         <%
                     registro = (java.util.Map)consulta.get(i); 
                     
                     arpDescripcion = (String)registro.get("arpDescripcion");
                     strCampos = arpDescripcion.split(";");
                     for(int s=0;s<strCampos.length;s++)
                     {
                        strCampo = strCampos[s];
                  %>
                 <td align="center" style="font-family:  Calibri,Arial;	font-size: 11px;color: #000000;font-weight:bold;"><%=strCampo%></td>
                  <%
                     }
            %>
         <%
               } %>
    </table>
         <%
      if(contador==0)
      {
        %>
          <script>alert("No se encontrar�n resultados")</script>
        <%      
      }
      %>
</body>
</html>