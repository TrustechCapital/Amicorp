<FORM name="frmMantenimientoCatalogosClavesControlGestion" id="frmMantenimientoCatalogosClavesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Catalogo Conceptos del Sistema</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">Concepto</td>
            <td colspan="2">
              <input type="text" name="cveNumClave" id="cveNumClave" tipo="Num" size="5" required message="La Clave es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">Secuencial Concepto</td>
            <td colspan="2">
              <input type="text" name="cveNumSecClave" id="cveNumSecClave" tipo="Num" size="15" required message="El Secuencial Clave es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">Descripci&oacute;n</td>
            <td colspan="2">
              <input type="text" name="cveDescClave" id="cveDescClave"  size="40" required message="La Descripcion es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">L&iacute;mite Inferior</td>
            <td colspan="2">
              <input type="text" name="cveLiminfClave" id="cveLiminfClave" tipo="Num" size="15"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">L&iacute;mite Superior</td>
            <td colspan="2">
              <input type="text" name="cveLimsupClave" id="cveLimsupClave" tipo="Num" size="15"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">Forma de Empleo</td>
            <td colspan="2">
              <input type="text" name="cveFormaEmpCve" id="cveFormaEmpCve" size="40" required message="La Forma de Empleo es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="15%">Status</td>
            <td colspan="2">
              <select size="1" name="cveCveStClave" id="cveCveStClave" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td colspan="4" class="subtitulo">Parametros</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="6%">&nbsp;</td>
            <td width="15%">Valor</td>
            <td width="15%">Descripci&oacute;n</td>
            <td>Aplica a Toda la Clave</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td align="right" width="25%">&nbsp;</td>
            <td align="right" nowrap width="6%">1</td>
            <td width="15%">
              <input type="text" name="cveParam1" id="cveParam1" tipo="AlphaNumeric" size="15"/>
            </td>
            <td width="15%">
              <input type="text" name="cveDescParam1" id="cveDescParam1" tipo="AlphaNumeric" size="15"/>
            </td>
            <td align="left">
              <input type="checkbox" name="chkClave"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td align="right" width="25%">&nbsp;</td>
            <td align="right" nowrap width="6%">2</td>
            <td width="15%">
              <input type="text" name="cveParam2" id="cveParam2" tipo="AlphaNumeric" size="15"/>
            </td>
            <td width="15%">
              <input type="text" name="cveDescParam2" id="cveDescParam2" tipo="AlphaNumeric" size="15"/>
            </td>
            <td align="left">
              <input type="checkbox" name="chkClave"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td align="right" width="25%">&nbsp;</td>
            <td align="right" nowrap width="6%">3</td>
            <td width="15%">
              <input type="text" name="cveParam3" id="cveParam3" tipo="AlphaNumeric" size="15"/>
            </td>
            <td width="15%">
              <input type="text" name="cveDescParam3" id="cveDescParam3" tipo="AlphaNumeric" size="15"/>
            </td>
            <td align="left">
              <input type="checkbox" name="chkClave"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogoClavesControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>