<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<input type="hidden" id="paramAno" name="paramAno" value="0"/>
<input type="hidden" id="paramMes" name="paramMes" value="0"/>
<input type="hidden" id="paramDia" name="paramDia" value="0"/>

<input type="hidden" id="refSP" name="refSP" value="repInventarioNegocios"/>
<input type="hidden" id="refQry" name="refQry" value="getInventarioNegocios"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Administracion/InventarioNegocios.jsp"/>

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
   
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" maxlength="10" size="10">
    </td>
  </tr> 

  <tr>   
    <td>Tipo Persona</td>
    <td>
	<select size="1" name="paramTipoPersona" id="paramTipoPersona" ref="cves" fun="loadComboElementDo" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded"  param="cmbObligacionesFiscalesParam">
	<option value="-1">-- Seleccione --</option>
	<option value="FIDEICOMITENTE">FIDEICOMITENTE</option>
	<option value="BENEFICIARIO">FIDEICOMISARIO</option>
	</select>

    </td>
  </tr>
  
  
  <tr>
    <td>Num Persona:</td>
    <td>
      <input type="text" id="paramNumPersona" name="paramNumPersona"   size="10">
    </td>
  </tr>   
  
  <tr>
    <td>RFC Persona:</td>
    <td>
      <input type="text" id="paramRFC" name="paramRFC"   size="10">
    </td>
  </tr>  

  
  <tr>
    <td>Fecha (Constitucion/Nacimiento) Del:</td>
    <td>
      <input type="text" id="paramFechaDel" name="paramFechaDel" tipo="Fecha"  maxlength="10" size="10"/>
    </td>
  </tr>  
  <tr>
    <td>Fecha (Constitucion/Nacimiento) Al:</td>
    <td>
      <input type="text" id="paramFechaAl" name="paramFechaAl" tipo="Fecha"  maxlength="10" size="10"/>
    </td>
  </tr>    


  <tr>   
    <td>Status Fideicomiso</td>
    <td>
	<select size="1" name="paramStatus" id="paramStatus" ref="cves" fun="loadComboElementDo" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded"  param="cmbObligacionesFiscalesParam">
	<option value="-1">-- Seleccione --</option>
	<option value="ACTIVO">ACTIVO</option>
	<option value="EXTINTO">EXTINTO</option>
	<option value="SUSPENDIDO">SUSPENDIDO</option>
	</select>
    </td>
  </tr>

  
</table>

<br/></br>

<hr/>