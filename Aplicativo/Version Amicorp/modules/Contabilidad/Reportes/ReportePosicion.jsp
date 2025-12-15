<!--ReportePosicion.jsp-->
<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="paramAno" name="paramAno"/>
<input type="hidden" id="paramMes" name="paramMes"/>
<input type="hidden" id="paramDia" name="paramDia"/>
<input type="hidden" id="refSP" name="refSP" value="repRepPosicion"/>
<input type="hidden" id="refQry" name="refQry" value="getRepPosicion"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/ReportePosicion.jsp"/>
<input type="hidden" id="paramOrder" name="paramOrder" value="s"/>
<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" required tipo="Numero" maxlength="10" size="10">
    </td>
  </tr>
</table>

<br/></br>

<hr/>