<FORM name="frmPrincipalBitacoraControlGestion" id="frmPrincipalBitacoraControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Consulta Bit&aacute;cora</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">No. Usuario
            </td>
            <td>
              <input type="text" name="paramNoUsuario" id="paramNoUsuario" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Funci&oacute;n</td>
            <td>
              <input type="text" name="paramFuncion" id="paramFuncion" size="50" maxlength="100"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Fecha</td>
            <td>
              <input type="text" name="paramFecha" id="paramFecha" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;
            </td>
            <td width="10%">Folio Operaci&oacute;n</td>
            <td>
              <input type="text" name="paramFolioOper" id="paramFolioOper" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosBitacora" fun="loadTableElementSpecial" tabla="tablaRegistrosDatosBitacora" onclick="consultar(this, GI('frmPrincipalBitacoraControlGestion'), true);"/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalBitacoraControlGestion'));"/>            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td nowrap width="110px">Fecha</td>
                  <td nowrap width="90px">No. Usuario</td>
                  <td nowrap width="100px">Folio Operaci&oacute;n</td>
                  <td nowrap width="100px">IP</td>
                  <td nowrap width="120px">Funci&oacute;n</td>
                  <td nowrap width="100px">Serie CD</td>
                  <td nowrap width="100px">Secuencia CD</td>
                  <td nowrap width="300px">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1020px;">
                <table id="tablaRegistrosDatosBitacora" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosBitacoraData" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
