<FORM name="frmMantenimientoCargaRendimientos" id="frmMantenimientoCargaRendimientos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Carga de Rendimientos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="30%">Fideicomiso</td>
            <td>
              <select size="1" name="renNumFid" id="renNumFid" ref="conNumFidNomFidFOSEG" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="renCveStRendimi" required message="El Fideicomiso es un campo obligatorio" onblur="cmbContratoInversionParam.Fideicomiso = this.value; loadElement(renNumContrato);"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="30%">Contrato Inversi&oacute;n</td>
            <td>
              <input type="text" name="renNumContrato" id="renNumContrato" size="10" maxlength="10" ref="conConInvRen" fun="loadTxtElementX" theValue="cprContratoInter" tipo="Num" param="cmbContratoInversionParam" next="hideWaitLayer" required message="El Contrato de Inversión es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="30%">A&ntilde;o de Ejercicio</td>
            <td>
              <input type="text" name="renEjercicio" id="renEjercicio" size="4" maxlength="4" tipo="Num" required message="El Año de Ejercicio es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="30%">Aportaci&oacute;n de Rendimientos</td>
            <td>
              <input type="text" name="renImpXAsignar" id="renImpXAsignar" size="18" maxlength="18" tipo="Money" required message="La Aportación de Rendimientos es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="30%">Status</td>
            <td>
              <select name="renCveStRendimi" id="renCveStRendimi" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionCargaRendimientos();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClick('Tesoreria.CargaRendimientosFOSEG.PrincipalCargaRendimientosFOSEG','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
