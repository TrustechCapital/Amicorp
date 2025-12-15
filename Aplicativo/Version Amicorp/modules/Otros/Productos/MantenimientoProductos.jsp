<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Producto Estándar</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%"  width="100%">
        <table width="100%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Id</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="proNumProdEsta" id="proNumProdEsta" size="5" maxlength="5" tipo="Num" required message="El número de Producto estándar es obligatorio"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Producto Estándar</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="text" name="proNomProdEsta" id="proNomProdEsta" size="40" maxlength="50" tipo="Texto"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Negocio</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="proTipoNegocio" id="proTipoNegocio" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="proClasifProd" param="clavesCombo36"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Clasificación Producto</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="proClasifProd" id="proClasifProd" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo37" next="proCveTipPers"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Persona</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="proCveTipPers" id="proCveTipPers" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo23" next="proCveTipClient"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Cliente</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="proCveTipClient" id="proCveTipClient" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo18" next="proCveStProdest"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Primer Titular</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="proCvePriTitu" id="proCvePriTitu">
                <option value="">-- Seleccione --</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              <input type="checkbox" name="proCveSujeto30Chk" id="proCveSujeto30Chk" class="check" tv="1" fv="0"/>Sujeto Art. 30
            </td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="checkbox" name="proCveSujeto28Chk" id="proCveSujeto28Chk" class="check" tv="1" fv="0"/>Sujeto Art. 80
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Meses de Resguardo</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="proNumMesResg" id="proNumMesResg" size="10" maxlength="5" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle" align="left" class="subtitulo" colspan="3">
              Resultados
              <hr width="80%"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle"  align="left" colspan="3">
                <table class="texto">
                  <tr>
                    <td>Cta Maestra</td>
                    <td>Scta</td>
                    <td>Sscta</td>
                    <td>Ssscta</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="proCtamResult" id="proCtamResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSctaResult" id="proSctaResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSsctaResult" id="proSsctaResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSssctaResult" id="proSssctaResult" size="5" maxlength="5" tipo="Num"/></td>
                  </tr>
                </table>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle" align="left" class="subtitulo" colspan="3">
              Aceptación
              <hr width="80%"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle"  align="left" colspan="3">
                <table class="texto">
                  <tr>
                    <td>Cta Maestra</td>
                    <td>Scta</td>
                    <td>Sscta</td>
                    <td>Ssscta</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="proCtamAcept" id="proCtamAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSctaAcept" id="proSctaAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSsctaAcept" id="proSsctaAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSssctaAcept" id="proSssctaAcept" size="5" maxlength="5" tipo="Num"/></td>
                  </tr>
                </table>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle" align="left" class="subtitulo" colspan="3">
              Servicios
              <hr width="80%"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle"  align="left" colspan="3">
                <table class="texto">
                  <tr>
                    <td>Cta Maestra</td>
                    <td>Scta</td>
                    <td>Sscta</td>
                    <td>Ssscta</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="proCtamServic" id="proCtamServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSctaServic" id="proSctaServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSsctaServic" id="proSsctaServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="proSssctaServic" id="proSssctaServic" size="5" maxlength="5" tipo="Num"/></td>
                  </tr>
                </table>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle" align="left" class="subtitulo" colspan="3">
              Honorarios
              <hr width="80%"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td valign="middle"  align="left" colspan="3">
                <table class="texto">
                  <tr>
                    <td>Importe Mínimo Apertura</td>
                    <td><input type="text" name="proImpMinApert" id="proImpMinApert" size="10" maxlength="16" tipo="Money"/></td>
                    <td>Importe Aceptación</td>
                    <td><input type="text" name="proImpHonAcepta" id="proImpHonAcepta" size="10" maxlength="16" tipo="Money"/></td>
                    <td>Importe Manejo</td>
                    <td><input type="text" name="proImpHonManejo" id="proImpHonManejo" size="10" maxlength="16" tipo="Money"/></td>
                  </tr>
                </table>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td valign="middle" colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Status</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="proCveStProdest" id="proCveStProdest" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="5" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="previoEjecutaOperacion('PRODESTA');" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="regresar()" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
