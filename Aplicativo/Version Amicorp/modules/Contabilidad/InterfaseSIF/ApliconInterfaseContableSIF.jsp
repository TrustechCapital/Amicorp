<FORM name="frmApliconInterfaseContable" id="frmApliconInterfaseContable" onsubmit="">
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
              <td align="center" width="25%" colspan="4">&nbsp;Fecha de Proceso&nbsp;&nbsp;&nbsp;
                <input type="text" name="txtFechaProceso" id="txtFechaProceso" tipo="Fecha" size="10" maxlength="10"/>
              </td>
            </tr>
            <tr valign="middle">
              <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" class="subtitulo">&nbsp;</td>
              <td align="left" class="subtitulo" colspan="2">Generaci&oacute;n del Aplicon</td>
              <td align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Archivo</td>
              <td align="left" width="25%">
                <input type="text" name="txtArchivo" id="txtArchivo" tipo="AlphaNumeric" size="30"/>
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
          <input type="BUTTON" value=" Aceptar " name="cmdAceptar" class="boton" onclick="generaArchivoAplicon();"/>
          <input type="BUTTON" value="Cancelar " name="cmdCancelar" class="boton" onclick="cargaPolizasInterfaseContableSIF();"/>
        </td>
      </tr>
  </table>
</FORM>
