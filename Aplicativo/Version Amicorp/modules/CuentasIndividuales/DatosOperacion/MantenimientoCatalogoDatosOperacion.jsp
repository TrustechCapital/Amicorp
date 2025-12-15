<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Datos de Operaci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="datEntClave" id="datEntClave" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="formsLoaded">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Fecha</td>
            <td>
              <input type="text" name="datFecha" id="datFecha" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="datCveStDatoscalc" required message="La Fecha es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Tasa</td>
            <td>
              <input type="text" name="datTasa" id="datTasa" size="12" maxlength="12" prec="3.8" reqPrecValue required message="La Tasa es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>
              <input type="checkbox" name="datCveRetIsrChk" id="datCveRetIsrChk" tv="1" fv="0" class="check"/>&nbsp;Retencion ISR
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Tasa ISR</td>
            <td>
              <input type="text" name="datTasaIsr" id="datTasaIsr" size="17" maxlength="17" tipo="Money" prec="14.2" reqPrecValue required message="La Tasa ISR es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Status</td>
            <td>
              <select id="datCveStDatoscalc" name="datCveStDatoscalc" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td>
            <input type="text" name="datCveTipoMerca" id="datCveTipoMerca" style="visibility:hidden" value="3" size="10" maxlength="10" tipo="Num" fun="loadTxtElementX"/>
            </td>
            <td>
            <input type="text" name="datNumInstrume" id="datNumInstrume" style="visibility:hidden" value="2" size="10" maxlength="10" tipo="Num" fun="loadTxtElementX"/>
            </td>
            <td>
            </td>
          </tr>
          <tr>
            <td>
              <input type="text" name="datDiaAltaReg" id="datDiaAltaReg" style="visibility:hidden" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[0]%>"/>
            </td>
            <td>
              <input type="text" name="datMesAltaReg" id="datMesAltaReg" style="visibility:hidden" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>"/>
            </td>
            <td>
              <input type="text" name="datAnoAltaReg" id="datAnoAltaReg" style="visibility:hidden" size="4" maxlength="4" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>" required message="El Año es un campo obligatorio"/>
            </td>          
          </tr>
          <tr>
            <td>
              <input type="text" name="datDiaUltMod" id="datDiaUltMod" style="visibility:hidden" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[0]%>"/>
            </td>
            <td>
              <input type="text" name="datMesUltMod" id="datMesUltMod" style="visibility:hidden" size="2" maxlength="2" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>"/>
            </td>
            <td>
              <input type="text" name="datAnoUltMod" id="datAnoUltMod" style="visibility:hidden" size="4" maxlength="4" tipo="Num" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>" required message="El Año es un campo obligatorio"/>
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
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionDatosOperacion();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('CuentasIndividuales.DatosOperacion.PrincipalCatalogoDatosOperacion','');"/>
      </td>
    </tr>
  </table>
</form>
