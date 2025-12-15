<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Productos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Id</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="prlNumProducto" id="prlNumProducto" size="5" maxlength="5" tipo="Num" required message="El número de Producto es obligatorio"/>
              <input type="text" name="prlNumProdEsta" id="prlNumProdEsta" size="5" maxlength="5" tipo="Num" style="position:absolute;visibility:hidden;"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Producto</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="text" name="prlNomProducto" id="prlNomProducto" size="20" maxlength="50" tipo="Texto"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Negocio</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="prlTipoNegocio" id="prlTipoNegocio" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="prlClasifProd" param="clavesCombo36"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Clasificación Producto</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="prlClasifProd" id="prlClasifProd" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo37" next="prlCveTipoPers"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Persona</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="prlCveTipoPers" id="prlCveTipoPers" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo23" next="prlTipoCliente"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Cliente</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="prlTipoCliente" id="prlTipoCliente" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo18" next="prlCveStProduct"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Pri Titu</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="prlCvePriTitu" id="prlCvePriTitu">
                <option value="">-- Seleccione --</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Nomenclatura</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="text" name="prlNomenclatura" id="prlNomenclatura" size="20" maxlength="50" tipo="Texto"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              <input type="checkbox" name="prlCveSujeto30Chk" id="prlCveSujeto30Chk" class="check" tv="1" fv="0"/>Sujeto Art. 30
            </td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="checkbox" name="prlSujeArt28Chk" id="prlSujeArt28Chk" class="check" tv="1" fv="0"/>Sujeto Art. 80
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Meses de Resguardo</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="prlNumMesResg" id="prlNumMesResg" size="10" maxlength="5" tipo="Num"/>
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
                    <td><input type="text" name="prlCtamResult" id="prlCtamResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSctaResult" id="prlSctaResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSsctaResult" id="prlSsctaResult" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSssctaResult" id="prlSssctaResult" size="5" maxlength="5" tipo="Num"/></td>
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
                    <td><input type="text" name="prlNumCtamAcept" id="prlNumCtamAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlNumSctaAcept" id="prlNumSctaAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSsctaAcept" id="prlSsctaAcept" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSssctaAcept" id="prlSssctaAcept" size="5" maxlength="5" tipo="Num"/></td>
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
                    <td><input type="text" name="prlCtamServic" id="prlCtamServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSctaServic" id="prlSctaServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSsctaServic" id="prlSsctaServic" size="5" maxlength="5" tipo="Num"/></td>
                    <td><input type="text" name="prlSssctaServic" id="prlSssctaServic" size="5" maxlength="5" tipo="Num"/></td>
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
                    <td><input type="text" name="prlImpMinAper" id="prlImpMinAper" size="10" maxlength="16" tipo="Money"/></td>
                    <td>Importe Aceptación</td>
                    <td><input type="text" name="prlImpHonAcep" id="prlImpHonAcep" size="10" maxlength="16" tipo="Money"/></td>
                    <td>Importe Manejo</td>
                    <td><input type="text" name="prlImpHonManejo" id="prlImpHonManejo" size="10" maxlength="16" tipo="Money"/></td>
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
              <select size="1" name="prlCveStProduct" id="prlCveStProduct" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTMLProd"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="previoEjecutaOperacion('PRODUCTO');" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="regresar()" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
