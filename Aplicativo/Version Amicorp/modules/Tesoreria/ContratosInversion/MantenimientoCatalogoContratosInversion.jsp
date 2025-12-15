<form name="frmMantenimientoContratosInversion" id="frmMantenimientoContratosInversion">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto; ">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Contratos de Inversi&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="20%">No. Fideicomiso</td>
            <td>
              <input type="text" name="cprNumContrato" id="cprNumContrato" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" onchange="CargaComboCuentas();"/>
            </td>
            <td>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>&nbsp;</td>
          </tr>

          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="20%">No. Sub Cuenta</td>
            <td>
              <select size="1" name="cprSubContrato" id="cprSubContrato" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" param="Fideicomiso" theValue="fsctNombreSubCuenta" next="cprEntidadFin"/>            
            </td>
            <td>
            &nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>

          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Intermediario</td>
            <td colspan="2">
              <select size="1" name="cprEntidadFin" id="cprEntidadFin" ref="conNumIntNomInt" fun="loadComboElement" keyValue="intEntidadFin" theValue="intIntermediario" next="cprCveFormaMan" required message="El Intermediario es un campo obligatorio" onchange="cprNomIntermed.value = this.options[this.selectedIndex].text;"/>
            </td>
            <td width="37%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="20%">Contrato de Inversi&oacute;n</td>
            <td>
              <input type="text" name="cprContratoInter" id="cprContratoInter" size="10" maxlength="10" tipo="Num" required message="El Contrato de Inversión es un campo obligatorio"/>
            </td>
            <td width="37%">&nbsp;</td>
            <td width="37%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;
            </td>
            <td colspan="3">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Forma Manejo</td>
            <td>
              <select size="1" name="cprCveFormaMan" id="cprCveFormaMan" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbFormaManejoParam" next="cprCveOrigRec"/>
            </td>
            <td>
              <input type="text" name="cprNomIntermed" id="cprNomIntermed" size="5" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Origen de Recursos</td>
            <td>
              <select size="1" name="cprCveOrigRec" id="cprCveOrigRec" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbOrigenRecursosParam" next="cprNumPais"/>
            </td>
            <td>
              <input type="checkbox" name="cprCveIsrExenChk" id="cprCveIsrExenChk" tv="1" fv="0" class="check"/>&nbsp;No Retener ISR
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Moneda</td>
            <td width="11%">
              <select name="cprNumPais" id="cprNumPais" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="cprNumCuenta" required message="La Moneda es un campo obligatorio"/>
            </td>
            <td width="37%">
              <input type="text" name="cprNumBanco" id="cprNumBanco" style="visibility:hidden;"/>
              <input type="text" name="cprNumSucursal" id="cprNumSucursal" style="visibility:hidden;"/>
            </td>
            <td width="37%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Cuenta Bancaria</td>
            <td width="11%">
              <select name="cprNumCuenta" id="cprNumCuenta" ref="muestraCuentaBancaria" fun="loadComboElement" keyValue="fcbaClabeCba" theValue="fcbaClabeCba"  param="fideo" next="cprCveStContint" required onchange="muestraClave();" message="La Cuenta Bancaria es un campo obligatorio"/>
            </td>
            <td width="37%">&nbsp;</td>
            <td width="37%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%">Status</td>
            <td width="11%">
              <select id="cprCveStContint" name="cprCveStContint" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="37%">
            </td>
            <td width="37%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionContratosInversion();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Tesoreria.ContratosInversion.PrincipalCatalogoContratosInversion','');" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
