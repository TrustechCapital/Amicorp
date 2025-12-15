<form name="frmPrinParamArch" id="frmPrinParamArch" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Archivo SAT</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table border="0" width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Id. Archivo</td>
            <td>
              <input type="text" name="paramIdArchivo" id="paramIdArchivo" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" valign="middle" colspan="4">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conParamArch" fun="loadTableElement" tabla="tblRegPrinparamArchSat" onclick="consultar(this, frmPrinParamArch, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmPrinParamArch);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantoParArchSat(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantoParArchSat(2);"/>
              <input type="button" value="  Baja   " name="cmdBaja" class="boton" onclick="cargaMantoParArchSat(3);"/>
              <input type="button" value="Modifica Estructura" name="cmdConsultar" class="boton" onclick="cargaMantoParArchSat(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="cabeceras" width="23px" nowrap>&nbsp;</td>
                  <td class="cabeceras" width="150px">Id. Archivo</td>
                  <td class="cabeceras" width="500px">Nombre</td>
                </tr>
              </table>
              <div style="height:350px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPrinparamArchSat" dataInfo="arrTblParamArchDat" keys="fastIdentificadorArchivo,fastNombre" fun="clickTabla" radioWidth="26px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
