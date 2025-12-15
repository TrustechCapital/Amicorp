<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="paramDia" name="paramDia" value="0"/>
<input type="hidden" id="paramAno" name="paramAno"/>
<input type="hidden" id="paramMes" name="paramMes"/>
<input type="hidden" id="refSP" name="refSP" value="repEdosFinanDinamic"/>
<input type="hidden" id="refQry" name="refQry" value="getEstadoCambios"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/EstadoCambios.jsp"/>
<input type="hidden" id="paramEdoFinan" name="paramEdoFinan" value="3"/>
<!--input type="hidden" id="template" name="template" value="/xml/Reportes/Contabilidad/template.xsl"/-->

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" tipo="Numero" required message="El fideicomiso es un campo requerido" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td>Fecha:</td>
    <td>
      <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" required message="La fecha es un campo requerido" maxlength="10" size="10"/>
    </td>
  </tr>  
  <tr>
    <td>Cuenta:</td>
    <td>
      <input type="text" id="paramCuenta" name="paramCuenta" tipo="Numero" maxlength="10" size="10"/>
    </td>
  </tr>  
</table>
<br/></br>
<hr/>