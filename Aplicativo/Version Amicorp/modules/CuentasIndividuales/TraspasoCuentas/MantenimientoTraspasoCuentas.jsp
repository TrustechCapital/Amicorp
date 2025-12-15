<form name="frmMantenimientoTraspasoCuentas" id="frmMantenimientoTraspasoCuentas">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Traspaso entre Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">
              <input type="text" name="trasContrato" id="trasContrato" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td height="22" colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">Folio</td>
            <td height="22" colspan="2">
              <input type="text" name="trasFolio" id="trasFolio" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">Fecha</td>
            <td height="22" colspan="2">
              <input type="text" name="trasFecOpe" id="trasFecOpe" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">Importe</td>
            <td height="22" colspan="2">
              <input type="text" name="trasImporte" id="trasImporte" size="15" maxlength="33" tipo="Money" required message="El Importe es un campo obligatorio"/>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">Motivo</td>
            <td height="22" colspan="2">
              <textarea name="trasMotivo" id="trasMotivo" style="width:400px;height:80px" onkeydown="validaLongitud(this,100);"></textarea>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">&nbsp;</td>
            <td height="22" colspan="2">&nbsp;
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22" class="subtitulo">
              <div id="dvUltNivel1">&nbsp;</div>
            </td>
            <td height="22" colspan="2">&nbsp;</td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">&nbsp;</td>
            <td height="22" colspan="2">&nbsp;</td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">
              <div id="dv1Nivel1">&nbsp;</div>
            </td>
            <td height="22" colspan="2">
              <select size="1" name="cmb1Nivel1" id="cmb1Nivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(2,1);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td height="25">
              <div id="dv1Nivel2">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmb1Nivel2" id="cmb1Nivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3,1);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td height="25">
              <div id="dv1Nivel3">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmb1Nivel3" id="cmb1Nivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="muestraClaveInversionista(this,1);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td nowrap height="25">&nbsp;</td>
            <td height="25" colspan="2">
              <input type="text" name="trasCveInv1" id="trasCveInv1" size="30" maxlength="30" tipo="Num" style="visibility:hidden"/>
            </td>
            <td height="25" width="15%">
              <input type="text" name="Secuencial1" id="Secuencial1" size="1" maxlength="2" tipo="Num" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25" class="subtitulo">
              <div id="dvUltNivel2">&nbsp;</div>
            </td>
            <td height="25" colspan="2">&nbsp;</td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">
              <div id="dv2Nivel1">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmb2Nivel1" id="cmb2Nivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(2,2);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">
              <div id="dv2Nivel2">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmb2Nivel2" id="cmb2Nivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3,2);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="23">&nbsp;</td>
            <td nowrap height="23">
              <div id="dv2Nivel3">&nbsp;</div>
            </td>
            <td height="23" colspan="2">
              <select size="1" name="cmb2Nivel3" id="cmb2Nivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="muestraClaveInversionista(this,2);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="23">&nbsp;</td>
          </tr>
          <tr>
            <td height="23">&nbsp;</td>
            <td nowrap height="23">&nbsp;</td>
            <td height="23" colspan="2">
              <input type="text" name="trasCveInv2" id="trasCveInv2" size="30" maxlength="30" tipo="Num" style="visibility:hidden"/>
            </td>
            <td height="23">
              <input type="text" name="Secuencial2" id="Secuencial2" size="1" maxlength="2" tipo="Num" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <input type="text" name="trasFecAlta" id="trasFecAlta" size="10" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
        <input type="text" name="trasFecUltMod" id="trasFecUltMod" size="10" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
        <input type="text" name="trasCveStatus" id="trasCveStatus" size="10" maxlength="25" tipo="Letras" value="ACTIVO" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="AltaInfo();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalTraspasoCuentas();"/>
      </td>
    </tr>
  </table>
</form>
