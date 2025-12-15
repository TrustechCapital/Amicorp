<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmReportes" id="frmReportes" onsubmit="">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Reportes de Tesoreria</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td align="right" nowrap><b>Seleccione el Reporte</b></td>
              <td align="center">
                <select id="slcReportes" name="slcReportes" onchange="cargaReporte(this.value)" required>
                  <option value="-1">-- Seleccione --</option>
                  <option value="FichaUnicaFoseg">Ficha Unica FOSEG</option>-->
                  <option value="FichaUnicaSinFoseg">Ficha Unica No FOSEG</option>-->                  
                </select>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <hr/>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <div id="dvReporte" class="texto"></div>
              </td>
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
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
    </form>
  </table>
</TD>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 
