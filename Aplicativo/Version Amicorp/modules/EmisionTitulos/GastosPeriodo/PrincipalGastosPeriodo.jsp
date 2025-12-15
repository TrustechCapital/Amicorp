<table align="center" class="texto">
  <tr>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Concepto</td>
    <td valign="middle" height="6" colspan="4">
                  <select size="1" name="ecpaIdSecPago" id="ecpaIdSecPago" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" param="param535"  theValue="eindDescripcion" required   onchange="existeConceptoRepDist(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Importe Honorario</td>
    <td valign="middle" height="6" colspan="4">
      <input type="text" name="ecpaImpHonorario" id="ecpaImpHonorario" tipo="Money" size="20" maxlength="19" reqPrecValue prec="16.2" required message="El Importe Honorario es un campo obligatorio" onblur="formatoMonto(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="12%" nowrap colspan="5">
      <input type="text" name="ecpaConcepto" id="ecpaConcepto" size="10" maxlength="10" style="visibility:hidden"/>
      <input type="text" name="ecpaStCedevhon" id="ecpaStCedevhon" size="10" maxlength="10" value="ACTIVO" style="visibility:hidden"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="20%" nowrap colspan="7" align="center">
      <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionGastosPeriodo();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaDetalleReporteDistribucion(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>
