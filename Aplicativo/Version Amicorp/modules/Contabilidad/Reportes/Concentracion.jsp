<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="paramAno" name="paramAno" value="0"/>
<input type="hidden" id="paramMes" name="paramMes" value="0"/>
<!--input type="hidden" id="urlReporte" name="urlReporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/-->
<input type="hidden" id="refSP" name="refSP" value="repConcentracionMovtos"/>
<input type="hidden" id="refQry" name="refQry" value="getConcentracionMovtos"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/Concentracion.jsp"/>
<!--input type="hidden" id="template" name="template" value="/xml/Reportes/Contabilidad/template.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Aviso de Cobro"/>
<input type="hidden" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="AVISO DE COBRO"-->

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" required tipo="Numero" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td>Fecha:</td>
    <td>
      <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>