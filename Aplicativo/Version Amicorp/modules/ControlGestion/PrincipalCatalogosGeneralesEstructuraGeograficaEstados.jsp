<FORM name="frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados" id="frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Estructura Geografica Estados</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%">Nombre Pais</td>
            <td>
              <select size="1" name="paramPais" id="paramPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="formsLoaded" required message="Para llevar a cabo la búsqueda se requiere cuando menos el Pais" onchange="cargaParamComboEstado(this,true);"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%">Nombre Estado</td>
            <td>
              <select size="1" name="paramEstado" id="paramEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNumEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosEstados" fun="loadTableElement" tabla="tablaRegistrosDatosEstados" onclick="buscarRegistros();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogosGeneralesEstructuraGeograficaEstados'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaEstado(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaEstado(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaEstado(3);"/>
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
                  <td width="200px"> Estado</td>
                  <td width="110px">Abrev. Estado</td>
                  <td width="110px">Hr. Diferencia</td>
                  <td width="110px">Min. Diferencia</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:880px;">
                <table id="tablaRegistrosDatosEstados" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosEstadosData" keys="edoNumEstado,edoNumPais" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</TD>
</FORM>
