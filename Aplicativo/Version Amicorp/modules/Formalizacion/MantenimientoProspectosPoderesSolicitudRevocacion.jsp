<FORM name="frmDatosMantenimientoProspectosPoderesSolicitudRevocacion" id="frmDatosMantenimientoProspectosPoderesSolicitudRevocacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Solicitud de Revocaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto" width="100%">
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap>Otorgante</td>
              <td nowrap style="visibility:hidden">
                <input type="radio" name="rdReferencia" id="podNumPoder3" class="radio" value="3" onclick="asignaValueRadio2Master('podNumPoder',this)"/>&nbsp;Nafin
              </td>
              <td nowrap>
                <input type="radio" name="rdReferencia" id="podNumPoder2" class="radio" value="2" onclick="asignaValueRadio2Master('podNumPoder',this)"/>&nbsp;Fiduciario
              </td>
              <td nowrap>
                <input type="radio" name="rdReferencia" id="podNumPoder" class="radio" value2="1" onclick="asignaValueRadio2Master('podNumPoder',this)" required message="La Referencia es un campo obligatorio"/>&nbsp;Fideicomiso
              </td>
              <td nowrap>No. Fideicomiso</td>
              <td nowrap>
                <input type="text" name="podNumContrato" id="podNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);"/>
              </td>
              <td nowrap>Status</td>
              <td nowrap>
                <input type="text" name="podCveStPoderes" id="podCveStPoderes" tipo="AlphaNumeric" size="25" maxlength="25"/>
              </td>
              <td nowrap width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td>Tipo Apoderado</td>
              <td colspan="2">
                <select id="podTipoApoderado" name="podTipoApoderado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="podAbogadoRev" param="clavesCombo96"/>
              </td>
              <td nowrap>Apoderado</td>
              <td colspan="4" nowrap>
                <input type="text" name="podNomApoderado" id="podNomApoderado" size="40" maxlength="70" required message="El Apoderado es un campo obligatorio"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap colspan="8">&nbsp;
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;
              </td>
              <td colspan="8" nowrap>
                <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td class="tab_blanco_claro" width="6" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoRevocacionTab()');" width="234" nowrap>Base de Otorgamiento/Revocaci&oacute;n</td>
                    <td class="tab_claro_claro_der" width="6" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudOtorgamientoTab()');" width="173" nowrap>Solicitud de Otorgamiento</td>
                    <td class="tab_claro_claro_der" width="6" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoTab()');" width="96" nowrap>Otorgamiento</td>
                    <td class="tab_claro_azul" width="6" nowrap>&nbsp;</td>
                    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudRevocacionTab()');" width="161" nowrap>Solicitud de Revocaci&oacute;n</td>
                    <td class="tab_azul_claro" width="6" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesRevocacionTab()');" width="88" nowrap>Revocaci&oacute;n</td>
                    <td class="tab_claro_blanco" width="2" nowrap>&nbsp;</td>
                  </tr>
                </table>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td colspan="8" nowrap>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap>Abogado Responsable</td>
              <td nowrap colspan="7">
                <select id="podAbogadoRev" name="podAbogadoRev" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="podNotarioRev">
                </select>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap>Fecha Solicitud</td>
              <td nowrap colspan="7">
                <input type="text" name="podFecSolRev" id="podFecSolRev" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap>Notario</td>
              <td nowrap colspan="7">
                <select id="podNotarioRev" name="podNotarioRev" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="loadCatalogo">
                </select>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="45%">&nbsp;</td>
              <td nowrap>Comentarios</td>
              <td colspan="7" nowrap>
                <textarea name="podComentarioRev" id="podComentarioRev" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr align="center">
        <td height="100%">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosPoderes();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr align="center">
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
