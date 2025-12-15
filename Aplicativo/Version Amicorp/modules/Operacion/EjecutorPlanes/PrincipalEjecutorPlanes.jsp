<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Ejecutor de Planes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="40%">&nbsp;</td>
            <td width="5%">Plan</td>
            <td>
              <select size="1" name="cmbPlanes" id="cmbPlanes" fun="loadComboElement" keyValue="plaCveFaseProd" theValue="plaCveFaseProd" param="cmbPlanesParam" next="formsLoaded" required message="El Plan es un campo obligatorio"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="4" align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtHoraMinuto" style="visibility:hidden"/>
              <input type="text" name="txtHoraMinuto" id="txtHoraMinuto" size="2" ref="conMinHorDeDual" fun="loadTxtElementX" theValue="hora" next="destazaFecha" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaPlan();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
