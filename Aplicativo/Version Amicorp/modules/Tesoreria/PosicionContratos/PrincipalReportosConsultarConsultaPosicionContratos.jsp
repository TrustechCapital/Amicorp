<form name="frmReportosConsultarPosicionContratos" id="frmReportosConsultarPosicionContratos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Posici&oacute;n de Contratos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td colspan="5" class="subtitulo"><div id="dvDetalle">Detalle de Reporto</div></td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Fideicomiso</td>
            <td>
              <input type="text" name="creNumContrato" id="creNumContrato" size="10"/>
            </td>
            <td width="70%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="70%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Cto Inver</td>
            <td colspan="2">
              <input type="text" name="creContratoInter" id="creContratoInter" size="10"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Mercado</td>
            <td colspan="2">
              <input type="text" name="creMercado" id="creMercado" size="30"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Instrumento</td>
            <td colspan="2">
              <input type="text" name="creInstrumento" id="creInstrumento" size="75"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td><div id="dvFolio">Folio Reporto</div></td>
            <td>
              <input type="text" name="creFolioReporto" id="creFolioReporto" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td>Importe</td>
            <td>
              <input type="text" name="creImpReporto" id="creImpReporto" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td>Plazo</td>
            <td>
              <input type="text" name="creNumPlazo" id="creNumPlazo" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td>Tasa</td>
            <td>
              <input type="text" name="crePjeTasaPacta" id="crePjeTasaPacta" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td><div id="dvPremioInteres">Premio</div></td>
            <td>
              <input type="text" name="crePremioReporto" id="crePremioReporto" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
            <td>Vencimiento</td>
            <td>
              <input type="text" name="creFechaVencim" id="creFechaVencim" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaConsultarPosicionContratos(false)"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
