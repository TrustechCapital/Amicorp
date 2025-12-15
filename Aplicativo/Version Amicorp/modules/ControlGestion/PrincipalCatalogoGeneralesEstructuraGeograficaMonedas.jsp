<FORM name="frmPrincipalCatalogosGeneralesEstructuraGeograficaMonedas" id="frmPrincipalCatalogosGeneralesEstructuraGeograficaMonedas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Estructura Geografica Moneda</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Nombre Moneda</td>
            <td>
              <input type="text" name="paramNomMoneda" id="paramNomMoneda" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosMonedas" fun="loadTableElement" tabla="tablaRegistrosDatosMonedas" onclick="consultar(this, GI('frmPrincipalCatalogosGeneralesEstructuraGeograficaMonedas'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogosGeneralesEstructuraGeograficaMonedas'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoGeneralesEstructuraGeograficaMonedas(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoGeneralesEstructuraGeograficaMonedas(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoGeneralesEstructuraGeograficaMonedas(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="200px">Pa&iacute;s</td>
                  <td width="200px">Moneda</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:460px;">
                <table id="tablaRegistrosDatosMonedas" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosMonedasData" keys="monNomMoneda,monNumPais" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
</FORM>
