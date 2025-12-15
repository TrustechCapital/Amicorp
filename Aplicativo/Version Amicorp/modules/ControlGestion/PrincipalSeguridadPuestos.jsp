<FORM name="frmPrincipalSeguridadPuestos" id="frmPrincipalSeguridadPuestos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Perfiles Seguridad y Acceso</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table align="center" class="texto" width="100%">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td>Perfil</td>
              <td>
                <input type="text" name="paramPuesto" id="paramPuesto" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td>Nombre</td>
              <td>
                <input type="text" name="paramNombre" id="paramNombre" tipo="AlphaNumeric" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;
                <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosPuestosPerfil" fun="loadTableElement" tabla="tablaRegistrosPuestos" onclick="consultar(this, GI('frmPrincipalSeguridadPuestos'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalSeguridadPuestos'));"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">
                <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoSeguridadPuestos(1);"/>
                <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoSeguridadPuestos(2);"/>
                <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
                <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoSeguridadPuestos(3);"/>
                <input type="BUTTON" value="Funciones por Perfil" id="cmdFuncionesPorPerfil" name="cmdFuncionesPorPerfil" class="boton" onclick="cargaPrincipalSeguridadFuncionesXPuesto();"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="4">
                <table cellspacing="0" cellpadding="0" border="0" class="texto">
                  <tr class="cabeceras">
                    <td width="23px" align="center">&nbsp;</td>
                    <td width="100px">Perfil</td>
                    <td width="500px">Nombre</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:660px;">
                  <table id="tablaRegistrosPuestos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaPuestosData" keys="fperIdPerfil" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
