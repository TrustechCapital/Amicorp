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
    BigDecimal col7 = new BigDecimal(0);
    BigDecimal col8 = new BigDecimal(0);
    BigDecimal col9 = new BigDecimal(0);
    BigDecimal col10 = new BigDecimal(0);
    BigDecimal col11 = new BigDecimal(0);
    
    BigDecimal totalMercado = new BigDecimal(0);
    BigDecimal totalHistorico = new BigDecimal(0);
    BigDecimal totalIntereses = new BigDecimal(0);
    BigDecimal totalMinusPlus = new BigDecimal(0);
   
    String col1="";
    String col2="";
    String col3="";
    String col4="";
    String col5="";
    String col6="";
    
    
    int contador=0;


//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(1);
    //numContrato=(BigDecimal)registro.get("posiNumFideicomiso");
    nomContrato=(String)registro.get("posiFideicomiso");
 }
%>

<html>
<head>
<title>POSICION POR CONTRATO</title>
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
					<td><div align='center' style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">POSICION POR CONTRATO</div></td>
				</tr>
				<tr><td height='23'>&nbsp;</td></tr>
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=nomContrato%></td></tr>
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



<table width="960"  border="0" cellpadding="4" align="center">
      <%
           for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
             
             col1=(String)registro.get("posiCol1");
             col2=(String)registro.get("posiCol2");
             col3=(String)registro.get("posiCol3");
             col4=(String)registro.get("posiCol4");
             col5=(String)registro.get("posiCol5");
             col6=(String)registro.get("posiCol6");
             col7=(BigDecimal)registro.get("posiCol7");
             col8=(BigDecimal)registro.get("posiCol8");
             col9=(BigDecimal)registro.get("posiCol9");
             col10=(BigDecimal)registro.get("posiCol10");
             col11=(BigDecimal)registro.get("posiCol11");
             
             totalMercado = totalMercado.add(new BigDecimal((col6.split("-").length==2)?col6.split("-")[1]:"0"));
             totalHistorico =totalHistorico.add(col8);
             totalIntereses =totalIntereses.add(col9);
             totalMinusPlus = totalMinusPlus.add(col10);
             
           // if(col1.intValue()!=0){campo1=DecimalFormatUtils.getFormatedNumber("###,###.00", col1);}else{campo1="&nbsp;";}              
              
             %>
           <%if(i==0){%>  
          <tr ><td colspan="13" align='center'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">POSICION</td></tr>
          <tr>
              <td colspan="13">&nbsp;</td>
          </tr>
          <tr>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">SubCto</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Contrato Inv</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Pizarra</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Serie</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Cupon</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Pos Inicial</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Compras</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Ventas</td>              
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Pos Actual</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Pos Garantia</td>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Costo Hist.</td>
              
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Intereses</td>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Minus/Plus</td>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Valor de mercado</td>
          </tr>
          <%}%>
  
          <%if(contador==0 && col1.equals("VACIO")==false){
            String temporal[]=col3.split("-");
            String campo1=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col8);
            String campo2=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col9);
            String campo3=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col10);
            String temp[]=col6.split("-"); 
            String tempi="0";
            if(temp.length==2){  tempi=temp[1];}
          %>
          <tr style="font-family: Arial;	font-size: 12px;color: #000000;">
            <td align="right" width="100"><%=col11%></td>
            <td align="right" width="100"><%=col1%></td>
            <td align="right" width="100" ><%=col2%></td>                
            <td align="right" width="100" ><%=temporal[0]%></td>
            <td align="right" width="100" ><%=temporal[1]%></td>
            <td align="right" width="100" ><%=temporal[2]%></td>  
            <td  align="right" width="100"><%=col5%></td>
            <td  align="right" width="100"><%=col4%></td>            
            <td  align="right" width="100"><%=temp[0]%></td> 
            <td  align="right" width="100"><%=col7%></td> 
            <td  align="right" width="200"><%=campo1%></td> 
            <td  align="right" width="100"><%=campo2%></td>
            <td  align="right" width="100"><%=campo3%></td>            
            <td  align="right" width="200"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00",new BigDecimal(tempi))%></td> 
          </tr>
          <%}%>
          
          <%if(col1.equals("VACIO")){%>
          
             <tr style="font-family: Arial;	font-size: 12px;color: #000000;">
            <td colspan="9">&nbsp;</td>
             <td width ="100" style="font-weight: bold;">Total:</td>
             <td width="100" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalHistorico)%></td>
             <td width="100" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalIntereses)%></td>
             <td width="100" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalMinusPlus)%></td>
            <td width="100" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalMercado)%></td>
          </tr> 
            <tr><td align="center" colspan="9"  nowrap>&nbsp;</td></tr>
            <tr><td align="center" colspan="9"  nowrap>&nbsp;</td></tr>
            
            <tr>
              <td colspan="14" align='center'style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">REPORTOS</td>
            </tr>  
             <tr>
              <td colspan="14">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Folio</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Tipo</td>
              <td align="center" width="500" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;" colspan="3">Mercado</td>
              <td align="center" width="500" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;" colspan="3">Intrumento</td>
              <td align="center" width="120" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Fecha Vencimiento</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Importe</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Plazo</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Tasa</td>
              <td align="center" width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;" colspan="2">Premio</td>
            </tr>
          <%contador=1;}%>
          
          <%if(contador!=0 && col1.equals("VACIO")==false){
            String temporal2[]=col3.split("-");
            String campo2=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col7);
            String campo3=DecimalFormatUtils.getFormatedNumber("###,###,###.00", col8);
          %>
          
          <tr style="font-family: Arial;	font-size: 12px;color: #000000;">
            <td align="right" width="100"><%=col1%></td>
            <td align="right" width="100"><%=col2%></td>
            
            <td  align="left" width="500"  colspan="3"><%=col4%></td>                
            <td  align="left" width="500" colspan="3"><%=col5%></td>
            <td  align="right" width="120"><%=col6%></td>
            <td align="right" width="100"><%=campo2%></td>
            <td align="right" width="100"><%=temporal2[0]%></td>
            <td align="right" width="100"><%=temporal2[1]%>%</td>
            <td  align="right" width="150" colspan="2"><%=campo3%></td>
          </tr>
          <% } %>
      <% } %>
    </table>
</body>
</html>