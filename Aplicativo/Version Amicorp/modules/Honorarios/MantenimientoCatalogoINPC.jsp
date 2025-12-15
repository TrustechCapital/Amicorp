<FORM name="frmINPCHonorariosMantenimiento" id="frmINPCHonorariosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo INPC</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="15%">A&ntilde;o</td>
              <td width="25%">
                <input type="text" name="inpcAno" id="inpcAno" tipo="Num" size="4" maxlength="4" onblur="verificaAltaRegistro();" required message="El Año es un dato obligatorio"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Mes</td>
              <td>
                <input type="text" name="inpcMes" id="inpcMes" tipo="Num" size="2" maxlength="2"  onblur="verificaAltaRegistro();" required message="El Mes es un dato obligatorio"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" valign="middle">&nbsp;</td>
              <td valign="middle">&Iacute;ndice</td>
              <td valign="middle">
                <input type="text" name="inpcImporte" id="inpcImporte" tipo="Money" size="19" maxlength="19" prec="13.5" reqPrecValue/>
              </td>
              <td align="center" valign="middle">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalINPCHonorarios();" style="visibility:hidden"/>
        </td>
      </tr>
  </table>
</FORM>
