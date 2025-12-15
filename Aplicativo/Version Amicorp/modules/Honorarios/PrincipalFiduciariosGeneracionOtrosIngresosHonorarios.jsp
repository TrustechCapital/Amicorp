<FORM name="frmPrincipalFiduciariosGeneracionOtrosIngresos" id="frmPrincipalFiduciariosGeneracionOtrosIngresos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Incorporaci&oacute;n de Provisiones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="20%">&nbsp;</td>
              <td nowrap width="10%">Fecha Valor</td>
              <td colspan="8">
                <input type="text" name="txtFechaValor" id="txtFechaValor" tipo="Fecha" size="10" required message="La Fecha Valor es un campo obligatorio" onblur="validaFechaCorrecta();"/>
                <input type="text" name="fcoDiaDia" id="fcoDiaDia" size="2" style="visibility:hidden"/>
                <input type="text" name="fcoMesDia" id="fcoMesDia" size="2" style="visibility:hidden"/>
                <input type="text" name="fcoAnoDia" id="fcoAnoDia" size="4" style="visibility:hidden"/>
                <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="2" style="visibility:hidden"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td nowrap width="10%">No. Fideicomiso</td>
              <td width="10%" colspan="4">
                <input type="text" name="txtNumFiso" id="txtNumFiso" tipo="Num" size="10" required message="El No. Fideicomiso es un campo obigatorio" onblur="onBlurNumFiso(this);"/>
              </td>
              <td colspan="5" width="20%">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td nowrap width="10%">Tipo de Servicio</td>
              <td colspan="8">
                <select size="1" name="txtTipoServicio" id="txtTipoServicio" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbMoneda" param="clavesCombo93" required message="El Tipo de Servicio es un campo obligatorio" onchange="muestraPagaOPeriodo();"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td nowrap width="10%">Importe</td>
              <td>
                <input type="text" name="txtCantidad" id="txtCantidad" tipo="Money" size="15" required message="El Importe es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td colspan="5">&nbsp;</td>
              <td>&nbsp;
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="40%" colspan="9">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="10%" class="subtitulo">
                <div id="Paga">Paga</div>
              </td>
              <td colspan="5" class="subtitulo">
                <div id="Periodo">Periodo</div>
              </td>
              <td width="40%" colspan="3">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="10%">
                <div id="Fideicomisario">
                  <input type="radio" name="rdPaga" id="rdFideicomisario" class="radio" onclick="cargaCombo2();"/>&nbsp;Fideicomisario
                </div>
              </td>
              <td colspan="5">
                <div id="Del">&nbsp;Del &nbsp;
                  <input type="text" name="txtDel" id="txtDel" tipo="Fecha" size="10" message="El Periodo Del es un campo obligatorio"/>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div id="Al">&nbsp;Al &nbsp;&nbsp;&nbsp;
                  <input type="text" name="txtAl" id="txtAl" tipo="Fecha" size="10" message="El Periodo Al es un campo obligatorio"/>
                </div>
              </td>
              <td width="40%" colspan="3">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="10%">
                <div id="Tercero">
                  <input type="radio" name="rdPaga" id="rdTercero" class="radio" onclick="cargaCombo2();"/>&nbsp;Tercero
                </div>
              </td>
              <td colspan="5">
                <select size="1" name="cmbPaga" id="cmbPaga" fun="loadComboElement" keyValue="valor" theValue="descripcion" next="formsLoaded" param="parametroComboPaga" message="El Fideicomisario o Tercero es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="40%" colspan="3">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td>
                <div id="Fideicomitente">
                  <input type="radio" name="rdPaga" id="rdFideicomitente" class="radio" onclick="cargaCombo2();"/>Fideicomitente
                </div>
              </td>
              <td colspan="5">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td width="40%" colspan="9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="txtTipoPersona" id="txtTipoPersona" tipo="AlphaNumeric" size="10" style="visibility:hidden"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="20%">&nbsp;</td>
              <td nowrap width="10%">Moneda en la que se Provisiona</td>
              <td>
                <select size="1" name="cmbMoneda" id="cmbMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="formsLoaded"/>
              </td>
              <td>&nbsp;</td>
              <td colspan="5">&nbsp;</td>
              <td>&nbsp;
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value=" Aceptar " name="cmdAceptar" class="boton" onclick="llamarFuncion();"/>
          <input type="BUTTON" value=" Limpiar " name="cmdLimpiar" class="boton" onclick="cargaPrincipalFiduciariosGeneracionOtrosIngresosHonorarios();"/>
          <input type="BUTTON" value=" Cancelar " name="cmdcalCosto" class="boton_x"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
