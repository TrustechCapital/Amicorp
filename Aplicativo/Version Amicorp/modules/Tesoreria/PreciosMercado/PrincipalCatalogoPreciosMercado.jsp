<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Precios de Mercado</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="15%">&nbsp;</td>
            <td width="15%">Fecha</td>
            <td width="25%" colspan="2">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="paramMercado"/>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="15%" colspan="2">Pizarra</td>
            <td width="25%">
              <input type="text" name="paramPizarra" id="paramPizarra" size="10" maxlength="10" required message="La Pizarra ó El Tipo Mercado es un campo obligatorio" onblur="estableceRequired(this);"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td width="15%" colspan="2">&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            <td width="15%" colspan="2">Serie</td>
            <td width="15%">
              <input type="text" name="paramSerie" id="paramSerie" size="7" maxlength="7"  message="La Serie es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">Tipo Mercado</td>
            <td width="15%" colspan="2">
              <select name="paramMercado" id="paramMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="destazaFecha" param="cmbMercadoParam" required message="El Tipo Mercado ó La Pizarra es un campo obligatorio" onchange="cargaComboInstrumentos(this);" onblur="estableceRequired(this);"/>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="15%" colspan="2">Cup&oacute;n</td>
            <td>
              <input type="text" name="paramCupon" id="paramCupon" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="15%">Instrumento</td>
            <td colspan="6">
              <select size="1" name="paramInstrumento" id="paramInstrumento" ref="conIns" fun="loadComboElement" keyValue="insNumInstrume" theValue="insNomInstrume" param="cmbInstrumentoParam" next="formsLoaded" message="El Instrumento es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9" align="center" valign="middle" width="15%">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramDia" id="paramDia" size="1" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="paramMes" id="paramMes" size="1" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="paramAno" id="paramAno" size="1" maxlength="4" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="9">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriConPreMer" fun="consultarCount" tabla="tblRegPriPreMer" onclick="if(fvCatPreciosm.checkForm())consultar(this,frmDatos,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.PreciosMercado.PrincipalCatalogoPreciosMercado','');"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center" valign="middle" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9">
              <table cellpadding="0" border="0" cellspacing="0">
                <tr align="left" class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="122" nowrap>Tipo&nbsp;de Mercado</td>
                  <td width="300" nowrap>Instrumento</td>
                  <td width="60" nowrap>Emisi&oacute;n</td>
                  <td width="65" nowrap>Pizarra</td>
                  <td width="60" nowrap>S&eacute;rie</td>
                  <td width="50" nowrap>Cup&oacute;n</td>
                  <td width="105" nowrap>Precio de Cierre</td>
                  <td width="80" nowrap>Tasa Anual</td>
                </tr>
              </table>
              <div style="height:350px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriPreMer" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPriPreMerDat" keys="preCveTipoMerca,preNumInstrume,preNumSecEmis,preAnoPrecEmis,preMesPrecEmis,preDiaPrecEmis,preNomPizarra,preSerEmis,preNumCuponVig,precio,tasa" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="textoNegrita" width="80">
              <div id="dvPrecio" style="visibility:hidden">Precio</div>
            </td>
            <td class="textoNegrita">
              <input type="text" name="txtPrecio" id="txtPrecio" size="15" maxlength="25" value="0" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
            <td class="textoNegrita" width="50">
              <div id="dvTasa" style="visibility:hidden">Tasa</div>
            </td>
            <td class="textoNegrita" colspan="2">&nbsp;
              <input type="text" name="txtTasa" id="txtTasa" size="15" maxlength="31" value="0" style="visibility:hidden"/>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptarPM" id="cmdAceptarPM" class="boton" onclick="ejecutaOperacionPrecioMercado();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelarPM" id="cmdCancelarPM" class="boton" onclick="inicializaDatos2();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
