<form name="frmDatosTransacciones" id="frmDatosTransacciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Transacciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">No.</td>
            <td>
              <input type="text" name="paramNumero" id="paramNumero" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" size="70" tipo="AlphaNumeric" maxlength="70"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Gu&iacute;a</td>
            <td>
              <input type="text" name="paramGuia" id="paramGuia" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" ref="conPriTra" fun="loadTableElement" tabla="tblRegPriTra" onclick="consultarCount(this, frmDatosTransacciones, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton"  onclick="limpiar(frmDatosTransacciones);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" colspan="4" align="center">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoTransacciones(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoTransacciones(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoTransacciones(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoTransacciones(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0" class="cabeceras">
                <tr>
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="60" nowrap>No.</td>
                  <td width="400" nowrap>Nombre</td>
                  <td width="60" nowrap>No. Gu&iacute;a</td>
                  <td width="100" nowrap>Acumula Saldos</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; width:743px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriTra" dataInfo="arrTblTraDat" keys="trsNumModulo,trsNumTransac" fun="clickTabla" NoRecordsMsg="No existen Registros para estos criterios de búsqueda" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
