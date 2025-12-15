<%@ page contentType="text/html;charset=windows-1252 "%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="refSP" name="refSP" value="repBalanzaDesglosada"/>
<input type="hidden" id="refQry" name="refQry" value="getBalanzaDesglosada"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/BalanzaDesglosada.jsp"/>


<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" required tipo="Numero" required message="El Fideicomiso es un campo obligatorio" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td>Fecha Inicio:</td>
    <td>
      <input type="text" id="paramFechaDel" name="paramFechaDel" tipo="Fecha" required message="La Fecha de Inicio es un campo obligatorio" maxlength="10" size="10"/>
    </td>
  </tr>   
  <tr>
    <td>Fecha Fin:</td>
    <td>
      <input type="text" id="paramFechaAl" name="paramFechaAl" tipo="Fecha" required message="La Fecha de Fin es un campo obligatorio" maxlength="10" size="10"/>
    </td>
  </tr>   
</table>

<br/></br>

<hr/>