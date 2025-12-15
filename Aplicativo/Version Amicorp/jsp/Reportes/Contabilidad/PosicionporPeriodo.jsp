

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
    //String fec_reporte = request.getParameter("fechaReporte")!=null?Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[0])+" de "+meses[Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[1])]+" de "+Integer.parseInt(request.getParameter("fechaReporte").toString().replaceAll("'","").split("/")[2]):"";


    BigDecimal idFedicomiso = new BigDecimal(0);
    BigDecimal idSubcontrato = new BigDecimal(0);
    BigDecimal idCtoInver = new BigDecimal(0);
    String idPizarra = "";
    String idSerie = "";
    BigDecimal idCupon = new BigDecimal(0);
    BigDecimal idFolio = new BigDecimal(0);
    String fechav = "";
    String nomFideicomiso = "";
    String nomSubcontrato = "";
    String nomEntidadFin = "";
    String compra="";
    String venta="";
    String posicion ="";
    String cveHeader="";
    int contador = 0;
    
    
    BigDecimal antIdCtoInver = new BigDecimal(0);
    String antNomFideicomiso = "";
    String antNomSubcontrato = "";
    String antNomEntidadFin = "";
%>

<html>
<head>
<title>REPORTE POSICION POR PERIODO</title>
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
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">REPORTE POSICION POR PERIODO <%=session.getAttribute("strFechaContable")%></td></tr>
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



<table width="800"  border="0" cellpadding="2" cellspacing="0" align="center">
          
          <%
           for(int i = 0; i < consulta.size(); i++) 
            {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
              contador++;
             
              idFedicomiso = (BigDecimal)registro.get("frpIdFedicomiso");
              idSubcontrato = (BigDecimal)registro.get("frpIdSubcontrato");
              idCtoInver = (BigDecimal)registro.get("frpIdCtoinver");
              idPizarra = (String)registro.get("frpIdPizarra");
              idSerie = (String)registro.get("frpIdSerie");
              idCupon = (BigDecimal)registro.get("frpIdCupon");
              idFolio = (BigDecimal)registro.get("frpIdFolio");
              fechav= (String)registro.get("frpFechav");
              nomFideicomiso= (String)registro.get("frpNomFideicomiso");
              nomSubcontrato= (String)registro.get("frpNomSubcontrato");
              nomEntidadFin= (String)registro.get("frpNomEntidadFin");
              compra= (String)registro.get("frpCompra");
              venta= (String)registro.get("frpVenta");
              posicion= (String)registro.get("frpPosicion");
              cveHeader= (String)registro.get("frpCveHeader");
            
             if(cveHeader.equals("ENCABEZADO"))
              {
              
          %>
          
         
            
             <%
                if(!antNomFideicomiso.equals(nomFideicomiso))
                {
                  antNomFideicomiso = nomFideicomiso;
                  
                  
                  antNomSubcontrato = "";
                  antNomEntidadFin = "";
                  antIdCtoInver = new BigDecimal(0);
              %>
                <tr style="font-weight:bold">
                  <td colspan="8" align='center'  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=nomFideicomiso%></td>
                </tr>
                <tr style="font-weight:bold">
                  <td colspan="8" align='center'  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><hr></td>
                </tr>
              <%}%>    
              
               <%
                if(!antNomSubcontrato.equals(nomSubcontrato)||!antNomEntidadFin.equals(nomEntidadFin)||antIdCtoInver!=idCtoInver)
                {
                  antNomSubcontrato = nomSubcontrato;
                  antNomEntidadFin = nomEntidadFin;
                  antIdCtoInver = idCtoInver;
              %>
                <tr>
                  <td colspan="2" align='left'  style="font-family: Arial;	font-size: 13px;color: #000000;">Subcuenta <b><%=idSubcontrato%>-<%=nomSubcontrato%></b></td>
                  <td colspan="2" align='left'  style="font-family: Arial;	font-size: 13px;color: #000000;">Contrato de inversión <b><%=idCtoInver%></b></td>
                  <td colspan="4" align='left'  style="font-family: Arial;	font-size: 13px;color: #000000;">Entidad Financiera <b><%=nomEntidadFin%></b></td>
                <tr>
                  <td colspan="8" align='center'  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Pizarra</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Serie</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Cupón</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Fecha</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Folio</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Compra</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Venta</td>
                  <td align="center" width="80" bgcolor="#999999" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:bold;">Posición</td>
              </tr>
              <%}%> 
          
          
             
      <% }
      
      if(cveHeader.equals("INICIAL"))
              {
          %>
          <tr style="font-family: Calibri,Arial; font-weight:bold;	font-size: 12px;color: #000000;"  >           
             
            <td align="left" width="80"><%=idPizarra%></td>
            <td align="right" width="80" ><%=idSerie%></td>   
            <td align="right" width="80" ><%=idCupon%></td>     
            <td align="right" width="80" ><%=fechav%></td>
            <td align="right" width="80" >&nbsp;</td> 
            <td  align="right" width="80">&nbsp;</td>
            <td  align="right" width="80">&nbsp;</td>
            <td align="right" width="80"><%=posicion%></td>
                                      
          </tr>
             
      <% }
      
      if(cveHeader.equals("COMPRA")||cveHeader.equals("VENTA"))
          {
          %>
          <tr style="font-family: Calibri,Arial;	font-size: 12px;color: #000000;"  >           
             
            <td align="left" width="80"><%=idPizarra%></td>
            <td align="right" width="80" ><%=idSerie%></td>   
            <td align="right" width="80" ><%=idCupon%></td>     
            <td align="right" width="80" ><%=fechav%></td>
            <td align="right" width="80" ><%=idFolio%></td> 
            <td  align="right" width="80"><%=compra%></td>
            <td  align="right" width="80"><%=venta%></td>
            <td align="right" width="80"><%=posicion%></td>
                                      
          </tr>
             
      <% }
      if(cveHeader.equals("TOTAL"))
              {
          %>
          <tr style="font-family: Calibri,Arial; font-weight:bold;	font-size: 12px;color: #000000;"  >           
            <td align="left" width="80"><%=idPizarra%></td>
            <td align="right" width="80" ><%=idSerie%></td>   
            <td align="right" width="80" ><%=idCupon%></td>     
            <td align="right" width="80" ><%=fechav%></td>
            <td align="right" width="80" >&nbsp;</td> 
            <td  align="right" width="80">&nbsp;</td>
            <td  align="right" width="80">&nbsp;</td>
            <td align="right" width="80"><%=posicion%></td>                       
          </tr>
          <tr style="font-family: Calibri,Arial; font-weight:bold;	font-size: 12px;color: #000000;"  >                   
            <td colspan=8 align="right" width="80">&nbsp;</td>                    
          </tr>
             
      <% }
      
      
      } %>
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