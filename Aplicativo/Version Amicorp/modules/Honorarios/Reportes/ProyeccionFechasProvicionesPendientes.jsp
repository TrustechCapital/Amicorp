<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="refSP" name="refSP" value="repProyeccionFecProv"/>
<input type="hidden" id="refQry" name="refQry" value="getProyeccionFecProv"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Honorarios/ProyeccionFechasProvicionesPendientes.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="PROYECCIÓN DE FECHAS DE PROVISIONES"/>
<input type="hidden" id="paramRepInfoTituloReporte" name="paramRepInfoTituloReporte" value="PROYECCIÓN DE FECHAS DE PROVISIONES"/>

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
  <tr>
    <td>Fechas</td>
    <td>
      <select id="paramFechas" name="paramFechas">
        <option value="1">Posteriores</option>
        <option value="2">Pasadas</option>
      </select>
    </td>
  </tr>    
  <tr>
    <td>Proceso</td>
    <td>
      <select id="paramProceso" name="paramProceso">
        <option value="1">Respaldo de Proyeccion de fechas</option>
        <option value="2">Aceptar en Proyeccion de fechas</option>
      </select>
    </td>
  </tr>      
</table>

<br/></br>

<hr/>