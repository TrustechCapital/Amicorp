<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Direcciones Fideicomitentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomiso</td>
            <td>
              <input type="text" name="dirNumContrato" id="dirNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);" required message="El Número de Fideicomiso es un campo obligatorio"/>
            </td>
            <td nowrap>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomitente</td>
            <td colspan="2">
              <input type="text" name="dirNumPersFid" id="dirNumPersFid" tipo="Num" size="10" maxlength="10" required message="El Número de Fideicomitente es un campo obligatorio"/>
              <input type="text" name="dirCvePersFid" id="dirCvePersFid" tipo="Num" size="10" maxlength="10" required message="El Número de Fideicomitente es un campo obligatorio" value="FIDEICOMITENTE" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">Raz&oacute;n Social</td>
            <td colspan="2">
              <input type="text" name="fidNomFideicom" id="fidNomFideicom" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap colspan="3" width="15%">&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">No. Direcci&oacute;n</td>
              <td colspan="2">
                <input type="text" name="dirNumSecDirecc" id="dirNumSecDirecc" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">A la Atenci&oacute;n de</td>
              <td colspan="2">
                <input type="text" name="dirNomAtencion" id="dirNomAtencion" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Tipo de Domicilio</td>
              <td colspan="2">
                <select size="1" name="dirCveTipoDomic" id="dirCveTipoDomic" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="dirNumPais" param="cmbTipoDomicilioParam" required message="El Tipo de Domicilio es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Calle y No.</td>
              <td colspan="2">
                <input type="text" name="dirCalleNum" id="dirCalleNum" size="50" maxlength="50" required message="La Calle y No. es un campo obligatorio"/>
              </td>
              <td align="left" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Colonia</td>
              <td colspan="2">
                <input type="text" name="dirNomColonia" id="dirNomColonia" size="50" maxlength="50" required message="La Colonia es un campo obligatorio"/>
              </td>
              <td align="left" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td nowrap width="15%">Poblaci&oacute;n
              </td>
              <td nowrap colspan="2">
                <input type="text" name="dirNomPoblacion" id="dirNomPoblacion" size="50" maxlength="50" required message="La Población es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%" class="subtitulo">&nbsp;</td>
              <td nowrap width="15%">Pa&iacute;s</td>
              <td colspan="2">
                <select size="1" name="dirNumPais" id="dirNumPais" ref="conNumPaiNomPai" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="dirCveStDirecc" required message="El País es un campo obligatorio" onchange="asignaDatosObjs(this);"/>
                <input type="text" name="dirNomPais" id="dirNomPais" size="10" maxlength="50" style="visibility:hidden"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Estado</td>
              <td colspan="2">
                <select size="1" name="dirNumEstado" id="dirNumEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNumEstado" theValue="edoNomEstado" next="hideWaitLayer" param="cmbEstadosParam" required message="El Estado es un campo obligatorio" onchange="asignaDatosObjs(this);">
                  <option value="-1">-- Seleccione --</option>
                </select>
                <input type="text" name="dirNomEstado" id="dirNomEstado" size="10" maxlength="50" style="visibility:hidden"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">C&oacute;digo Postal</td>
              <td>
                <input type="text" name="dirCodigoPostal" id="dirCodigoPostal" size="5" maxlength="10" tipo="Num" required message="El Código Postal es un campo obligatorio"/>
              </td>
              <td>
                <input type="checkbox" name="dirAnoAltaRegChk" id="dirAnoAltaRegChk" class="check" tv="1" fv="0"/>&nbsp;Envio Informaci&oacute;n
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Status</td>
              <td colspan="2">
                <select size="1" name="dirCveStDirecc" id="dirCveStDirecc" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="asignaValues2ObjHTML" param="cmbStatusParam" required message="El Status es un campo obligatorio"/>
              </td>
              <td align="left" width="10%">&nbsp;</td>
            </tr>
          </div>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionDireccion();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalDirecciones2();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
