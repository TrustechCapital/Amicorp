<FORM name="frmDatosMantenimientoProspectosPoderesOtorgamientoRevocacion" id="frmDatosMantenimientoProspectosPoderesOtorgamientoRevocacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Base de Otorgamiento/Revocaci&oacute;n</td>
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
                <input type="radio" name="rdReferencia" id="podNumPoder3" class="radio" value="3" onclick="contratoNecesario(this);" />Protego</td>
              <td nowrap>
                <input type="radio" name="rdReferencia" id="podNumPoder2" class="radio" value="2" onclick="contratoNecesario(this);"/>&nbsp;Fiduciario
              </td>
              <td nowrap>
                <input type="radio" name="rdReferencia" id="podNumPoder" class="radio" value2="1" onclick="contratoNecesario(this);" required message="La Referencia es un campo obligatorio"/>&nbsp;Fideicomiso
              </td>
              <td nowrap>No. Fideicomiso</td>
              <td nowrap>
                <input type="text" name="podNumContrato" id="podNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);"/>
              </td>
              <td nowrap>Status</td>
              <td nowrap>
                <input type="text" name="podCveStPoderes" id="podCveStPoderes" tipo="AlphaNumeric" size="25" maxlength="25"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Tipo Apoderado</td>
              <td colspan="2" nowrap>
                <select id="podTipoApoderado" name="podTipoApoderado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo96" required message="El Tipo de Apoderado es un campo obligatorio"/>
              </td>
              <td nowrap>Apoderado</td>
              <td colspan="4" nowrap>
                <input type="text" name="podNomApoderado" id="podNomApoderado" size="40" maxlength="70" required message="El Apoderado es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>
                <input type="text" name="podIdPoder" id="podIdPoder" tipo="Num" size="4" maxlength="10" required message="El Id de Poder es un campo obligatorio" style="visibility:hidden"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>
                <table id="Tabs" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td class="tab_blanco_azul" nowrap>&nbsp;</td>
                    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoRevocacionTab()');" nowrap>Base de Otorgamiento/Revocaci&oacute;n</td>
                    <td class="tab_azul_claro" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudOtorgamientoTab()');" nowrap>Solicitud de Otorgamiento</td>
                    <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoTab()');" nowrap>Otorgamiento</td>
                    <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudRevocacionTab()');" nowrap>Solicitud de Revocaci&oacute;n</td>
                    <td class="tab_claro_claro_der" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesRevocacionTab()');" nowrap>Revocaci&oacute;n</td>
                    <td class="tab_claro_blanco" nowrap>&nbsp;</td>
                  </tr>
                </table>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="8" nowrap>Bases Para el Otorgamiento</td>
              <td class="subtitulo" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">
                <input type="checkbox" name="podComiteTecChk" id="podComiteTecChk" class="check" tv="1" fv="0"/>&nbsp;Comit&eacute; Tecnico
                </td>
              <td colspan="2" nowrap>
                <input type="checkbox" name="podConsejoDirChk" id="podConsejoDirChk" class="check" tv="1" fv="0"/>&nbsp;Consejo Directivo
              </td>
              <td colspan="4" nowrap>
                <input type="checkbox" name="podFodeocomisarioChk" id="podFodeocomisarioChk" class="check" tv="1" fv="0"/>&nbsp;Fideicomisario
</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="2" nowrap>
                <input type="checkbox" name="podContratoChk" id="podContratoChk" class="check" tv="1" fv="0"/>&nbsp;Fideicomiso
</td>
              <td colspan="2" nowrap>
              <input type="checkbox" name="podFideicomitenteChk" id="podFideicomitenteChk" class="check" tv="1" fv="0"/>&nbsp;Fideicomitente
</td>
              <td nowrap colspan="4">
                <input type="checkbox" name="podReglasOperChk" id="podReglasOperChk" class="check" tv="1" fv="0"/>&nbsp;Reglas de Operaci&oacute;n
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">
              <input type="checkbox" name="podOtroChk" id="podOtroChk" class="check" tv="1" fv="0"/>&nbsp;Otro
</td>
              <td nowrap colspan="2">
              </td>
              <td nowrap colspan="4" style="visibility:hidden;">
                <input type="checkbox" name="podPoliticasChk" id="podPoliticasChk" class="check" tv="1" fv="0"/>&nbsp;Pol&iacute;ticas Para el Otorgamiento
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr align="center">
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;
              </td>
              <td nowrap>Comentarios
              </td>
              <td nowrap colspan="7">
                <textarea name="podComentario" id="podComentario" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
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
          <input type="button" value="Aceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosPoderes();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr align="center">
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
