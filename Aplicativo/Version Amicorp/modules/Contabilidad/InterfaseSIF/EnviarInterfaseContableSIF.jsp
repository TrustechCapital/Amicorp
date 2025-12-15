<FORM name="frmEnviarInterfaseContable" id="frmEnviarInterfaseContable" onsubmit="">
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
              <td align="left" class="subtitulo" colspan="2">Env&iacute;o de Archivo</td>
              <td align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Destino</td>
              <td align="left" width="25%">
                <input type="text" name="txtDestino" id="txtDestino" tipo="AlphaNumeric" size="15"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Usuario</td>
              <td align="left" width="25%">
                <input type="text" name="txtUsuario" id="txtUsuario" tipo="AlphaNumeric" size="15"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Password</td>
              <td align="left" width="25%">
                <input type="password" name="txtPassword" id="txtPassword" tipo="AlphaNumeric" size="15" maxlength="15" required message="El Password es un campo obligatorio"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Archivo</td>
              <td align="left" width="25%">
                <input type="text" name="txtArchivo" id="txtArchivo" tipo="AlphaNumeric" size="30"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Ruta</td>
              <td align="left" width="25%" colspan="2">
                <input type="text" name="txtRuta" id="txtRuta" tipo="AlphaNumeric" size="50"/>
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
          <input type="BUTTON" value="  Enviar  " name="cmdEnviar" class="boton" onclick="botonEnviar();"/> &nbsp;
          <input type="BUTTON" value=" Cancelar " name="cmdCancelar" class="boton" onclick="cargaPolizasInterfaseContableSIF();"/>
        </td>
      </tr>
  </table>
  <a id="ligaArchivo" href="#"/>
</FORM>
