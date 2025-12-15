<form name="frmDatosTratamientoFiscal" id="frmDatosTratamientoFiscal" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Tratamiento Fiscal</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">No. Clave</td>
            <td>
              <input type="text" name="paramClave" id="paramClave" size="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Descripci&oacute;n</td>
            <td>
              <input type="text" name="paramDescripcion" id="paramDescripcion" size="30" tipo="AlphaNumeric"/>
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
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriTraFis" fun="loadTableElement" tabla="tblRegPriTraFis" onclick="consultar(this, frmDatosTratamientoFiscal, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosTratamientoFiscal);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoTratamientoFiscal(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoTratamientoFiscal(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoTratamientoFiscal(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoTratamientoFiscal(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="70" nowrap>Clave</td>
                  <td width="500" nowrap>Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:200px; overflow:auto; position:relative; vertical-align:top;width:593px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriTraFis" dataInfo="arrTblTraFisDat" keys="trfCveTratfisc" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
