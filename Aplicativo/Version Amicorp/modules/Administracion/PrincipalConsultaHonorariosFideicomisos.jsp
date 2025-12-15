<FORM name="frmDatosConsultaHonorarios" id="frmDatosConsultaHonorarios" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Consulta Honorarios Fideicomisos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">N&uacute;m. Fideicomiso</td>
              <td width="33%" colspan="2">
                <input type="text" name="pacNumContrato" id="pacNumContrato" tipo="Num" size="15" maxlength="10"/>
                <input type="text" name="paramNumContrato" id="paramNumContrato" tipo="Num" size="15" maxlength="10"/>
              </td>
              <td width="11%">Cto. Eje</td>
              <td width="3%">
                <input type="text" name="txtCtoEje" size="10"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Nombre</td>
              <td colspan="5" width="11%">
                <input type="text" name="txtNombre" size="75%"/>
              </td>
            </tr>
            <tr>
              <td width="25%">Tipo de Persona</td>
              <td width="33%" colspan="2">
                <input type="text" name="txtTipoPersona" size="10"/>
              </td>
              <td width="11%">No. Cliente</td>
              <td width="3%">
                <input type="text" name="txtNoCliente" size="10"/>
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
                <input type="radio" name="rdpacCveImpFijo" value="1"/>Importe Fijo
              </td>
              <td align="left" valign="middle" width="20%">
                <input type="radio" name="rdFormaCalculo" value="1"/>% Pactado
              </td>
              <td align="left" valign="middle" colspan="2" width="20%">
                <input type="radio" name="rdFormaCalculo" value="1"/>Tabla&nbsp; de C&aacute;lculo
              </td>
              <td align="left" width="20%" valign="middle">
                <input type="radio" name="rdFormaCalculo" value="1"/>% Al Millar
              </td>
              <td align="left" width="20%" valign="middle">
                <input type="radio" name="rdFormaCalculo" value="1"/>Exento
              </td>
            </tr>
            <tr>
              <td align="left" width="20%">
                <input type="text" name="pacCveFormaCalc" id="pacCveFormaCalc" tipo="AlphaNumeric" size="10"/>
              </td>
              <td align="left" valign="middle" width="20%">
                <input type="checkbox" name="pacInpcChk" id="pacInpcChk" class="check" tv="1" fv="0"/>INPC
              </td>
              <td align="left" valign="middle" colspan="2" width="20%">&nbsp;</td>
              <td align="left" width="20%" valign="middle">&nbsp;</td>
              <td align="left" width="20%" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td align="left" width="20%">&nbsp;</td>
              <td align="left" valign="middle" width="20%">
                <input type="checkbox" name="chkSaldoPromedio"/>Saldo Promedio
              </td>
              <td align="left" valign="middle" colspan="2" width="20%">
                <input type="checkbox" name="chkValorFondo"/>Valor del Fondo &nbsp;
              </td>
              <td align="left" width="20%" valign="middle">
                <input type="text" name="txtOficioExtencion" size="10"/>
              </td>
              <td align="left" width="20%" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%"/>
              <td width="10%" colspan="2"/>
              <td width="20%"/>
              <td width="20%">&nbsp;</td>
              <td width="20%">&nbsp;</td>
            </tr>
            <tr>
              <td/>
              <td colspan="2">Importe M&iacute;nimo
                <input type="text" name="pacImpMinHono" id="pacImpMinHono" tipo="Num" size="10"/>
              </td>
              <td width="11%" colspan="3">Importe M&aacute;ximo &nbsp;
                <input type="text" name="pacImpMaximo" id="pacImpMaximo" tipo="Num" size="10"/>
              </td>
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
                <input type="checkbox" name="chkMesCompleto"/>Mes Completo
              </td>
              <td width="11%">&nbsp;</td>
              <td width="3%">&nbsp;</td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td>D&iacute;a de Corte</td>
              <td>
                <input type="text" name="pacDiaCalcClte" id="pacDiaCalcClte" tipo="Num" size="2" maxlength="2" required/>
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
                <input type="text" name="pacFecUltCalc" id="pacFecUltCalc" tipo="AlphaNumeric" size="10"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">A Quien se Cobra</td>
              <td>
                <select size="1" name="pacCvePersCob" id="pacCvePersCob" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="pacCveStPacahon" param="clavesCombo10"/>
              </td>
              <td>&nbsp;</td>
              <td>&Uacute;ltima Revisi&oacute;n</td>
              <td width="3%">
                <input type="text" name="txtUltimaRevision" id="txtUltimaRevision" tipo="AlphaNumeric" size="10"/>
                <input type="hidden" name="pacDiaUltRevis" id="pacDiaUltRevis" tipo="AlphaNumeric" size="5"/>
                <input type="hidden" name="pacMesUltRevis" id="pacMesUltRevis" tipo="AlphaNumeric" size="5"/>
                <input type="hidden" name="pacAnoUltRevis" id="pacAnoUltRevis" tipo="AlphaNumeric" size="5"/>
              </td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">Fecha Prox. Calc.</td>
              <td width="33%" colspan="3">
                <input type="text" name="txtFechaProxCalc" id="txtFechaProxCalc" tipo="AlphaNumeric" size="10"/>
                <input type="hidden" name="pacDiaCalcHono" id="pacDiaCalcHono" tipo="AlphaNumeric" size="5"/>
                <input type="hidden" name="pacMesCalcHono" id="pacMesCalcHono" tipo="AlphaNumeric" size="5"/>
                <input type="hidden" name="pacAnoCalcHono" id="pacAnoCalcHono" tipo="AlphaNumeric" size="5"/>
              </td>
              <td width="3%">&nbsp;</td>
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
                <textarea name="txtComentario" cols="0"></textarea>
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
          <input type="BUTTON" value="Regresar" name="cmdCancelar" class="boton" onclick="cargaMantenimientoFideicomisos2Tab();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
