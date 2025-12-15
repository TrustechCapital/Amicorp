<FORM name="frmMantenimientoCatalogoGuias" id="frmMantenimientoCatalogoGuias" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Conceptos Contables</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">Concepto</td>
            <td>
              <input type="text" name="gunNumGuia" id="gunNumGuia" size="10" tipo="Num" maxlength="10"/>
              <input type="text" name="paramNumGuia" id="paramNumGuia" size="10" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">Nombre</td>
            <td>
              <input type="text" name="gunNomGuia" id="gunNomGuia" size="80" tipo="AlphaNumeric" maxlength="100" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td align="center" width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">Status</td>
            <td>
              <input type="text" name="gunCveStGuiano" id="gunCveStGuiano" size="10" maxlength="25" disabled class="inputLocked" value="PENDIENTE"/>
            </td>
            <td width="10%">&nbsp;</td>
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
            <td colspan="4" class="subtitulo" align="center">Estructura Concepto</td>
          </tr>
          <tr>
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="35" nowrap>Sec.</td>
                  <td width="116" nowrap>Nombre Cuenta</td>
                  <td width="54" nowrap>Cuenta</td>
                  <td width="34" nowrap>Scta</td>
                  <td width="39" nowrap>Sscta</td>
                  <td width="47" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="62" nowrap>Ssssscta</td>
                  <td width="58" nowrap>Auxiliar1</td>
                  <td width="57" nowrap>Auxiliar2</td>
                  <td width="57" nowrap>Auxiliar3</td>
                  <td width="91" nowrap>Aplica Dato</td>
                  <td width="30" nowrap>C/A</td>
                  <td width="125" nowrap>Descripci&oacute;n</td>
                  <td width="100" nowrap>Status</td>
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
