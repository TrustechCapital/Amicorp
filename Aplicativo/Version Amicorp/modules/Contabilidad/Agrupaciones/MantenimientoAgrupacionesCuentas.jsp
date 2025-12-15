<FORM name="frmMantenimientoAgrupacionesCuentas" id="frmMantenimientoAgrupacionesCuentas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Agrupacion con Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Id. Agrupacion</td>
            <td>
              <input type="text" name="paramNumGuia" id="paramNumGuia" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNomGuia" id="paramNomGuia" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(l&oacute;gico)</td>
            <td>
              <input type="text" name="paramNomGuia" id="paramNomGuia" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(Impresi&oacute;n)</td>
            <td>
              <input type="text" name="paramNomGuia" id="paramNomGuia" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionGuia();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Guias.PrincipalCatalogoGuias','');" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="cargaMantenimientoEstructuraGuias(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaMantenimientoEstructuraGuias(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="cargaMantenimientoEstructuraGuias(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaMantenimientoEstructuraGuias(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">Cuentas agrupadas</td>
          </tr>
          <tr>
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="35" nowrap>Id. Agrupacion</td>
                  <td width="116" nowrap>Cuenta de Mayor</td>
                  <td width="34" nowrap>Scta</td>
                  <td width="39" nowrap>Sscta</td>
                  <td width="47" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="62" nowrap>Ssssscta</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriEstGui" dataInfo="arrTblEstGuiDat" keys="guiNumGuia,guiNumSecAsient" fun="clickTabla2" radioWidth="26px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
