<form name="frmDatosOperacionesNoExistentes" id="frmDatosOperacionesNoExistentes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Operaciones Contables No Existentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto" width="100%">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="13%" nowrap>Fecha</td>
            <td>
              <input type="text" name="paramFecha" id="paramFecha" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="13%" nowrap>Folio Operaci&oacute;n</td>
            <td>
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" ref="conPriOpeNoExi" fun="loadTableElementSpecial" tabla="tblRegPriOpeNoExi" onclick="consultarCount(this,frmDatosOperacionesNoExistentes, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.OperacionesNoExistentes.PrincipalConsultaOperacionesNoExistentes','');"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="100">Folio</td>
                  <td width="300">No. Operaci&oacute;n</td>
                  <td width="400">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriOpeNoExi" dataInfo="arrTblOpeNoExiDat" keys="errIdError" fun="clickTabla" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
