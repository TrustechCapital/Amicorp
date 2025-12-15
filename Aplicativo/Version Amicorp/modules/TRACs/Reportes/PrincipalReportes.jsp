<FORM name="frmReportes" id="frmReportes" onsubmit=" ">
  <input type="hidden" id="paramtipoReporte" name="paramtipoReporte" value=""/>
  <input type="hidden" id="paramEstructura" name="paramEstructura" value="1"/>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Reportes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td align="right" nowrap width="20%">&nbsp;</td>
            <td nowrap>Seleccione el Reporte</td>
            <td align="center">
              <select id="slcReportes" name="slcReportes" onchange="cargaReporte(this.value)" required message="El tipo de Reporte es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="ReporteCartera">Reporte Cartera</option>
                <option value="ComposicionCartera">Composición de Cartera</option>
                <option value="ValorTeoricoUnidad">Valor Teórico de la Unidad</option>
                <option value="ValorTeoricoCertificados">Valor Teórico de los Certificados</option>
                <option value="ValorTeoricoFideicomiso">Valor Teórico del Fideicomiso</option>
                <option value="CertificadosCirculacion">Certificados en Circulación</option>
                <option value="ReporteEmisnet">Reporte EMISNET</option>
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
        <input type="BUTTON" value="Generar " name="cmdAceptar" class="boton" onclick="ejecutaReporte();"/>
        <!--input type=&quot;BUTTON&quot; value=&quot;Cancelar&quot; name=&quot;cmdCancelar&quot; class=&quot;boton&quot; onclick=&quot;();&quot;/!-->
      </td>
    </tr>
  </table>
  <!--input type=&quot;hidden&quot; id=&quot;paramRepInfoUrlLogo&quot; name=&quot;paramRepInfoUrlLogo&quot; value=&quot;&lt;%=&quot;http://&quot; + request.getServerName() + &quot;:&quot; + request.getServerPort() + request.getContextPath()+&quot;/imagenes/logo_bn.jpg&quot;%&gt;&quot; /&gt;
    &lt;input type=&quot;hidden&quot; id=&quot;paramRepInfoFechaReporte&quot; name=&quot;paramRepInfoFechaReporte&quot; value=&quot;&lt;%=mx.gob.nafin.fiduciario.common.util.DateTimeUtils.formatDateTimeFromPattern(&quot;dd' de 'MMMMM' del 'yyyy&quot;, new java.util.Date(), java.util.Locale.getDefault())%&gt;&quot;/-->
</FORM>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 
