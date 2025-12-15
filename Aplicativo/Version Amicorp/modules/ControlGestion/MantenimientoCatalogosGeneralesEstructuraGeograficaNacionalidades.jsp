<FORM name="frmMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades" id="frmMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Estructura Geografica Nacionalidades</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Pais</td>
            <td>
              <select size="1" name="nacNumPais" id="nacNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="nacCveStNaciona" required message="El país es un campo obligatorio" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Nombre</td>
            <td>
              <input type="text" name="nacNomNacional" id="nacNomNacional" tipo="AlphaNumeric" size="50" maxlength="50" required message="La Nacionalidad es un campo obligatorio" onblur="verificaExistenciaNacionalidad();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Abreviatura</td>
            <td>
              <input type="text" name="nacAbrNacional" id="nacAbrNacional" tipo="AlphaNumeric" size="10" maxlength="3" required message="La Abreviatura de la Nacionalidad es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Status</td>
            <td>
              <select size="1" name="nacCveStNaciona" id="nacCveStNaciona" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalCatalogosGeneralEstructuraGeograficaNacionalidades();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
