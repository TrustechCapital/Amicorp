<form name="frmConsultarMovimientosDetalleValores" id="frmConsultarMovimientosDetalleValores" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Movimientos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto" width="90%">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="40%" nowrap>Fideicomiso</td>
            <td width="40%" colspan="2">
              <input type="text" name="movNumContrato" id="movNumContrato" size="10"/>
            </td>
            <td colspan="5">
              <input type="text" name="movNomContrato" id="movNomContrato" size="80"/>
            </td>
            <td width="15%" nowrap>Cto. Inversi&oacute;n</td>
            <td width="10%" nowrap>
              <input type="text" name="devContratoInter" id="devContratoInter" size="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="40%" nowrap>&nbsp;</td>
            <td width="40%" colspan="2">&nbsp;
            </td>
            <td colspan="5">&nbsp;
            </td>
            <td width="15%" nowrap>Folio</td>
            <td width="10%" nowrap>
              <input type="text" name="movFolioOpera" id="movFolioOpera" size="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="40%" nowrap>Operaci&oacute;n</td>
            <td width="40%" colspan="2">
              <input type="text" name="movNumOperacion" id="movNumOperacion" size="10"/>
            </td>
            <td colspan="5">
              <input type="text" name="movNomOperacion" id="movNomOperacion" size="80"/>
            </td>
            <td width="15%" nowrap>Hora Registro</td>
            <td width="10%" nowrap>
              <input type="text" name="movHrTransac" id="movHrTransac" size="2" maxlength="2"/>:
              <input type="text" name="movMinTransac" id="movMinTransac" size="2" maxlength="2"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="40%" nowrap>Conc. Conta</td>
            <td width="40%" colspan="2">
              <input type="text" name="movNumTransac" id="movNumTransac" size="10"/>
            </td>
            <td colspan="5">
              <input type="text" name="movNomTransaccion" id="movNomTransaccion" size="80"/>
            </td>
            <td width="15%" nowrap>Importe</td>
            <td width="10%" nowrap>
              <input type="text" name="movImpMovto" id="movImpMovto" size="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="12">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="2" class="subtitulo" nowrap>Compra/Venta</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="2" class="subtitulo" nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Pizarra</td>
            <td>Serie</td>
            <td>Cup&oacute;n</td>
            <td>&nbsp;</td>
            <td>Proovedor</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Utilidad</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="devNomPizarra" id="devNomPizarra" size="6"/>
            </td>
            <td>
              <input type="text" name="devSerieEmision" id="devSerieEmision" size="4"/>
            </td>
            <td colspan="2">
              <input type="text" name="devNumCuponVig" id="devNumCuponVig" size="4"/>
            </td>
            <td>
              <input type="text" name="devEntidadFin" id="devEntidadFin"  size="4"/>
            </td>
            <td colspan="3">
              <input type="text" name="devProovedor1" id="devProovedor1" size="45" ref="conNomProXNumPro" fun="loadTxtElement" param="txtProovedorParam" next="devInstrumento"/>
            </td>
            <td colspan="2">
              <input type="text" name="devImpUtilidad" id="devImpUtilidad" size="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="2" nowrap>Titulos</td>
            <td colspan="2">Precio</td>
            <td>&nbsp;</td>
            <td colspan="2">Tasa Rendimiento</td>
            <td>Importe</td>
            <td colspan="2">Perdida</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="2" nowrap>
              <input type="text" name="devNumTitulos" id="devNumTitulos" size="8"/>
            </td>
            <td colspan="3">
              <input type="text" name="devImpPrecioTit" id="devImpPrecioTit" size="10"/>
            </td>
            <td colspan="2">
              <input type="text" name="devTasaRendimien1" id="devTasaRendimien1" size="10"/>
            </td>
            <td>
              <input type="text" name="devNumImpTit1" id="devNumImpTit1" size="10"/>
            </td>
            <td colspan="2">
              <input type="text" name="devImpPerdida" id="devImpPerdida" size="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="10" class="subtitulo" nowrap>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="2" class="subtitulo" nowrap>Reportos/Pagares</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td class="subtitulo">Intereses</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap colspan="10">
            <input type="HIDDEN" name="devCveTipoMerca" id="devCveTipoMerca" size="5"/>
            <input type="HIDDEN" name="devNumInstrume" id="devNumInstrume" size="5"/>
            <input type="HIDDEN" name="devNumNoneda" id="devNumNoneda" size="5"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Reporto/Pagare</td>
            <td nowrap colspan="4">&nbsp;&nbsp;Instrumento</td>
            <td colspan="2">Proovedor</td>
            <td>Intereses</td>
            <td colspan="2">
              <input type="text" name="devImpIntereses" id="devImpIntereses" size="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="devFolioOperPla" id="devFolioOperPla" size="8"/>
            </td>
            <td nowrap colspan="4">
            <input type="text" name="devInstrumento" id="devInstrumento" size="35" ref="conNomInsXNumIns" fun="loadTxtElement" param="txtInstrumentoParam" next="devMoneda"/></td>
            <td colspan="2">
              <input type="text" name="devProovedor2" id="devProovedor2" size="18"/>
            </td>
            <td>I. S. R.</td>
            <td colspan="2">
              <input type="text" name="devImpIsr" id="devImpIsr" size="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Plazo</td>
            <td colspan="3">Tasa</td>
            <td>Importe</td>
            <td colspan="2">Premio</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="devNumPlazo" id="devNumPlazo" size="6"/>
            </td>
            <td colspan="3">
              <input type="text" name="devTasaRendimien2" id="devTasaRendimien2" size="10"/>
            </td>
            <td>
              <input type="text" name="devNumImpTit2" id="devNumImpTit2" size="10"/>
            </td>
            <td colspan="2">
              <input type="text" name="devNumImpPremio" id="devNumImpPremio" size="10"/>
            </td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Moneda</td>
            <td colspan="4">
              <input type="text" name="devMoneda" id="devMoneda" size="20" ref="conNomMonXNumMon" fun="loadTxtElement" param="txtMonedaParam" next="hideWaitLayer"/>
            </td>
            <td>Importe M. E.</td>
            <td>
              <input type="text" name="devImpMoneda" id="devImpMoneda" size="10"/>
            </td>
            <td>Tipo Cambio</td>
            <td colspan="2">
              <input type="text" name="devTipoCambio" id="devTipoCambio" size="6"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%" colspan="12">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Tipo de Derecho</td>
            <td colspan="4">
              <input type="text" name="devCveTipoDere" id="devCveTipoDere" size="35"/>
            </td>
            <td>Pizarra</td>
            <td>Serie Ant.</td>
            <td>Cupon</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>Factor</td>
            <td>
              <input type="text" name="devCveFactor" id="devCveFactor" size="6"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <input type="text" name="devNomPizarraAn" id="devNomPizarraAn" size="6"/>
            </td>
            <td>
              <input type="text" name="devSerieEmisAnt" id="devSerieEmisAnt" size="6"/>
            </td>
            <td>
              <input type="text" name="devCuponVigAnt" id="devCuponVigAnt" size="4"/>
            </td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Regresar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaPrincipalConsultarConsultaMovimientos();"/>
      </td>
    </tr>
  </table>
</form>
