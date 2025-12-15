<FORM name="frmPrincipalCatalogosGeneralesEstructuraGeograficaNacionalidades" id="frmPrincipalCatalogosGeneralesEstructuraGeograficaNacionalidades" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Estructura Geografica Nacionalidades</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="5%">Pa&iacute;s</td>
            <td align="left">
              <select size="1" name="paramPais" id="paramPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="formsLoaded"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosNacionalidades" fun="loadTableElement" tabla="tablaRegistrosDatosNacionalidades" onclick="consultar(this, GI('frmPrincipalCatalogosGeneralesEstructuraGeograficaNacionalidades'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogosGeneralesEstructuraGeograficaNacionalidades'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesEstructuraGeograficaNacionalidades(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px" nowrap>&nbsp;</td>
                  <td width="150px" nowrap>Pa&iacute;s</td>
                  <td width="200px" nowrap>Nacionalidad</td>
                  <td width="130px" nowrap>Abrev. Nacionalidad</td>
                  <td width="90px" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:630px;">
                <table id="tablaRegistrosDatosNacionalidades" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosNacionalidadesData" keys="nacNumPais,nacNomNacional" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
