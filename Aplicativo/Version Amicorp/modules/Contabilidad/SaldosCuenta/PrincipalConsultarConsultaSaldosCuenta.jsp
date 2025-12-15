<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Saldos por Cuenta</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Cuenta</td>
            <td>
              <input type="text" name="salNumCtam" id="salNumCtam" size="5"/>
            </td>
            <td>
              <input type="text" name="salNumScta" id="salNumScta" size="5"/>
            </td>
            <td>
              <input type="text" name="salNumSscta" id="salNumSscta" size="5"/>
            </td>
            <td>
              <input type="text" name="salNumSsscta" id="salNumSsscta" size="5"/>
            </td>
            <td>
              <input type="text" name="salNumSssscta" id="salNumSssscta" size="5"/>
            </td>
            <td>
              <input type="text" name="salNumSsssscta" id="salNumSsssscta" size="5"/>
            </td>
            <td colspan="2">
              <label id="salNomCta" class="textoNegrita"></label>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;Tercer Auxiliar</td>
            <td>
              <input type="text" name="salNumAux3" id="salNumAux3" size="5"/>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="8">
              <input type="HIDDEN" name="paramsalNumCtam" id="paramsalNumCtam" size="5"/>
              <input type="HIDDEN" name="paramsalNumScta" id="paramsalNumScta" size="5"/>
              <input type="HIDDEN" name="paramsalNumSscta" id="paramsalNumSscta" size="5"/>
              <input type="HIDDEN" name="paramsalNumSsscta" id="paramsalNumSsscta" size="5"/>
              <input type="HIDDEN" name="paramsalNumSssscta" id="paramsalNumSssscta" size="5"/>
              <input type="HIDDEN" name="paramsalNumSsssscta" id="paramsalNumSsssscta" size="5"/>
              <input type="HIDDEN" name="paramsalNumAux1" id="paramsalNumAux1" size="5"/>
              <input type="HIDDEN" name="paramsalNumAux2" id="paramsalNumAux2" size="5"/>
              <input type="HIDDEN" name="paramsalNumAux3" id="paramsalNumAux3" size="5"/>
              <input type="HIDDEN" name="paramorder" id="paramorder" size="2" value="s"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Fideicomiso</td>
            <td colspan="2">
              <input type="text" name="salNumAux1" id="salNumAux1" size="10"/>
            </td>
            <td colspan="6"><label id="salNomContrato" class="textoNegrita"></label></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="9">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Per&iacute;odo</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Ejercicio</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2">Saldo Inicial</td>
            <td>&nbsp;</td>
            <td colspan="2">
              <input type="text" name="salSaldoIniPer" id="salSaldoIniPer" size="15"/>
            </td>
            <td>&nbsp;</td>
            <td colspan="2">Saldo Inicial</td>
            <td>
              <input type="text" name="salImpIniEje" id="salImpIniEje" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>
              <input type="text" name="salMovtosCarPer" id="salMovtosCarPer" size="5"/>
            </td>
            <td colspan="2" align="center">Cargos Por</td>
            <td colspan="2">
              <input type="text" name="salCargosPer" id="salCargosPer" size="15"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <input type="text" name="salMovtosCarEje" id="salMovtosCarEje" size="5"/>
            </td>
            <td width="20%" align="center">&nbsp;Cargos Acumulados Por</td>
            <td>
              <input type="text" name="salImpCarEjer" id="salImpCarEjer" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>
              <input type="text" name="salMovtosAboPer" id="salMovtosAboPer" size="5"/>
            </td>
            <td colspan="2" align="center">Abonos Por</td>
            <td colspan="2">
              <input type="text" name="salAbonosPer" id="salAbonosPer" size="15"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <input type="text" name="salMovtosAboEje" id="salMovtosAboEje" size="5"/>
            </td>
            <td width="20%" align="center">&nbsp;Abonos Acumulados Por</td>
            <td>
              <input type="text" name="salImpAboEjer" id="salImpAboEjer" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2">Saldo Actual</td>
            <td>&nbsp;</td>
            <td colspan="2">
              <input type="text" name="salImpSaldoAct" id="salImpSaldoAct" size="15"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="11" align="center" valign="middle">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="11" align="center">
              <input type="button" value="Regresar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaPrincipalConsultaSaldosCuenta();"/>
            </td>
          </tr>
          <tr>
            <td colspan="11" align="center" valign="middle" class="subtitulo">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="11" align="center" valign="middle" class="subtitulo">Movimientos del Mes</td>
          </tr>
          <tr>
            <td colspan="11" align="center">
              <table align="center" width="100%" class="texto" cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td nowrap width="70">Status</td>
                  <td nowrap width="70">Folio</td>
                  <td nowrap width="40">D&iacute;a</td>
                  <td nowrap width="70">Operaci&oacute;n</td>
                  <td nowrap width="70">Tran.</td>
                  <td nowrap width="70">Sec.</td>
                  <td nowrap width="70">Cta</td>
                  <td nowrap width="60">Scta</td>
                  <td nowrap width="60">Sscta</td>
                  <td nowrap width="60">Ssscta</td>
                  <td nowrap width="60">Sssscta</td>
                  <td nowrap width="60">Ssssscta</td>
                  <td nowrap width="50">Aux1</td>
                  <td nowrap width="50">Aux2</td>
                  <td nowrap width="50">Aux3</td>
                  <td nowrap width="50">C/A</td>
                  <td nowrap width="100">Importe</td>
                  <td nowrap width="100">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriMovSalFid" dataInfo="arrTblMovSalFidDat" keys="asiFolioOpera" fun="" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
