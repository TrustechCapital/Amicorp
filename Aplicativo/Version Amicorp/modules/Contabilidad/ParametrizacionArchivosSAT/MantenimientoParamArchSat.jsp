<FORM name="frmMantenimientoParamArch" id="frmMantenimientoParamArch" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Archivo SAT</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">Id. Archivo</td>
            <td>
              <input type="text" name="fastIdentificadorArchivo" id="fastIdentificadorArchivo" size="10" maxlength="10" tipo="Num" required message="El identificador es un dato obligatorio"/>
              <input type="text" name="paramIdArchivo" id="paramIdArchivo" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">Nombre</td>
            <td>
              <input type="text" name="fastNombre" id="fastNombre" size="65" maxlength="255" tipo="AlphaNumeric"/>
            </td>
            <td align="center" width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" size="65" maxlength="255" tipo="AlphaNumeric" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionArchivo();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.ParametrizacionArchivosSAT.PrincipalParamArchSat','');" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="cargaEstructParamArchSat(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaEstructParamArchSat(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="cargaEstructParamArchSat(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaEstructParamArchSat(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">Parametro Archivo</td>
          </tr>
          <tr>
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0" align="center" width="950px">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td class="cabeceras" width="50">Archivo</td>
                  <td class="cabeceras" width="50">Id. Dato</td>
                  <td class="cabeceras" width="50">Orden</td>
                  <td class="cabeceras" width="40">Relleno</td>
                  <td class="cabeceras" width="140">Sentido del Relleno</td>
                  <td class="cabeceras" width="90">Longitud</td>
                  <td class="cabeceras" width="90">&iquest;Lo Graba?</td>
                  <td class="cabeceras" width="100">&iquest;Tiene Valor Fijo?</td>
                  <td class="cabeceras" width="200">Referencia</td>
                </tr>
              </table>
              <div style="height:350px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0"  align="center" width="933px" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriEstArchSat" dataInfo="arrTblEstParamArchDat" keys="fastIdentificadorArchivo,fdatIdentificadorDato" fun="clickTabla2" radioWidth="26px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
