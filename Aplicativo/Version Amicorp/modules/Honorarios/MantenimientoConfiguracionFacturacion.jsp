<FORM name="frmMantenimientoConfiguracionFacturacion" id="frmMantenimientoConfiguracionFacturacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Facturaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td colspan="3">
                <input type="radio" name="rdTipo" id="rdActualizaSerie" class="radio" required message="Es necesario elegir una de las opciones" onclick="habilitaCajasTexto();"/>Actualizaci&oacute;n de Serie de Facturaci&oacute;n
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="15%" colspan="3">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="15%">Serie Actual</td>
              <td width="15%">
                <input type="text" name="txtSerieActual" id="txtSerieActual" tipo="AlphaNumeric" size="4" maxlength="300"/>
              </td>
              <td>
                <input type="text" name="txtSerie" id="txtSerie" tipo="AlphaNumeric" size="4"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Serie Nueva</td>
              <td>
                <input type="text" name="txtSerieNueva" id="txtSerieNueva" tipo="AlphaNumeric" size="4" maxlength="300"/>
              </td>
              <td>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Clave de Autorizaci&oacute;n</td>
              <td class="textoRP" valign="top">
                <input type="text" name="txtClaveAutorizacion" id="txtClaveAutorizacion" tipo="AlphaNumeric" size="8" maxlength="300"/>
              </td>
              <td class="textoRP" valign="top">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%" colspan="3">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%" colspan="3">
                <input type="radio" name="rdTipo" id="rdCambiaClave" class="radio" required message="Es necesario elegir una de las opciones" onclick="habilitaCajasTexto();"/>Cambio de Clave de Autorizaci&oacute;n
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%" colspan="3">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Clave Anterior</td>
              <td width="15%">
                <input type="text" name="txtClaveAnterior" id="txtClaveAnterior" tipo="AlphaNumeric" size="8" maxlength="300"/>
              </td>
              <td>
                <input type="text" name="txtClaveAnteriorConfirma" id="txtClaveAnteriorConfirma" tipo="AlphaNumeric" size="8"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Clave Nueva</td>
              <td width="15%">
                <input type="text" name="txtClaveNueva" id="txtClaveNueva" tipo="AlphaNumeric" size="8" maxlength="300"/>
              </td>
              <td>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Confirmar Clave</td>
              <td width="15%">
                <input type="text" name="txtConfirmarClave" id="txtConfirmarClave" tipo="AlphaNumeric" size="8" maxlength="300"/>
              </td>
              <td>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="actualizaSerieOCambiaClave();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalFacturacion();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
