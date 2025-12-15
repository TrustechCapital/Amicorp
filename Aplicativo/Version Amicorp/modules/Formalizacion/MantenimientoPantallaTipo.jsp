<FORM name="frmMantenimientoPantallaTipo" id="frmMantenimientoPantallaTipo" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Pantalla Tipo</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Id</td>
            <td colspan="2">
              <input type="text" name="ptiPantalla" id="ptiPantalla" tipo="Num" size="10" maxlength="10" required message="El Id es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Descripci&oacute;n</td>
            <td colspan="2">
              <input type="text" name="ptiDescripcion" id="ptiDescripcion" size="50" maxlength="100" required message="La descripción es un dato obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Paises</td>
            <td colspan="2">
              <select size="1" name="nacNumPais" id="nacNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" required message="El país es un campo obligatorio" defaultValue="null" onchange="numOrden(this);"/> 
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td colspan="2">&nbsp;
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td width="5%">
              <input type="checkbox" name="cbAceptar"/>Men&uacute;</td>
            <td>
              <input type="radio" name="rdMenuFuncion" id="rdFuncion" class="radio" onclick="determinaMenuFuncion(this);"/>Funci&oacute;n
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td colspan="2">&nbsp;
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalPantallaTipo();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
