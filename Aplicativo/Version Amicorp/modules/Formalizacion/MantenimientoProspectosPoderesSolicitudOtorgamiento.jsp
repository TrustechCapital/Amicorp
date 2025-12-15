<FORM name="frmDatosMantenimientoProspectosPoderesSolicitudOtorgamiento" id="frmDatosMantenimientoProspectosPoderesSolicitudOtorgamiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr align="center">
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Solicitud de Otorgamiento</td>
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
              <td nowrap>No. Fideicomiso</td>
              <td nowrap>
                <input type="text" name="podNumContrato" id="podNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta();"/>
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
                <select id="podTipoApoderado" name="podTipoApoderado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="podAbogadoOto" param="clavesCombo96"/>
              </td>
              <td nowrap>Apoderado</td>
              <td colspan="4" nowrap>
                <input type="text" name="podNomApoderado" id="podNomApoderado" size="40" maxlength="70" required message="El Apoderado es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="8">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;
              </td>
              <td colspan="8" nowrap>
                <table cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td class="tab_blanco_claro" nowrap>&nbsp;</td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoPoderesOtorgamientoRevocacionTab()');" nowrap>Base de Otorgamiento/Revocaci&oacute;n</td>
                    <td class="tab_claro_azul" nowrap>&nbsp;</td>
                    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoPoderesSolicitudOtorgamientoTab()');" nowrap>Solicitud de Otorgamiento</td>
                    <td class="tab_azul_claro" nowrap>&nbsp;</td>
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
              <td nowrap>Abogado responsable</td>
              <td colspan="7" nowrap>
                <select id="podAbogadoOto" name="podAbogadoOto" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="podNotarioOto"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Fecha Solicitud</td>
              <td colspan="7" nowrap>
                <input type="text" name="podFecSolOto" id="podFecSolOto" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Notario</td>
              <td colspan="7" nowrap>
                <select id="podNotarioOto" name="podNotarioOto" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="podTipoPoder"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr align="center">
              <td width="15%">&nbsp;</td>
              <td colspan="8" nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="8" nowrap>Tipo de Poder</td>
              <td class="subtitulo" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="8" nowrap>&nbsp;</td>
              <td class="subtitulo" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Tipo Poder</td>
              <td nowrap colspan="2">
                <select id="podTipoPoder" name="podTipoPoder" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo1001"/>
              </td>
              <td nowrap colspan="5">&nbsp;</td>              
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td rowspan="3" width="15%">&nbsp;</td>
              <td rowspan="3" nowrap><input type="checkbox" name="podTipoGeneralChk" id="podTipoGeneralChk" class="check" tv="1" fv="0"/>&nbsp;General
              </td>
              <td nowrap>
                <input type="checkbox" name="podPleitosCobranChk" id="podPleitosCobranChk" class="check" tv="1" fv="0"/>&nbsp;Pleitos y Cobranza
              </td>
              <td nowrap>&nbsp;
                <input type="checkbox" name="podActDominioChk" id="podActDominioChk" class="check" tv="1" fv="0"/>&nbsp;Actos de Dominio
              </td>
              <td nowrap colspan="4">&nbsp;
                <input type="checkbox" name="podSusTitCredChk" id="podSusTitCredChk" class="check" tv="1" fv="0"/>&nbsp;Suscribir Titulos de Creditos
              </td>
              <td nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap>
                <input type="checkbox" name="podAdmLocalChk" id="podAdmLocalChk" class="check" tv="1" fv="0"/>&nbsp;Administracion Laboral
              </td>
              <td nowrap>&nbsp;
                <input type="checkbox" name="podActAdmonChk" id="podActAdmonChk" class="check" tv="1" fv="0"/>&nbsp;Actos de Administraci&oacute;n
              </td>
              <td colspan="5" nowrap>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap colspan="7">
                <textarea name="podComentarioOto" id="podComentarioOto" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr align="left">
              <td width="15%">&nbsp;</td>
              <td nowrap>
                <input type="checkbox" name="podTipoEspecialChk" id="podTipoEspecialChk" class="check" tv="1" fv="0"/>&nbsp;Especial
              </td>
              <td nowrap colspan="7">
                <textarea name="podDesEspecia" id="podDesEspecia" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Facultades de Sustituci&oacute;n</td>
              <td nowrap colspan="7">
                <textarea name="podFacSustitucio" id="podFacSustitucio" style="width:600px;height:50px" onkeydown="validaLongitud(this,250);"></textarea>
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
