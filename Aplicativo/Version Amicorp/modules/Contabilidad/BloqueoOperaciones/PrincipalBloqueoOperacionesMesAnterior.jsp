<form name="frmDatosBloqueoOperaciones" id="frmDatosBloqueoOperaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Bloqueo de Operaciones Mes Anterior</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table border="0" width="100%" class="texto">
          <tr>
            <td align="center">
              <input type="checkbox" name="chkBloqueoOperaciones" id="chkBloqueoOperaciones" class="check"/>&nbsp;Bloqueo de Operaciones Mes Anterior
            </td>
          </tr>
          <tr>
            <td align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaMesAnoAnt" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="bloqueoOperacionesMesAnterior();"/>
      </td>
    </tr>
  </table>
</form>
