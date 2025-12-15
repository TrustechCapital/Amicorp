<form name="frmComprasVentas" id="frmComprasVentas">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Compras y Ventas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Fecha Valor</td>
            <td>
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaContable" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio" onblur="verificaFecha(this);"/>
            </td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="txtFechaLiq" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="1" maxlength="1" value="0" ref="conDatPos" fun="cargaTablaPosicion" param="txtPosicionParam" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr id="trFechaLiq" style="visibility:hidden;" > 
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Fecha Liquidación</td>
            <td>
              <input type="text" name="txtFechaLiq" id="txtFechaLiq" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="cmbMercado" tipo="Fecha" required message="La Fecha Liquidación es un campo obligatorio" onblur="verificaFechaLiq(GI('txtFechaContable'),this);" />
            </td>
            <td>
              &nbsp;
            </td>
            <td colspan="2">
              &nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Tipo de Movimiento</td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="rdTipoMovimiento" class="radio" value="1" value2="1" required message="El Tipo de Movimiento es un campo obligatorio" onclick="cargaObjetosTipoMovimiento(this);" checked/>&nbsp;Compra
            </td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="rdTipoMovimiento2" class="radio" value="2" onclick="cargaObjetosTipoMovimiento(this);"/>&nbsp;Venta
            </td>
            <td>
              <input type="text" name="txtRetencionISR" id="txtRetencionISR" size="1" ref="conRetISR" fun="loadTxtElementX" theValue="retencionIsr" param="txtRetencionParam" next="ejecutaCompraVenta" maxlength="1" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Fideicomiso</td>
            <td>
              <input type="text" name="numFideicomiso" id="numFideicomiso" size="10" required message="El Fideicomiso es un campo obligatorio" onblur="cargaCmbContratoInversion(this,cmbContratoInversion);"/>
            </td>
            <td colspan="3">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" theValue="ctoTipoAdmon" param="divNombreFideicomisoParam" next="hideWaitLayer">&nbsp;</div>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Contrato de Inversi&oacute;n</td>
            <td colspan="4">
              <select size="1" name="cmbContratoInversion" id="cmbContratoInversion" ref="conDatConInv" keyValue="cprEntidadFin" theValue="numContratoNomIntermed" fun="loadComboElement" param="cmbContratoInversionParam" next="consultaNomFid" required message="El Contrato de Inversión es un campo obligatorio" onchange="cargaPosicion(this);" onblur="recuperaSubCuenta();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Sub Cuenta</td>
            <td colspan="4">
              <input type="text" name="numSubcuenta" id="numSubcuenta" size="50" disabled="disabled"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;
            </td>
            
            <td>
              <div id="dvMercado">Mercado</div>
            </td>
            <td colspan="4">
              <select name="cmbMercado" id="cmbMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbMercadoParam" next="formsLoaded" required message="El Mercado es un campo obligatorio" onchange="cargaComboEmisiones(this);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>
              <div id="dvEmisiones">Emisiones</div>
            </td>
            <td colspan="4">
              <select name="cmbEmisiones" id="cmbEmisiones" ref="conDatEmision" fun="loadComboElement" keyValue="datosEmision" theValue="emision" param="cmbEmisionParam" next="formsLoaded" required message="La Emisión es un campo obligatorio" onchange="asignaEmisoraSerieCupon(this);""">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center" colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td align="center">Emisora</td>
            <td align="center">Serie</td>
            <td align="center">Cup&oacute;n</td>
            <td align="center">No. Titulos</td>
            <td align="center">Precio</td>
            <td align="center">Importe</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="10%">&nbsp;</td>
            <td width="15%">
              <input type="text" name="txtEmisora" id="txtEmisora" size="10"/>
            </td>
            <td width="15%">
              <input type="text" name="txtSerie" id="txtSerie" size="10"/>
            </td>
            <td align="center" width="15%">
              <input type="text" name="txtCupon" id="txtCupon" size="10"/>
            </td>
            <td width="15%">
              <input type="text" name="txtNoTitulos" id="txtNoTitulos" size="10" tipo="Num" required message="El No. de Titulos es un campo obligatorio" onblur="calculaImporte(this.value,txtPrecio.value);"/>
            </td>
            <td width="15%">
              <input type="text" name="txtPrecio" id="txtPrecio" size="10" tipo="Money" prec="100.100" reqPrecValue required message="El Precio es un campo obligatorio" onblur="calculaImporte(this.value,txtNoTitulos.value);"/>
            </td>
            <td width="15%">
              <input type="text" name="txtImporte" id="txtImporte" size="10" tipo="Money" prec="100.2" reqPrecValue required message="El Importe es un campo obligatorio" onblur="calculaPrecio(this.value,txtNoTitulos.value);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center" valign="middle" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" width="15%">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                <tr align="left" class="cabeceras">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="86" nowrap>Emisora</td>
                  <td width="70" nowrap>Serie</td>
                  <td width="67" nowrap>Cup&oacute;n</td>
                  <td width="100" nowrap>Ventas</td>
                  <td width="100" nowrap>Compras</td>
                  <td width="120" nowrap>Posici&oacute;n Actual</td>
                  <td width="120" nowrap>Posici&oacute;n Garantia</td>
                  <td width="120" nowrap>Posici&oacute;n Disponible</td>
                  <td width="120" nowrap>Costo Historico</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriPos" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblPosDat" keys="posCveTipoMerca,posNumInstrume,posNumSecEmis,posNomPizarra,posNumSerEmis,posNumCuponVig" fun="clickTabla" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" width="15%">&nbsp;
        <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="asignaRetencionISR();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.ComprasVentas.PrincipalComprasVentas','');"/>
      </td>
    </tr>
  </table>
</form>
