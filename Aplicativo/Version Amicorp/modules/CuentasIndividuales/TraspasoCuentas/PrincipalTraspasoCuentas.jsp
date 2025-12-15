<FORM name="frmPrincipalTraspasoCuentas" id="frmPrincipalTraspasoCuentas">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Traspaso Entre Cuentas</td>
    </tr>
    <tr>
      <td height="21">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
            </td>
            <td colspan="3" width="40%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="cargaDatosNiveles">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>Folio</td>
            <td colspan="3">
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel1">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmb1Nivel1" id="cmb1Nivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(2,1);" onblur="asignaClave();" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel2">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmb1Nivel2" id="cmb1Nivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3,1);" onblur="asignaClave();" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel3">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmb1Nivel3" id="cmb1Nivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="asignaClave();" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="3">
              <input type="text" name="paramClave" id="paramClave" size="20" maxlength="30" tipo="Num" style="visibility:hidden"/>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%" colspan="6" align="center">
              <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="muestraDatosTraspasoCuentasIndividuales" fun="loadTableElement" tabla="tablaTraspasoCuentas" onclick="consultar(this, GI('frmPrincipalTraspasoCuentas'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton" onclick="cargaPrincipalTraspasoCuentas();"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="6">
              <input type="button" value="Traspasar" name="cmdTraspasar" class="boton" onclick="cargaMantenimientoTraspasoCuentas(1);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoTraspasoCuentas(2);"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="105" nowrap>Fecha</td>
                  <td width="170" nowrap>
                    <div id="dvUltNivel1">&nbsp;</div>
                  </td>
                  <td width="167" nowrap>
                    <div id="dvUltNivel2">&nbsp;</div>
                  </td>
                  <td width="91" nowrap>Folio</td>
                  <td width="147" nowrap>Importe</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:100%">
                <table id="tablaTraspasoCuentas" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaTraspasoCuentasData" keys="trasContrato,trasFolio" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
