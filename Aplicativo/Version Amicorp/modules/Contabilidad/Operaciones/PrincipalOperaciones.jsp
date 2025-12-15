<form name="frmDatosOperaciones" id="frmDatosOperaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Operaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
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
              <input type="text" name="paramNombre" id="paramNombre" size="50" maxlength="50" tipo="AlphaNumeric"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Operaci&oacute;n</td>
            <td>
              <select size="1" name="cmbOperacion" id="cmbOperacion" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbOperacionParam" next="formsLoaded" onchange="cmbAtxt(this,GI('paramOperacion'))"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramOperacionLineas" id="paramOperacionLineas" size="2" value="" style="visibility:hidden"/>
              <input type="text" name="paramOperacionDepositos" id="paramOperacionDepositos" size="2" value="" style="visibility:hidden"/>
              <input type="text" name="paramOperacion" id="paramOperacion" size="2" value="" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriOpe" fun="loadTableElement" tabla="tblRegPriOpe" onclick="previoConsultar(this);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosOperaciones);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoOperaciones(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoOperaciones(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoOperaciones(3);"/>
              <input type="button" value="Modifica Estructura" name="cmdConsultar" class="boton" onclick="cargaMantenimientoOperaciones(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="102" nowrap>No.</td>
                  <td width="302" nowrap>Nombre</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:527px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriOpe" dataInfo="arrTblOpeDat" keys="opeNumOperacion" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
