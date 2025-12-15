<form name="frmDatosReestructuracionSaldos" id="frmDatosReestructuracionSaldos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Reestructuraci&oacute;n de Saldos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" colspan="2">Fideicomiso</td>
            <td colspan="4">
              <select size="1" name="cmbFideicomiso" id="cmbFideicomiso" ref="conNumFidNomFidFOSEG" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="formsLoaded" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" colspan="2">Ejercicio</td>
            <td colspan="4">
              <input type="text" name="txtEjercicio" id="txtEjercicio" size="4" maxlength="4" tipo="Num" required message="El Ejercicio es un campo obligatorio"/>
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
        <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="ejecutaReestructuracionSaldos();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClick('Tesoreria.ReestructuracionSaldos.PrincipalReestructuracionSaldosFOSEG','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
