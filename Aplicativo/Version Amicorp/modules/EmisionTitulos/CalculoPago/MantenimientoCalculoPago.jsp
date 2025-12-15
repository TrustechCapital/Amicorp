<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">C&aacute;lculo de Pago</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Id RC</td>
            <td width="1%" valign="middle" colspan="5">
               <input type="text" name="idRC" id="idRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaEmisor(this,GI('ecedIdPrograma'),GI('ecedIdFideicomiso'),GI('ecedIdEmision'))"/>
            </td>
            <td width="15%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Programa</td>
            <td width="1%" valign="middle" colspan="5">
              <select size="1" disabled name="ecedIdPrograma" id="ecedIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="ecedIdFideicomiso" param="cmbPrograma"  required message="El Programa es un campo obligatorio"/>
            </td>
            <td width="15%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Fideicomiso</td>
            <td width="1%" valign="middle" colspan="5">
              <select size="1" disabled name="ecedIdFideicomiso" id="ecedIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" param="cmbFideicomiso" next="ecedIdEmision">
                <option value="0">-- Seleccione --</option>
              </select>
            </td>
            <td width="15%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Emisi&oacute;n</td>
            <td valign="middle" height="6" width="1%" colspan="5">
              <select size="1" name="ecedIdEmision" id="ecedIdEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" param="cmbEmision" next="asignaValues2ObjHTMLCalculoPago" onchange="asignaSecuencialCalculoPago();" >
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Cup&oacute;n</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedIdPeriodo" id="ecedIdPeriodo" tipo="Num" size="10" maxlength="10" class="inputLocked" disabled/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">&nbsp;
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
           <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Fideicomitente</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedFideicomitente" id="ecedFideicomitente" size="10" maxlength="250" class="inputLocked" disabled/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">&nbsp;
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap class="subtitulo" colspan="6">&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap class="subtitulo" colspan="6">C&aacute;lculo de Pago</td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="1%">&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Fecha Emisión</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedFecEmision" id="ecedFecEmision" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Emisión es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">
              &nbsp;
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Fecha Inicio Periodo</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedFecInicioPer" id="ecedFecInicioPer" tipo="Fecha" size="10" maxlength="10" required message="La Fecha Inicio Periodo es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Fecha Fin Periodo</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">
              <input type="text" name="ecedFecFinPer" id="ecedFecFinPer" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Fin Periodo es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Fecha de Pago</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedFecPagoPer" id="ecedFecPagoPer" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Pago es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Fecha de Determinación</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">
              <input type="text" name="ecedFecDetermina" id="ecedFecDetermina" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Determinación es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Plazo</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedPlazo" id="ecedPlazo" tipo="Num" size="10" maxlength="10" required message="El Plazo es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Tipo Moneda</td>
            <td valign="middle" height="6" nowrap>
              <input type="radio" name="rdTipoMoneda" id="ecedTipoMoneda" value2="99" class="radio" onclick="asignaValueRadio2Master('ecedTipoMoneda',this);" message="El Tipo de Moneda es un campo obligatorio"/>UDIS
            </td>
            <td valign="middle" height="6" nowrap>
              <input type="radio" name="rdTipoMoneda" id="rdMXN" value="1" class="radio" onclick="asignaValueRadio2Master('ecedTipoMoneda',this);"/>MXN
            </td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Valor Moneda</td>
            <td valign="middle" height="6" width="1%" colspan="2">
              <input type="text" name="ecedValorMoneda" id="ecedValorMoneda" tipo="Money" size="10" maxlength="19" reqPrecValue prec="16.2"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>Factor Prorrata</td>
            <td valign="middle" height="6" width="15%" nowrap>
              <input type="text" name="ecedFacProrrata" id="ecedFacProrrata" tipo="Money" size="10" maxlength="19" reqPrecValue prec="16.2"/>
            </td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>Importe Intereses</td>
            <td valign="middle" height="6" width="1%" colspan="2">
              <input type="text" name="ecedImpIntereses" id="ecedImpIntereses" tipo="Money" size="10" maxlength="19" reqPrecValue prec="16.2"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>Importe Amortización</td>
            <td valign="middle" height="6" width="15%" nowrap>
              <input type="text" name="ecedImpAmortizacion" id="ecedImpAmortizacion" tipo="Money" size="10" maxlength="19" reqPrecValue prec="16.2"/>
            </td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="12%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="1%">
              <input type="text" name="ecedStCedevpag" id="ecedStCedevpag" size="10" maxlength="10" value="ACTIVO" style="visibility:hidden"/>
            </td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%" nowrap colspan="2">&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionCalculoPago();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.ReporteDistribucion.PrincipalReporteDistribucion','')" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
