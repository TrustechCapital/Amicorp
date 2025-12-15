<FORM name="frmDatosManto" id="frmDatosManto" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Bit&aacute;cora</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="3%">&nbsp;</td>
            <td width="49%">N&uacute;mero del ejercicio</td>
            <td width="46%">
              <input type="text" name="fbdeEjercicioDeclara" id="fbdeEjercicioDeclara" tipo="NUM" size="10" maxlength="10" required message="El número del ejercicio es un campo obligatorio"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="49%">Periodo</td>
            <td width="46%">
              <input type="text" name="fbdePeriodoDeclara" id="fbdePeriodoDeclara" size="10" maxlength="10" tipo="Date" required message="El Periodo es un campo obligatorio"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="49%">Tipo de Declaracion</td>
            <td width="46%">
              <input type="text" name="fbdeTipoDeclara" id="fbdeTipoDeclara"  size="50" maxlength="50" required message="El tipo de declaración es un campo obligatorio" onblur="convertirMayusculas(this);"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="49%">Fecha de la Declaracion</td>
            <td width="46%">
              <input type="text" name="fbdeFechaDeclara" id="fbdeFechaDeclara" tipo="Date" size="10" maxlength="10"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="49%">Folio</td>
            <td width="46%">
              <input type="text" name="fbdeFolioDeclara" id="fbdeFolioDeclara" tipo="NUM" size="10" maxlength="10"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalBitacora()" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
