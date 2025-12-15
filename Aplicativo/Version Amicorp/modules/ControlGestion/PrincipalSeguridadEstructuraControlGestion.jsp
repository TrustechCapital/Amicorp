<FORM name="frmPrincipalSeguridadEstructuraControlGestion" id="frmPrincipalSeguridadEstructuraControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Estructura Organizacional</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="4%" nowrap>Nivel Estructura</td>
            <td width="4%">
              <input type="text" name="paramNivel1" id="paramNivel1" tipo="Num" size="5" maxlength="10"/>
            </td>
            <td width="4%">
              <input type="text" name="paramNivel2" id="paramNivel2" tipo="Num" size="5" maxlength="10"/>
            </td>
            <td width="4%">
              <input type="text" name="paramNivel3" id="paramNivel3" tipo="Num" size="5" maxlength="10"/>
            </td>
            <td width="4%">
              <input type="text" name="paramNivel4" id="paramNivel4" tipo="Num" size="5" maxlength="10"/>
            </td>
            <td width="4%">
              <input type="text" name="paramNivel5" id="paramNivel5" tipo="Num" size="5" maxlength="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="4%" nowrap>Area</td>
            <td colspan="5">
              <input type="text" name="paramArea" id="paramArea" tipo="AlphaNumeric" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="4%" nowrap>Status</td>
            <td colspan="5">
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="8%" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td width="8%" colspan="8" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosEstructuraSeguridad" fun="loadTableElement" tabla="tablaRegistrosDatosEstructura" onclick="consultar(this, GI('frmPrincipalSeguridadEstructuraControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalSeguridadEstructuraControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td width="8%" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td width="8%" colspan="8" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoSeguridadEstructuraControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoSeguridadEstructuraControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoSeguridadEstructuraControlGestion(3);"/>
            </td>
          </tr>
          <tr>
            <td width="8%" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td width="8%" colspan="8" class="subtitulo" align="center">Esructura Organizacional</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="35px">Nivel1</td>
                  <td width="35px">Nivel2</td>
                  <td width="35px">Nivel3</td>
                  <td width="35px">Nivel4</td>
                  <td width="35px">Nivel5</td>
                  <td width="225px">Nombre</td>
                  <td width="170px">Responsable</td>
                  <td width="45px">Lada</td>
                  <td width="100px">Telefono</td>
                  <td width="45px">Ext.</td>
                  <td width="70px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:900px;">
                <table id="tablaRegistrosDatosEstructura" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosEstructuraData" keys="estNumNivel1,estNumNivel2,estNumNivel3,estNumNivel4,estNumNivel5" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
