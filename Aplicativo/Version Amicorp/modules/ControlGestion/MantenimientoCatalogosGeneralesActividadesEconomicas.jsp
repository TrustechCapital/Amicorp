<FORM name="frmMantenimientoCatalogosGeneralesActividadesEconomicas" id="frmMantenimientoCatalogosGeneralesActividadesEconomicas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Actividades Econ&oacute;micas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="5%">Rama Actividad</td>
            <td>
              <input type="text" name="actNumRama" id="actNumRama" tipo="Num" size="10" maxlength="10" required message="El Número de Rama es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="5%">Sub-Rama</td>
            <td>
              <input type="text" name="actNumSrama" id="actNumSrama" tipo="Num" size="10" maxlength="10" required message="El Número de Sub-Rama es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="5%">Descripci&oacute;n</td>
            <td>
              <input type="text" name="actNomRama" id="actNomRama" tipo="AlphaNumeric" size="50" maxlength="50" required message="La Descripción es un dato obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="5%">Status</td>
            <td>
              <select size="1" name="actCveStRama" id="actCveStRama" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave"  param="clavesCombo31" next="loadCatalogo"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosGeneralesActividadesEconomicas();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
