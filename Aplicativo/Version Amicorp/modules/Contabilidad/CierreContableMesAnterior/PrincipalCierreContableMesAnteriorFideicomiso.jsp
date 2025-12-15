<form name="frmDatosCierre" id="frmDatosCierre" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cierre Contable Mes Anterior Por Fideicomiso</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td colspan="3">
              <select size="1" name="cmbFideicomiso" id="cmbFideicomiso" ref="conNumFidNomFid" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="txtFechaContable"  onchange="consultaStatusMesContableFideicomiso(this);" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" rowspan="2">Status Cierre</td>
            <td>
              <input type="radio" name="rdStatus" id="rdStatusAbierto" class="radio" value="" value2="0" onclick="asignaValueRadio2Master('rdStatusAbierto',this);" message="El Status es un campo obligatorio" disabled/>Abierto
            </td>
            <td class="textoNegrita">
              <div id="divMesAbierto"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2">
              <input type="radio" name="rdStatus" id="rdStatusCerrado" class="radio" value="1" onclick="asignaValueRadio2Master('rdStatusAbierto',this);" disabled/>Cerrado
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="5" align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="consultaMesAbierto" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="5" align="center">
              <input type="button" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="activaCampos();"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="5" align="center">&nbsp;
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
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="cierreContableMesAnterior();" style="visibility:hidden"/>
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.CierreContableMesAnterior.PrincipalCierreContableMesAnteriorFideicomiso','')"/>
      </td>
    </tr>
  </table>
</form>
