<FORM name="frmMantenimientoSeguridadModulos" id="frmMantenimientoSeguridadModulos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Datos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Opci&oacute;n</td>
            <td colspan="2">
              <input type="text" name="ffunIdFuncion" id="ffunIdFuncion" tipo="Num" size="10" maxlength="10" required message="El Id de Opción es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Nombre Funci&oacute;n</td>
            <td colspan="2">
              <input type="text" name="ffunNomMenu" id="ffunNomMenu" size="50" maxlength="100" required message="El Nombre de la Función es un dato obligatorio"/>
            </td>
            
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadModulos();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
