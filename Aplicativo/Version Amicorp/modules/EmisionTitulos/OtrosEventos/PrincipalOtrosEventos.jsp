<table align="center" class="texto">
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Concepto</td>
    <td valign="middle" height="6">
            <select size="1" name="ecfcIdConPag" id="ecfcIdConPag" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" param="param537"  theValue="eindDescripcion" required onchange="existeConceptoRepDist(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap>Importe</td>
    <td valign="middle" height="6" nowrap>
      <input type="text" name="ecpgImpPago" id="ecpgImpPago" tipo="Money" size="20" maxlength="19" reqPrecValue prec="16.2" required message="El Saldo es un campo obligatorio" onblur="formatoMonto(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" nowrap colspan="2">
      <!--input type="text" name="ecmoIdSecMor" id="ecmoIdSecMor" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/-->
      
      <input type="text" name="ecpgImpPagoDis" id="ecpgImpPagoDis" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/>
      <input type="text" name="ecpgConcepto" id="ecpgConcepto" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/>
      <input type="text" name="ecfcStCedevfco" id="ecfcStCedevfco" value="ACTIVO" size="10" maxlength="10" style="visibility:hidden"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="20%" nowrap colspan="4" align="center">
      <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionOtrosEventos();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaDetalleReporteDistribucion(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>
