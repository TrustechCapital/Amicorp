<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="refSP" name="refSP" value="repAviso"/>
<input type="hidden" id="refQry" name="refQry" value="getAviso"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Honorarios/AvisoCobro.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Aviso de Cobro"/>
<input type="hidden" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="AVISO DE COBRO">

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Periodicidad</td>
    <td>
      <select id="paramPeriodicidad" name="paramPeriodicidad" required tipo="Numero">
        <option value="1">Mensual</option>
        <option value="2">Bimestral</option>
        <option value="3">Trimestral</option>
        <option value="4">Semestral y Anual</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>Fideicomiso</td>
    <td>
      <input type="text" id="paramFideicomiso" name="paramFideicomiso" tipo="Numero"/>
      <input type="hidden" id="paramTipoAviso" name="paramTipoAviso" tipo="Numero" value="1"/>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>