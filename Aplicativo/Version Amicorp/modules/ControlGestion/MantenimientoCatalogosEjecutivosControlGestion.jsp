<FORM name="frmMantenimientoCatalogosEjecutivosControlGestion" id="frmMantenimientoCatalogosEjecutivosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Ejecutivos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">No. Ejecutivo</td>
            <td width="25%">
              <input type="text" name="ejeNumEjecAtenc" id="ejeNumEjecAtenc" tipo="Num" size="15" maxlength="10" required message="El Número de Ejecutivo es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Banca</td>
            <td colspan="5">
              <select size="1" name="ejeCveBanca" id="ejeCveBanca" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ejeCveTipoEjec" param="clavesCombo5" required message="La Banca es un campo obligatorio" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Nombre Ejecutivo</td>
            <td colspan="5">
              <input type="text" name="ejeNomEjecutivo" id="ejeNomEjecutivo" tipo="AlphaNumeric" size="50" maxlength="50" required message="El Nombre de Ejecutivo es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Tipo de Ejecutivo</td>
            <td colspan="5">
              <select size="1" name="ejeCveTipoEjec" id="ejeCveTipoEjec" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ejeNomPais" param="clavesCombo67" required message="El Tipo de Ejecutivo es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <!--tr>
            <td>Estructura</td>
            <td colspan="9">
              <select size="1" name="ejeCveTipoEjec" id="ejeCveTipoEjec" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="A Determinar" param="clavesCombo67"/>
            </td>
          </tr-->
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%" class="subtitulo">Direcci&oacute;n</td>
            <td class="subtitulo" width="25%">&nbsp;</td>
            <td class="subtitulo" width="3%">&nbsp;</td>
            <td class="subtitulo" width="5%">&nbsp;</td>
            <td class="subtitulo" width="10%">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Calle y N&uacute;mero</td>
            <td colspan="5">
              <input type="text" name="ejeCalleNum" id="ejeCalleNum" size="50" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Colonia</td>
            <td colspan="5">
              <input type="text" name="ejeNomColonia" id="ejeNomColonia" size="50" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Poblaci&oacute;n</td>
            <td colspan="5">
              <input type="text" name="ejeNomPoblacion" id="ejeNomPoblacion" size="50" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <!--tr>
            <td>Correo Electr&oacute;nico</td>
            <td colspan="9">
              <input type="text" name="ejeCorreoElectronico" id="ejeCorreoElectronico" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
          </tr-->
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">C&oacute;digo Postal</td>
            <td width="25%">
              <input type="text" name="ejeCodigoPostal" id="ejeCodigoPostal" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Pa&iacute;s</td>
            <td width="25%">
              <select size="1" name="ejeNomPais" id="ejeNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="ejeCveStEjecuti" onchange="cargaParamComboEstado(this,false);"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">Lada</td>
            <td width="10%">Tel&eacute;fono</td>
            <td>Ext.</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Estado</td>
            <td width="25%">
              <select size="1" name="ejeNumEstado" id="ejeNumEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNumEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado" onchange="cambiaNomEstado();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="3%">Tel1</td>
            <td width="5%">
              <input type="text" name="ejeNumCveLada1" id="ejeNumCveLada1" size="4" maxlength="4"/>
            </td>
            <td width="10%">
              <input type="text" name="ejeNumTelef1" id="ejeNumTelef1" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="ejeNumExt1" id="ejeNumExt1" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">Status</td>
            <td width="25%">
              <select size="1" name="ejeCveStEjecuti" id="ejeCveStEjecuti" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31"/>
            </td>
            <td width="3%">Tel2</td>
            <td width="5%">
              <input type="text" name="ejeNumCveLada2" id="ejeNumCveLada2" size="4" maxlength="4"/>
            </td>
            <td width="10%">
              <input type="text" name="ejeNumTelef2" id="ejeNumTelef2" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="ejeNumExt2" id="ejeNumExt2" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="6%">&nbsp;</td>
            <td width="25%">
              <input type="text" name="ejeNomEstado" id="ejeNomEstado" size="10" maxlength="50" style="visibility:hidden"/>
            </td>
            <td width="3%">Fax</td>
            <td width="5%">
              <input type="text" name="ejeNumLadaFax" id="ejeNumLadaFax" size="4" maxlength="4"/>
            </td>
            <td width="10%">
              <input type="text" name="ejeNumTelefFax" id="ejeNumTelefFax" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="ejeNumExtFax" id="ejeNumExtFax" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="22">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosEjecutivosControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
