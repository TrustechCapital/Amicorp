<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Saldos SAT</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td nowrap width="35%">&nbsp;</td>
            <td nowrap width="8%">Fideicomiso</td>
            <td nowrap width="10%">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td nowrap width="25%"><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div></td>
            <td nowrap width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramAno" id="paramAno" size="4" ref="conFecCon" fun="asignaAnoMovimiento" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="5">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriSalSAT" fun="loadTableElement" tabla="tblRegPri" onclick="if(fvCat.checkForm())consultar(this, frmDatos, true);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.SaldosSAT.PrincipalSaldosSAT','');"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="40" nowrap>Cta</td>
                  <td width="40" nowrap>Scta</td>
                  <td width="45" nowrap>Sscta</td>
                  <td width="50" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="70" nowrap>Ssssscta</td>
                  <td width="300" nowrap>Nombre Cuenta</td>
                  <td width="70" nowrap>Aportaci&oacute;n</td>
                  <td width="70" nowrap>Ingreso</td>
                  <td width="70" nowrap>Cargo</td>
                  <td width="70" nowrap>Abono</td>
                  <td width="100" nowrap>Tipo Persona</td>
                </tr>
              </table>
              <div style="height:350px; overflow:auto; position:relative; vertical-align:top; width:1005px;">
                <table border="0" cellpadding="0" cellspacing="0" id="tblRegPri" dataInfo="arrTblRegDat" keys="csaNumCtam,csaNumScta,csaNumSscta,csaNumSsscta,csaNumSssscta,csaNumSsssscta,csaNumAux1,csaAportacion,csaIngreso,csaCargo,csaAbono" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td align="center" nowrap width="35%">&nbsp;</td>
            <td align="center" nowrap colspan="3" valign="middle">&nbsp;</td>
            <td align="center" nowrap width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" nowrap width="35%">&nbsp;</td>
            <td align="center" nowrap colspan="3" valign="middle">
              <div id="dvDatos" style="visibility:hidden">
                <input type="radio" class="radio" name="AI" id="Aportacion" message="Aportación o Ingreso es un campo obligatorio"/>&nbsp;Aportaci&oacute;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" class="radio" name="AI" id="Ingreso"/>&nbsp;Ingreso&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="check" id="Cargo"/>&nbsp;Cargo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" class="check" id="Abono"/>&nbsp;Abono&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              </div>
            <td align="center" nowrap width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Guardar" name="cmdGuardar" id="cmdGuardar" class="boton" style="visibility:hidden" onclick="ejecutaOperacionSaldosSAT();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" style="visibility:hidden" onclick="cancelarOperacionSaldosSAT();"/>
      </td>
    </tr>
  </table>
</form>
