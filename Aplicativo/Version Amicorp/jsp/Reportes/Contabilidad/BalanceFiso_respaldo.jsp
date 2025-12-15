<%@ page contentType="application/vnd.ms-excel"%>
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
  response.setContentType("application/vnd.ms-excel");
  //response.setHeader("Content-Disposition", "attachment; filename=\"mult-table.xls\"");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String tipoNegocio = "";
    String creditos = "";
    String valores = "";
    String inmuebles = "";
    String efectivo = "";
    String otros = "";
    String fideicomitentes = "";
    
    BigDecimal numContrato = new BigDecimal(0);
    String nomContrato = "";
    
    BigDecimal impCreditos = new BigDecimal(0);
    BigDecimal impValores = new BigDecimal(0);
    BigDecimal impInmuebles = new BigDecimal(0);
    BigDecimal impEfectivo = new BigDecimal(0);
    BigDecimal impOtros = new BigDecimal(0);
    BigDecimal impFideicomitentes = new BigDecimal(0);
    
    BigDecimal totalImpCreditos = new BigDecimal(0);
    BigDecimal totalImpValores = new BigDecimal(0);
    BigDecimal totalImpInmuebles = new BigDecimal(0);
    BigDecimal totalImpEfectivo = new BigDecimal(0);
    BigDecimal totalImpOtros = new BigDecimal(0);
    BigDecimal totalImpFideicomitentes = new BigDecimal(0);
    
    BigDecimal generalImpCreditos = new BigDecimal(0);
    BigDecimal generalImpValores = new BigDecimal(0);
    BigDecimal generalImpInmuebles = new BigDecimal(0);
    BigDecimal generalImpEfectivo = new BigDecimal(0);
    BigDecimal generalImpOtros = new BigDecimal(0);
    BigDecimal generalImpFideicomitentes = new BigDecimal(0);
    
    String strVacio = "";
    
    //Variables auxiliares para llevara  cabo los cortes
    String tipoNegocioActual = "";
%>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='738'>
				<tr>
        <td>
          <div align='center'>
            <p class='style14'>PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</p>            
          </div>
        </td>
      </tr>
      <tr>
        <td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
      </tr>
      <tr>
        <td><div align='center' class='style15'><span class='style16'>BALANZA FISO</span></div></td>
      </tr>
      <tr><td height='23'>&nbsp;</td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7'><div align='center'><img src='../../../imagenes/logo_bn.jpg' width='102' height='70'></div></td>
					
				</tr>
			</table>
		</td>
		</tr>
		</table>
	

    <table cellspacing="0" cellpadding="0" style="font-size:8pt" border="0">
<%  
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i);
        
        //Obtener datos de la BD
        tipoNegocio = (String)registro.get("rbaTipoNegocio");
        creditos = (String)registro.get("rbaEncCreditos");
        valores = (String)registro.get("rbaEncValores");
        inmuebles = (String)registro.get("rbaEncInmuebles");
        efectivo = (String)registro.get("rbaEncEfectivo");
        otros = (String)registro.get("rbaEncOtros");
        fideicomitentes = (String)registro.get("rbaEncFieicomitentes");
        
        numContrato = (BigDecimal)registro.get("rbaNumContrato");
        nomContrato = (String)registro.get("rbaNomContrato");
        
        impCreditos = (BigDecimal)registro.get("rbaImpCreditos");
        impValores = (BigDecimal)registro.get("rbaImpValores");
        impInmuebles = (BigDecimal)registro.get("rbaImpInmuebles");
        impEfectivo = (BigDecimal)registro.get("rbaImpEfectivo");
        impOtros =(BigDecimal)registro.get("rbaImpOtros");
        impFideicomitentes = (BigDecimal)registro.get("rbaImpFideicomitentes");      
        
        if(tipoNegocioActual.compareTo(tipoNegocio) != 0) { //Primer corte: RBA_TIPO_NEGOCIO
          
          if(tipoNegocioActual.compareTo(tipoNegocio) != 0 && tipoNegocioActual.compareTo(strVacio) != 0) { //Totales
%>
            <tr>
              <td colspan="9" nowrap>&nbsp;</td>
            </tr>
            <tr style="font-weight:bolder">
              <td nowrap>&nbsp;</td>
              <td nowrap width="20">&nbsp;</td>
              <td nowrap>TOTALES:</td>
              <td nowrap width="150" align="right"><%=totalImpCreditos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpCreditos):"&nbsp;"%></td>
              <td nowrap width="150" align="right"><%=totalImpValores.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpValores):"&nbsp;"%></td>
              <td nowrap width="150" align="right"><%=totalImpInmuebles.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpInmuebles):"&nbsp;"%></td>
              <td nowrap width="150" align="right"><%=totalImpEfectivo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpEfectivo):"&nbsp;"%></td>
              <td nowrap width="150" align="right"><%=totalImpOtros.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpOtros):"&nbsp;"%></td>
              <td nowrap width="150" align="right"><%=totalImpFideicomitentes.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpFideicomitentes):"&nbsp;"%></td>
            </tr>
            <tr>
              <td colspan="9" nowrap>&nbsp;</td>
            </tr>
<%                      
            totalImpCreditos = new BigDecimal(0);
            totalImpValores = new BigDecimal(0);
            totalImpInmuebles = new BigDecimal(0);
            totalImpEfectivo = new BigDecimal(0);
            totalImpOtros = new BigDecimal(0);
            totalImpFideicomitentes = new BigDecimal(0);
          }
        
%>
            <tr style="font-weight:bolder">
              <td nowrap colspan="3"><%=tipoNegocio != null?tipoNegocio:"&nbsp;"%></td>
              <td nowrap align="center"><%=creditos != null?creditos:"&nbsp;"%></td>
              <td nowrap align="center"><%=valores != null?valores:"&nbsp;"%></td>
              <td nowrap align="center"><%=inmuebles != null?inmuebles:"&nbsp;"%></td>
              <td nowrap align="center"><%=efectivo != null?efectivo:"&nbsp;"%></td>
              <td nowrap align="center"><%=otros != null?otros:"&nbsp;"%></td>
              <td nowrap align="center"><%=fideicomitentes != null?fideicomitentes:"&nbsp;"%></td>
            </tr>
            <%tipoNegocioActual = tipoNegocio;%>
<%        
          i--;
          continue;
        }
%>
        <tr>
          <td nowrap width="50" align="right"><%=numContrato%></td>
          <td nowrap width="20">&nbsp;</td>
          <td nowrap><%=nomContrato%></td>
          <td width="150" align="right"><%=impCreditos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impCreditos):"&nbsp;"%></td>
          <td width="150" align="right"><%=impValores.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impValores):"&nbsp;"%></td>
          <td width="150" align="right"><%=impInmuebles.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impInmuebles):"&nbsp;"%></td>
          <td width="150" align="right"><%=impEfectivo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impEfectivo):"&nbsp;"%></td>
          <td width="150" align="right"><%=impOtros.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impOtros):"&nbsp;"%></td>
          <td width="150" align="right"><%=impFideicomitentes.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", impFideicomitentes):"&nbsp;"%></td>
        </tr>
<%    
        totalImpCreditos = new BigDecimal(totalImpCreditos.doubleValue() + impCreditos.doubleValue());
        totalImpValores = new BigDecimal(totalImpValores.doubleValue() + impValores.doubleValue());
        totalImpInmuebles = new BigDecimal(totalImpInmuebles.doubleValue() + impInmuebles.doubleValue());
        totalImpEfectivo = new BigDecimal(totalImpEfectivo.doubleValue() + impEfectivo.doubleValue());
        totalImpOtros = new BigDecimal(totalImpOtros.doubleValue() + impOtros.doubleValue());
        totalImpFideicomitentes = new BigDecimal(totalImpFideicomitentes.doubleValue() + impFideicomitentes.doubleValue());
        
        generalImpCreditos = new BigDecimal(generalImpCreditos.doubleValue() + impCreditos.doubleValue());
        generalImpValores = new BigDecimal(generalImpValores.doubleValue() + impValores.doubleValue());
        generalImpInmuebles = new BigDecimal(generalImpInmuebles.doubleValue() + impInmuebles.doubleValue());
        generalImpEfectivo = new BigDecimal(generalImpEfectivo.doubleValue() + impEfectivo.doubleValue());
        generalImpOtros = new BigDecimal(generalImpOtros.doubleValue() + impOtros.doubleValue());
        generalImpFideicomitentes = new BigDecimal(generalImpFideicomitentes.doubleValue() + impFideicomitentes.doubleValue());
      }
%>
      <tr>
        <td colspan="9" nowrap>&nbsp;</td>
      </tr>
      <tr style="font-weight:bolder">
        <td nowrap>&nbsp;</td>
        <td nowrap width="20">&nbsp;</td>
        <td nowrap>TOTALES:</td>
        <td nowrap width="150" align="right"><%=totalImpCreditos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpCreditos):"&nbsp;"%></td>
        <td nowrap width="150" align="right"><%=totalImpValores.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpValores):"&nbsp;"%></td>
        <td nowrap width="150" align="right"><%=totalImpInmuebles.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpInmuebles):"&nbsp;"%></td>
        <td nowrap width="150" align="right"><%=totalImpEfectivo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpEfectivo):"&nbsp;"%></td>
        <td nowrap width="150" align="right"><%=totalImpOtros.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpOtros):"&nbsp;"%></td>
        <td nowrap width="150" align="right"><%=totalImpFideicomitentes.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalImpFideicomitentes):"&nbsp;"%></td>
      </tr>
      <tr>
        <td colspan="9" nowrap>&nbsp;</td>
      </tr>
      <tr style="font-weight:bolder">
        <td nowrap>&nbsp;</td>
        <td nowrap width="20">&nbsp;</td>
        <td nowrap>&nbsp;</td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpCreditos)%></td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpValores)%></td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpInmuebles)%></td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpEfectivo)%></td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpOtros)%></td>
        <td nowrap width="150" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", generalImpFideicomitentes)%></td>
      </tr>
      <tr>
        <td colspan="9" nowrap>&nbsp;</td>
      </tr>
      
    </table>
  </body>
</html>