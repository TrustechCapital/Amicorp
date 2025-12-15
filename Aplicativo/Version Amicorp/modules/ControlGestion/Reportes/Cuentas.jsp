<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="paramAno" name="paramAno" value="0"/>
<input type="hidden" id="paramMes" name="paramMes" value="0"/>

<input type="hidden" id="refQry" name="refQry" value="getAltasBajasFisos"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Administracion/AltasBajasFisos.jsp"/>

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fecha:</td>
    <td>
      <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" maxlength="10" size="10" required message="La Fecha es un campo obligatorio"/>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>