<FORM name="frmDatosTiposCambio" id="frmDatosTiposCambio">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Tipo de Cambio</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td nowrap width="13%">Moneda</td>
            <td colspan="5">
              <select id="paramMoneda" name="paramMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="formsLoaded"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="13%">D&iacute;a</td>
            <td>
              <input type="text" name="paramDia" id="paramDia" size="2" maxlength="2" tipo="Num"/>
            </td>
            <td>Mes</td>
            <td>
              <input type="text" name="paramMes" id="paramMes" size="2" maxlength="2" tipo="Num" required message="El Mes es un campo obligatorio" onblur="asignaRequiredCampos(this);"/>
            </td>
            <td>A&ntilde;o</td>
            <td>
              <input type="text" name="paramAno" id="paramAno" size="4" maxlength="4" tipo="Num" required message="El Año es un campo obligatorio" onblur="asignaRequiredCampos(this);"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap width="13%">Tipo de Cambio</td>
            <td colspan="5">
              <input type="text" name="paramTipoCambio" id="paramTipoCambio"  size="21" maxlength="21" tipo="Money" prec="12.8" reqPrecValue required message="El Tipo de Cambio es un campo obligatorio" onblur="asignaRequiredCampos(this);"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriTipCam" fun="loadTableElement" tabla="tblRegPriTipCam" onclick="if(fvCatTipocambPri.checkForm()) consultar(this,frmDatosTiposCambio,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosTiposCambio);"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoTiposCambio(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoTiposCambio(2)"/>
              <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoTiposCambio(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoTiposCambio(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="140" nowrap>Pa&iacute;s</td>
                  <td width="140" nowrap>Moneda</td>
                  <td width="50" nowrap>A&ntilde;o</td>
                  <td width="50" nowrap>Mes</td>
                  <td width="50" nowrap>D&iacute;a</td>
                  <td width="50" nowrap>Hora</td>
                  <td width="50" nowrap>Minuto</td>
                  <td width="80" nowrap>Importe</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriTipCam" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPriTipCam" keys="ticNumPais,ticAnoAltaReg,ticMesAltaReg,ticDiaAltaReg,ticHoraAlta,ticMinutoAlta" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
