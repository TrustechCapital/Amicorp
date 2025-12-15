<FORM name="frmPrincipalGeneraLOBO" id="frmPrincipalGeneraLOBO">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cierres Mensuales Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap>A&ntilde;o</td>
            <td nowrap>
              <select id="cmbAno" name="cmbAno" ref="clavesAnoConta" fun="loadComboElement" keyValue="movFecOper" theValue="movFecOper"  next="cmbMes" required message="El Año es un parámetro obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap>Mes</td>
            <td nowrap>
              <select id="cmbMes" name="cmbMes" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo616" next="loadCatalogo" required message="El Mes es un parámetro obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
        <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" onclick="botonAceptar();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmPrincipalGeneraLOBO'));"/>
      </td>
    </tr>
  </table>
  <a id="ligaArchivo" href="#"/>
</FORM>
