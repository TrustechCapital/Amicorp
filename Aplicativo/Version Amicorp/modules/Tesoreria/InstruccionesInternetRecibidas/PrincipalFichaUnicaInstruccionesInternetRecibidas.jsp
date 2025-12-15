<form name="frmDatos2" id="frmDatos2">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Reportes de Ficha &Uacute;nica de Operaci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td align="left" class="subtitulo" width="20%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="3" width="15%">Reportes de Ficha &Uacute;nica Internet</td>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" class="subtitulo" colspan="6">&nbsp;
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="20%">&nbsp;</td>
            <td align="left" width="15%">
              <input type="radio" name="paramTipoFicha" id="paramTipoFicha" class="radio" value2="1" required message="El Tipo de Reporte es un campo obligatorio" onclick="estableceRequiredObjs('paramTipoFicha',this);"/>&nbsp;Gen&eacute;rica
            </td>
            <td align="left" width="10%">Status</td>
            <td align="left" width="15%">
              <select size="1" name="paramStatus" id="paramStatus" message="El Status es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
                <option value="ACEPTADA">ACEPTADA</option>
                <option value="PENDIENTE">PENDIENTE</option>
              </select>
            </td>
            <td align="left" width="15%" nowrap>&nbsp;
              </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="20%">&nbsp;</td>
            <td align="left" width="15%">&nbsp;</td>
            <td align="left" width="10%">Fecha</td>
            <td align="left" width="15%">
              <input type="text" name="paramFecha" id="paramFecha" size="10" maxlength="10" tipo="Fecha" message="La Fecha es un campo obligatorio"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="15%" height="17" colspan="6">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="20%" height="17">&nbsp;</td>
            <td align="left" width="15%" height="17">
              <input type="radio" name="paramTipoFicha" id="TipoFichaEspecifica" class="radio" value="2" onclick="estableceRequiredObjs('paramTipoFicha',this);"/>&nbsp;Espec&iacute;fica
            </td>
            <td align="left" width="10%" height="17">Folio</td>
            <td align="left" width="15%" height="17">
              <input type="text" name="paramFolio" id="paramFolio" size="10" tipo="Num"/>
            </td>
            <td align="left" width="15%" height="17">&nbsp;</td>
            <td align="left" width="15%" height="17">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="center" width="20%" height="17" colspan="6" nowrap>
              <input type="text" id="refSP" name="refSP" value="ejeFunFichaUnica" size="13" style="visibility:hidden"/>
              <input type="text" id="refQry" name="refQry" value="conFicUni" size="5" style="visibility:hidden"/>
              <input type="text" id="template" name="template" value="/xml/Reportes/Tesoreria/" style="visibility:hidden"/>
              <input type="text" id="nombreReporte" name="nombreReporte" value="Ficha Única" size="10" style="visibility:hidden"/>
              <input type="text" id="paramRepInfoRavTipoAviso" name="paramRepInfoRavTipoAviso" value="FICHA UNICA" size="10" style="visibility:hidden"/>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="20%" height="17">&nbsp;</td>
            <td align="left" width="15%" height="17">
              <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
            </td>
            <td align="left" width="15%" nowrap colspan="2">
              <input type="checkbox" name="paramFOSEG" id="paramFOSEG" class="check" value="0" onclick="asignaValue2Check(this);"/>&nbsp;Ficha FOSEG
            </td>
            <td align="left" width="15%" height="17">&nbsp;</td>
            <td align="left" width="15%" height="17">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaFichaUnica();"/>
        <input type="BUTTON" value="Cancelar " name="cmdCancelar" class="boton" onclick="onButtonClickPestania('Tesoreria.InstruccionesInternetRecibidas.PrincipalInstruccionesInternetRecibidas','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
