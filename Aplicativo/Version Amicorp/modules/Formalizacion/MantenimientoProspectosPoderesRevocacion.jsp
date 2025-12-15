<FORM name="frmDatosMantenimientoProspectosPoderesRevocacion" id="frmDatosMantenimientoProspectosPoderesRevocacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr align="center">
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Revocaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="100%" class="texto">
            <tr>
              <td width="15%">&nbsp;</td>
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
              <td nowrap>No. fideicomiso</td>
              <td>
                <input type="text" name="podNumContrato" id="podNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta();"/>
              </td>
              <td>Status</td>
              <td>
                <input type="text" name="podCveStPoderes" id="podCveStPoderes" tipo="AlphaNumeric" size="25" maxlength="25"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Tipo Apoderado</td>
              <td colspan="2">
                <select id="podTipoApoderado" name="podTipoApoderado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="podNotarioRev" param="clavesCombo96"/>
              </td>
              <td>Apoderado</td>
              <td colspan="4">
                <input type="text" name="podNomApoderado" id="podNomApoderado" size="40" maxlength="70" required message="El Apoderado es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8">
              <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td class="tab_blanco_claro" nowrap>&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoRevocacionTab()');" nowrap>Base de Otorgamiento/Revocaci&oacute;n</td>
                  <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudOtorgamientoTab()');" nowrap>Solicitud de Otorgamiento</td>
                  <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoTab()');" nowrap>Otorgamiento</td>
                  <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudRevocacionTab()');" nowrap>Solicitud de Revocaci&oacute;n</td>
                  <td class="tab_claro_azul" nowrap>&nbsp;</td>
                  <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoPoderesRevocacionTab()');" nowrap>Revocaci&oacute;n</td>
                  <td class="tab_azul_blanco" nowrap>&nbsp;</td>
                </tr>
              </table>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td>Escritura</td>
              <td colspan="2">
                <input type="text" name="podEscrituraRev" id="podEscrituraRev" size="30" maxlength="30"/>
              </td>
              <td colspan="2">
                <input type="checkbox" name="podInsregPubRevChk" id="podInsregPubRevChk" class="check" tv="1" fv="0"/>&nbsp;Inscripci&oacute;n Reg Publico
              </td>
              <td colspan="3">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td>Fecha Escritura</td>
              <td colspan="2">
                <input type="text" name="podFecEscrRev" id="podFecEscrRev" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td colspan="2">Fecha Reg</td>
              <td colspan="3">
                <input type="text" name="podFecRegRev" id="podFecRegRev" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td>Notario</td>
              <td colspan="2">
                <select id="podNotarioRev" name="podNotarioRev" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="loadCatalogo"/>
              </td>
              <td colspan="2">Folio Mercantil</td>
              <td colspan="3">
                <input type="text" name="podFolMercaRev" id="podFolMercaRev" size="25" maxlength="25"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr align="center">
              <td width="15%">&nbsp;</td>
              <td colspan="8">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td>Comentarios
              </td>
              <td colspan="7">
                <textarea name="podComentarioRev" id="podComentarioRev" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
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
