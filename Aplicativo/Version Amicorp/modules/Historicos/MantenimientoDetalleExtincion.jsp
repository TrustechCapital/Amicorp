<FORM name="frmMantenimientoDetalleExtincion" id="frmMantenimientoDetalleExtincion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Detalle de Extinci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Fideicomiso</td>
            <td nowrap>
              <input type="text" name="ctrContrato" id="ctrContrato" tipo="Num" size="15" maxlength="10"/>
            </td>
            <td nowrap>Usuario que Extingui&oacute;</td>
            <td nowrap>
              <input type="text" name="ctrUsuario" id="ctrUsuario" tipo="Num" size="15" maxlength="10"/>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Motivo</td>
            <td nowrap>
              <textarea name="ctrMotivo" id="ctrMotivo" style="width:300px;height:70px"></textarea>
            </td>
            <td nowrap>Sustituci&oacute;n Fiduciaria</td>
            <td nowrap>
              <textarea name="ctrFiducSust" id="ctrFiducSust" style="width:300px;height:70px"></textarea>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Comentario</td>
            <td nowrap>
              <textarea name="ctrComentario" id="ctrComentario" style="width:300px;height:70px"></textarea>
            </td>
            <td nowrap>Fecha de Sustituci&oacute;n</td>
            <td nowrap>
              <input type="text" name="ctrFecSust" id="ctrFecSust" tipo="Fecha" size="15" maxlength="10"/>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Fecha de Extinci&oacute;n</td>
            <td nowrap>
              <input type="text" name="ctrFecha" id="ctrFecha" tipo="Fecha" size="15" maxlength="10"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Regresar" name="cmdCancelar" class="boton_x" onclick="cargaDetalleExtincion();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
