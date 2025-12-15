<FORM name="frmMantenimientoBienesGarPagos" id="frmMantenimientoBienesGarPagos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento del Registro Pagos de Bienes en Garantia</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="40%" align="center" class="texto">
          <tr>
            <td width="30%">Fideicomiso:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbIdFideicomiso" id="fpbIdFideicomiso" tipo="Num" size = "10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message = "Valor obligatorio"/>
            </td>
          </tr>
          <tr>
            <td>SubCuenta:</td>
            <td width="15%">
              <input type="text" name="fpbIdSubcuenta" id="fpbIdSubcuenta" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="30%">Id Garantia:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbIdGarantia" id="fpbIdGarantia" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="30%">Id Bien:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbIdBienGarantia" id="fpbIdBienGarantia" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="30%">Id Cobro:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbIdCobro" id="fpbIdCobro" tipo="Num" size = "10" maxlength="10" required message ="Valor obligatorio"/>
            </td>
          </tr>
           <tr>
            <td width="30%">Importe:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbImporte" id="fpbImporte" tipo="Num" size = "20" maxlength="16"/>
            </td>
          </tr>
           <tr>
            <td width="30%">Moneda:</td>
            <td nowrap width="15%">
              <select size="1" name="fpbCveMoneda" id="fpbCveMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="loadCatalogoBienesGarPagos"/>
            </td>
          </tr>
           <tr>
            <td width="30%">Fecha:</td>
            <td nowrap width="15%">
              <input type="text" name="fpbFecha" id="fpbFecha" tipo="Fecha" size="10" maxlength="10"/>
            </td>
          </tr>
           <tr>
            <td width="30%">Comentario</td>
            <td nowrap width="15%">
            <textarea name="fpbComentario" id="fpbComentario" cols="20" rows="10"> </textarea>
            </td>
          </tr>
           <tr>
            &nbsp;
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="button" value="Aceptar " id="cmdAceptarPagos" name="cmdAceptarPagos" class="boton" onclick="ejecutaFuncionBienesGarPagos();" style="visibility:hidden"/>
              <input type="button" value="Cancelar" id="cmdCancelarPagos" name="cmdCancelarPagos" class="boton_x" onclick="onButtonClickPestania('Garantias.Garantias.PrincipalGarantias','')" style="visibility:hidden"/>
            </td>
          </tr>
        </td>
    </tr>
  </table>
</FORM>