<form name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Saldos&nbsp;Historicos por Fideicomiso</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="25%" nowrap>&nbsp;</td>
            <td nowrap colspan="2">Fideicomiso</td>
            <td nowrap colspan="2">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="10%" nowrap colspan="5">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam"></div>
            </td>
            <td width="20%" nowrap>&nbsp;</td>
          </tr>
          
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td width="5%">Cuenta</td>
            <td width="5%">Scta</td>
            <td width="5%">Sscta</td>
            <td width="5%">Ssscta</td>
            <td width="5%">Sssscta</td>
            <td width="5%">Ssssscta</td>
            <td width="5%">Aux1</td>
            <td width="5%">Aux2</td>
            <td width="5%">Aux3</td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
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
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td width="5%">Año</td>
            <td width="5%">Mes</td>            
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;</td>           
            <td width="5%">
              <input type="text" name="paramAnoMovto" id="paramAnoMovto" size="4" maxlength="4" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>"  message="El Año es un campo obligatorio"/>
            </td>
            <td width="5%">
              <input type="text" name="paramMesMovto" id="paramMesMovto" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>"/>
            </td>
            <td nowrap></td>
            
          </tr>
          <tr>
            <td colspan="11" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="11">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriSalFidH" fun="loadTableElement" tabla="tblRegPriSalFid" onclick="if(fvCat.checkForm())consultarSaveParameters(this, frmDatos, true);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="11" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="11">
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaPrincipalConsultarConsultaSaldosFideicomiso(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="11" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="11" align=center>
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="37" nowrap>Cta</td>
                  <td width="37" nowrap>Scta</td>
                  <td width="42" nowrap>Sscta</td>
                  <td width="47" nowrap>Ssscta</td>
                  <td width="52" nowrap>Sssscta</td>
                  <td width="60" nowrap>Ssssscta</td>
                  <td width="260" nowrap>Nombre Cuenta</td>
                  <td width="40" nowrap>Aux1</td>
                  <td width="40" nowrap>Aux2</td>
                  <td width="100" nowrap>Aux3</td>
                  <td width="100" nowrap>Saldo Ant.</td>
                  <td width="100" nowrap>Cargos</td>
                  <td width="100" nowrap>Abonos</td>
                  <td width="100" nowrap>Saldo Actual</td>
                </tr>
              </table>
              <div style="height:255px; width:1138; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" id="tblRegPriSalFid" dataInfo="arrTblSalFidDat" keys="salNumCtam,salNumScta,salNumSscta,salNumSsscta,salNumSssscta,salNumSsssscta,salNumAux1,salNumAux2,salNumAux3" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
