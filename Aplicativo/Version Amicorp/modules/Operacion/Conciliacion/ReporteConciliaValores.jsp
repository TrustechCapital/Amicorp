

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

    BigDecimal numContrato = new BigDecimal(0);
    BigDecimal numSubContrato = new BigDecimal(0);
    BigDecimal numCtoInver = new BigDecimal(0);
    String salTotalP = "";
    String salTotalF = "";
    String salTotalC = "";
    String diferencia = "";
    String comentario="";
    String status="";
    
    String concilian = "0";
    String noconcilian = "0";
      
    if(request.getParameter("concilia")!=null)
    {
      concilian = request.getParameter("concilia").split("-")[0].replaceAll("'","");
      noconcilian = request.getParameter("concilia").split("-")[1].replaceAll("'","");
    }
    int contador=0;
   
%>

<html>
<head>
<title>REPORTE CONCILIACION DE VALORES</title>
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
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">REPORTE DE CONCILIACION DE VALORES <%=request.getParameter("fechaReporte")!=null?"&nbsp;&nbsp;&nbsp("+fec_reporte+")":session.getAttribute("strFechaContable")!=null?"&nbsp;&nbsp;&nbsp;("+session.getAttribute("strFechaContable")+")":""%></td></tr>
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
          <tr style="font-weight:bold">
            <td colspan="9" align='right'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Conciliados : <%=concilian%> &nbsp;&nbsp;&nbsp; No Conciliados: <%=noconcilian%></td>
          </tr>
          <tr><td colspan="9" align='center'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">&nbsp;</td></tr>
          <tr>
              <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Fiso</td>
              <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Sub Cta</td>
              <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Cto Inver</td>
              <td align="center" width="120" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Saldo Edo. Cta.</td>
              <td align="center" width="120" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Saldo Valuación</td>
              <td align="center" width="120" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Saldo Contable</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Diferencia</td>
              <td align="center" width="300" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Comentario</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Estatus</td>   
          </tr>
          <%
           for(int i = 0; i < consulta.size(); i++) 
            {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
              numContrato = (BigDecimal)registro.get("fcvaFideicomiso");
              numSubContrato = (BigDecimal)registro.get("fcvaSubcuenta");
              numCtoInver = (BigDecimal)registro.get("fcvaCtoInver");
              salTotalP = (String)registro.get("fcvaSaldoTotalP");
              salTotalF = (String)registro.get("fcvaSaldoTotalF");
              salTotalC = (String)registro.get("fcvaSaldoTotalC");
              diferencia = (String)registro.get("fcvaDiferencia");
              comentario= (String)registro.get("fcvaComentario");
              status= (String)registro.get("fcvaCveStatus");
            
              contador++;
          %>
          <tr style="font-family: Calibri,Arial;	font-size: 12px;color: #000000;" <%=status.equals("NO CONCILIADO")?"style='background-color:#FF9D9D;'":""%> >           
             
            <td align="right" width="80"><%=numContrato%></td>
            <td align="right" width="80" ><%=numSubContrato%></td>   
            <td align="right" width="80" ><%=numCtoInver%></td>   
            <td align="right" width="120" ><%=salTotalP%></td>
            <td  align="right" width="120"><%=salTotalF%></td> 
            <td  align="right" width="120"><%=salTotalC%></td> 
            <td  align="right" width="100"><%=diferencia%></td>
            <td  align="right" width="300"><%=comentario%></td>
            <td align="right" width="100"><%=status%></td>
                                      
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