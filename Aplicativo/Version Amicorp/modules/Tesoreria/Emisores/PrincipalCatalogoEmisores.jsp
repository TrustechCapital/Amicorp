<form name="frmDatosEmisores" id="frmDatosEmisores">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Emisores</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="10%">No. Emisor</td>
            <td width="25%">
              <input type="text" name="paramNumEmisor" id="paramNumEmisor" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Emisor</td>
            <td width="15%">
              <input type="text" name="paramEmisor" id="paramEmisor" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="cmbStatusParam"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriEmisores" fun="loadTableElement" tabla="tblRegPriEmi" onclick="consultar(this, GI('frmDatosEmisores'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosEmisores);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">
              <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoEmisores(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoEmisores(2)"/>
              <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoEmisores(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoEmisores(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="4">
              <table align="center" width="100%" class="texto" border="0" cellpadding="0" cellspacing="0">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="76" nowrap>No. Emisor</td>
                  <td width="303" nowrap>Actividad Econ&oacute;mica</td>
                  <td width="201" nowrap>Nombre Emisor</td>
                  <td width="188" nowrap>Pa&iacute;s Origen</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriEmi" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblEmiDat" keys="emsNumEmisor,actNomRama" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
