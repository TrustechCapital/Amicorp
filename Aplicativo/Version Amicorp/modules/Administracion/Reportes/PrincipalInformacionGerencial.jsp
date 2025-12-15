<FORM name="frmReportes" id="frmReportes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Informaci&oacute;n Gerencial</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td align="right" nowrap width="20%">&nbsp;</td>
            <td nowrap>Seleccione el Informe</td>
            <td align="center">
              <select id="cmbReportes" name="cmbReportes" onchange="cargaReporte(this.value)" required message="El tipo de Reporte es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="AvanceProyectosNegociosFiduciarios">Monitor de Instrucciones</option>
				<option value="InventarioNegocios">Inventario de Negocios</option>
				<option value="AltasBajasFisos">Historico de Riesgo</option>
				<option value="InformacionPersonas">Informacion Personas</option>
              </select>
            </td>
            <td align="center" width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td colspan="2">
              <div id="dvReporte" class="texto"/>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaReporte();"/>
        <!--input type=&quot;BUTTON&quot; value=&quot;Cancelar&quot; name=&quot;cmdCancelar&quot; class=&quot;boton&quot; onclick=&quot;();&quot;/!-->
      </td>
    </tr>
  </table>
  <!--input type=&quot;hidden&quot; id=&quot;paramRepInfoUrlLogo&quot; name=&quot;paramRepInfoUrlLogo&quot; value=&quot;&lt;%=&quot;http://&quot; + request.getServerName() + &quot;:&quot; + request.getServerPort() + request.getContextPath()+&quot;/imagenes/logo_bn.jpg&quot;%&gt;&quot; /&gt;
    &lt;input type=&quot;hidden&quot; id=&quot;paramRepInfoFechaReporte&quot; name=&quot;paramRepInfoFechaReporte&quot; value=&quot;&lt;%=mx.gob.nafin.fiduciario.common.util.DateTimeUtils.formatDateTimeFromPattern(&quot;dd' de 'MMMMM' del 'yyyy&quot;, new java.util.Date(), java.util.Locale.getDefault())%&gt;&quot;/-->
</FORM>
<a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 
