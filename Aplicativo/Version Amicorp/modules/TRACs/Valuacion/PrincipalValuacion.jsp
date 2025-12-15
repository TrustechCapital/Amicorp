<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      
      <tr>
        <td align="center" height="100%" class="titulo">Valuación</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <table class="texto" width="600">
            
            <tr>
              <td>&nbsp;</td>
              <td nowrap colspan="5"><hr></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td nowrap>Fecha</td>
              <td nowrap>
                <input type="text" id="fechaVal" name="fechaVal" maxlength="10" size="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
              </td>
              <td nowrap>&nbsp;</td>
              <td nowrap>Precio NAFTRAC Cierre</td>
              <td nowrap>
                <input type="text" name="preNaf" id="preNaf" tipo="Money" size="10" maxlength="10"  required message="El Precio de NAFTRAC de Cierre es un campo obligatorio"/>
              </td>
              <td nowrap >
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="7" align="center">
                <input type="button" value="Valuar" name="cmdValuar" class="boton" onclick="funValuacion();" >
                <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="limpiar(frmDatos);" >
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
      <td colspan = 2 align="left">
        <div id="dvProcedimiento">
        </div>
      
      </td>
    </tr>
      
  </table>
</FORM>
