

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

    BigDecimal numFolio = new BigDecimal(0);
    BigDecimal numContrato = new BigDecimal(0);
    BigDecimal numSubContrato = new BigDecimal(0);
    String fecha = "";
    String descripcion="";
    String periodicidad="";
    BigDecimal eventos= new BigDecimal(0);
    String estatus="";

    
    int contador=0;
   
%>

<html>
<head>
<title>REPORTE AGENDA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>		
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
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">REPORTE AGENDA DE EVENTOS<%=request.getParameter("fechaReporte")!=null?"&nbsp;&nbsp;&nbsp("+fec_reporte+")":session.getAttribute("strFechaContable")!=null?"&nbsp;&nbsp;&nbsp;("+session.getAttribute("strFechaContable")+")":""%></td></tr>
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
	
          <P>&nbsp;</P>



<table width="960"  border="0" cellpadding="2" cellspacing="0" align="center">
          <tr ><td colspan="10" align='center'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">&nbsp;</td></tr>
          <tr>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Folio</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">No. Fideicomiso</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">No. Subcuenta</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Fecha</td>
              <td align="center" width="400" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Descripción</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Periodicidad</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Eventos</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Estatus</td>   
          </tr>
          <%
           for(int i = 0; i < consulta.size(); i++) 
            {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
              numFolio=(BigDecimal)registro.get("eageIdFolio");
              numContrato=(BigDecimal)registro.get("eageFideicomiso");
              numSubContrato = (BigDecimal)registro.get("eageSubcuenta");
              fecha = (String)registro.get("eageFecEvento1");
              descripcion= (String)registro.get("eageDesEvento");
              periodicidad= (String)registro.get("eagePeriodicidad");
              eventos= (BigDecimal)registro.get("eageNumEventos");
              estatus= (String)registro.get("eageCveStatus");
              
              contador++;
          %>
          <tr style="font-family: Arial;	font-size: 11px;color: #000000;">           
             
            <td align="right" width="100"><%=numFolio%></td>
            <td align="right" width="100" ><%=numContrato%></td>   
            <td align="right" width="100" ><%=numSubContrato%></td>   
            <td align="right" width="100" ><%=fecha!=null?fecha:""%></td>
            <td  align="right" width="400"><%=descripcion!=null?descripcion:""%></td> 
            <td  align="right" width="100"><%=periodicidad!=null?periodicidad:""%></td> 
            <td  align="right" width="100"><%=eventos%></td>
            <td  align="right" width="100"><%=estatus!=null?estatus:""%></td>
                                      
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