<form name="frmDatos2" id="frmDatos2">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Utilidad / P&eacute;rdida SAT</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="38%">&nbsp;</td>
            <td nowrap width="10%">Fideicomiso</td>
            <td>
              <input type="text" name="fsaNumContrato" id="fsaNumContrato" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="38%">&nbsp;</td>
            <td nowrap width="10%">A&ntilde;o</td>
            <td>
              <input type="text" name="fsaAno" id="fsaAno" size="4" maxlength="4" tipo="Num" required message="El Año es un campo obligatorio" onblur="if(this.value.length < 4){alert('Introduzca un Año valido!');this.focus();}"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="38%">&nbsp;</td>
            <td nowrap width="10%">Mes</td>
            <td>
              <input type="text" name="fsaMes" id="fsaMes" size="2" maxlength="2" tipo="Num" required message="El Mes es un campo obligatorio" onblur="if(this.value > 12){alert('Introduzca un Mes valido!');this.focus();}"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="38%">&nbsp;</td>
            <td nowrap width="10%">Tipo</td>
            <td>
              <select size="1" name="fsaTipo" id="fsaTipo" required message="EL Tipo es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="UTILIDAD">UTILIDAD</option>
                <option value="PERDIDA">PERDIDA</option>
              </select>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="38%">&nbsp;</td>
            <td nowrap width="10%">Importe</td>
            <td>
              <input type="text" name="fsaImporte" id="fsaImporte" size="19" maxlength="19" tipo="Money" prec="14.2" required message="El Importe es un campo obligatorio" reqPrecValue/>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionUtilidadPerdida();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.UtilidadPerdidaFiscalSAT.PrincipalUtilidadPerdidaFiscalSAT','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
