<form name="frmDatosInstrumentos" id="frmDatosInstrumentos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Instrumentos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%">Mercado</td>
            <td width="25%">
              <select name="paramMercado" id="paramMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbMercadoParam" next="paramClasificacion"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Clasificaci&oacute;n</td>
            <td width="25%">
              <select name="paramClasificacion" id="paramClasificacion" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbClasificacionParam" next="paramStatus"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">No. Instr.</td>
            <td width="25%">
              <input type="text" name="paramNumeroInstrumento" id="paramNumeroInstrumento" tipo="Num"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="middle" height="22">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td valign="middle" height="22">
              <input type="text" name="paramNombre" id="paramNombre" size="50" tipo="AlphaNumeric"/>
            </td>
            <td align="center" valign="middle" height="22">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="middle">&nbsp;</td>
            <td width="10%">Status</td>
            <td valign="middle" width="25%">
              <select id="paramStatus" name="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="middle" colspan="4">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle" width="25%">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriIns" fun="loadTableElement" tabla="tblRegPriIns" onclick="consultar(this, GI('frmDatosInstrumentos'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="CmdLimpiar" id="CmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosInstrumentos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle" width="25%">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoInstrumentos(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoInstrumentos(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoInstrumentos(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoInstrumentos(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle" width="25%">&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="100%" colspan="7">
              <table class="texto" cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="83" nowrap>Mercado</td>
                  <td width="76" nowrap>Instrumento</td>
                  <td width="234" nowrap>Nombre</td>
                  <td width="120" nowrap>Abreviatura</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:645px">
                <table border="0" cellspacing="0" cellpadding="0" class="texto" id="tblRegPriIns" dataInfo="arrTblInsDat" keys="insCveTipoMerca,insNumInstrume" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
