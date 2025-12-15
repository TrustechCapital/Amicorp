<FORM name="frmPolizasInterfaseContable" id="frmPolizasInterfaseContable" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Interfase Contable SIF</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td align="center" width="25%" colspan="4">&nbsp;Fecha de Proceso&nbsp;&nbsp;&nbsp;
                <input type="text" name="txtDiaContable" id="txtDiaContable" tipo="Num" size="2" maxlength="2"/>
                <input type="text" name="txtMesContable" id="txtMesContable" tipo="Num" size="2" maxlength="2" required message="El Mes es un campo obligatorio"/>
                <input type="text" name="txtAnoContable" id="txtAnoContable" tipo="Num" size="4" maxlength="4" required message="El Año es un campo obligatorio"/>
              </td>
            </tr>
            <tr valign="middle">
              <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" class="subtitulo">&nbsp;</td>
              <td align="left" class="subtitulo">Generar P&oacute;lizas</td>
              <td align="left" class="subtitulo">&nbsp;</td>
              <td align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td colspan="4" align="left" class="subtitulo">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">No. P&oacute;liza</td>
              <td align="left" width="25%">
                <input type="text" name="txtNoPoliza" id="txtNoPoliza" tipo="Num" size="10" maxlength="10" required message="El Número de Póliza es un campo obligatorio"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Fecha de Aplicaci&oacute;n</td>
              <td align="left" width="25%">
                <input type="text" name="txtFechaContable" id="txtFechaContable" tipo="AlphaNumeric" size="10" maxlength="10"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td align="left" width="25%">&nbsp;</td>
              <td align="left" width="15%">Folio</td>
              <td align="left" width="25%">
                <input type="text" name="txtNoFolio" id="txtNoFolio" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td align="left" width="25%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value=" Aceptar " name="cmdAceptar" class="boton" onclick="nuevaFechaProceso();"/>
          <input type="BUTTON" value=" Aplicon " name="cmdAplicon" class="boton" onclick="cargaApliconInterfaseContableSIF();"/>
          <input type="BUTTON" value=" Imprimir" name="cmdImprimir" class="boton" onclick="cargaImprimirInterfaseContableSIF();"/>
          <input type="BUTTON" value=" Enviar  " name="cmdEnviar" class="boton" onclick="cargaEnviarInterfaseContableSIF();"/>
        </td>
      </tr>
  </table>
</FORM>
