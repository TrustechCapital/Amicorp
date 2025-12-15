<form name="frmConsultarMovimientos" id="frmConsultarMovimientos" onsubmit="">
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
            <td width="10%">&nbsp;</td>
            <td width="10%" nowrap>Fideicomiso</td>
            <td width="10%">
              <input type="text" name="movNumContrato" id="movNumContrato" size="10" maxlength="10"/>
            </td>
            <td>
            <input type="text" name="movNomContrato" id="movNomContrato" size="80"/></td>
            <td colspan="4" width="10%" nowrap>&nbsp;Folio</td>
            <td width="10%" nowrap>
              <input type="text" name="movFolioOpera" id="movFolioOpera" size="10" maxlength="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
            <td width="10%">&nbsp;
            </td>
            <td>
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" style="visibility:hidden"/>
              <input type="text" name="paramorder2" id="paramorder2" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;Hora Registro</td>
            <td width="10%" nowrap>
              <input type="text" name="movHrTransac" id="movHrTransac" size="2" maxlength="2"/>:
              <input type="text" name="movMinTransac" id="movMinTransac" size="2" maxlength="2"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%" nowrap>Operaci&oacute;n</td>
            <td width="10%">
              <input type="text" name="movNumOperacion" id="movNumOperacion" size="10" maxlength="10"/>
            </td>
            <td>
              <input type="text" name="movNomOperacion" id="movNomOperacion" size="80"/>
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;Fecha Contable</td>
            <td width="10%" nowrap>
              <input type="text" name="movDiaMovto" id="movDiaMovto" size="1" maxlength="2"/>/
              <input type="text" name="movMesMovto" id="movMesMovto" size="1" maxlength="2"/>/
              <input type="text" name="movAnoMovto" id="movAnoMovto" size="4" maxlength="4"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%" nowrap>Conc. Conta</td>
            <td width="10%">
              <input type="text" name="movNumTransac" id="movNumTransac" size="10" maxlength="10"/>
            </td>
            <td>
              <input type="text" name="movNomTransaccion" id="movNomTransaccion" size="80"/>
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;Gu&iacute;a Contable</td>
            <td width="10%" nowrap>
              <input type="text" name="movNumGuia" id="movNumGuia" size="10" maxlength="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
            <td width="10%">
              &nbsp;
            </td>
            <td>
              &nbsp;
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;Fecha Liquidación</td>
            <td width="10%" nowrap>
              <input type="text" name="movFeqLiq" id="movFeqLiq" size="10" maxlength="10">              
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="10">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="10">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="10">
              <input type="button" value="Regresar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaPrincipalConsultaMovimientos();"/>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="10" class="subtitulo" align="center">Asientos Contables</td>
          </tr>
          <tr align="center">
            <td colspan="10">
              <table cellpadding="0" cellspacing="0" border="0">
                <tr class="cabeceras">
                  <td width="40" nowrap>Sec</td>
                  <td width="200" nowrap>Nombre</td>
                  <td width="50" nowrap>Cta</td>
                  <td width="40" nowrap>Scta</td>
                  <td width="40" nowrap>Sscta</td>
                  <td width="50" nowrap>Ssscta</td>
                  <td width="65" nowrap>Sssscta</td>
                  <td width="65" nowrap>Ssssscta</td>
                  <td width="50" nowrap>Aux1</td>
                  <td width="50" nowrap>Aux2</td>
                  <td width="50" nowrap>Aux3</td>
                  <td width="40" nowrap>C/A</td>
                  <td width="120" nowrap>Importe</td>
                  <td width="200" nowrap>Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1100px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriAsi" dataInfo="arrTblAsiDat" keys="" fun="" >
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="10">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;
            </td>
            <td colspan="8" align="center">
              <input type="button" value="Datos Inversión" name="cmdDetalleValores" id="cmdDetalleValores" class="boton" onclick="cargaPrincipalDetalleValoresConsultarConsultaMovimientos();"/>
              <input type="button" value="Datos Operación" name="cmdDetalleOperacion" id="cmdDetalleOperacion" class="boton" onclick="cargaPrincipalDetalleOperacionConsultarConsultaMovimientos();"/>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
