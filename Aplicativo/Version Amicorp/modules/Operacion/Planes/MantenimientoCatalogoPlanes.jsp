<form name="frmDatos2" id="frmDatos2">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Planes Operacion</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Nombre Plan</td>
            <td colspan="4">
              <input type="text" name="plaCveFaseProd" id="plaCveFaseProd" size="36" maxlength="36" tipo="AlphaNumeric" required message="El Nombre del Plan es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Descripci&oacute;n</td>
            <td colspan="4">
              <textarea name="plaDescFaseProd" id="plaDescFaseProd" style="width: 500px;height:200px" required message="La Descripción es un campo obligatorio" onkeydown="validaLongitud(this,255);"></textarea>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Periodicidad</td>
            <td colspan="3">
              <select size="1" name="plaCvePerAplica" id="plaCvePerAplica" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbPeriodicidadParam" next="asignaValues2ObjHTML" required message="La Periodicidad es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Fecha Inicio Operaci&oacute;n</td>
            <td>
              <input type="text" name="Fecha" id="Fecha" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="destazaFecha" required message="La Fecha de Inicio de Operación es un campo obligatorio"/>
            </td>
            <td nowrap width="35%">
              <input type="text" name="plaDiaAplicacion" id="plaDiaAplicacion" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="plaMesAplicacion" id="plaMesAplicacion" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="plaAnoAplicacion" id="plaAnoAplicacion" size="4" maxlength="4" style="visibility:hidden"/>
              <input type="text" name="plaCveStPlan" id="plaCveStPlan" size="4" value="ACTIVO" style="visibility:hidden"/>
            </td>
            <td nowrap>Hora Inicio Operaci&oacute;n</td>
            <td nowrap>
              <input type="text" name="plaHoraAplica" id="plaHoraAplica" size="2" maxlength="2" tipo="Num" required message="La Hora de Inicio de Operación es un campo obligatorio" onblur="eval(this.value) > 24?alert('El formato de la Hora debe ser 24hr'):''"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap/>
            <td colspan="3">
              <input type="checkbox" name="plaCveChControl" id="plaCveChControl" onclick="asignaValue2Check(this)" class="check"/>&nbsp;Verifica Tabla de Control
            </td>
            <td>&nbsp;</td>
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
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionPlan();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="onButtonClickPestania('Operacion.Planes.PrincipalCatalogoPlanes','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
