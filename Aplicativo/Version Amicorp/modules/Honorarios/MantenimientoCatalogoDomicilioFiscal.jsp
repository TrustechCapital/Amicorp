<FORM name="frmDomicilioFiscalHonorariosMantenimiento" id="frmDomicilioFiscalHonorariosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">
          <P>Mantenimiento a Domicilio Fiscal del Fideicomiso</P>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="12%" nowrap>No. Fideicomiso</td>
              <td>
                <input type="text" name="dfNumContrato" id="dfNumContrato" tipo="Num" size="10" maxlength="10" onblur="verificarAltaPk();" required message="El Número de Fideicomiso es un dato obligatorio"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="12%" nowrap>Domicilio Fiscal</td>
              <td>
                <textarea name="dfDomicilio" id="dfDomicilio" style="width:400px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="12%" nowrap>RFC</td>
              <td>
                <input type="text" name="dfRfc" id="dfRfc" size="15" maxlength="255"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="12%" nowrap>Nombre</td>
              <td>
                <textarea name="dfNombre" id="dfNombre" style="width:400px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="  Aceptar  " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalDomicilioFiscalHonorarios();" style="visibility:hidden"/>
        </td>
      </tr>
  </table>
</FORM>
