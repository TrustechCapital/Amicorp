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
            <input type="text" name="movNomContrato" id="movNomContrato" size="80" ref="conNomFid" fun="loadTxtElementX" theValue="nombre" param="objNumFideicomisoParam" next="movNomOperacion"/></td>
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
              <input type="HIDDEN" name="paramFolio" id="paramFolio" size="10" maxlength="10"/>
              <input type="HIDDEN" name="paramorder2" id="paramorder2" size="2" value="s"/>
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;</td>
            <td width="10%" nowrap>&nbsp;
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
              <input type="text" name="movNomOperacion" id="movNomOperacion" size="80" ref="conNomOpe" fun="loadTxtElementX" theValue="nombre" param="objNumOperacionParam" next="formsLoaded"/>
            </td>
            <td colspan="4" width="10%" nowrap>&nbsp;Fecha Contable</td>
            <td width="10%" nowrap>
              <input type="text" name="movFechaContable" id="movFechaContable" size="10" maxlength="10"/></td>
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
            <td colspan="10" class="subtitulo" align="center">Asientos Contables</td>
          </tr>
          <tr align="center">
            <td colspan="10">
              <table cellpadding="0" cellspacing="0" border="0">
                <tr class="cabeceras">
                  <td width="40" nowrap class="cabeceras">Sec</td>
                  <td width="200" nowrap class="cabeceras">Nombre</td>
                  <td width="50" nowrap class="cabeceras">Cta</td>
                  <td width="40" nowrap class="cabeceras">Scta</td>
                  <td width="40" nowrap class="cabeceras">Sscta</td>
                  <td width="50" nowrap class="cabeceras">Ssscta</td>
                  <td width="65" nowrap class="cabeceras">Sssscta</td>
                  <td width="65" nowrap class="cabeceras">Ssssscta</td>
                  <td width="50" nowrap class="cabeceras">Aux1</td>
                  <td width="50" nowrap class="cabeceras">Aux2</td>
                  <td width="50" nowrap class="cabeceras">Aux3</td>
                  <td width="40" nowrap class="cabeceras">C/A</td>
                  <td width="120" nowrap class="cabeceras">Importe</td>
                  <td width="200" nowrap class="cabeceras">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriAsi" dataInfo="arrTblAsiDat" keys="" fun="" >
                </table>
              </div>
            </td>
          </tr>
          <tr>
              <td colspan=10>
                <table width="60%" align=center>
                  <tr>
                          <td  align="center" class="texto" ><b>Total Cargos:</b></td>
                          <td align="center" class="texto">
                            <input type="text" name="tCargos" id="tCargos" size="20" maxlength="20" value="0.0" tipo="Num"/>
                          </td>
                          <td  align="center" class="texto" ><b>Total Abonos:</b></td>
                          <td  align="center" class="texto" >
                            <input type="text" name="tAbonos" id="tAbonos" size="20" maxlength="20" value="0.0" tipo="Num"/>
                          </td>
                          <td  align="center" class="texto" ><b>Diferencia</b></td>
                          <td align="center" class="texto">
                            <input type="text" name="tDiferencia" id="tDiferencia" size="20" maxlength="20" value="0.0" tipo="Num"/>
                          </td>
                  </tr>
                </table>
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
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="contabilizaOperacion();"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalOperativasPolizas();"/>
      </td>
    </tr>
  </table>
</form>
