<FORM name="frmPrincipalCatalogosGeneralesActividadesEconomicas" id="frmPrincipalCatalogosGeneralesActividadesEconomicas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Actividades Econ&oacute;micas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;
          <input type="hidden" name="paramorder" id="paramorder" value="s" size="50" maxlength="50" style="position:absolute;"/>
          <input type="hidden" name="paramEsActividadPadre" id="paramEsActividadPadre" tipo="Number" size="20" maxlength="10" style="position:absolute;"/>
        </td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td height="26" width="30%">&nbsp;</td>
            <td height="26" width="5%">No. Actividad</td>
            <td height="26">
              <input type="text" name="paramActividad" id="paramActividad" tipo="Number" size="10" maxlength="10"/>
            </td>
            <td height="26" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" width="30%">&nbsp;</td>
            <td height="26" width="5%">Nombre</td>
            <td height="26">
              <input type="text" name="paramNombre" id="paramNombre" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
            <td height="26" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" width="30%">&nbsp;</td>
            <td height="26" width="5%">Actividad Padre?</td>
            <td height="26">
              <input type="checkbox" name="chkActividad" id="chkActividad" class="check" onclick="esActividadPadre(this);"/>
            </td>
            <td height="26" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosActividadesEconomicas" fun="loadTableElement" tabla="tablaRegistrosDatosActividades" onclick="consultar(this, GI('frmPrincipalCatalogosGeneralesActividadesEconomicas'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogosGeneralesActividadesEconomicas'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosGeneralesActividadesEconomicas(1)"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesActividadesEconomicas(2)"/>
              <input type="BUTTON" value="  Baja   " id="cmdBajar" name="cmdBajar" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosGeneralesActividadesEconomicas(3)"/>
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
                  <td width="70px">Rama</td>
                  <td width="70px">SubRama</td>
                  <td width="300px">Nombre</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:590px;">
                <table id="tablaRegistrosDatosActividades" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosActividadesData" keys="actNumRama,actNumSrama" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
