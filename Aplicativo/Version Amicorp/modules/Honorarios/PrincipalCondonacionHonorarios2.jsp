<FORM name="frmCondonacionHonorarios2" id="frmCondonacionHonorarios2" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Condonaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="30%">Fecha Condonacion</td>
              <td width="25%" colspan="2">
                <input type="text" name="txtFechaCondonacion" id="txtFechaCondonacion" tipo="Fecha" size="15" onblur="validaFechaCorrectaYFideicomiso();"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">Fideicomiso</td>
              <td colspan="2">
                <input type="text" name="decNumContrato" id="decNumContrato" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">Importe Condonacion</td>
              <td colspan="2">
                <input type="text" name="txtImpCondonacion" id="txtImpCondonacion" tipo="Money" size="20" onblur="validaNoSeaMayor();" required message="El Importe de Condonación es un dato obligatorio"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">
          <input type="text" name="fcoDiaDia" id="fcoDiaDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="fcoMesDia" id="fcoMesDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="fcoAnoDia" id="fcoAnoDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="txtMesAbierto" id="txtMesAbierto" tipo="AlphaNumeric" size="2" style="visibility:hidden"/>
          <input type="text" name="decFecCalcHono" id="decFecCalcHono" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="decCveTipoHono" id="decCveTipoHono" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="decCvePersFid" id="decCvePersFid" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
          <input type="text" name="decNumPersFid" id="decNumPersFid" tipo="Num" size="5" style="visibility:hidden"/>
          <input type="text" name="decNumSecuencial" id="decNumSecuencial" tipo="Num" size="5" style="visibility:hidden"/>
          <input type="text" name="decImpRemHonor" id="decImpRemHonor" tipo="Num" size="5" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="aplicaFuncion();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton" onclick="cargaPrincipalCondonacionHonorarios();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
