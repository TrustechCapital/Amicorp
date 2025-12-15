<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Producto Serie</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%"  width="100%">
        <table width="100%" align="center" class="texto" border="0">
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Producto Estándar</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="fpsIdProdEsta" id="fpsIdProdEsta" ref="qryProdesta" fun="loadComboElement" keyValue="proNumProdEsta" theValue="proNomProdEsta" next="fpsIdProducto" param="paramProdesta" onblur="cargaProducto(this);" required message="El Producto Estándar es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Producto</td>
            <td valign="middle" width="8%" nowrap>
              <select name="fpsIdProducto" id="fpsIdProducto" ref="qryProducto" fun="loadComboElement" keyValue="prlNumProducto" theValue="prlNomProducto" next="fpsCveStSerie" param="paramProducto" required message="El Producto un campo obligatorio"/>
            </td>
            <td valign="middle" width="8%" nowrap>
              &nbsp;
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>No. Serie</td>
            <td valign="middle" width="8%" nowrap>
              <input type="text" name="fpsNumSerie" id="fpsNumSerie" size="5" maxlength="4" tipo="Num" required message="El Número de Serie es un campo obligatorio"/>
            </td>
            <td valign="middle" width="8%" nowrap>
              &nbsp;
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td valign="middle" colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Status</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="fpsCveStSerie" id="fpsCveStSerie" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo31" next="asignaValues2ObjHTML"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="5" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacion();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="regresar()" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
