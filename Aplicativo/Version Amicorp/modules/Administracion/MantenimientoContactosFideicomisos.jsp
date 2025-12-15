<FORM name="frmDatosMantenimientoContactosFideicomisos" id="frmDatosMantenimientoContactosFideicomisos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Contactos&nbsp;de Fideicomisos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table align="center" class="texto" width="90%">
            <tr valign="middle">
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>N&uacute;m. Fideicomiso</td>
              <td colspan="3">
                <input type="text" name="conNumContrato" id="conNumContrato" tipo="Num" size="10" maxlength="10" onblur="mostrarDatosInformativos(2);" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td>Cto. Eje</td>
              <td>
                <input type="text" name="txtCtoEje" size="10"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Nombre</td>
              <td colspan="6">
                <input type="text" name="txtNombre" id="txtNombre" size="50" tipo="AlphaNumeric"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Tipo de Persona</td>
              <td colspan="3">
                <input type="text" name="txtTipoPersona" id="txtTipoPersona" size="10" tipo="AlphaNumeric"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>
                <input type="text" name="txtNoCliente" id="txtNoCliente" size="10" tipo="AlphaNumeric" style="visibility:hidden"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;
              </td>
              <td colspan="7">
                <hr/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="7">Contactos</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="7">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>No. Contacto</td>
              <td colspan="6">
                <input type="text" name="conNumSecContac" id="conNumSecContac" tipo="Num" size="10" maxlength="10" required message="El No. Contacto es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Nombre</td>
              <td colspan="6">
                <input type="text" name="conNomContacto" id="conNomContacto" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Empresa</td>
              <td colspan="6">
                <input type="text" name="conDependencia" id="conDependencia" size="50" maxlength="100"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Puesto</td>
              <td colspan="6">
                <input type="text" name="conCargo" id="conCargo" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Comentario</td>
              <td colspan="6">
                <textarea name="conComentario" id="conComentario" style="width:500px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Calle y No.</td>
              <td colspan="6">
                <input type="text" name="conCalleNum" id="conCalleNum" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Colonia</td>
              <td colspan="6">
                <input type="text" name="conNomColonia" id="conNomColonia" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Poblaci&oacute;n</td>
              <td colspan="6">
                <input type="text" name="conNomPoblacion" id="conNomPoblacion" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Pa&iacute;s</td>
              <td colspan="4">
                <select size="1" name="conNomPais" id="conNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="conCveStContact"/>
              </td>
              <td>C&oacute;digo Postal</td>
              <td>
                <input type="text" name="conCodigoPostal" id="conCodigoPostal" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td class="subtitulo" nowrap>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="5">Tel&eacute;fonos</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td>Lada</td>
              <td>Tel&eacute;fono</td>
              <td>Ext</td>
              <td colspan="3">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Casa</td>
              <td>
                <input type="text" name="conNumLadaCasa" id="conNumLadaCasa" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td>
                <input type="text" name="conNumTelefCasa" id="conNumTelefCasa" size="20" maxlength="20"/>
              </td>
              <td>&nbsp;</td>
              <td colspan="3">&nbsp;
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Oficina</td>
              <td>
                <input type="text" name="conNumLadaOfic" id="conNumLadaOfic" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td>
                <input type="text" name="conNumTelefOfic" id="conNumTelefOfic" size="20" maxlength="20" required message="El Teléfono de Oficina es un campo obligatorio"/>
              </td>
              <td>
                <input type="text" name="conNumExtOfic" id="conNumExtOfic" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td colspan="3">&nbsp;
              </td>
              <td>&nbsp;
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Fax</td>
              <td>
                <input type="text" name="conNumLadaFax" id="conNumLadaFax" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td>
                <input type="text" name="conNumTelefFax" id="conNumTelefFax" size="20" maxlength="20"/>
              </td>
              <td>
                <input type="text" name="conNumExtFax" id="conNumExtFax" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td colspan="3">&nbsp;
              </td>
              <td>&nbsp;
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td width="15%" nowrap>Status</td>
              <td colspan="5">
                <select size="1" name="conCveStContact" id="conCveStContact" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalContactosFideicomisos();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
