<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Abrir Sistema</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td align="center"><div id="dvLeyenda" class="textoNegrita">&nbsp;</div></td>
          </tr>
          <tr>
            <td align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaAbrirCerrarSistema();"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
