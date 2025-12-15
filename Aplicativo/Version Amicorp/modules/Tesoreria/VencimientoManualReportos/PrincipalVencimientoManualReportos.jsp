<form name="frmVencimientoManualReportos" id="frmVencimientoManualReportos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Vencimiento Manual de Reportos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="33%">&nbsp;</td>
            <td width="13%" nowrap>Folio Reporto</td>
            <td nowrap>
              <input type="text" name="txtFolio" id="txtFolio" size="10" tipo="Num" required message="El Folio es un campo obligtorio"/>
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="8" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaContable" style="visibility:hidden"/>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="8" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="consultaMesAbierto" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="33%">&nbsp;</td>
            <td width="13%">
              <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="1" maxlength="1" value="0" ref="conDatPos" fun="cargaTablaPosicion" param="txtPosicionParam" style="visibility:hidden"/>
            </td>
            <td>
              <input type="checkbox" name="chkNoAfectarContabilidad" id="chkNoAfectarContabilidad" class="check"/>&nbsp;No Afectar Contabilidad
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" width="15%">&nbsp;
        <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="ejecutaVencimientoManualReportos();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.VencimientoManualReportos.PrincipalVencimientoManualReportos','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
