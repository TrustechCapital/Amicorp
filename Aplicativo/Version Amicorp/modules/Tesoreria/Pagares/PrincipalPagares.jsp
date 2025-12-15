<form name="frmPagares" id="frmPagares">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Registro de Pagar&eacute;s</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td nowrap width="20%">Fecha Valor</td>
            <td nowrap colspan="3">
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaContable" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio" onblur="verificaFecha(this);"/>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="formsLoaded" style="visibility:hidden"/>
              <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="1" maxlength="1" value="0" ref="conDatPos" fun="cargaTablaPosicion" param="txtPosicionParam" style="visibility:hidden"/>
              <input type="text" name="txtRetencionISR" id="txtRetencionISR" size="1" ref="conRetISR" fun="loadTxtElementX" theValue="retencionIsr" param="txtRetencionParam" next="ejecutaPagare" style="visibility:hidden"/>
            </td>
            <td nowrap>&nbsp;
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td colspan="4">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Fideicomiso &nbsp;&nbsp;&nbsp;</td>
            <td>
              <input type="text" name="numFideicomiso" id="numFideicomiso" size="10" required message="El Fideicomiso es un campo obligatorio" onblur="cargaCmbContratoInversion(this,cmbContratoInversion);"/>
            </td>
            <td colspan="3">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" theValue="ctoTipoAdmon" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Cto. Inversi&oacute;n</td>
            <td colspan="4">
              <select size="1" name="cmbContratoInversion" id="cmbContratoInversion" ref="conDatConInv" keyValue="cprEntidadFin" theValue="numContratoNomIntermed" fun="loadComboElement" param="cmbContratoInversionParam" next="consultaNomFid" required message="El Contrato de Inversión es un campo obligatorio" onblur="recuperaSubCuenta();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Sub Cuenta</td>
            <td>
              <input type="text" name="numSubcuenta" id="numSubcuenta" size="50" disabled="disabled"/>
            </td>
            <td align="center" colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Plazo</td>
            <td>
              <input type="text" name="txtPlazo" id="txtPlazo" size="5" maxlength="5" tipo="Num" required message="El Plazo es un campo obligatorio" onblur="calculaCantidades();"/>
            </td>
            <td>&nbsp;</td>
            <td width="20%">Premio</td>
            <td>
              <input type="text" name="txtPremio" id="txtPremio" size="25" maxlength="25"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Tasa</td>
            <td>
              <input type="text" name="txtTasa" id="txtTasa" size="16" maxlength="16" required message="La Tasa es un campo obligatorio" onblur="calculaCantidades();"/>
            </td>
            <td>&nbsp;</td>
            <td width="20%">Fecha Vencimiento</td>
            <td>
              <input type="text" name="txtFechaVencimiento" id="txtFechaVencimiento" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">Importe</td>
            <td>
              <input type="text" name="txtImporte" id="txtImporte" size="25" maxlength="25" required message="El Importe es un campo obligatorio" onblur="calculaCantidades();"/>
            </td>
            <td>&nbsp;</td>
            <td width="20%">Importe Vencimiento</td>
            <td>
              <input type="text" name="txtImporteVencimiento" i="txtImporteVencimiento" size="25" maxlength="25"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center" colspan="3" width="20%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" width="15%">&nbsp;
        <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="verificaFechaMesAnteriorFideicomiso();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.Pagares.PrincipalPagares','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
