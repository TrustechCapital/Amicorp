<FORM name="frmConsultarCarteraContrato" id="frmConsultarCarteraContrato" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">  
      <tr>
        <td align="center" height="100%" class="titulo">Cartera por Contrato</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="20%">Fideicomiso</td>
              <td>
                <input type="text" name="decNumContrato" id="decNumContrato" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="20%">Persona que paga honorario</td>
              <td>
                <input type="text" name="decCvePersFid" id="decCvePersFid" tipo="AlphaNumeric" size="20" maxlength="25"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle" width="30%">&nbsp;</td>
              <td valign="middle" width="20%">Num. Persona que paga en honorario</td>
              <td valign="middle">
                <input type="text" name="decNumPersFid" id="decNumPersFid" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td align="center" valign="middle" width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle" width="30%">&nbsp;</td>
              <td valign="middle" width="20%">Tipo de honorario</td>
              <td valign="middle">
                <input type="text" name="decCveTipoHono" id="decCveTipoHono" tipo="AlphaNumeric" size="20" maxlength="25"/>
              </td>
              <td align="center" valign="middle" width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle" width="30%">&nbsp;</td>
              <td valign="middle" width="20%">Fecha de c&aacute;lculo</td>
              <td valign="middle">
                <input type="text" name="decFecCalcHono" id="decFecCalcHono" tipo="AlphaNumeric" size="15" maxlength="10"/>
              </td>
              <td align="center" valign="middle" width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle" width="30%">&nbsp;</td>
              <td valign="middle" width="20%">Secuencial de pago</td>
              <td valign="middle">
                <input type="text" name="decNumSecuencial" id="decNumSecuencial" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td align="center" valign="middle" width="5%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">
          <hr/>
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="15%">Importe Honorario</td>
              <td width="25%">
                <input type="text" name="decImpOrigHonor" id="decImpOrigHonor" tipo="Num" size="10" maxlength="16"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td valign="middle">Importe de pago</td>
              <td valign="middle">
                <input type="text" name="pagImpPago" id="pagImpPago" tipo="Num" size="10" maxlength="16"/>
              </td>
              <td align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td valign="middle">&nbsp;</td>
              <td valign="middle">&nbsp;</td>
              <td align="center" valign="middle">&nbsp;</td>
            </tr>
            
            <tr>
              <td align="center" valign="middle" colspan="4">
                <input type="BUTTON" value="   Regresar   " name="cmdRegresar" size="20%" class="boton" onclick="cargaPrincipalComposicionCarteraHonorarios();"/>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
