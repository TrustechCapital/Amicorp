<%@ page contentType="text/html;charset=windows-1252"%>
<br/>
<!-- <input type="hidden" id="paramUsuario" name="p aramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>-->
<!--input type="hidden" id="urlReporte" name="urlR eporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/-->
<input type="hidden" id="refSP" name="refSP" value="spEnvioInfo"/>
<input type="hidden" id="refQry" name="refQry" value="qryEnvioInfo"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/EnvioInfo.jsp"/>
<table border="0" cellpadding="1" class="texto" cellspacing="5" width="60%" align="center">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" tipo="Numero" maxlength="10" size="10" onchange="valorFide(this.value)">
    </td>
  </tr>  
</table>

<br/></br>

<hr/>