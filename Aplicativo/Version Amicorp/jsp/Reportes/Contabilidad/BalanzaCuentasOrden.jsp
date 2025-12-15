<!-- BalanzaCuentasOrden.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">
  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    BigDecimal aux1 = new BigDecimal(0);
    String nomContrato = "";
    BigDecimal ctam = new BigDecimal(0);
    BigDecimal scta = new BigDecimal(0);
    BigDecimal sscta = new BigDecimal(0);
    BigDecimal ssscta = new BigDecimal(0);
    BigDecimal aux2 = new BigDecimal(0);
    BigDecimal aux3 = new BigDecimal(0);
    String nomCta = "";
    BigDecimal saldoAnterior = new BigDecimal(0);
    BigDecimal cargo = new BigDecimal(0);
    BigDecimal abono = new BigDecimal(0);
    BigDecimal deudor = new BigDecimal(0);
    BigDecimal acreedor = new BigDecimal(0);
    
    BigDecimal totalSaldoAnterior = new BigDecimal(0);
    BigDecimal totalCargos = new BigDecimal(0);
    BigDecimal totalAbonos = new BigDecimal(0);
    BigDecimal totalDeudor = new BigDecimal(0);
    BigDecimal totalAcreedor = new BigDecimal(0);
    
    BigDecimal bigDecimalCero = new BigDecimal(0);
    
    //Variables auxiliares para llevara  cabo los cortes
    BigDecimal fideicomisoActual = new BigDecimal(0);
    
    if(consulta.size()>0){
    
    aux1 = (BigDecimal)registro.get("reoNumAux1");
        nomContrato = (String)registro.get("reoNomContrato");
    }
    
%>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='738'>
				<tr>
					<td align="CENTER" class='style15'><span class="style14">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</span></td>
				</tr>
				<tr>
					<td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr>
        <td><div align='center' class='style15'><span class='style16'>BALANZA DE CUENTAS DE ORDEN</span></div></td>
      </tr>
      <tr><td height='23'>&nbsp;</td></tr>
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

    <table border="0" cellspacing="0" cellpadding="0" style="font-size:8pt">
      <tr>
        <th nowrap align="left">CTA</th>
        <th width="20" nowrap align="left">S1</th>
        <th nowrap align="left">S2</th>
        <th nowrap align="left">S3</th>
        <th nowrap align="left">A2</th>
        <th nowrap align="left">A3</th>
        <th nowrap align="left" width="30">&nbsp;</th>
        <th nowrap align="left">DESCRIPCION</th>
        <th nowrap width="200" align="right">SALDO ANTERIOR</th>
        <th nowrap width="200" align="right">CARGOS</th>
        <th nowrap width="200" align="right">ABONOS</th>
        <th nowrap width="200" align="right">DEUDOR</th>
        <th nowrap width="200" align="right">ACREEDOR</th>
      </tr>
<%  
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i);
        
        //Obtener datos de la BD
        aux1 = (BigDecimal)registro.get("reoNumAux1");
        nomContrato = (String)registro.get("reoNomContrato");
        ctam = (BigDecimal)registro.get("reoNumCtam");
        scta = (BigDecimal)registro.get("reoNumScta");
        sscta = (BigDecimal)registro.get("reoNumSscta");
        ssscta = (BigDecimal)registro.get("reoNumSsscta");
        nomCta = (String)registro.get("reoNombre");
        aux2 = (BigDecimal)registro.get("reoNumAux2");
        aux3 = (BigDecimal)registro.get("reoNumAux3");
        saldoAnterior = (BigDecimal)registro.get("reoSaldoIniPer");
        cargo = (BigDecimal)registro.get("reoCargosPer");
        abono = (BigDecimal)registro.get("reoAbonosPer");
        deudor = (BigDecimal)registro.get("deudora");
        acreedor = (BigDecimal)registro.get("acreedora");
        
        
        if(fideicomisoActual.compareTo(aux1) != 0) { //Primer corte: REO_NUM_AUX1
          
          if(fideicomisoActual.compareTo(aux1) != 0 && fideicomisoActual.compareTo(bigDecimalCero) != 0) { //Totales
%>
            <tr style="font-weight:bolder">
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap width="30">TOTAL:</td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoAnterior)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalDeudor)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAcreedor)%></td>
            </tr>
            <tr>
              <td colspan="13" nowrap>&nbsp;</td>
            </tr>
<%         
            totalSaldoAnterior = new BigDecimal(0);
            totalCargos = new BigDecimal(0);
            totalAbonos = new BigDecimal(0);
            totalDeudor = new BigDecimal(0);
            totalAcreedor = new BigDecimal(0);
          }
        
%>
          <tr style="font-weight:bolder">
            <td colspan="5" nowrap>FIDEICOMISO: </td>
            <td nowrap>&nbsp;</td>
            <td nowrap><%=aux1%></td>
            <td colspan="1" nowrap align="right" width="30">&nbsp;</td>
            <td colspan="5" nowrap><%=nomContrato%></td>
            <%fideicomisoActual = aux1;%>
          </tr>
<%        
          i--;
          continue;
        }
%>
        <tr>
          <td align="right" nowrap><%=ctam.intValue() != 0?ctam.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=scta.intValue() != 0?scta.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=sscta.intValue() != 0?sscta.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=ssscta.intValue() != 0?ssscta.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=aux2.intValue() != 0?aux2.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=aux3.intValue() != 0?aux3.toString():"&nbsp;"%></td>
          <td width="30">&nbsp;</td>
          <td nowrap><%=nomCta%></td>
          <td align="right"><%=saldoAnterior.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", saldoAnterior):"&nbsp;"%></td>
          <td align="right"><%=cargo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", cargo):"&nbsp;"%></td>
          <td align="right"><%=abono.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", abono):"&nbsp;"%></td>
          <td align="right"><%=deudor.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", deudor):"&nbsp;"%></td>
          <td align="right"><%=acreedor.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", acreedor):"&nbsp;"%></td>
        </tr>
<%    
        totalSaldoAnterior = new BigDecimal(totalSaldoAnterior.doubleValue() + saldoAnterior.doubleValue());
        totalCargos = new BigDecimal(totalCargos.doubleValue() + cargo.doubleValue());
        totalAbonos = new BigDecimal(totalAbonos.doubleValue() + abono.doubleValue());
        totalDeudor = new BigDecimal(totalDeudor.doubleValue() + deudor.doubleValue());
        totalAcreedor = new BigDecimal(totalAcreedor.doubleValue() + acreedor.doubleValue());
      }
%>
      <tr>
        <td colspan="13" nowrap>&nbsp;</td>
      </tr>
      <tr style="font-weight:bolder">
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap width="30">TOTAL:</td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoAnterior)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalDeudor)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAcreedor)%></td>
      </tr>
      <tr>
        <td colspan="13" nowrap>&nbsp;</td>
      </tr>
    </table>
  </body>
</html>