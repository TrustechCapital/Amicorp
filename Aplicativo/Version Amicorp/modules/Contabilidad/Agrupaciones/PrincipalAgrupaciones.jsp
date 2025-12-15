<form name="frmPrincipalAgrupaciones" id="frmPrincipalAgrupaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Agrupaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table border="0" width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Id. Agrupacion</td>
            <td>
              <input type="text" name="paramIdAgrupacion" id="paramIdAgrupacion" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNomAgrupacion" id="paramNomAgrupacion" size="65" maxlength="100"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(l&oacute;gico)</td>
            <td>
              <input type="text" name="paramNomEtiqueta" id="paramNomEtiqueta" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(Impresi&oacute;n)</td>
            <td>
              <input type="text" name="paramNomImpreso" id="paramNomImpreso" size="65" maxlength="100" tipo="AlphaNumeric"/>
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
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conParamRubro" fun="loadTableElement" tabla="tblRegPriCatRubro" onclick="consultar(this, frmPrincipalAgrupaciones, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmPrincipalAgrupaciones);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimiento(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimiento(2);"/>
              <input type="button" value="  Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimiento(3);"/>
              <input type="button" value="Agrupar Cuentas" name="cmdConsultar" class="boton" onclick="cargaMantenimiento(4);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
            </td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="cabeceras" width="23px" nowrap>&nbsp;</td>
                  <td class="cabeceras" width="53">Id</td>
                  <td class="cabeceras" width="400px">Nombre Agrupacion</td>
                  <td class="cabeceras" width="40px">¿Etiqueta?</td>
                  <td class="cabeceras" width="400px">Nombre Impresion</td>
                </tr>
              </table>
              <div style="height:200px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriCatRubro" dataInfo="arrRubDat" keys="facoIdAgrupacion" fun="clickTabla" radioWidth="26px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
