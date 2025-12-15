  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Operaci&oacute;n</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <form name="frmDatosConsulta" id="frmDatosConsulta" onsubmit="">
          <table align="center" class="texto" width="100%">
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="10%">Fecha</td>
              <td width="20%"><input type="text" name="paramFecha"  id="paramFecha" tipo="Date" size="10" maxlength="10" /></td>
              <td width="10%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>Cr&eacute;dito</td>
              <td><input type="text" name="paramCredito"  id="paramCredito" tipo="AlphaNumeric" size="15" maxlength="20" required message="El No. de Cr&eacute;dito es un dato obligatorio"/></td>            
              <td><input type="button" value="Buscar" name="cmdBuscar" id="cmdBuscar" class="boton" ref="qryVintaAmortizacionesCredito" fun="loadTableElement" tabla="tblReg" onclick="consultarRP(this, frmDatosConsulta, false);"/></td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </form>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <table cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="center">
                  <td align="center" width="25px" nowrap>&nbsp;</td>
                  <td width="90px" nowrap>Cr&eacute;dito</td>
                  <td width="60px" nowrap>Per&iacute;odo</td>
                  <td width="80px" nowrap>Fecha Inicio</td>
                  <td width="80px" nowrap>Fecha Fin</td>
                  <td width="40px" nowrap>D&iacute;as</td>
                  <td width="40px" nowrap>Tasa</td>
                  <td width="100px" nowrap>Movimiento Capital</td>
                  <td width="100px" nowrap>Pago de Inter&eacute;s</td>
                  <td width="100px" nowrap>IVA</td>
                  <td width="100px" nowrap>Pago Total</td>
                  <td width="100px" nowrap>Saldo de Capital</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top;" align="left">
                <table cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="iperiod,idProducto,idCredito,idClienteicapital,iintereses,iiva,vanteriorPagada" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b&uacute;squeda">
                </table>
              </div>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr id="trSeccion" style="visibility:hidden;">
      <td>
        <form name="frmDatos" id="frmDatos" onsubmit="">
          <table align="center" class="texto">
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="15%">Forma de Liquidaci&oacute;n</td>
              <td width="40%">
                <select size="1" name="cmbFormaPago" id="cmbFormaPago" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbTipoPago" param="clavesCombo81" required message="La Forma de Liquidaci&oacute;n es un dato obligatorio"/>
              <td width="20%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>Fecha</td>
              <td><input type="text" name="txtFechaPago"  id="txtFechaPago" tipo="Date" size="10" maxlength="10" required message="La Fecha es un dato obligatorio"/></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>Tipo de Operaci&oacute;n</td>
              <td>
                <select size="1" name="cmbTipoPago" id="cmbTipoPago" ref="qryVintaTipoPagos" fun="loadComboElement" keyValue="idTipoPago" theValue="vtipoPago" next="cmbMoneda" param="tipoPagoCombo" required message="El Tipo de Operaci&oacute;n es un dato obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>Moneda</td>
              <td>
                <select size="1" name="cmbMoneda" id="cmbMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNomMoneda" theValue="monNomMoneda" next="formsLoaded" required message="La Moneda es un dato obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>Importe</td>
              <td><input type="text" name="txtImporte"  id="txtImporte" tipo="Money" size="15" maxlength="20" required  message="El Importe es un dato obligatorio"/></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td align="right"><input type="button" value="Aceptar" name="cmdAceptar" class="boton" onclick="aplicaPago();"/></td>
              <td><input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalRecepcionPagos();"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="6" align="center"><a id="linkReporteNew" href="#" target="_new" style="visibility:hidden;position: absolute; top: 0; left: 0;" >Archivo</a></td>
            </tr>
            <tr>
          </table>
        </form>
      </td>
    </tr>
  </table>
</form>