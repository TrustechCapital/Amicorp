<form name="frmMantenimientoObligacionesFiscales" id="frmMantenimientoObligacionesFiscales" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Obligaciones Fiscales</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td>No. Clave</td>
            <td>
              <input type="text" name="obfCveObligfisc" id="obfCveObligfisc" tipo="AlphaNumeric" required message="El No. Clave es un campo obligatorio" maxlength="20" size="20" onblur="verificaExistaClave();"/>
              <input type="text" name="obfCveStOblfis" id="obfCveStOblfis" tipo="AlphaNumeric" size="5" value="ACTIVO" style="visibility:hidden"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Tipo de Impuesto</td>
            <td>
              <input type="text" name="oblTipoImp" id="oblTipoImp" tipo="AlphaNumeric" required message="El Tipo de Impuesto es un campo obligatorio" maxlength="100" size="50"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;
            </td>
            <td colspan="2">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Concepto</td>
            <td>
              <input type="text" name="obfDescripcion" id="obfDescripcion" tipo="AlphaNumeric" required message="El Concepto es un campo obligatorio" maxlength="255" size="50"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>No. de Declaraciones</td>
            <td>
              <input type="text" name="obfNumDeclar" id="obfNumDeclar" tipo="Num" required message="El No. de Declaraciones es un campo obligatorio" maxlength="10" size="20"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Per&iacute;odo</td>
            <td>
              <input type="text" name="obfPeriodo" id="obfPeriodo" tipo="AlphaNumeric" required message="El Período es un campo obligatorio" maxlength="100" size="50"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Plazo de Presentaci&oacute;n</td>
            <td>
              <input type="text" name="obfPlazPres" id="obfPlazPres" tipo="AlphaNumeric" required message="El Plazo de Presentación es un campo obligatorio" maxlength="100" size="50"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Lugar de Presentaci&oacute;n</td>
            <td>
              <input type="text" name="obfLugarPres" id="obfLugarPres" tipo="AlphaNumeric" required message="El Lugar de Presentacíon es un campo obligatorio" maxlength="100" size="50"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Formato</td>
            <td>
              <input type="text" name="obfFormato" id="obfFormato" tipo="AlphaNumeric" required message="El Formato es un campo obligatorio" maxlength="255" size="50"/>
            </td>
            <td>&nbsp;
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionObligacionesFiscales();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.ObligacionesFiscales.PrincipalObligacionesFiscalesRegimenFiscal','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
