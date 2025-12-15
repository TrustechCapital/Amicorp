

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
    
    //Variables que contendrán los elementos de cada tupla
    
    String meses [] = {"","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
    String fec_reporte = request.getParameter("fechaReporte")!=null?Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[0])+" de "+meses[Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[1])]+" de "+Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[2]):"";

    BigDecimal numProspecto = new BigDecimal(0);
    String nomProspecto = "";
    String fecha = "";
    String nomUsuario="";
    String seguimiento="";
    
    int contador=0;
   
%>

<html>
<head>
<title>REPORTE SEGUIMIENTO DE PROYECTO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' align="center" bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>		
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>					
				</tr>
			</table>
		</td>
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER"  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"></div></td>
				</tr>
				<tr><td height='23'>&nbsp;</td></tr>
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">REPORTE DE SEGUIMIENTO DE PROYECTO</td></tr>
			</table>
		</td>
	</tr>
</table>	
	
          <P>&nbsp;</P>



<table width="960"  border="0" cellpadding="2" cellspacing="0" align="center">
    <tr>
        <td colspan="10" align='center'  style="font-family: Segoe UI, Calibri ,Arial;	font-size: 14px;color: #000000;font-weight: bold; height:30px;">Tabla de Seguimiento</td>
    </tr>
          <tr style="font-family: Segoe UI, Calibri ,Arial;font-size: 14px;font-weight: bold;height:30px;" bgcolor="#BBBBBB">
              <td align="center" width="50">No.</td>
              <td align="center" width="300">Proyecto</td>
              <td align="center" width="100">Fecha</td>
              <td align="center" width="200">Usuario</td>
              <td align="center" width="150">Seguimiento</td>  
          </tr>
          <%
           for(int i = 0; i < consulta.size(); i++) 
            {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
              numProspecto=(BigDecimal)registro.get("fspNumProspecto");
              nomProspecto=(String)registro.get("fspNomProspecto");
              fecha = (String)registro.get("fspFechaFormatted");
              nomUsuario = (String)registro.get("fspNomUsuario");
              seguimiento = (String)registro.get("fspSeguimiento");
              
              contador++;
          %>
          <tr style="font-family: Segoe UI, Calibri ,Arial;	font-size: 13px;color: #000000;text-align:right;height:25px;">  
            <td align="right" width="50"><%=numProspecto%></td>
            <td align="right" width="300" ><%=nomProspecto%></td>   
            <td align="right" width="100" ><%=fecha%></td>   
            <td align="right" width="200" ><%=nomUsuario%></td>   
            <td align="right" width="150" ><%=seguimiento%></td>   
                                      
          </tr>
             
      <% } %>
    </table>
         <%
      if(contador==0)
      {
        %>
          <script>alert("No se encontrarón resultados")</script>
        <%      
      }
      %>
</body>
</html>