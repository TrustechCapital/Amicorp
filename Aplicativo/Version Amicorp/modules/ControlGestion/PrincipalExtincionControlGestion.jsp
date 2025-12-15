<FORM name="frmPrincipalExtincionControlGestion" id="frmPrincipalExtincionControlGestion" onsubmit="">
<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Extinci&oacute;n de Fideicomisos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Fideicomiso</td>
            <td>
              <input type="text" name="ctoNumContrato" id="ctoNumContrato" tipo="Num" size="15" onblur="muestraDatosConsulta();" required message="El número de fideicomiso es obligatorio"/>
            </td>
            <td width="7%" nowrap>Fecha de Constituci&oacute;n</td>
            <td>
              <input type="text" name="ctoFechaConstit" id="ctoFechaConstit" tipo="AlphaNumeric" size="15"/>
              <input type="text" name="ctoAnoApertura" id="ctoAnoApertura" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
              <input type="text" name="ctoMesApertura" id="ctoMesApertura" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
              <input type="text" name="ctoDiaApertura" id="ctoDiaApertura" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Nombre</td>
            <td colspan="3">
              <input type="text" name="ctoNomContrato" id="ctoNomContrato" tipo="AlphaNumeric" size="70"/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Producto</td>
            <td colspan="3">
              <input type="text" name="ctoNomProducto" id="ctoNomProducto" tipo="AlphaNumeric" size="70"/>
            </td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">Saldos del Fideicomiso</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
            <td>
              <input type="text" name="txtTipoAdmon" id="txtTipoAdmon" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
              <input type="text" name="ctoNumProducto" id="ctoNumProducto" tipo="Num" size="5" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Saldo Actual de Honorarios</td>
            <td colspan="3">
              <input type="text" name="txtSaldoActual" id="txtSaldoActual" tipo="Money" size="50"/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Valor Posici&oacute;n</td>
            <td colspan="3">
              <input type="text" name="txtValorPosicion" id="txtValorPosicion" tipo="Money" size="50"/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="10%">Valor de Fondo</td>
            <td colspan="3">
              <input type="text" name="txtValorFondo" id="txtValorFondo" tipo="Money" size="50"/>
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
        <input type="BUTTON" value="  Limpiar  " name="cmdLimpiar" class="boton" onclick="cargaPrincipalExtincionControlGestion();"/>
        <input type="BUTTON" value="Extinguir" name="cmdExtirguir" class="boton" onclick="verificarExtinguir();"/>
      </td>
    </tr>
  </table>
</TD>
</FORM>
