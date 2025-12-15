<FORM name="frmMantenimientoEncuestaOpcionesControlGestion" id="frmMantenimientoEncuestaOpcionesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento de Opciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap width="5%">No. Opci&oacute;n</td>
            <td>
              <input type="text" name="oecNumOpcion" id="oecNumOpcion" tipo="Num" size="5" maxlength="5" required message="El Número de Opción es un dato obligatorio" onblur="verificaExistenciaRegistroOpciones();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap width="5%">Descripci&oacute;n</td>
            <td>
              <input type="text" name="oecDescripcionOpcion" id="oecDescripcionOpcion" size="50" maxlength="50" required message="La Descripción es un dato obligatorio"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalEncuestaOpcionesControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
