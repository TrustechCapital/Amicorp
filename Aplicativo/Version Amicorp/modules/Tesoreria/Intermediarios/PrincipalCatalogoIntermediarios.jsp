<FORM name="frmDatosIntermediarios" id="frmDatosIntermediarios">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Intermediarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="90%">
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Intermediario</td>
            <td width="25%">
              <input type="text" name="paramNumIntermediario" id="paramNumIntermediario" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Nombre</td>
            <td width="25%">
              <input type="text" name="paramNombre" id="paramNombre" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>RFC</td>
            <td width="47%">
              <input type="text" name="paramRFC" id="paramRFC" tipo="AlphaNumeric" size="15" maxlength="15"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Status</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="cmbStatusParam"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriInt" fun="loadTableElement" tabla="tblRegPriInt" onclick="consultar(this,frmDatosIntermediarios,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosIntermediarios);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">
              <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoIntermediarios(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoIntermediarios(2)"/>
              <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoIntermediarios(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoIntermediarios(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table class="texto" cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="90" nowrap>Intermediario</td>
                  <td width="326" nowrap>Nombre</td>
                  <td width="137" nowrap>RFC</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:676px">
                <table id="tblRegPriInt" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblIntDat" keys="intEntidadFin" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
