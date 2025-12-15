<form name="frmDatosInterfaseTEFFFON" id="frmDatosInterfaseTEFFFON">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Interfase TEF v&iacute;a FFON</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td align="center" width="25%" colspan="4">&nbsp;Fecha Valor&nbsp;&nbsp;&nbsp;
            <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaFechaValor" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio"/>
            </td>
          </tr>
          <tr valign="middle">
            <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" class="subtitulo" width="29%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="2">Fecha&nbsp;de&nbsp;Recepci&oacute;n</td>
            <td align="left" class="subtitulo" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo" width="30%">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">
              <input type="radio" name="chkFechaRecepcion" id="chkFechaRecepcion1" class="radio" required message="La Fecha de Recepción es un campo obligatorio"/></td>
            <td align="left" width="44%">&nbsp;Todas</td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" nowrap width="3%">
              <input type="radio" name="chkFechaRecepcion" id="chkFechaRecepcion2" class="radio"/></td>
              <td align="left" nowrap width="44%">
                <div id="dvFechaAnterior">&nbsp;</div>
              </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">
              <input type="radio" name="chkFechaRecepcion" id="chkFechaRecepcion3" class="radio">
              </input>
            </td>
            <td align="left" width="44%">
              <div id="dvFechaValor">&nbsp;</div>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaStoreInterfaseTEFFFON();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClick('Tesoreria.InterfaseTEFFFON.PrincipalInterfaseTEFFFON','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
