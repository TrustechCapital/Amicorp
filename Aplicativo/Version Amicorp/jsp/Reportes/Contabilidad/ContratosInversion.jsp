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
  
  
    
    BigDecimal numContrato = new BigDecimal(0);
    BigDecimal col6_especial = new BigDecimal(0);
    BigDecimal col7 = new BigDecimal(0);
    BigDecimal col8 = new BigDecimal(0);
    BigDecimal col9 = new BigDecimal(0);
    BigDecimal col10 = new BigDecimal(0);
    BigDecimal col11 = new BigDecimal(0);
    BigDecimal total_directo = new BigDecimal(0);
    BigDecimal porc_total_directo = new BigDecimal(0);
    BigDecimal total_reporto = new BigDecimal(0);
    BigDecimal porc_total_reporto = new BigDecimal(0);
    BigDecimal total_efectivo = new BigDecimal(0);
    BigDecimal porc_total_efectivo = new BigDecimal(0);
    BigDecimal total_global = new BigDecimal(0);
    
    BigDecimal precioMercado = new BigDecimal(0);    
    
    BigDecimal saldo_1201 = new BigDecimal(0);
    BigDecimal saldo_1101 = new BigDecimal(0);
    BigDecimal saldo_1205 = new BigDecimal(0);
    BigDecimal suma_saldos = new BigDecimal(0);
    
    
    String s_saldo_1201="";
    String s_saldo_1101="";
    String s_saldo_1205="";
    String s_suma_saldos="";
    
    
    String nomContrato="";
    String fecPrecios="";
    String col1="";
    String col2="";
    String col3="";
    String col4="";
    String col5="";
    String col6="";
    String porc_directo="";
    String porc_reporto="";
    String porc_efectivo="";
    String tot_directo="";
    String tot_reporto="";
    String tot_efectivo="";
    String tot_global="";
    int contador=0;
    String mensaje="";
    String num_contrato="";


//se valida si hay informacion en la tabla
if(consulta.size()>0)
{  
    registro = (java.util.Map)consulta.get(0);
    
    //numContrato=(BigDecimal)registro.get("posiNumFideicomiso");
    nomContrato=(String)registro.get("posiFideicomiso");
    fecPrecios=(String)registro.get("posiCol4");
    mensaje=(String)registro.get("posiFideicomiso");
    
  if(consulta.size()>1)
  {
    
    total_directo = total_directo.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_directo = porc_total_directo.add(new BigDecimal((String)registro.get("posiCol3")));
    porc_directo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_directo);
    tot_directo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_directo);
    
    registro = (java.util.Map)consulta.get(1);
    total_reporto= total_reporto.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_reporto = porc_total_reporto.add(new BigDecimal((String)registro.get("posiCol3")));
    porc_reporto=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_reporto);
    tot_reporto=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_reporto);  
    
    registro = (java.util.Map)consulta.get(2);
    total_efectivo= total_efectivo.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_efectivo = porc_total_efectivo.add(new BigDecimal((String)registro.get("posiCol3")));
    porc_efectivo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_efectivo);
    tot_efectivo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_efectivo);
    
    registro = (java.util.Map)consulta.get(3);
    total_global= total_global.add(new BigDecimal((String)registro.get("posiCol2")));
    tot_global=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_global);
        
 
%>

<html>
<head>
<title>POSICION POR CONTRATO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="1150"  align="center">
<tr><td><hr width="1150" size="1"> </td></tr>
</table>

<table>
		<tr>		
		<td>
			<table width='950'>
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
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=nomContrato.split("---")[0]%></td></tr>
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">Precios al:&nbsp;&nbsp;<%=fecPrecios%></td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='200' height='91' rowspan='7'><div align='right'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>					
				</tr>
			</table>
		</td>
	</tr>
</table>	
	
          <P>&nbsp;</P>

<table width="1150" align="center">
<tr><td><hr width="1150" size="1"> </td></tr>
</table>


<%
int vueltas=0;
int vueltas_aux=-1;
int inicio_aux=-1;
if(nomContrato.indexOf("SOLOTOTALES")!=-1){vueltas=((consulta.size()-1)/6)+1; inicio_aux=1;vueltas_aux=0;}

for(int i = inicio_aux; i < vueltas; i++) {
  
    total_directo = new BigDecimal(0);
    porc_total_directo = new BigDecimal(0);
    total_reporto = new BigDecimal(0);
    porc_total_reporto = new BigDecimal(0);
    total_efectivo = new BigDecimal(0);
    porc_total_efectivo = new BigDecimal(0);
    total_global = new BigDecimal(0);
    
    
   saldo_1201 = new BigDecimal(0);
   saldo_1101 = new BigDecimal(0);
   saldo_1205 = new BigDecimal(0);
   suma_saldos = new BigDecimal(0);
    
    porc_directo="";
    porc_reporto="";
    porc_efectivo="";
    tot_directo="";
    tot_reporto="";
    tot_efectivo="";
    tot_global="";
    
    s_saldo_1201="";
    s_saldo_1101="";
    s_saldo_1205="";
    s_suma_saldos="";
    
    
    
    registro = (java.util.Map)consulta.get(vueltas_aux+1);
    
    num_contrato=((String)registro.get("posiFideicomiso")).split("---")[1];
    
    total_directo = total_directo.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_directo = porc_total_directo.add(new BigDecimal((String)registro.get("posiCol3")));
    porc_directo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_directo);
    tot_directo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_directo);
    
    registro = (java.util.Map)consulta.get(vueltas_aux+2);
    total_reporto= total_reporto.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_reporto = porc_total_reporto.add(new BigDecimal((String)registro.get("posiCol3")));
    
    saldo_1201 = saldo_1201.add(new BigDecimal((String)registro.get("posiCol4")));
    saldo_1101 = saldo_1101.add(new BigDecimal((String)registro.get("posiCol5")));
    saldo_1205 = saldo_1205.add(new BigDecimal((String)registro.get("posiCol6")));
    
    suma_saldos=suma_saldos.add(saldo_1201);
    suma_saldos=suma_saldos.add(saldo_1101);
    suma_saldos=suma_saldos.add(saldo_1205);
    
    s_saldo_1201=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", saldo_1201);
    s_saldo_1101=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", saldo_1101);;
    s_saldo_1205=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", saldo_1205);;
    
    
    s_suma_saldos=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", suma_saldos);;
    
    porc_reporto=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_reporto);
    tot_reporto=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_reporto);  
    
    registro = (java.util.Map)consulta.get(vueltas_aux+3);
    total_efectivo= total_efectivo.add(new BigDecimal((String)registro.get("posiCol2")));
    porc_total_efectivo = porc_total_efectivo.add(new BigDecimal((String)registro.get("posiCol3")));
    porc_efectivo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", porc_total_efectivo);
    tot_efectivo=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_efectivo);
    
    registro = (java.util.Map)consulta.get(vueltas_aux+4);
    total_global= total_global.add(new BigDecimal((String)registro.get("posiCol2")));
    tot_global=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", total_global);
    
    if(nomContrato.indexOf("SOLOTOTALES")!=-1){
      vueltas_aux=vueltas_aux+6;
    }else{
      vueltas_aux=vueltas_aux+1;
    }
    
%>
<table width="1150" align="center"><tr><td>
  <table  width="950" align="center">
    <tr>
      <td colspan="5" style="font-family: Arial;	font-size: 15px;color: #000000;font-weight: bold;">Posicion de Valores de Contrato de Inversion: <%=num_contrato%></td>
    </tr>
    <tr>
      <td width="250">&nbsp;</td>
      <td width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;">Valuación al </td>
      <td width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;">% Total</td>
      <td width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;">Valuación al </td>
      <td width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;">% Total</td>
    </tr>
    
    <tr>
      <td colspan="5" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Mercado de Dinero</td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 13px;color: #000000;">&nbsp;&nbsp;Operaciones en Directo</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150" align="right"><%=tot_directo%></td>
      <td width="150" align="right"><%=porc_directo%>%</td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 13px;color: #000000;">&nbsp;&nbsp;Operaciones en Reporto</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150" align="right"><%=tot_reporto%></td>
      <td width="150" align="right"><%=porc_reporto%>%</td>
    </tr>
    <tr>
      <td colspan="5" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Sociedades de inversión</td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 13px;color: #000000;">&nbsp;&nbsp;Mercado de Deuda</td>
      <td width="100">&nbsp;</td>
      <td width="100">&nbsp;</td>
      <td width="100">&nbsp;</td>
      <td width="100">&nbsp;</td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 13px;color: #000000;">&nbsp;&nbsp;Renta Variable</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5"></td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Saldo de efectivo</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150" align="right"><%=tot_efectivo%></td>
      <td width="150" align="right"><%=porc_efectivo%>%</td>
    </tr>
    <tr>
      <td style="font-family: Arial;	font-size: 15px;color: #000000;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150" align="right"><%=tot_global%></td>
      <td width="150" align="right">100%</td>
    </tr>  
  </table>
  </td>
  <td>
    <table width="200" >
      <%if(nomContrato.indexOf("SOLOTOTALES")!=-1){%>
      <tr><td>&nbsp;</td></tr>
      <tr><td colspan="2" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;">Saldo Cuentas</td></tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td>1201 :</td><td align="right"><%=s_saldo_1201%></td></tr>      
      <tr><td>1205 :</td><td align="right"><%=s_saldo_1205%></td></tr>
      <tr><td>1101 :</td><td align="right"><%=s_saldo_1101%></td></tr>            
      <tr><td>Sumas :</td><td align="right"><%=s_suma_saldos%></td></tr>
     <% }%>
    </table>
  </td>
</tr>
  <tr><td colspan="5"><hr width="1150" size="1"></td></tr>
</table>

<%}%>



<table width="1150" align="center">

      <%
      if(nomContrato.indexOf("SOLOTOTALES")==-1){
           for(int i = 4; i < consulta.size(); i++) {  //Para cada registro
                      
             registro = (java.util.Map)consulta.get(i); 
             
             col1=(String)registro.get("posiCol1");
             col2=(String)registro.get("posiCol2");
             col3=(String)registro.get("posiCol3");
             col4=(String)registro.get("posiCol4");
             col5=(String)registro.get("posiCol5");
             col6=(String)registro.get("posiCol6");
             col6_especial=new BigDecimal(0);
             if(contador==0 && col6.equals("0")==false){
             col6_especial=col6_especial.add(new BigDecimal(col6));
             }
             
             col7=(BigDecimal)registro.get("posiCol7");
             col8=(BigDecimal)registro.get("posiCol8");
             col9=(BigDecimal)registro.get("posiCol9");
             col10=(BigDecimal)registro.get("posiCol10");
             col11=(BigDecimal)registro.get("posiCol11");
             
            
            
           // if(col1.intValue()!=0){campo1=DecimalFormatUtils.getFormatedNumber("###,###.00", col1);}else{campo1="&nbsp;";}              
              
             %>
           <%if(i==4){%>  
           <tr>
           <td align="center">
           <table>
          <tr ><td colspan="11" align='center'  style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Posición</td></tr>
          <tr>
              <td colspan="11">&nbsp;</td>
          </tr>
          <tr>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Emisora</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Fecha Vencimiento</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Titulos mes actual</td>              
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Tasa costo precio preferencia</td>              
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Precio de mercado</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Valor de mercado</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Variación</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">% de inversión</td>
              <td align="center" COLSPAN="3">&nbsp;</td>
          </tr>
          <%}%>
  
          <%if(contador==0 && col1.equals("VACIO")==false){
          String campo6=".00";
             if(contador==0 && col6.equals("0")==false){
            campo6=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col6_especial);
            }
            String campo8=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col8);
            String campo9=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col9);
            String campo10=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col10);
          %>
          <tr style="font-family: Arial;	font-size: 14px;color: #000000;">
            <td align="right" width="200"><%=col1%></td>
            <td align="right" width="130" ><%=col2%></td>                
            <td align="right" width="130" ><%=col3%></td>            
            <td  align="right" width="140"><%=col4%></td>
            <td  align="right" width="140"><%=col5%></td>
            <td  align="right" width="140"><%=campo6%></td> 
            <td  align="right" width="130"><%=col7%></td> 
            <td  align="right" width="130"><%=col8%>%</td>
          </tr>
          <%}%>
          
          <%if(col1.equals("VACIO")){%>
            </table>/<td></td>
             <tr><td align="center"><table>         
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td colspan="11"><hr width="1200" size="1"> </td></tr>
            <tr>
              <td colspan="11" align='center'style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Reportos</td>
            </tr>  
             <tr>
              <td colspan="11">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Emisora</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Fecha de Inicio</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Fecha de Vencimiento</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Plazo</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Titulos</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Dias por Vencer</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Tasa</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Premio devenegado</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Valor al corte</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">% de inversión</td>
              <td>&nbsp;</td>
            </tr>
          <%contador=1;}%>
          
          
          <%if(contador==1 && col1.equals("VACIO")==false && col1.equals("VACIO2")==false){
          
          String campo9=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col9);
            %>
          <tr style="font-family: Arial;	font-size: 14px;color: #000000;">
            <td align="left" width="200"><%=col1%></td>
            <td align="right" width="100"><%=col2%></td>
            <td align="right" width="100"><%=col3%></td>
            <td  align="right" width="100"><%=col4%></td>                
            <td  align="right" width="100"><%=col5%></td>
            <td  align="right" width="150"><%=col6%></td>
            <td  align="right" width="100"><%=col7%></td>
            <td  align="right" width="100"><%=col8%></td>
            <td align="right" width="150"><%=campo9%></td>
            <td align="right" width="100"><%=col10%>%</td>
            <td>&nbsp;</td>
          </tr>
          <% } %>
          
          
          <%if(col1.equals("VACIO2")){%>
            </table>/<td></td>
            <tr><td align="center"><table> 
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td colspan="11"><hr width="1200" size="1"> </td></tr>
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
            
            <tr>
              <td colspan="11" align='center' style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Movimientos del mes</td>
            </tr>  
             <tr>
              <td colspan="11">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" width="50" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Dia</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Num. Op.</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Operación</td>
              <td align="center" width="200" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Descripción</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Cantidad</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Precio</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Plazo</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Tasa</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">ISR/IVA</td>
              <td align="center" width="150" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Cargos/Abonos</td>
              <td align="center" width="100" bgcolor="#999999" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">Saldo</td>
              
            </tr>
            
          <%contador=2;}%>
          
          <%if(contador==2 && col1.equals("VACIO")==false && col1.equals("VACIO2")==false){
              String valor10=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", col10);
              
               precioMercado = precioMercado.add(new BigDecimal(col6));
               String valor6=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", precioMercado);
               
              if(col6.equals("0")==false)
                valor10="-"+valor10;
          %>
          <tr style="font-family: Arial;	font-size: 14px;color: #000000;">
            <td align="LEFT" width="50"><%=col1%></td>
            <td align="LEFT" width="100"><%=col2%></td>
            <td align="LEFT" width="700"><%=col3%></td>
            <td align="LEFT" width="400"><%=col4%></td>                
            <td align="right" width="100"><%=col5%></td>
            <td align="right" width="100"><%=col6%></td>
            <td align="right" width="50"><%=col7%></td>
            <td align="right" width="50"><%=col8%></td>
            <td align="right" width="50"><%=col9%></td>           
            <td align="right" width="150"><%=valor10%></td> 
            <td align="right" width="100"><%=col11%></td>
          </tr>
          
          
          <% } %>   
          
         <%if(i==consulta.size()-1){%>
      <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
          <tr><td align="center" colspan="11"  nowrap>&nbsp;</td></tr>
          <tr><td colspan="11"><hr width="1200" size="1"> </td></tr>
          <tr><td align="center" colspan="8"  nowrap>&nbsp;</td><td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;" nowrap>Posicion Final de Efectivo</td>
          <td>&nbsp;</td>
          <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;" nowrap><%=tot_efectivo%></td></tr>            
          <tr><td colspan="11"><hr width="1200" size="1"> </td></tr>
        <%}%>
      <%}
      }
      %>
       
      </table>
</body>
</html>
      <%
      }else{out.print(mensaje);}
      
    }%>
      
    