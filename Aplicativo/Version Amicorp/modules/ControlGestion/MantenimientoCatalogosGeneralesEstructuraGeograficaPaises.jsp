<FORM name="frmMantenimientoCatalogosGeneralesEstructuraGeograficaPaises" id="frmMantenimientoCatalogosGeneralesEstructuraGeograficaPaises" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Estructura Geografica Pa&iacute;ses</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>No. Pais</td>
            <td>
              <input type="text" name="paiNumPais" id="paiNumPais" tipo="Num" size="10" maxlength="10" required message="El Número de País es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>Nombre</td>
            <td>
              <input type="text" name="paiNomPais" id="paiNomPais" tipo="AlphaNumeric" size="50" maxlength="50" required message="El Nombre del País es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>Ingl&eacute;s</td>
            <td>
              <input type="text" name="paiAbrPais" id="paiAbrPais" tipo="AlphaNumeric" size="50" maxlength="50"/>
            
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>Status</td>
            <td>
              <select size="1" name="paiCveStPais" id="paiCveStPais" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
