<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Cat&aacute;logo de Autoridades</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="10%">Autoridad</td>
            <td>
              <input type="text" name="paramAutoridad" id="paramAutoridad" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" size="60" maxlength="100"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" valign="middle" colspan="4">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriCatAut" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoAutoridades(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoAutoridades(2);"/>
              <input type="button" value="  Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoAutoridades(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoAutoridades(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="60" nowrap>Clave</td>
                  <td width="300" nowrap>Nombre de Autoridad</td>
                  <td width="300" nowrap>Direcci&oacute;n</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eautIdAutoridad" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
