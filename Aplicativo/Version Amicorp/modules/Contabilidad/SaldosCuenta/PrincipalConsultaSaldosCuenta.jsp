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
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="5%">Cuenta</td>
            <td width="5%">Scta</td>
            <td width="5%">Sscta</td>
            <td width="5%">Ssscta</td>
            <td width="5%">Sssscta</td>
            <td width="5%">Ssssscta</td>
            <td width="5%">Aux1</td>
            <td width="5%">Aux2</td>
            <td width="5%">Aux3</td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="5%">
              <input type="text" name="paramNumCtam" id="paramNumCtam" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumScta" id="paramNumScta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumSscta" id="paramNumSscta" size="4" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumSsscta" id="paramNumSsscta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumSssscta" id="paramNumSssscta" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumSsssscta" id="paramNumSsssscta" size="4" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumAux1" id="paramNumAux1" size="18" maxlength="8" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumAux2" id="paramNumAux2" size="18" maxlength="8" tipo="Num"/>
            </td>
            <td width="5%">
              <input type="text" name="paramNumAux3" id="paramNumAux3" size="18" maxlength="12" tipo="Num"/>
            </td>
            <td width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="11" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="11" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriSalFid" fun="loadTableElement" tabla="tblRegPriSalFid" onclick="if(fvCat.checkForm())consultarSaveParameters(this, frmDatos, true);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="11">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="11">
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaPrincipalConsultarConsultaSaldosCuenta(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="11">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="11">
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
                  <td width="40" nowrap>Aux1</td>
                  <td width="40" nowrap>Aux2</td>
                  <td width="40" nowrap>Aux3</td>
                  <td width="100" nowrap>Saldo Ant.</td>
                  <td width="100" nowrap>Cargos</td>
                  <td width="100" nowrap>Abonos</td>
                  <td width="100" nowrap>Saldo Actual</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriSalFid" dataInfo="arrTblSalFidDat" keys="salNumCtam,salNumScta,salNumSscta,salNumSsscta,salNumSssscta,salNumSsssscta,salNumAux1,salNumAux2,salNumAux3" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
