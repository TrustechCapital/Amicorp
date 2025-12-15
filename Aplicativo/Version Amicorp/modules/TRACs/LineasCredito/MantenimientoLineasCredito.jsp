<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Líneas de Crédito</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap>&nbsp;
                            </td>
                            <td nowrap>&nbsp;</td>
                            <td nowrap colspan="4">
                              &nbsp;&nbsp;
                            </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Fideicomiso</td>
              <td nowrap colspan="3">
                <select size="1" name="lcrIdFideicomiso" id="lcrIdFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="lcrScta" onchange="cargaCmbScta(this);"/>
              </td>
              <td nowrap width="15%">L&iacute;nea de Crédito</td>
              <td nowrap colspan="3">
                 <input type="text" name="lcrIdLinea" id="lcrIdLinea" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Sub Cuenta</td>
              <td nowrap colspan="3">
               <select id="lcrScta" name="lcrScta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctNombreSubCuenta" next="lcrTipoCredito" param="cmbSubcuenta"/>
              </td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap colspan="3">
                &nbsp;
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Tipo Credito</td>
              <td nowrap colspan="3">
                <select size="1" name="lcrTipoCredito" id="lcrTipoCredito" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo388" next="lcrInstitucion"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Casa de Bolsa</td>
              <td nowrap colspan="3">
                <select size="1" name="lcrInstitucion" id="lcrInstitucion" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo26" next="lcrStatus"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Importe Crédito</td>
              <td nowrap colspan="3">
                 <input type="text" name="lcrImpCredito" id="lcrImpCredito" tipo="Money" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
               <td nowrap>Tasa</td>
              <td nowrap colspan =3>
                <input type="text" name="lcrTasa" id="lcrTasa" tipo="Money" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Plazo</td>
              <td nowrap colspan=3>
                <input type="text" name="lcrPlaza" id="lcrPlaza" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Fecha Apertura</td>
              <td nowrap colspan=3>
                <input type="text" id="lcrFechaApertura" name="lcrFechaApertura" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap colspan=3>
                &nbsp;
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Fecha Vencimiento</td>
              <td nowrap>
                <input type="text" id="lcrFechaVencimiento" name="lcrFechaVencimiento" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Comentario</td>
              <td nowrap colspan=3>
                <textarea name="lcrComentario" id="lcrComentario" style="width:200px;height:80px"></textarea>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Status</td>
              <td nowrap>
                <select size="1" name="lcrStatus" id="lcrStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            
           
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" ><!--style="visibility:hidden"/>-->
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipal();" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
