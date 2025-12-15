<form name="frmDatosObligacionesFiscales" id="frmDatosObligacionesFiscales" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Obligaciones Fiscales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="13%" nowrap>No. Clave</td>
            <td>
              <input type="text" name="paramClave" id="paramClave" size="10" tipo="AlphaNumeric"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="13%" nowrap>Tipo de Impuesto</td>
            <td>
              <input type="text" name="paramTipoImpuesto" id="paramTipoImpuesto" size="30" tipo="AlphaNumeric"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriOblFis" fun="loadTableElement" tabla="tblRegPriOblFis" onclick="consultar(this, frmDatosObligacionesFiscales, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosObligacionesFiscales);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoObligacionesFiscales(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoObligacionesFiscales(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoObligacionesFiscales(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoObligacionesFiscales(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">
              <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr class="cabeceras">
                  <td width="23">&nbsp;</td>
                  <td width="150">Tipo de Impuesto</td>
                  <td width="167">Concepto</td>
                  <td width="122">No. Declaraciones</td>
                  <td width="55">Per&iacute;odo</td>
                  <td width="154">Plazo&nbsp;Presentaci&oacute;n</td>
                  <td width="168">Lugar Presentaci&oacute;n</td>
                  <td width="100">Formato</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriOblFis" dataInfo="arrTblOblFisDat" keys="obfCveObligfisc,oblTipoImp" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
