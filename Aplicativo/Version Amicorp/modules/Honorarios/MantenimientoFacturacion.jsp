<FORM name="frmMantenimientoFacturacion" id="frmMantenimientoFacturacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Facturaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Fideicomiso</td>
              <td width="1%">
                <input type="text" name="facNumContrato" id="facNumContrato" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">No. Folio</td>
              <td width="1%">
                <input type="text" name="facNumFactura" id="facNumFactura" tipo="AlphaNumeric" size="15" maxlength="15"/>
                <input type="text" name="facSecFactura" id="facSecFactura" tipo="Num" size="15" maxlength="15"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Nombre</td>
              <td width="1%">
                <input type="text" name="facNombre" id="facNombre" tipo="AlphaNumeric" size="50" maxlength="255"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Domicilio</td>
              <td width="1%">
                <textarea name="facDomicilio" id="facDomicilio"></textarea>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">RFC</td>
              <td width="1%">
                <input type="text" name="facRfc" id="facRfc" tipo="AlphaNumeric" size="14" maxlength="16"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Per&iacute;odo</td>
              <td align="left" width="1%">
                <input type="text" name="facPerDel" id="facPerDel" tipo="Fecha" size="10" maxlength="10"/>&nbsp;Al &nbsp;
                <input type="text" name="facPerAl" id="facPerAl" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Fecha de Facturaci&oacute;n</td>
              <td align="left" width="1%">
                <input type="text" name="facFechaFactura" id="facFechaFactura" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Observaci&oacute;n</td>
              <td align="left" width="1%">
                <textarea name="facObservaciones" id="facObservaciones"></textarea>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="16%">Status</td>
              <td align="left" width="1%">
                <select size="1" name="facStFactura" id="facStFactura" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo165"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Act. Dom. Fisc." name="cmdActDomFisc" class="boton"/>
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="modificaInfo();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaMantenimientoAsignaFolioFacturacion();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
