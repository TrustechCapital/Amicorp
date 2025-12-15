<form name="frmConsultarPosicionContratos" id="frmConsultarPosicionContratos">
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
        <table width="100%" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Fideicomiso</td>
            <td>
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" size="10" fun="loadTableElement" tabla="tblRegPriPosCon"/>
            </td>
            <td colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Contrato Inversi&oacute;n</td>
            <td>
              <input type="text" name="paramNumContratoInversion" id="paramNumContratoInversion" size="10" fun="loadTableElement" tabla="tblRegPriRepCon"/>
            </td>
            <td>Fecha</td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="asignaValues2ObjHTML"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;
            </td>
            <td colspan="5">
              <input type="text" name="paramNumIntermediario" id="paramNumIntermediario" size="10" fun="loadTableElement" tabla="tblRegPriPagCon" style="visibility:hidden"/>
              <input type="text" name="paramNumMercado" id="paramNumMercado" size="10" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo" align="center">Posici&oacute;n</td>
          </tr>
          <tr align="center">
            <td colspan="7">
              <table cellspacing="0" cellpadding="0" border="0" width="1080">
                <tr class="cabeceras">
                  <td nowrap width="23">&nbsp;</td>
                  <td nowrap width="79">Fideicomiso</td>
                  <td nowrap width="86">SubContrato</td>
                  <td nowrap width="86">Contrato Inv</td>
                  <td nowrap width="76">Pizarra</td>
                  <td nowrap width="57">Serie</td>
                  <td nowrap width="50">Cup&oacute;n</td>
                  <td nowrap width="100">Pos Inicial</td>
                  <td nowrap width="100">Ventas</td>
                  <td nowrap width="100">Compras</td>
                  <td nowrap width="100">Pos Actual</td>
                  <td nowrap width="100">Pos Garantia</td>
                  <td nowrap width="100">Costo Hist.</td>
                </tr>
              </table>
              <div style="height:200px; overflow:auto; position:relative; vertical-align:top;width:1080px">
                <table id="tblRegPriPosCon" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblPosConDat" keys="posNumContrato,posNumEntidFin,posContratoInter,posSubContrato,posCveTipoMerca,posNumInstrume,posNumSecEmis,nomInstrumento,nomMercado,nomMoneda" fun="clickTablaPosCon" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo" align="center">Reportos / Pagar&eacute;s</td>
          </tr>
          <tr>
            <td colspan="7">
              <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td nowrap width="60">Folio</td>
                  <td nowrap width="60"> Tipo</td>
                  <td nowrap width="81">Fideicomiso</td>
                  <td nowrap width="40">Plazo</td>
                  <td nowrap width="130">Mercado</td>
                  <td nowrap width="200">Instrumento</td>
                  <td nowrap width="150">Importe</td>
                  <td nowrap width="50">Tasa</td>
                  <td nowrap width="100">Premio</td>
                  <td nowrap width="60">D&iacute;a Venc</td>
                  <td nowrap width="60">Mes Venc</td>
                  <td nowrap width="60">A&ntilde;o Venc</td>
                  <td nowrap width="100">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriRepCon" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblRepConDat" keys="creNumContrato,creSubContrato,creEntidadFin,creContratoInter,creFolioReporto,creTipo,nomInstrumento,nomMercado" fun="clickTablaRepCon" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="onButtonClickPestania('Tesoreria.PosicionContratos.PrincipalConsultaPosicionContratos','')"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
