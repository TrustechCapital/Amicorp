

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
    
    //--- Fechas ----
    String fReporte = request.getParameter("fechaReporte")!=null?request.getParameter("fechaReporte").toString().replaceAll("'","").trim():"XXXX";
    String fFinReporte = request.getParameter("fechaFinReporte")!=null?request.getParameter("fechaFinReporte").toString().replaceAll("'","").trim():"XXXX";
    
    String fec_reporte = !fReporte.equals("XXXX")?Integer.parseInt(fReporte.split("/")[0])+" de "+meses[Integer.parseInt(fReporte.split("/")[1])]+" de "+Integer.parseInt(fReporte.split("/")[2]):"";
    
    if(!fReporte.equals(fFinReporte))// fechas diferentes
    {
      fec_reporte = "Del " + fec_reporte + " al ";
      fec_reporte = !fFinReporte.equals("XXXX")?fec_reporte+Integer.parseInt(fFinReporte.split("/")[0])+" de "+meses[Integer.parseInt(fFinReporte.split("/")[1])]+" de "+Integer.parseInt(fFinReporte.split("/")[2]):"";
    
    }
    
    //------------------
    BigDecimal numFolio = new BigDecimal(0);
    BigDecimal numContrato = new BigDecimal(0);
    BigDecimal numSubContrato = new BigDecimal(0);
    String fecha = "";
    String pizarra="";
    String serie="";
    String descripcion="";
    String acciontomada="";
    String periodicidad="";
    BigDecimal eventos= new BigDecimal(0);
    String estatus="";

    
    int contador=0;
   
%>

<!doctype html>
<head>
<title>REPORTE AGENDA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- Enable IE9 Standards mode -->
<meta http-equiv="X-UA-Compatible" content="IE=9" >
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
					<td width='151' height='91' rowspan='7'><div align='center'><img height="120px" src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>					
				</tr>
			</table>
		</td>
	</tr>
</table>	


<table width="960"  border="0" cellpadding="2" cellspacing="0" align="center">
          <tr ><td colspan="10" align='center'  style="font-family: Calibri,Arial;	font-size: 14px;color: #000000;font-weight: bold;">&nbsp;</td></tr>
          <tr>
              <td align="left" width="100" bgcolor="#006598"  style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">&nbsp;Folio</td>
              <td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Fecha</td>
              <td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">No. Fideicomiso</td>
              <td align="left" width="150" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Pizarra</td>
              <td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Serie</td>
              <td align="left" width="550" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Descripción</td>
              <td align="left" width="300" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Acción Tomada</td>
              <!--td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Periodicidad</td>
              <td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Eventos</td-->
              <td align="left" width="100" bgcolor="#006598" style="font-family: Calibri,Arial;	font-size: 12px;color: #FFFFFF;font-weight:bold;">Estatus</td>   
          </tr>
          <%
           for(int i = 0; i < consulta.size(); i++) 
            {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
              numFolio=(BigDecimal)registro.get("eageIdFolio");
              numContrato=(BigDecimal)registro.get("eageFideicomiso");
              numSubContrato = (BigDecimal)registro.get("eageSubcuenta");
              fecha = (String)registro.get("eageFecEvento1");
              pizarra= (String)registro.get("eagePizarra");
              serie= (String)registro.get("eageSerie");
              descripcion= (String)registro.get("eageDesEvento");
              acciontomada= (String)registro.get("eageAccionTomada");
              periodicidad= (String)registro.get("eagePeriodicidad");
              eventos= (BigDecimal)registro.get("eageNumEventos");
              estatus= (String)registro.get("eageCveStatus");
              
              contador++;
          %>
          <tr style="font-family: Calibri,Arial;	font-size: 12px;color: #000000;">           
             
            <td align="left" width="100"><%=numFolio%></td>
            <td align="left" width="100" ><%=fecha!=null?fecha:""%></td>
           <td align="left" width="100" ><%=numContrato%></td>   
             <td align="left" width="150" ><%=pizarra!=null?pizarra:""%></td>
            <td align="left" width="100" ><%=serie!=null?serie:""%></td>
            <td  align="left" width="550"><%=descripcion!=null?descripcion:""%></td> 
            <td  align="left" width="300"><%=acciontomada!=null?acciontomada:""%></td> 
            <!--td  align="left" width="100"><%=periodicidad!=null?periodicidad:""%></td> 
            <td  align="left" width="100"><%=eventos%></td-->
            <td  align="left" width="100"><%=estatus!=null?estatus:""%></td>
                                      
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