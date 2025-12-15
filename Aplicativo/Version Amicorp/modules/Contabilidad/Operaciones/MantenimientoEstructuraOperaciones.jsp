<form name="frmMantenimientoEstructuraOperaciones" id="frmMantenimientoEstructuraOperaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Estructura de Operaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td class="subtitulo" width="20%" height="22">&nbsp;</td>
            <td class="subtitulo" colspan="2" height="22">Estructura de Operaciones</td>
            <td width="10%" height="22">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Operaci&oacute;n</td>
            <td>
              <input type="text" name="eopNumOperacion" id="eopNumOperacion" size="10" maxlength="10" tipo="Num" required message="El No. de Operación es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Secuencial</td>
            <td>
              <input type="text" name="eopNumSecOpera" id="eopNumSecOpera" size="10" maxlength="10" tipo="Num" required message="El Secuencial es un campo obligatorio"/>
              <input type="text" name="eopNumModulo" id="eopNumModulo" size="2" maxlength="10" tipo="Num" value="2" style="visibility:hidden"/>
              <input type="text" name="eopNumTransac" id="eopNumTransac" size="2" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Transacci&oacute;n</td>
            <td>
              <input type="text" name="eopNomTransac" id="eopNomTransac" size="80" maxlength="255" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Status</td>
            <td>
              <select size="1" name="eopCveStEstoper" id="eopCveStEstoper" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValores2ObjHTMLEstructuraOperaciones" required message="El status es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEstructura();" style="visibility:hidden"/>
              <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaMantenimientoOperaciones(modo);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="subtitulo" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="subtitulo" colspan="2">Criterio de B&uacute;squeda Transacci&oacute;n</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td nowrap>No. Transacci&oacute;n</td>
            <td class="subtitulo">
              <input type="text" name="txtTransaccion" id="txtTransaccion" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td nowrap>Nombre Transacci&oacute;n</td>
            <td class="subtitulo">
              <input type="text" name="txtNomTransaccion" id="txtNomTransaccion" size="40" maxlength="255" onblur="cargaComboEstructura();" />&nbsp;<input type="button" value="Consultar Transacciones" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaComboEstructura();" style="visibility:hidden"/>  
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td nowrap>Transacci&oacute;n</td>
            <td class="subtitulo">
              <select size="1" name="cmbTransacciones" id="cmbTransacciones" ref="conTra" fun="loadComboElement" keyValue="trsNumTransac" theValue="trsNumNomTransac" param="cmbTransaccionParam" next="hideWaitLayer" required message="La Transacción es un campo obligatorio" onchange="asignaValorTransaccion(this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
