<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="refSP" name="refSP" value="repAviso"/>
<input type="hidden" id="refQry" name="refQry" value="getAviso"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Honorarios/AvisoCobro.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Recordatorio"/>
<input type="hidden" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="PRIMER RECORDATORIO">

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Periodicidad</td>
    <td>
      <select id="paramPeriodicidad" name="paramPeriodicidad" required>
        <option value="1">MENSUAL</option>
        <option value="2">BIMESTRAL</option>
        <option value="3">TRIMESTRAL</option>
        <option value="4">SEMESTRAL Y ANUAL</option>
      </select>
    </td>
  </tr>  
  <tr>
    <td>Tipo de Aviso</td>
    <td>
      <select id="paramTipoAviso" name="paramTipoAviso" required>
        <option value="1">Aviso</option>
        <option value="2">Primer Recordatorio</option>
        <option value="3">Segundo Recordatorio</option>
        <option value="4">Tercer Recordatorio</option>
      </select>
    </td>
  </tr>    
  <tr>
    <td>Fideicomiso</td>
    <td>
      <input type="text" id="paramFideicomiso" name="paramFideicomiso" tipo="Numero"/>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>