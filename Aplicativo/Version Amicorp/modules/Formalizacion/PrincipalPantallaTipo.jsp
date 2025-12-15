<FORM name="frmPrincipalPantallatipo" id="frmPrincipalPantallaTipo" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Pantalla Tipo</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" nowrap>
          <table align="center" class="texto">
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">Id</td>
              <td nowrap>
                <input type="text" name="paramId" id="paramId" tipo="Num" size="15" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">Descripci&oacute;n</td>
              <td nowrap>
                <input type="text" name="paramDesc" id="paramDesc" tipo= "AlphaNumeric" size="30" maxlength="100"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;
                <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosPantalla" fun="loadTableElement" tabla="tablaRegistrosPantalla" onclick="consultar(this, GI('frmPrincipalPantallaTipo'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalPantallaTipo'));"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">
                <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoPantallaTipo(1);"/>
                <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoPantallaTipo(2);"/>
                <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
                <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoPantallaTipo(3);"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr align="center" >
              <td colspan="4">
                <table class="texto" cellpadding="0" cellspacing="0" border="0">
                  <tr class="cabeceras">
                    <td width="23px" nowrap>&nbsp;</td>
                    <td width="55px" nowrap>Id</td>
                    <td width="300px" nowrap>Descripci&oacute;n</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:500px">
                  <table id="tablaRegistrosPantalla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaPantallaData" keys="ptiPantalla" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
