<FORM name="frmImprimirInterfaseContable" id="frmImprimirInterfaseContable" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Interfase Contable SIF</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td align="center" width="25%" colspan="3">&nbsp;Fecha de Proceso&nbsp;&nbsp;&nbsp;
                <input type="text" name="paramRepInfoRavFechaProceso" id="paramRepInfoRavFechaProceso" tipo="Fecha" size="10" maxlength="10"/>
              </td>
            </tr>
            <tr valign="middle">
              <td colspan="3" align="left" class="subtitulo">&nbsp;
              </td>
            </tr>
            <tr valign="middle">
              <td align="left" class="subtitulo">&nbsp;</td>
              <td align="left" class="subtitulo">Impresi&oacute;n de Reportes</td>
              <td align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" class="subtitulo">&nbsp;</td>
              <td align="left" class="subtitulo">
                <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
              </td>
              <td align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="40%">
                <input type="radio" class="radio" name="rdImpresionReportes" id="rdFichaUnica" required message="Es forzoso elegir una opción"/>Ficha &Uacute;nica
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="40%">
                <input type="radio" class="radio" name="rdImpresionReportes" id="rdReporteErrores"/>Reporte de Errores
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value=" Imprimir " name="cmdAceptar" class="boton" onclick="ejecutaReporte();"/>
          <input type="BUTTON" value="Cancelar " name="cmdCancelar" class="boton" onclick="cargaPolizasInterfaseContableSIF();"/>
        </td>
      </tr>
  </table>
</FORM>
