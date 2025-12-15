<FORM name="frmMantenimientoSeguridadModulos" id="frmMantenimientoSeguridadModulos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Funciones</td>
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
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Sub Men&uacute;</td>
            <td colspan="2">
              <select size="1" name="ffunIdPadre" id="ffunIdPadre" ref="claveSubMenu2" fun="loadComboElement" keyValue="ffunIdFuncion" theValue="ffunNomMenu" next="loadCatalogo" defaultValue="null" onchange="numOrden(this);"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td width="5%">
              <input type="radio" name="rdMenuFuncion" id="rdMenu" class="radio" onclick="determinaMenuFuncion(this);" checked/>Men&uacute;</td>
            <td>
              <input type="radio" name="rdMenuFuncion" id="rdFuncion" class="radio" onclick="determinaMenuFuncion(this);"/>Funci&oacute;n
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Ruta de la Funci&oacute;n</td>
            <td colspan="2">
              <input type="text" name="ffunNombreFuncion" id="ffunNombreFuncion" size="50" maxlength="255" message="La Ruta de la Función es un campo obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Orden</td>
            <td colspan="2">
              <input type="text" name="ffunOrden" id="ffunOrden" tipo="Num" size="2" maxlength="2" required message="El Orden es un campo obligatorio" onblur="verificaOrden(this);"/>
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
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadModulos();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
