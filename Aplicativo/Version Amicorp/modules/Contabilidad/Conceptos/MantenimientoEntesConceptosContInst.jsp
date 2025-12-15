<form name="frmMantenimientoEntesConceptos" id="frmMantenimientoEntesConceptos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Conceptos Contabilidad Institucional</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" nowrap>Tipo de Ente</td>
            <td>
              <select size="1" name="entTipoEnte" id="entTipoEnte" defaultValue="0" onchange="cargaObjTipoEnte(this);" required message="El Tipo de Ente es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="1">Fideicomiso</option>
                <option value="2">Fideicomisario</option>
                <option value="3">Tercero</option>
                <option value="4">Area Nafin</option>
                <option value="5">Banco</option>
                <option value="6">Banco de Mexico</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" nowrap><div id="div1" style="visibility:hidden">Fideicomiso</div></td>
            <td>
              <input type="text" name="entNumContrato" id="entNumContrato" size="10" maxlength="10f" value="0" tipo="Num" message="El Fideicomiso es un campo obligatorio" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" nowrap><div id="div2" style="visibility:hidden">div2</div></td>
            <td>
              <input type="text" name="entNumTipo" id="entNumTipo" size="10" maxlength="10" tipo="Num" message="Este es un campo obligatorio" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" nowrap>No. de Ente</td>
            <td>
              <input type="text" name="entNumEnteCont" id="entNumEnteCont" size="10" maxlength="10" value="0"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%" nowrap>Status</td>
            <td>
              <select size="1" name="entCveStEntes" id="entCveStEntes" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValores2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">&nbsp;
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEntesConceptos();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClick('Contabilidad.Conceptos.PrincipalEntesConceptosContInst','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
