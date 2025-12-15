<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Líneas de Crédito</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap>&nbsp;
                            </td>
                            <td nowrap>&nbsp;</td>
                            <td nowrap colspan="4">
                              &nbsp;&nbsp;
                            </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">N&uacute;mero</td>
              <td nowrap colspan="3">
                <input type="text" name="notNumNotario" id="notNumNotario" tipo="Num" size="10" maxlength="10" onblur="consultarExistenciaNotario();" required message="El Número es un campo obligatorio"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Nombre</td>
              <td nowrap>
                <input type="text" name="notNomNotario" id="notNomNotario" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">N&uacute;mero Oficial</td>
              <td nowrap colspan="3">
                <input type="text" name="notNumOficNota" id="notNumOficNota" tipo="Num" size="10" maxlength="10" required message="El Número Oficial es un campo obligatorio"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Localidad</td>
              <td nowrap>
                <input type="text" name="notLocalidadNota" id="notLocalidadNota" size="50" maxlength="50" required message="La Localidad es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">RFC</td>
              <td nowrap colspan="3">
                <input type="text" name="notRfc" id="notRfc" tipo="AlphaNumeric" size="15" maxlength="15" required message="El RFC es un campo obligatorio"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Status</td>
              <td nowrap>
                <select size="1" name="notCveStNotario" id="notCveStNotario" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="notNomPais" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap class="subtitulo" colspan="7">Direcci&oacute;n</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Calle&nbsp;y N&uacute;mero</td>
              <td colspan="6" nowrap>
                <input type="text" name="notCalleNum" id="notCalleNum" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Colonia</td>
              <td colspan="6" nowrap>
                <input type="text" name="notNomColonia" id="notNomColonia" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Poblaci&oacute;n</td>
              <td colspan="3" nowrap>
                <input type="text" name="notNomPoblacion" id="notNomPoblacion" size="50" maxlength="50"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>C.P.</td>
              <td nowrap>
                <input type="text" name="notCodigoPostal" id="notCodigoPostal" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="19%">Municipio o Delegaci&oacute;n</td>
            <td width="50%">
              <input type="text" name="notNomDelegacion" id="notNomDelegacion" size="50" maxlength="50"/>
            </td>
              <td>&nbsp;</td>              
              <td >&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Pa&iacute;s</td>
              <td nowrap colspan="3">
                <select size="1" name="notNomPais" id="notNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="loadCatalogo" onchange="cargaParamComboEstado(this,false)"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Estado</td>
              <td nowrap>
                <select size="1" name="notNomEstado" id="notNomEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNomEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;
              </td>
              <td colspan="7" nowrap>&nbsp;
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="7" nowrap>Telefonos</td>
              <td align="center" class="subtitulo" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap align="center">Oficina-1</td>
              <td nowrap align="center">Oficina-2</td>
              <td nowrap align="center">Fax</td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Lada</td>
              <td nowrap>
                <input type="text" name="notCveLada1Ofic" id="notCveLada1Ofic" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td nowrap>
                <input type="text" name="notCveLada2Ofic" id="notCveLada2Ofic" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td nowrap>
                <input type="text" name="notNumLadaFax" id="notNumLadaFax" tipo="Num" size="4" maxlength="4"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Tel&eacute;fono</td>
              <td nowrap>
                <input type="text" name="notTelef1Ofic" id="notTelef1Ofic" size="20" maxlength="20" required message="El Teléfono de la Oficina es un campo requerido"/>
              </td>
              <td nowrap>
                <input type="text" name="notTelef2Ofic" id="notTelef2Ofic" size="20" maxlength="20"/>
              </td>
              <td nowrap>
                <input type="text" name="notNumTelefFax" id="notNumTelefFax" size="20" maxlength="20"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Extensi&oacute;n</td>
              <td nowrap>
                <input type="text" name="notNumExt1Ofic" id="notNumExt1Ofic" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap>
                <input type="text" name="notNumExt2Ofic" id="notNumExt2Ofic" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap>
                <input type="text" name="notNumExtFax" id="notNumExtFax" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">E-Mail</td>
              <td colspan="6" nowrap>
                <input type="text" name="notEMail" id="notEMail" tipo="Email" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" ><!--style="visibility:hidden"/>-->
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('TRACs.LineasCredito.PrincipalLineasCredito','');" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
