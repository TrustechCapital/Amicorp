<FORM name="frmMantenimientoCatalogosGeneralesEstructuraGeograficaMonedas" id="frmMantenimientoCatalogosGeneralesEstructuraGeograficaMonedas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Estructura Geografica Moneda</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap>Pais</td>
            <td width="78%" colspan="2">
              <select size="1" name="monNumPais" id="monNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="monCveStMoneda" required message="El País es un campo obligatorio" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap>Nombre</td>
            <td width="78%" colspan="2">
              <input type="text" name="monNomMoneda" id="monNomMoneda" tipo="AlphaNumeric" size="50" maxlength="50" required message="El Nombre de la moneda es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap>Status</td>
            <td colspan="2">
              <select size="1" name="monCveStMoneda" id="monCveStMoneda" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" colspan="2" nowrap>Valor Homologado con Flujo de Fondos</td>
            <td>
              <input type="text" name="monSigla" id="monSigla" tipo="AlphaNumeric" size="10" maxlength="5"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%" colspan="5" align="center">&nbsp;&nbsp;Elija de la lista el Valor&nbsp;con&nbsp;el&nbsp;cual&nbsp;se&nbsp;va&nbsp;a Homologar esta moneda con el sistema Flujo de Fondos</td>
          </tr>
          <tr>
            <td width="35%" colspan="5" align="center">&nbsp;&nbsp;
            <select size="1" name="cmbMonedas">
              <option value="2">Caption2</option>
            </select></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogoGeneralesEstructuraGeograficaMonedas();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
