<table align="center" class="texto">
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Concepto de Morosidad</td>
    <td valign="middle" height="6">
            <select size="1" name="ecmoIdSecMor" id="ecmoIdSecMor" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" onchange="morCuentas(this);existeConceptoRepDist(this);" param="param541"  theValue="eindDescripcion" required/>

    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>No. de Cuentas</td>
    <td valign="middle" height="6">
      <input type="text" name="ecmoNumCtas" id="ecmoNumCtas" tipo="Num" size="10" maxlength="10"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>% Cuentas</td>
    <td valign="middle" height="6">
      <input type="text" name="ecmoPorCtas" id="ecmoPorCtas" tipo="Money" size="5" maxlength="19" reqPrecValue prec="16.4" onblur="formatoMonto(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Saldo</td>
    <td valign="middle" height="6" nowrap>
      <input type="text"  name="ecmoImpSaldo" id="ecmoImpSaldo" tipo="Money" size="20" maxlength="19" reqPrecValue prec="16.2" required message="El Saldo es un campo obligatorio" onblur="formatoMonto(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap colspan="2">
      <input type="text" name="ecmoFecInicioExt" id="ecmoFecInicioExt" tipo="Fecha" size="10" maxlength="10" value="<%=session.getAttribute("fechaContable").toString()%>" style="visibility:hidden"/>
      <input type="text" name="ecmoFecFinExt" id="ecmoFecFinExt" tipo="Fecha" size="10" maxlength="10" value="<%=session.getAttribute("fechaContable").toString()%>" style="visibility:hidden"/>
      <input type="text" name="ecmoConcepMor" id="ecmoConcepMor" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/>
      <input type="text" name="ecmoStCedevmor" id="ecmoStCedevmor" value="ACTIVO" size="10" maxlength="10" style="visibility:hidden"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="20%" nowrap colspan="4" align="center">
      <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionEstadisticaMorosidad();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaDetalleReporteDistribucion(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>
