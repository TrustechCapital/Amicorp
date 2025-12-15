<%@ page contentType="text/html;charset=windows-1252 "%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="paramOrder" name="paramOrder" value="s"/>
<input type="hidden" id="urlReporte" name="urlReporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/>
<input type="hidden" id="refSP" name="refSP" value="spMovDia"/>
<input type="hidden" id="refQry" name="refQry" value="qryMovDia"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/MovimientosDiario.jsp"/>
<!--input type="hidden" id="template" name="template" value="/xml/Reportes/Contabilidad/template.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Aviso de Cobro"/>
<input type="hidden" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="AVISO DE COBRO"-->

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" tipo="Numero" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td>Fecha Inicial:</td>
    <td>
      <input type="text" id="paramFechaInicial" name="paramFechaInicial" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>
  <tr>
    <td>Fecha Final:</td>
    <td>
      <input type="text" id="paramFechaFinal" name="paramFechaFinal" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>
  <tr>
    <td>Cuenta:</td>
    <td>
      <input type="text" id="paramCtaCheques" name="paramCtaCheques" tipo="Numero" maxlength="10" size="10"/>
    </td>
  </tr>
</table>

<br/></br>

<hr/>