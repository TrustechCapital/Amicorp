<FORM name="frmMantenimiento" id="frmMantenimiento">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Administraci&oacute;n de Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>Banco</td>
            <td>
              <input type="text" name="claveBanco" id="claveBanco" size="5" maxlength="10" tipo="Num" onblur="if(this.value != ''){divClaveBancoParam.claveBanco = this.value; loadElement(banco);}"/>
            </td>
            <td width="40%">
                <div id="banco" class="textoNegrita" ref="conNomBan" fun="asignaValor2DivNombreBanco" param="divClaveBancoParam" next="hideWaitLayer">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>No. Cuenta</td>
            <td width="15%" colspan="2">
              <input type="text" name="cuenta" id="cuenta" size="20" maxlength="20"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>Titular</td>
            <td width="15%" colspan="2">
              <input type="text" name="titular" id="titular" size="75" maxlength="100" required message="El Titular es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>RFC</td>
            <td width="15%" colspan="2">
              <input type="text" name="rfc" id="rfc" size="15" maxlength="15"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>Fecha de Captura</td>
            <td width="15%" colspan="2">
              <input type="text" name="fechaCaptura" id="fechaCaptura" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%" nowrap>Status &nbsp;&nbsp;&nbsp;</td>
            <td width="15%" colspan="2">
              <input type="text" name="statusCta" id="statusCta" size="10" maxlength="20"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionAdministracionCuentas(); cargaPrincipalAdministracionCuentas();"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('ControlGestion.AdministracionCuentas.PrincipalAdministracionCuentas','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
