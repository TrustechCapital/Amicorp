<FORM name="frmMantenimientoEmisores" id="frmMantenimientoEmisores">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Emisores</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="13%">N&uacute;m. Emisor</td>
            <td width="25%">
              <input type="text" name="emsNumEmisor" id="emsNumEmisor" size="10" maxlength="10" tipo="Num" required message="El Número de Emisor es un campo obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="13%">Nombre</td>
            <td>
              <input type="text" name="emsNomEmisor" id="emsNomEmisor" tipo="AlphaNumeric" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="13%">Actividad</td>
            <td>
              <select name="actNomRama" id="actNomRama" ref="conNumActNomAct" fun="loadComboElement" keyValue="actNomRama" theValue="actNomRama" next="emsNumPaisOrig" required message="La Actividad es un campo obligatorio" onchange="consultaNumRamaNumSramaActividad(this);"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%">Pa&iacute;s Origen</td>
            <td>
              <select name="emsNumPaisOrig" id="emsNumPaisOrig" ref="conNumPaiNomPai" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="emsCveStEmisor" onchange="GI('emsNomPaisOrig').value = this.options[this.selectedIndex].text;"/>
              <input type="text" name="emsNomPaisOrig" id="emsNomPaisOrig" maxlength="5" size="5" style="visibility:hidden"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%">Status &nbsp;&nbsp;&nbsp;</td>
            <td>
              <select name="emsCveStEmisor" id="emsCveStEmisor" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
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
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEmisor();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.Emisores.PrincipalCatalogoEmisores','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
