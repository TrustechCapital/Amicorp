<form name="frmDatosM" id="frmDatosM">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Definici&oacute;n de Estructura</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td>&nbsp;</td>
            <td nowrap>
              <input type="text" name="estContrato" id="estContrato" size="10" maxlength="10" tipo="Num"  onblur="validarPkAlta(this);" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td colspan="4">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="formsLoaded">&nbsp;</div>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td colspan="4">
              <textarea name="estArbol" id="estArbol" style="width:500px;height:80px;overflow-y:hidden;overflow-x:hidden;" fun="cargaArbol" param="divNombreFideicomisoParam"></textarea>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Nivel</td>
            <td colspan="4">
              <input type="text" name="txtNumNivel" id="txtNumNivel" size="5" maxlength="5" tipo="Num" disabled="disabled"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Nombre</td>
            <td colspan="4">
              <input type="text" name="estNombre" id="estNombre" size="36" maxlength="36" tipo="AlphaNumeric" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Descripci&oacute;n</td>
            <td colspan="4">
              <textarea name="estDescripcion" id="estDescripcion" style="width:500px;height:80px" required message="La Descripción es un campo obligatorio" onkeydown="validaLongitud(this,300);"></textarea>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Longitud de clave</td>
            <td colspan="3">
              <input type="text" name="estLongId" id="estLongId" size="5" tipo="Num" required message="La longitud de clave es un campo obligatorio"/>
            </td>
            <td>
              <input type="text" name="estFecAlta" id="estFecAlta" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="estFecUltMod" style="visibility:hidden"/>
              <input type="text" name="estFecUltMod" id="estFecUltMod" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaValues2ObjHTML" style="visibility:hidden"/>
              <input type="text" name="estNivel" id="estNivel" size="1" ref="conNumNiv" fun="loadTxtElementX" theValue="nivel" param="divNombreFideicomisoParam" next="formsLoaded" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionDefinicionEstructura();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('CuentasIndividuales.DefinicionEstructura.PrincipalCatalogoDefinicionEstructura','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
