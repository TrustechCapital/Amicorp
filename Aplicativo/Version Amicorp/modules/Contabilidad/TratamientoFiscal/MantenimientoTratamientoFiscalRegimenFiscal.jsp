<form name="frmMantenimientoTratamientoFiscal" id="frmMantenimientoTratamientoFiscal" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Tratamiento Fiscal</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td>No. Clave</td>
            <td>
              <input type="text" name="trfCveTratfisc" id="trfCveTratfisc" maxlength="20" size="20" ref="asiValSecTraFis" fun="loadTxtElementX" theValue="numSecuencial" next="formsLoaded" tipo="Num" required message="El No. Clave es un campo obligatorio"/>
              <input type="HIDDEN" name="trfCveStTrafis" id="trfCveStTrafis" tipo="AlphaNumeric" size="5" value="ACTIVO"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;
            </td>
            <td colspan="2">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap>&nbsp;</td>
            <td valign="top" nowrap>Descripci&oacute;n</td>
            <td nowrap>
              <textarea name="trfClasific" id="trfClasific" tipo="AlphaNumeric" rows="20" cols="50" style="width:350;height:200"></textarea>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionTratamientoFiscal();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.TratamientoFiscal.PrincipalTratamientoFiscalRegimenFiscal','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
