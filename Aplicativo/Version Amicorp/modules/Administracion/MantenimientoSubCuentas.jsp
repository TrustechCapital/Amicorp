<FORM name="frmMantenimientoCatalogoSubCuentas" id="frmMantenimientoCatalogoSubCuentas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Catalogo Sub Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>No. Fideicomiso</td>
            <td width="20%">
              <input type="text" name="fsctIdFideicomiso" id="fsctIdFideicomiso" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);" required message="El Número de Fideicomiso es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td >
            <td width="35%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>No. Sub Cuenta</td>
            <td>
              <input type="text" name="fsctIdSubCuenta" id="fsctIdSubCuenta" tipo="AlphaNumeric" size="10" maxlength="3" required message="El Número de Sub Cuenta es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>Nombre Sub Cuenta</td>
            <td>
              <input type="text" name="fsctNombreSubCuenta" id="fsctNombreSubCuenta" tipo="AlphaNumeric" size="50" maxlength="500" required message="El Nombre de la Sub Cuenta es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="8%" nowrap>Status</td>
            <td>
              <select size="1" name="fsctStatus" id="fsctStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
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
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosGeneralEstructuraGeograficaPaises();" />
      </td>
    </tr>
  </table>
</FORM>
