<FORM name="frmPagoHonorarios2" id="frmPagoHonorarios2" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="6" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Cobro de Honorarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="30%">Fecha Cobro</td>
              <td width="25%" colspan="2">
                <input type="text" name="txtFechaPago" id="txtFechaPago" tipo="AlphaNumeric" size="15" onblur="validaFechaCorrectaYFideicomiso();"/>
                <input type="text" name="fcoDiaDia" id="fcoDiaDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="fcoMesDia" id="fcoMesDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="fcoAnoDia" id="fcoAnoDia" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="txtMesAbierto" id="txtMesAbierto" tipo="AlphaNumeric" size="2" style="visibility:hidden"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">Fideicomiso</td>
              <td colspan="2">
                <input type="text" name="decNumContrato" id="decNumContrato" tipo="Num" size="10"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">Importe Cobro</td>
              <td colspan="2">
                <input type="text" name="txtImpPago" id="txtImpPago" tipo="Money" size="20" onblur="validaNoSeaMayor();"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">Forma Cobro</td>
              <td colspan="2">
                <select size="1" name="cmbFormaPago" id="cmbFormaPago" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbBanco" param="clavesCombo6" onchange="muestraElementosAcordes();"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
              <td colspan="2">
                <input type="text" name="decFecCalcHono" id="decFecCalcHono" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decCveTipoHono" id="decCveTipoHono" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decImpRemHonor" id="decImpRemHonor" tipo="Num" size="5" style="visibility:hidden"/>
                <input type="text" name="decCvePersFid" id="decCvePersFid" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decNumPersFid" id="decNumPersFid" tipo="Num" size="5" style="visibility:hidden"/>
                <input type="text" name="decDiaPerDel" id="decDiaPerDel" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decMesPerDel" id="decMesPerDel" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decAnoPerDel" id="decAnoPerDel" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decDiaPerAl" id="decDiaPerAl" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decMesPerAl" id="decMesPerAl" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decAnoPerAl" id="decAnoPerAl" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="decNumSecuencial" id="decNumSecuencial" tipo="Num" size="5" style="visibility:hidden"/>
                <input type="text" name="txtFechaDel" id="txtFechaDel" tipo="AlphaNumeric" size="12" style="visibility:hidden"/>
                <input type="text" name="txtFechaAl" id="txtFechaAl" tipo="AlphaNumeric" size="12" style="visibility:hidden"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%" colspan="5">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
              <td colspan="2">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                <div id="Banco">Banco</div>
              </td>
              <td>
                <select size="1" name="cmbBanco" id="cmbBanco" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="cmbCuentaNafin" param="clavesCombo27"/>
              </td>
              <td>
                <div id="Referencia">Referencia
                <input type="text" name="txtReferencia" id="txtReferencia" tipo="Num" size="10"/></div>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                <div id="CuentaNafin">Cuenta Nafin</div>
              </td>
              <td colspan="2">
                <select size="1" name="cmbCuentaNafin" id="cmbCuentaNafin" ref="muestraCuenta" fun="loadComboElement" keyValue="cveLimsupClave" theValue="cveLimsupClave" next="cmbCuentaNafinBancomer" param="claveLiminf164"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                <div id="CuentaNafinBancomer">Cuenta Nafin Bancomer</div>
              </td>
              <td colspan="2">
                <select size="1" name="cmbCuentaNafinBancomer" id="cmbCuentaNafinBancomer" ref="muestraCuenta" fun="loadComboElement" keyValue="cveLimsupClave" theValue="cveLimsupClave" next="cmbContratoInversion" param="claveLiminf12"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                <div id="ContratoDeInversion">Contrato de Inversion</div>
              </td>
              <td colspan="2">
                <select size="1" name="cmbContratoInversion" id="cmbContratoInversion" ref="muestraContratoInversion" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprContratoInter" next="cmbMoneda" param="interNumContrato"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                <div id="ContratoDeInversion">Moneda en la que se Paga</div>
              </td>
              <td colspan="2">
                <select size="1" name="cmbMoneda" id="cmbMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="loadCatalogo"/>
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="30%">
                
              </td>
              <td colspan="2">&nbsp;
              </td>
              <td width="30%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="aplicaFuncion();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalPagoHonorarios();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
