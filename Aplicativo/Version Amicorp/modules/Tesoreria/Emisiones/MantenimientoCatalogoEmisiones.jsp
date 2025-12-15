<form name="frmMantenimientoEmisiones" id="frmMantenimientoEmisiones">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Emisiones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td nowrap>Tipo de Mercado</td>
            <td>
              <select name="emiCveTipoMerca" id="emiCveTipoMerca" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbMercadoParam" next="emiNumMoneda" required message="El Tipo de Mercado es un campo obligatorio" onchange="asignaVariablesEmision(this);"/>
            </td>
            <td>&nbsp;</td>
            <td>Instrumento</td>
            <td colspan="11">
              <select size="1" name="emiNumInstrume" id="emiNumInstrume" ref="conIns" fun="loadComboElement" keyValue="insNumInstrume" theValue="insNomInstrume" param="cmbInstrumentoParam" next="formsLoaded" required message="El Instrumento es un campo obligatorio" onchange="asignaSecuencialEmision(GI('emiCveTipoMerca'),this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
          </tr>
          <tr valign="middle">
            <td nowrap>Sec. Emisi&oacute;n</td>
            <td>
              <input type="text" name="emiNumSecEmis" id="emiNumSecEmis" size="10" maxlength="10" tipo="Num" required message="El Secuencial de Emisión es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>Emisora</td>
            <td>
              <input type="text" name="emiNomPizarra" id="emiNomPizarra" size="10" maxlength="10" required message="La Emisora es un campo obligatorio"/>
            </td>
            <td>Serie</td>
            <td>&nbsp;</td>
            <td colspan="5">
              <input type="text" name="emiNumSerEmis" id="emiNumSerEmis" size="10" maxlength="7" required message="La Serie es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>Cup&oacute;n</td>
            <td>
              <input type="text" name="emiNumCuponVig" id="emiNumCuponVig" size="10" maxlength="10" tipo="Num" required message="El Cupón es un campo obligatorio"/>
            </td>
          </tr>
          <tr valign="middle">
            <td colspan="15" nowrap>
              <hr/>
            </td>
          </tr>
          <tr valign="middle">
            <td nowrap>Valor Nominal</td>
            <td colspan="2">
              <input type="text" name="emiValorNominal" id="emiValorNominal" size="23" maxlength="23" tipo="Money"/>
            </td>
            <td>Moneda</td>
            <td colspan="11">
              <select size="1" name="emiNumMoneda" id="emiNumMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="emiCveStEmision"/>
            </td>
          </tr>
          <tr valign="middle">
            <td nowrap>Descripci&oacute;n</td>
            <td colspan="14">
              <input type="text" name="emiDescEmision" id="emiDescEmision" size="75" tipo="AlphaNumeric"/>
            </td>
          </tr>
          <tr>
            <td nowrap>Status</td>
            <td colspan="3">
              <select name="emiCveStEmision" id="emiCveStEmision" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValue2TipoMercado" required message="El Status es un campo obligatorio"/>
            </td>
            <td colspan="11">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEmision();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.Emisiones.PrincipalCatalogoEmisiones','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
