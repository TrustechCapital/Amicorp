<!--
/*
  @Autor:Inscitech
  @Creado: Junio 2008
*/
-->

<%@ page import="java.text.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<jsp:useBean id="balance" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="cuentas" class="com.nafin.negocio.balanceFormulas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="repEdoFinan"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="datEdoFinan" class="com.nafin.negocio.nReporte"/>
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
    
    String nomContrato="";
    BigDecimal numContrato = new BigDecimal(0);
    String col7 = "";
    String col8 = "";
    String col1="";
    String col2="";
    String col3="";
    String col4="";
    String col5="";
    String col6="";
    
    String fecha="";

    
    int contador=0;


//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(1);
    //numContrato=(BigDecimal)registro.get("posiNumFideicomiso");
    nomContrato=(String)registro.get("posiFideicomiso");
    fecha=(String)registro.get("posiCol4");
 }
%>

<html>
<head>
<title>POLIZA CONTABILIDAD INSTITUCIONAL</title>
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
					<td align="CENTER"  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;">DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">POLIZA CONTABILIDAD INSTITUCIONAL MOVIMIENTOS AL <%=fecha%></div></td>
				</tr>
				<tr><td height='23'>&nbsp;</td></tr>
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">&nbsp;</td></tr>
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



<table width="960"  border="0" align="center">
      <%
           for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
             col1=(String)registro.get("posiCol1");
             col2=(String)registro.get("posiCol2");
             col3=(String)registro.get("posiCol3");
             col4=(String)registro.get("posiCol4");
             col5=(String)registro.get("posiCol5");
             col6=(String)registro.get("posiCol6");
             col7=(String)registro.get("posiCol7");
             col8=(String)registro.get("posiCol8");
           
              
             %>
           <%if(i==0){%>  
          <tr ><td colspan="10" align='center'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">&nbsp;</td></tr>
          <tr>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Cuenta</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Subcuenta</td>
              <td align="center" width="300" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Concepto</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Fecha</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Cargos</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;">Abonos</td>
              
          </tr>
          <%}%>
          
          <tr style="font-family: Arial;	font-size: 10px;color: #000000;">           
            <%if(i==consulta.size()-1){%>
              <td align="right" width="100" >&nbsp;</td>                
              <td align="right" width="300"  >&nbsp;</td>
            <%}else{%>
              <td align="right" width="100"><%=col1%></td>
              <td align="right" width="100" ><%=col2%></td>   
            <%}%>
            <td align="right" width="300" ><%=col3%></td>
            <td  align="right" width="100"><%=col4%></td> 
            <td  align="right" width="100"><%=col5%></td> 
            <td  align="right" width="100"><%=col6%></td>
                                      
          </tr>
             
      <% } %>
    </table>
</body>
</html>