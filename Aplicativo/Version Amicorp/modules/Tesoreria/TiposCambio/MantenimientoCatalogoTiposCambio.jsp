<FORM name="frmMantenimientoTiposCambio" id="frmMantenimientoTiposCambio">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Tipo de Cambio</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Moneda</td>
            <td width="15%" nowrap>
              <select name="ticNumPais" id="ticNumPais" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="ticCveStTipocam" required message="La Moneda es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Fecha</td>
            <td width="15%" nowrap>
              <input type="text" name="ticFechaAlta" id="ticFechaAlta" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="destazaFecha" required message="La Fecha es un campo obligatorio"/>
              <input type="text" name="ticDiaAltaReg" id="ticDiaAltaReg" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="ticMesAltaReg" id="ticMesAltaReg" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="ticAnoAltaReg" id="ticAnoAltaReg" size="4" maxlength="4" style="visibility:hidden"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Hora</td>
            <td width="15%" nowrap>
              <input type="text" name="txtHoraMinuto" id="txtHoraMinuto" size="5" maxlength="5"/>hh:mi
              <input type="text" name="ticHoraAlta" id="ticHoraAlta" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="ticMinutoAlta" id="ticMinutoAlta" size="2" maxlength="2" ref="conMinHorDeDual" fun="asignaHoraMinuto" style="visibility:hidden"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Tipo de Cambio</td>
            <td width="15%" nowrap>
              <input type="text" name="ticImpTipoCamb" id="ticImpTipoCamb" size="21" maxlength="21" tipo="Money" prec="12.8" reqPrecValue required message="El Tipo de Cambio es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Status &nbsp;&nbsp;&nbsp;</td>
            <td width="15%" nowrap>
              <select id="ticCveStTipocam" name="ticCveStTipocam" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionTiposCambio();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.TiposCambio.PrincipalCatalogoTiposCambio','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
