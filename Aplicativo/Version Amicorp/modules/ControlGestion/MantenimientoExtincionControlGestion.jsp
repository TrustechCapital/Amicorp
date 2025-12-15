<FORM name="frmMantenimientoExtincionControlGestion" id="frmMantenimientoExtincionControlGestion" onsubmit="">
<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Ficha de Extinci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="2%">&nbsp;</td>
              <td width="14%">Motivo</td>
              <td width="25%" colspan="4">
                <select size="1" name="cmbMotivo" id="cmbMotivo" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbUsuario" param="clavesCombo133" required message="El Motivo es un campo obligatorio"/>
                <input type="text" name="txtFiso" id="txtFiso" tipo="Num" size="15" style="visibility:hidden"/>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">Comentario</td>
              <td colspan="4">
                <textarea name="txtComentarios" id="txtComentarios" required message="Es obligatorio colocar el Comentario"></textarea>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">Fecha de Extinci&oacute;n</td>
              <td colspan="4">
                <input type="text" name="txtFecha" id="txtFecha" tipo="Fecha" size="15" required message="La fecha es un campo obligatorio"/>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">Usuario</td>
              <td colspan="4">
                <select size="1" name="cmbUsuario" id="cmbUsuario" ref="muestraUsuarios" fun="loadComboElement" keyValue="usuNumUsuario" theValue="usuNomUsuario" next="formsLoaded" required message="El usuario es un campo obligatorio"/>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">&nbsp;</td>
              <td colspan="4">&nbsp;</td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">&nbsp;</td>
              <td colspan="4">* FIDUCIARIO SUSTITUTO</td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">Fiduciario</td>
              <td colspan="4">
                <input type="hidden" name="antNumProducto" id="antNumProducto" tipo="Num" size="3"/>
                <input type="text" name="txtFidSust" id="txtFidSust" tipo="AlphaNumeric" size="50"/>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
            <tr>
              <td width="2%">&nbsp;</td>
              <td width="14%">Fecha de Sustituci&oacute;n</td>
              <td colspan="4">
                <input type="text" name="txtFechaSust" id="txtFechaSust" tipo="AlphaNumeric" size="15"/>
              </td>
              <td width="1%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="verificarEjecucionFuncion();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalExtincionControlGestion();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</TD>
</FORM>
