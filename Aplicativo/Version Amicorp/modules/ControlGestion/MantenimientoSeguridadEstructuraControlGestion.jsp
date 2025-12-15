<FORM name="frmMantenimientoSeguridadEstructuraControlGestion" id="frmMantenimientoSeguridadEstructuraControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Estructura</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td class="subtitulo" width="10%">&nbsp;</td>
            <td class="subtitulo" colspan="10">Estructura Fiduciaria</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="7%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Nivel de Estructura</td>
            <td width="7%">
              <input type="text" name="estNumNivel1" id="estNumNivel1" tipo="Num" size="5" maxlength="10" required message="El Nivel 1 es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="7%">
              <input type="text" name="estNumNivel2" id="estNumNivel2" tipo="Num" size="5" maxlength="10" required message="El Nivel 2 es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="7%">
              <input type="text" name="estNumNivel3" id="estNumNivel3" tipo="Num" size="5" maxlength="10" required message="El Nivel 3 es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="7%">
              <input type="text" name="estNumNivel4" id="estNumNivel4" tipo="Num" size="5" maxlength="10" required message="El Nivel 4 es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="7%">
              <input type="text" name="estNumNivel5" id="estNumNivel5" tipo="Num" size="5" maxlength="10" required message="El Nivel 5 es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Nombre del Area</td>
            <td colspan="5">
              <input type="text" name="estDescNivel" id="estDescNivel" size="50" maxlength="50" required message="El Nombre del Área es un dato obligatorio"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Responsable</td>
            <td colspan="5">
              <input type="text" name="estNomRespNivel" id="estNomRespNivel" size="50" maxlength="50" required message="El Responsable es un dato obligatorio"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="10">
              <hr/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;
            </td>
            <td class="subtitulo" colspan="7">Direcci&oacute;n</td>
            <td class="subtitulo" colspan="3">Tel&eacute;fonos</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" width="10%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Calle y No.</td>
            <td colspan="5">
              <input type="text" name="estCalleNum" id="estCalleNum" size="50" maxlength="50"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">Lada</td>
            <td width="11%">Tel&eacute;fono</td>
            <td>Ext</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Colonia</td>
            <td colspan="5">
              <input type="text" name="estNomColonia" id="estNomColonia" size="50" maxlength="50"/>
            </td>
            <td width="3%">Ofna1</td>
            <td width="5%">
              <input type="text" name="estNumCveLada1" id="estNumCveLada1" size="4" maxlength="4"/>
            </td>
            <td width="11%">
              <input type="text" name="estNumTelef1" id="estNumTelef1" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="estNumExt1" id="estNumExt1" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Poblaci&oacute;n</td>
            <td colspan="5">
              <input type="text" name="estNomPoblacion" id="estNomPoblacion" size="50" maxlength="50"/>
            </td>
            <td width="3%">Ofna2</td>
            <td width="5%">
              <input type="text" name="estNumCveLada2" id="estNumCveLada2" size="4" maxlength="4"/>
            </td>
            <td width="11%">
              <input type="text" name="estNumTelef2" id="estNumTelef2" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="estNumExt2" id="estNumExt2" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Pa&iacute;s</td>
            <td colspan="5">
              <select size="1" name="estNomPais" id="estNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="estCveStNivel" onchange="cargaParamComboEstado(this,false);"/>
            </td>
            <td width="3%">Fax</td>
            <td width="5%">
              <input type="text" name="estNumLadaFax" id="estNumLadaFax" size="4" maxlength="4"/>
            </td>
            <td width="11%">
              <input type="text" name="estNumTelefFax" id="estNumTelefFax" size="20" maxlength="20"/>
            </td>
            <td>
              <input type="text" name="estNumExtFax" id="estNumExtFax" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Estado</td>
            <td colspan="5">
              <select size="1" name="estNomEstado" id="estNomEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNomEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;
            </td>
            <td width="11%">&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="5%">Cod. Postal</td>
            <td colspan="5">
              <input type="text" name="estCodigoPostal" id="estCodigoPostal" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td colspan="10">
              <hr/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;
            </td>
            <td class="subtitulo" colspan="10">Contabilidad de Resultados</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" width="10%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="7%">&nbsp;</td>
            <td class="subtitulo" width="3%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="5%">Centro de Logro</td>
            <td colspan="4">
              <input type="text" name="estNumCenLogro" id="estNumCenLogro" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td colspan="2" align="right">&nbsp;Centro de Costo</td>
            <td width="5%" colspan="2">
              <input type="text" name="estNumCenCosto" id="estNumCenCosto" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="5%">Status</td>
            <td colspan="5">
              <select size="1" name="estCveStNivel" id="estCveStNivel" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="3%">&nbsp;</td>
            <td width="5%">&nbsp;
            </td>
            <td width="11%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadEstructuraControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
