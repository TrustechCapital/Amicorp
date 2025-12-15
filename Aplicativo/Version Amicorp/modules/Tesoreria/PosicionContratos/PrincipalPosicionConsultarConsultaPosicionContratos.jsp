<form name="frmPosicionConsultarPosicionContratos" id="frmPosicionConsultarPosicionContratos">
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
            <td colspan="8" class="subtitulo">Detalle de Valores</td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td>Fideicomiso</td>
            <td>
              <input type="text" name="posNumContrato" id="posNumContrato" size="15" ref="conPriComPos" fun="loadTableElementSpecial" tabla="tblRegPriComPos"/>
            </td>
            <td colspan="4">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>Cto. Inver</td>
            <td>
              <input type="text" name="posContratoInter" id="posContratoInter" size="15" ref="conPriVenPos" fun="loadTableElementSpecial" tabla="tblRegPriVenPos"/>
            </td>
          </tr>
          <tr>
            <td>Mercado</td>
            <td colspan="2">
              <input type="text" name="posMercado" id="posMercado" size="25"/>
            </td>
            <td>Instrumento</td>
            <td colspan="2">
              <input type="text" name="posInstrumento" id="posInstrumento" size="50"/>
            </td>
            <td>Emisi&oacute;n</td>
            <td>
              <input type="text" name="posNumSecEmis" id="posNumSecEmis" size="15"/>
            </td>
          </tr>
          <tr>
            <td>Pizarra</td>
            <td>
              <input type="text" name="posNomPizarra" id="posNomPizarra" size="15"/>
            </td>
            <td>Serie</td>
            <td>
              <input type="text" name="posNumSerEmis" id="posNumSerEmis" size="15"/>
            </td>
            <td>Cup&oacute;n</td>
            <td>&nbsp;
            </td>
            <td>Proveedor</td>
            <td>
              <input type="text" name="posProveedor" id="posProveedor" size="25"/>
            </td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">
              <hr/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4" class="subtitulo">P&eacute;riodo</td>
            <td align="center" colspan="4" class="subtitulo">Ejercicio</td>
          </tr>
          <tr>
            <td align="left" colspan="2">Posici&oacute;n Inicial</td>
            <td align="left" colspan="2">
              <input type="text" name="posPosicIniPer" id="posPosicIniPer"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Posici&oacute;n Inicial</td>
            <td align="left" colspan="2">
              <input type="text" name="posPosicIniEjer" id="posPosicIniEjer"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Compras</td>
            <td align="left" colspan="2">
              <input type="text" name="posCpasPosicPer" id="posCpasPosicPer"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Compras Acumuladas</td>
            <td align="left" colspan="2">
              <input type="text" name="posCpasPosEjer" id="posCpasPosEjer"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Ventas</td>
            <td align="left" colspan="2">
              <input type="text" name="posVtasPosicPer" id="posVtasPosicPer"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Ventas Acumuladas</td>
            <td align="left" colspan="2">
              <input type="text" name="posVtasPosEjer" id="posVtasPosEjer"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Posici&oacute;n Actual</td>
            <td align="left" colspan="2">
              <input type="text" name="posPosicActual" id="posPosicActual"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Fecha Ultimo Movimiento</td>
            <td align="left" colspan="2">
              <input type="text" name="posFechaUltMovto" id="posFechaUltMovto"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Costo Historico</td>
            <td align="left" colspan="2">
              <input type="text" name="posCostoHistoric" id="posCostoHistoric"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Precio Promedio</td>
            <td align="left" colspan="2">
              <input type="text" name="posPrecioProm" id="posPrecioProm"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Posici&oacute;n en Garantia</td>
            <td align="left" colspan="2">
              <input type="text" name="posPosicComprom" id="posPosicComprom"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Posici&oacute;n Disponible</td>
            <td align="left" colspan="2">
              <input type="text" name="posPosicDispon" id="posPosicDispon"/>
            </td>
          </tr>
          <tr>
            <td align="left" colspan="2">Int Devengados no Cob</td>
            <td align="left" colspan="2">
              <input type="text" name="txtIntDevengados" value="0.00"/>
            </td>
            <td align="left">&nbsp;</td>
            <td align="left">Moneda</td>
            <td align="left" colspan="2">
              <input type="text" name="posMoneda" id="posMoneda"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" class="subtitulo" align="center">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="8" class="subtitulo" align="center">Detalle&nbsp;Compras</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0" width="50%">
                <tr class="cabeceras">
                  <td width="100" nowrap>Fecha</td>
                  <td width="100" nowrap>Titulos Compra</td>
                  <td width="150" nowrap>Precio</td>
                  <td width="150" nowrap>Importe Compra</td>
                  <td width="125" nowrap>Titulos Disponibles</td>
                  <td width="100" nowrap>Status</td>
                  <td width="100" nowrap>Folio</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriComPos" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblComPosDat">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="8" class="subtitulo" align="center">Detalle Ventas</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0" width="50%">
                <tr class="cabeceras">
                  <td width="100" nowrap>Fecha</td>
                  <td width="100" nowrap>Folio Venta</td>
                  <td width="100" nowrap>Folio Compra</td>
                  <td width="150" nowrap>Precio Venta</td>
                  <td width="150" nowrap>Precio Compra</td>
                  <td width="100" nowrap>T&iacute;tulos</td>
                  <td width="150" nowrap>Importe</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriVenPos" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblVenPosDat">
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
      <td height="100%" align="center">
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaConsultarPosicionContratos(false)"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
