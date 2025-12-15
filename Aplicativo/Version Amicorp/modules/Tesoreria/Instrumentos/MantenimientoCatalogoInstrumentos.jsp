<form name="frmMantenimientoInstrumentos" id="frmMantenimientoInstrumentos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Instrumentos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="13%">Tipo de Mercado</td>
            <td nowrap colspan="3">
              <select id="insCveTipoMerca" name="insCveTipoMerca" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbMercadoParam" next="insCveStInstrum" required message="El Tipo de Mercado es un campo obligatorio" onchange="asignaSecuencialInstrumento(this);"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="13%">No. Instrumento</td>
            <td nowrap width="15%">
              <input type="text" name="insNumInstrume" id="insNumInstrume" size="10" maxlength="10" tipo="Num" required message="El No. de Instrumento es un campo obligatorio"/>
            </td>
            <td nowrap width="13%">Nombre</td>
            <td nowrap>
              <input type="text" name="insNomInstrume" id="insNomInstrume" size="60" maxlength="50" tipo="AlphaNumeric" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="13%">Abreviatura</td>
            <td nowrap width="15%">
              <input type="text" name="insMnemoInstrume" id="insMnemoInstrume" size="8" maxlength="8" tipo="AlphaNumeric"/>
            </td>
            <td nowrap width="13%">Valor Nominal</td>
            <td nowrap>
              <input type="text" name="insValorNominal" id="insValorNominal" size="16" maxlength="16" tipo="Num" required message="El Valor Nominal es un campo obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="13%">Status</td>
            <td colspan="3" nowrap>
              <select id="insCveStInstrum" name="insCveStInstrum" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionInstrumento();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.Instrumentos.PrincipalCatalogoInstrumentos','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
