<FORM name="frmDatosFinalidadesContratoMantenimiento" id="frmDatosFinalidadesContratoMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Finalidades del Contrato</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">N&uacute;m. Fideicomiso</td>
              <td width="8%">
                <input type="text" name="finNumContrato" id="finNumContrato" tipo="Num" size="10" maxlength="10" onblur="verificacionExistenciaRegistro(true);" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="40%">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">N&uacute;m. Finalidad</td>
              <td width="8%">
                <input type="text" name="finFolioFinalida" id="finFolioFinalida" tipo="Num" size="10" maxlength="10" required message="El Núm. Finalidad es un campo obligatorio"/>
              </td>
              <td width="5%">&nbsp;</td>
              <td align="right" width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">Tipo de Finalidad</td>
              <td colspan="2">
                <select size="1" name="finCveTipoFinal" id="finCveTipoFinal" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" onchange="verificacionExistenciaRegistro(false);" next="loadCatalogo" param="clavesCombo164" required message="El Tipo de Finalidad es un campo obligatorio"/>
              </td>
              <td align="right" width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">Texto:</td>
              <td width="20%" colspan="2">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" width="25%">&nbsp;
              </td>
              <td nowrap colspan="3">&nbsp;&nbsp;
              <textarea name="finTxtComentario" id="finTxtComentario" style="width:800px;height:200px" required message="El Comentario es un campo obligatorio"></textarea></td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">&nbsp;</td>
              <td nowrap width="8%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="25%">&nbsp;</td>
              <td class="subtitulo" nowrap width="1%" colspan="3">Establecida Por</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">&nbsp;</td>
              <td colspan="2">&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap width="9%">Fideicomitente/Mandante</td>
              <td colspan="2">
                <select size="1" name="finNumDictador" id="finNumDictador" ref="claveFideicomitente" fun="loadComboElement" keyValue="fidFideicomitente" theValue="fidNomFideicom" next="formsLoaded" param="parametroComboMandante" onchange="obtieneNombre(this);" required message="El Fideicomitente/Mandante es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">
          <input type="text" name="finNomDictador" id="finNomDictador" size="50" maxlength="50" style="visibility:hidden"/>
          <input type="text" name="finCveStFinalid" id="finCveStFinalid" tipo="Letras" size="25" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalFinalidadesContrato();" style="visibility:hidden"/>
        </td>
      </tr>
  </table>
</FORM>
