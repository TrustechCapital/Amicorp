<!-- BalanzaCompprobacionEje.jsp -->

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
  %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
    <style type="text/css">
<!--
	.style14 {
				font-size: 16px;
				font-weight: bold;
				font-family: Verdana, Arial, Helvetica, sans-serif;
			 }
	.style15 {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 12px;
				font-weight: bold;
			 }
	.style16 {font-family: Arial, Helvetica, sans-serif}
	.style18 {
				font-size: 12px;
				font-weight: bold;
				font-family: Arial, Helvetica, sans-serif;
			 }
	.error   {
	       font-family: Arial, Helvetica, Verdana;	
				 font-size: 14px;color: #006699;
				 font-weight: bold;
			 }	 		 
.style26 {font-size: xx-small}
body,td,th {
	font-size: xx-small;
}
-->
</style>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">
  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String nomContrato = "";
    BigDecimal aux1 = new BigDecimal(0);
    BigDecimal ctam = new BigDecimal(0);
    BigDecimal scta = new BigDecimal(0);
    BigDecimal sscta = new BigDecimal(0);
    BigDecimal ssscta = new BigDecimal(0);
    BigDecimal sssscta = new BigDecimal(0);
    String nomCta = "";
    BigDecimal aux2 = new BigDecimal(0);
    BigDecimal aux3 = new BigDecimal(0);
    BigDecimal saldoAnterior = new BigDecimal(0);
    BigDecimal cargo = new BigDecimal(0);
    BigDecimal abono = new BigDecimal(0);
    BigDecimal saldoActual = new BigDecimal(0);
    
    BigDecimal totalSaldoAnterior = new BigDecimal(0);
    BigDecimal totalCargos = new BigDecimal(0);
    BigDecimal totalAbonos = new BigDecimal(0);
    BigDecimal totalSaldoActual = new BigDecimal(0);
    
    //Variables auxiliares para llevara  cabo los cortes
    BigDecimal fideicomisoActual = new BigDecimal(0);
    BigDecimal bigDecimalCero = new BigDecimal(0);
%>
<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
				<tr>
        <td><div align='center' style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">BALANZA DE COMPROBACION POR EJE</div></td>
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
		
	

    <br>

    <table border="0" cellspacing="0" cellpadding="0" style="font-size:8pt">
      <tr>
        <th nowrap align="left">CTA</th>
        <th width="20" nowrap align="left">S1</th>
        <th nowrap align="left">S2</th>
        <th nowrap align="left">S3</th>
        <th nowrap align="left">S4</th>
        <th nowrap align="left">A2</th>
        <th nowrap align="left">A3</th>
        <th nowrap align="left" width="30">&nbsp;</th>
        <th nowrap align="left">DESCRIPCION</th>
        <th nowrap width="200">SALDO ANTERIOR</th>
        <th nowrap width="200">CARGO</th>
        <th nowrap width="200">ABONO</th>
        <th nowrap width="200">SALDO ACTUAL</th>
      </tr>
<%  
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i);
        
        //Obtener datos de la BD
        nomContrato = (String)registro.get("ctoNomContrato");
        aux1 = (BigDecimal)registro.get("salNumAux1");
        ctam = (BigDecimal)registro.get("salNumCtam");
        scta = (BigDecimal)registro.get("salNumScta");
        sscta = (BigDecimal)registro.get("salNumSscta");
        ssscta = (BigDecimal)registro.get("salNumSsscta");
        sssscta = (BigDecimal)registro.get("salNumSssscta");
        nomCta = (String)registro.get("cueNomCta");
        aux2 = (BigDecimal)registro.get("salNumAux2");
        aux3 = (BigDecimal)registro.get("salNumAux3");
        saldoAnterior = (BigDecimal)registro.get("salSaldoIniPer");
        cargo = (BigDecimal)registro.get("salCargosPer");
        abono = (BigDecimal)registro.get("salAbonosPer");
        saldoActual = (BigDecimal)registro.get("salImpSaldoAct");
        
        if(fideicomisoActual.compareTo(aux1) != 0) { //Primer corte: SAL_NUM_AUX1
          
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
              <td nowrap width="30">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoAnterior)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos)%></td>
              <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoActual)%></td>
            </tr>
            <tr>
              <td colspan="13" nowrap>&nbsp;</td>
            </tr>
<%         
            totalSaldoAnterior = new BigDecimal(0);
            totalCargos = new BigDecimal(0);
            totalAbonos = new BigDecimal(0);
            totalSaldoActual = new BigDecimal(0);
          }
        
%>
          <tr style="font-weight:bolder">
            <td colspan="5" nowrap>FIDEICOMISO: </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>
              <%= aux1%>
            </td>
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
          <td align="right" nowrap><%=sssscta.intValue() != 0?sssscta.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=aux2.intValue() != 0?aux2.toString():"&nbsp;"%></td>
          <td align="right" nowrap><%=aux3.intValue() != 0?aux3.toString():"&nbsp;"%></td>
          <td width="30">&nbsp;</td>
          <td nowrap><%=nomCta%></td>
          <td align="right"><%=saldoAnterior.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", saldoAnterior):"&nbsp;"%></td>
          <td align="right"><%=cargo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", cargo):"&nbsp;"%></td>
          <td align="right"><%=abono.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", abono):"&nbsp;"%></td>
          <td align="right"><%=saldoActual.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", saldoActual):"&nbsp;"%></td>
        </tr>
<%    
        totalSaldoAnterior = new BigDecimal(totalSaldoAnterior.doubleValue() + saldoAnterior.doubleValue());
        totalCargos = new BigDecimal(totalCargos.doubleValue() + cargo.doubleValue());
        totalAbonos = new BigDecimal(totalAbonos.doubleValue() + abono.doubleValue());
        totalSaldoActual = new BigDecimal(totalSaldoActual.doubleValue() + saldoActual.doubleValue());
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
        <td nowrap width="30">&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoAnterior)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos)%></td>
        <td nowrap width="200" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", totalSaldoActual)%></td>
      </tr>
      <tr>
        <td colspan="13" nowrap>&nbsp;</td>
      </tr>
    </table>
  </body>
</html>