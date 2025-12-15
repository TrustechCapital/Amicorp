<FORM name="frmMantenimiento" id="frmMantenimiento">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Cuentas NAFIN</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td nowrap width="20%">Fideicomiso</td>
            <td nowrap>
              <input type="text" name="ctnNumContrato" id="ctnNumContrato" maxlength="10" size="10"/>
            </td>
            <td width="70%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;
            </td>
            <td nowrap width="20%">Banco / Cuenta
            </td>
            <td colspan="2">
              <select size="1" name="ctnCuenta" id="ctnCuenta" fun="loadComboElement" keyValue="id" theValue="descripcion" required message="El Banco / Cuenta es un campo obligatorio"/>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" maxlength="10" size="10" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionCuentasFideicomiso();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalCuentasFideicomiso();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
