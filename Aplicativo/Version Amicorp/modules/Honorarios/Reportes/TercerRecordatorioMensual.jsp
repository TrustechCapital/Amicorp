<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="refSP" name="refSP" value="repAviso"/>
<input type="hidden" id="refQry" name="refQry" value="getAviso"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Honorarios/TercerRecordatorioMT.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Recordatorio"/>
<input type="hidden" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="TERCER RECORDATORIO">

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Periodicidad</td>
    <td>
      <select id="paramPeriodicidad" name="paramPeriodicidad" onchange="TercerRecordatorio(this);" required>
        <option value="1">MENSUAL</option>
        <option value="2">BIMESTRAL</option>
        <option value="3">TRIMESTRAL</option>
        <option value="4">SEMESTRAL Y ANUAL</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>Fideicomiso</td>
    <td>
      <input type="text" id="paramFideicomiso" name="paramFideicomiso" tipo="Numero"/>
      <input type="hidden" id="paramTipoAviso" name="paramTipoAviso" tipo="Numero" value="4"/>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>