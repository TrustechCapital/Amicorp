<form name="frmDatosEmisiones" id="frmDatosEmisiones">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Emisiones</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%">Mercado</td>
            <td>
              <select id="paramMercado" name="paramMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbMercadoParam" next="paramStatus" onchange="cmbInstrumentoParam.tipoMercado = this.value; loadElement(GI('paramInstrumento'));"/>
            </td>
            <td width="10%">Emisora</td>
            <td>
              <input type="text" id="paramEmisora" name="paramEmisora" tipo="AlphaNumeric" maxlength="10" size="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%">Instrumento</td>
            <td>
              <select size="1" name="paramInstrumento" id="paramInstrumento" ref="conIns" fun="loadComboElement" keyValue="insNumInstrume" theValue="insNomInstrume" param="cmbInstrumentoParam" next="formsLoaded">
                <option value="-1">-- Seleccione --</option>
              </select>
                
            </td>
            <td width="10%">Serie</td>
            <td>
              <input type="text" id="paramSerie" name="paramSerie" tipo="AlphaNumeric" maxlength="7" size="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%">Secuencial</td>
            <td>
              <input type="text" maxlength="10" size="10" name="paramSec" id="paramSec" tipo="Num"/>
            </td>
            <td width="10%">Cup&oacute;n</td>
            <td>
              <input type="text" id="paramCupon" name="paramCupon" tipo="Num" maxlength="10" size="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="15%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="10%" colspan="6">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center" width="15%">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriEmi" fun="loadTableElement" tabla="tblRegPriEmi" onclick="consultar(this, GI('frmDatosEmisiones'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosEmisiones);"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center" width="25%">
              <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoEmisiones(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoEmisiones(2)"/>
              <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoEmisiones(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoEmisiones(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <table class="texto" cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="141" nowrap>Mercado</td>
                  <td width="218" nowrap>Instrumento</td>
                  <td width="68" nowrap>Sec. Emis.</td>
                  <td width="97" nowrap>Emisora</td>
                  <td width="98" nowrap>Serie</td>
                  <td width="76" nowrap>Cup&oacute;n</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriEmi" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblEmiDat" keys="emiNumSecEmis,emiCveTipoMerca,emiNumInstrume,emiNomPizarra,emiNumSerEmis,emiNumCuponVig" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
