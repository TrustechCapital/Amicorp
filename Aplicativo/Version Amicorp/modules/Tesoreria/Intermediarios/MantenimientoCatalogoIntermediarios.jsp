<FORM name="frmMantenimientoIntermediarios" id="frmMantenimientoIntermediarios">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Intermediarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Intermediario</td>
            <td width="25%">
              <input type="text" name="intEntidadFin" id="intEntidadFin" size="10" maxlength="10" tipo="Num" required message="El Número de Intermediario es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Nombre</td>
            <td>
              <input type="text" name="intIntermediario" id="intIntermediario" size="50" maxlength="50" tipo="AlphaNumeric" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>RFC</td>
            <td>
              <input type="text" name="intRfc" id="intRfc" size="15" maxlength="15" tipo="AlphaNumeric"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%" nowrap>Status &nbsp;&nbsp;&nbsp;</td>
            <td>
              <select name="intCveStInterme" id="intCveStInterme" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionIntermediario();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.Intermediarios.PrincipalCatalogoIntermediarios','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
