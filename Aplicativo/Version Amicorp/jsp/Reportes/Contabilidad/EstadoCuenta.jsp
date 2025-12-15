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
    <title>Estado de Cuenta</title>
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
    BigDecimal cargos = new BigDecimal(0);
    BigDecimal abonos = new BigDecimal(0);
    String scta = "";
    String cuenta = "";
    String fecha = "";
    String descripcion = "";
    String saldoParcial = "";
    String saldoInicial = "";
    String saldoFinal = "";
    
    if(consulta.size()>0){
      registro = (java.util.Map)consulta.get(0);    
      numFiso=(BigDecimal)registro.get("fmdNumFideicomiso");// ajustar nombres al procedure
      nomFiso=(String)registro.get("fmdNomFideicomiso");
      periodo = (String)registro.get("fmdPeriodo");
      saldoInicial = (String)registro.get("fmdSaldoInicial");
      saldoFinal = (String)registro.get("fmdSaldoFinal");
      cuenta = (String)registro.get("fmdCuenta");
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
          <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7">ESTADO DE CUENTA </td>
        </tr>
        <tr>
         <td>
           &nbsp;
        </td>
        </tr>
        	<tr><td height='23' align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">
				  <%=nomFiso%>
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
<table border="0" cellspacing="1" cellpadding="1" align="center" style="font-family: Arial;	font-size: 12px;">
   <tr>
   <th colspan="3" nowrap align="center" height="20"></th>
   <th></th>
  </tr>
  <tr>
   <th colspan="5" nowrap align="center" height="20"></th>
  </tr>
   <tr>
   <th  nowrap align="center" height="20"></th>
   <th  nowrap align="center" height="20">Periodo del <%=periodo%></th>
   <th  nowrap align="center" height="20"></th>
   <th nowrap align="center" height="20" style="font-size:15px;">No. de Cuenta: <%=cuenta%></th>
  </tr>
  <tr>
   <th colspan="5" nowrap align="center" height="20"></th>
  </tr>
  <tr>
    <th nowrap colspan="2" align="center" width="500">&nbsp;</th>
    <th nowrap align="center" width="250">Saldo Operativo Inicial : <%=saldoInicial%></th>
    <th nowrap align="center" width="250">Saldo Operativo Final: <%=saldoFinal%></th>
  </tr>
  <tr>
    <th colspan="5" nowrap align="center" height="20"></th>
    </tr>
  <tr>
    <th  nowrap align="center" width="100">Fecha de Operacion</th>        
    <th  nowrap align="center" width="400">Concepto</th>
    <th  nowrap align="center" width="200">Cargos/Abonos(-+)</th>
    <th  nowrap align="center" width="200">Saldo Operativo</th>             
  </tr>
  <%
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
                folio = (BigDecimal)registro.get("fmdFolio");
                fecha = (String)registro.get("fmdFecha");
                scta=(String)registro.get("fmdNumSubcuenta");
                cuenta = (String)registro.get("fmdCuenta");
                descripcion = (String)registro.get("fmdDescripcion");
                cargos = (BigDecimal)registro.get("fmdCargo");
                abonos = (BigDecimal)registro.get("fmdAbono");
                saldoParcial = (String)registro.get("fmdSaldo");
                
                String cargo_o_abono="";               
                if(abonos.intValue()!=0)
                {
                 cargo_o_abono="-"+DecimalFormatUtils.getFormatedNumber("###,###,###,###,###,###,###.00", abonos);
                }
                
                if(cargos.intValue()!=0)
                {
                 cargo_o_abono=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###,###,###.00", cargos);
                }
                
              //Obtener datos de la BD
          //  
                %>
        <tr>
        <%if(descripcion.equals("SALTO")==false){%>
          <td align="left"  nowrap width="130"><%=fecha%></td>
          <td align="left"  nowrap  width="400"><%=descripcion%></td>
          <td align="right" nowrap width="200"><%=cargo_o_abono%></td>
          <td align="right"  nowrap width="200"><%=saldoParcial%></td>
         
        <%}else{%>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
          <td align="center"  nowrap>&nbsp;</td>
        <%}%>
        <tr>
      </tr>
      <%}%>
</table>


</body>
</html>