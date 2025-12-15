<table align="center" class="texto">
  <!--tr>
    <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="12%" nowrap>Fecha Inicio</td>
    <td valign="middle" height="6" width="1%">
      <input type="text" name="ecfcFecInicioPer" id="ecfcFecInicioPer" tipo="Fecha" size="10" maxlength="10" required message="La Fecha Inicio es un campo obligatorio"/>
    </td>
    <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="10%" nowrap>Fecha Fin</td>
    <td valign="middle" height="6" width="20%" nowrap>
      <input type="text" name="ecfcFecFinPer" id="ecfcFecFinPer" tipo="Fecha" size="10" maxlength="10" required message="La Fecha Fin es un campo obligatorio"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr-->
  <tr>
    <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="12%" nowrap>Concepto</td>
    <td valign="middle" height="6" width="1%">
      <select size="1" name="ecfcIdSecCob" id="ecfcIdSecCob" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" param="param536"  theValue="eindDescripcion" onchange="existeConceptoRepDist(this);" required/>
    </td>
    <td valign="middle" height="6" width="10%" nowrap>
      &nbsp;
    </td>
    <td valign="middle" height="6" width="10%" nowrap>Importe</td>
    <td valign="middle" height="6" width="20%" nowrap>
      <input type="text" name="ecfcImpCobranza" id="ecfcImpCobranza" tipo="Money" size="20" maxlength="19" reqPrecValue prec="16.2" required message="El Importe es un campo obligatorio" onblur="formatoMonto(this);"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <!--tr>
    <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="12%" nowrap>Comentario</td>
    <td valign="middle" height="6" width="1%" colspan="4">
      <textarea name="ecfcComentario" id="ecfcComentario" style="width:400px;height:80px" onkeydown="validaLongitud(this,50);"></textarea>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr-->
  <tr>
    <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
    <td valign="middle" height="6" width="12%" nowrap colspan="5">
      <!--input type="text" name="ecfcIdPrograma" id="ecfcIdPrograma" size="10" maxlength="10" style="visibility:hidden"/-->
      <!--input type="text" name="ecfcIdSecCob" id="ecfcIdSecCob" size="10" maxlength="10" style="visibility:hidden"/-->
      <input type="text" name="ecfcConcepto" id="ecfcConcepto" size="10" maxlength="10" style="visibility:hidden"/>
      
      
      <input type="text" name="ecfcStCedevfco" id="ecfcStCedevfco" size="10" maxlength="10" value="ACTIVO" style="visibility:hidden"/>
    </td>
    <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" height="6" width="20%" nowrap colspan="7" align="center">
      <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionFlujoCobranza();" style="visibility:hidden"/>
      <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaDetalleReporteDistribucion(2);" style="visibility:hidden"/>
    </td>
  </tr>
</table>
