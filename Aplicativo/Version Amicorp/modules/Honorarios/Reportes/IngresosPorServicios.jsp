<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="refSP" name="refSP" value="repIngresosServicio"/>
<input type="hidden" id="refQry" name="refQry" value="getIngresosServicio"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Honorarios/OtrosIngresosFideicomiso.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Otros Ingresos por Servicios"/>
<input type="hidden" id="paramRepInfoTituloReporte" name="paramRepInfoTituloReporte" value="Otros Ingresos por Servicios"/>

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Año</td>
    <td>
      <input type="text" id="paramAno" name="paramAno" tipo="Numero"/>
    </td>
  </tr>
  <tr>
    <td>Mes</td>
    <td>
      <select id="paramMes" name="paramMes">
        <option value="1">Enero</option>
        <option value="2">Febrero</option>
        <option value="3">Marzo</option>
        <option value="4">Abril</option>
        <option value="5">Mayo</option>
        <option value="6">Junio</option>
        <option value="7">Julio</option>
        <option value="8">Agosto</option>
        <option value="9">Septiembre</option>
        <option value="10">Octubre</option>
        <option value="11">Noviembre</option>
        <option value="12">Diciembre</option>
      </select>
    </td>
  </tr>  
</table>

<br/></br>

<hr/>