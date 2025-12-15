<FORM name="frmParametrosHonorariosMantenimiento" id="frmParametrosHonorariosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Par&aacute;metros de Honorarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">No. Fideicomiso</td>
              <td width="33%" colspan="2">
                <input type="text" name="pacNumContrato" id="pacNumContrato" tipo="Num" size="10" onblur="mostrarDatosInformativos(2);" required message="El No. Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="11%">Cto. Eje</td>
              <td width="3%">
                <input type="text" name="txtCtoEje" id="txtCtoEje" tipo="Num" size="10"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Nombre</td>
              <td colspan="5" width="11%">
                <input type="text" name="txtNomFiso" id="txtNomFiso" tipo="AlphaNumeric" size="50"/>
              </td>
            </tr>
            <tr>
              <td width="25%">Tipo de Persona</td>
              <td width="33%" colspan="2">
                <input type="text" name="txtTipoPersona" id="txtTipoPersona" tipo="AlphaNumeric" size="10"/>
              </td>
              <td width="11%">No. Cliente</td>
              <td width="3%">
                <input type="text" name="txtNoCliente" id="txtNoCliente" tipo="Num" size="10"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="11%" colspan="6">
                <hr/>
              </td>
            </tr>
            <tr valign="middle">
              <td class="subtitulo" width="25%">Forma de C&aacute;lculo</td>
              <td class="subtitulo" width="33%" colspan="2">&nbsp;</td>
              <td class="subtitulo" width="11%">&nbsp;</td>
              <td class="subtitulo" width="3%">&nbsp;</td>
              <td class="subtitulo" width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%" colspan="3">&nbsp;</td>
              <td width="11%">&nbsp;</td>
              <td width="3%">&nbsp;</td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td align="left" width="20%">
                <input type="radio" name="rdFormaCalc" id="rdImpFijo" class="radio" onclick="opcionesRadios(this);" required message="La Forma de Cálculo es un campo obligatorio"/>Importe Fijo
              </td>
              <td align="left" valign="middle" width="20%">
                <input type="radio" name="rdFormaCalc" id="rdPorcPactado" class="radio" onclick="opcionesRadios(this);"/>% Pactado
              </td>
              <td align="left" valign="middle" colspan="2" width="20%">
                <input type="radio" name="rdFormaCalc" id="rdTblCalc" class="radio" onclick="opcionesRadios(this);"/>Tabla&nbsp; de C&aacute;lculo
              </td>
              <td align="left" width="20%" valign="middle">
                <input type="radio" name="rdFormaCalc" id="rdPorcMillar" class="radio" onclick="opcionesRadios(this);"/>% Al Millar
              </td>
              <td align="left" width="20%" valign="middle">
                <input type="radio" name="rdFormaCalc" id="rdExento" class="radio" onclick="opcionesRadios(this);"/>Sin Cobro</td>
            </tr>
            <tr>
              <td align="left" width="20%">
                <input type="text" name="pacImpFijoHono" id="pacImpFijoHono" tipo="Money" size="17" maxlength="17" prec="14.2" reqPrecValue message="El Importe Fijo es un campo obligatorio" style="visibility:hidden"/>
              </td>
              <td align="left" valign="middle" width="20%">
              </td>
              <td align="left" valign="middle">
                <div id="dvSaldo" style="visibility:hidden">
                  <input type="radio" name="rdTabla" id="rdTblSaldo" class="radio" onclick="opcionesRadios(this);" message="La Tabla es un campo obligatorio"/>Tabla&nbsp; Saldo
                </div>
              </td>
              <td align="left" valign="middle">
                <div id="dvValor" style="visibility:hidden">
                  <input type="radio" name="rdTabla" id="rdTblValor" class="radio" onclick="opcionesRadios(this);"/>Tabla&nbsp; Valor
                </div>
              </td>
              <td align="left" width="20%" valign="middle">&nbsp;</td>
              <td align="left" width="20%" valign="middle">
                <input type="text" name="pacCveFormaCalc" id="pacCveFormaCalc" size="10" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="20%">
                <div id="dvINPC" style="visibility:hidden">
                  <input type="checkbox" name="pacInpcChk" id="pacInpcChk" class="check" tv="1" fv="0"/>INPC
                </div>
              </td>
              <td width="10%" colspan="2" align="center">
                <div id="dvImpMin" style="visibility:hidden">
                  Importe M&iacute;nimo<input type="text" name="pacImpMinHono" id="pacImpMinHono" tipo="Money" size="17" maxlength="17" prec="14.2" reqPrecValue message="El Importe Mínimo es un campo obligatorio"/>
                </div>
              </td>
              <td width="20%" colspan="2">
                <div id="dvImpMax" style="visibility:hidden">
                  Importe M&aacute;ximo &nbsp;<input type="text" name="pacImpMaximo" id="pacImpMaximo" tipo="Money" size="17" maxlength="17" prec="14.2" reqPrecValue message="El Importe Máximo es un campo obligatorio"/>
                </div>
              </td>
              <td width="20%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="6">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="25%">
                <input type="checkbox" name="pacCveManMonExChk" id="pacCveManMonExChk" class="check" tv="1" fv="0"/>Moneda Extranjera
              </td>
              <td width="33%" colspan="2">
                <input type="checkbox" name="pacCveExtempChk" id="pacCveExtempChk" class="check" tv="1" fv="0"/>Mes Completo
              </td>
              <td width="11%">&nbsp;</td>
              <td width="3%">&nbsp;</td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td>D&iacute;a de Corte</td>
              <td>
                <input type="text" name="pacDiaCalcClte" id="pacDiaCalcClte" tipo="AlphaNumeric" size="2" maxlength="2" required message="El Día de Corte es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td>Periodicidad</td>
              <td>
                <select size="1" name="pacCvePeriodCob" id="pacCvePeriodCob" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="pacNumMoneda" param="clavesCombo9"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Moneda</td>
              <td>
                <select size="1" name="pacNumMoneda" id="pacNumMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="pacCvePersCob"/>
              </td>
              <td>&nbsp;</td>
              <td width="11%">&Uacute;ltimo C&aacute;lculo</td>
              <td width="3%">
                <input type="text" name="pacFecUltCalc" id="pacFecUltCalc" tipo="Fecha" size="10"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">A Quien se Cobra</td>
              <td>
                <select size="1" name="pacCvePersCob" id="pacCvePersCob" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="pacPeriodoActInpc" param="clavesCombo10"/>
              </td>
              <td>&nbsp;</td>
              <td>&Uacute;ltima Revisi&oacute;n</td>
              <td width="3%">
                <input type="text" name="txtFecUltRevision" id="txtFecUltRevision" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('pacDiaUltRevis'),GI('pacMesUltRevis'),GI('pacAnoUltRevis'));"/>
              </td>
              <td width="37%">
                <input name="pacDiaUltRevis" id="pacDiaUltRevis" tipo="Num" size="2" style="visibility:hidden"/>
                <input name="pacMesUltRevis" id="pacMesUltRevis" tipo="Num" size="2" style="visibility:hidden"/>
                <input name="pacAnoUltRevis" id="pacAnoUltRevis" tipo="Num" size="4" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="25%">Fecha Prox. Calc.</td>
              <td width="33%" colspan="3">
                <input type="text" name="txtFecProxCalc" id="txtFecProxCalc" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('pacDiaCalcHono'),GI('pacMesCalcHono'),GI('pacAnoCalcHono'));"/>
              </td>
              <td width="3%">
                <input name="pacDiaCalcHono" id="pacDiaCalcHono" tipo="Num" size="2" style="visibility:hidden"/>
                <input name="pacMesCalcHono" id="pacMesCalcHono" tipo="Num" size="2" style="visibility:hidden"/>
                <input name="pacAnoCalcHono" id="pacAnoCalcHono" tipo="Num" size="4" style="visibility:hidden"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Perìodo Act. INPC</td>
              <td>
                <select size="1" name="pacPeriodoActInpc" id="pacPeriodoActInpc" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="pacCveStPacahon" param="clavesCombo637"/>
              </td>
              <td>&nbsp;</td>
              <td width="11%"></td>
              <td width="3%">
              </td>
              <td width="37%">&nbsp;</td>
            </tr>            
            <tr>
              <td width="25%" colspan="6">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="25%">Comentario</td>
              <td width="33%" colspan="3">
                <textarea name="pacTexFundamento" id="pacTexFundamento" style="width:400px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
              </td>
              <td>&nbsp;</td>
              <td width="37%" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Status</td>
              <td width="33%" colspan="3">
                <select size="1" name="pacCveStPacahon" id="pacCveStPacahon" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31"/>
              </td>
              <td>&nbsp;</td>
              <td width="37%" align="left">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalParametrosHonorarios();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
