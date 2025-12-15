<FORM name="frmPrincipalSeguridadUsuariosInternet" id="frmPrincipalSeguridadUsuariosInternet" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios Internet</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>No. Usuario</td>
            <td>
              <input type="text" name="paramNoUsuario" id="paramNoUsuario" tipo="Num" size="15" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Nombre</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" tipo="AlphaNumeric" size="50" maxlength="50" onblur="convertirMayusculas(this)"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Perfil Cliente</td>
            <td>
              <select size="1" name="paramTipoUsuario" id="paramTipoUsuario" ref="clavePerfilExteno" fun="loadComboElement" keyValue="fperIdPerfil" theValue="fperNombrePerfil" next="paramStatus" param="paramPerfil"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Fecha &nbsp;Alta Registro</td>
            <td>
              <input type="text" name="fechaAltaRegistro" id="fechaAltaRegistro" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('paramDiaAlta'),GI('paramMesAlta'),GI('paramAnoAlta'));"/>
              <input type="text" name="paramDiaAlta" id="paramDiaAlta" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="paramMesAlta" id="paramMesAlta" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="paramAnoAlta" id="paramAnoAlta" tipo="Num" size="4" maxlength="4" style="visibility:hidden"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosUsuariosInternet" fun="loadTableElement" tabla="tablaRegistrosDatosUsuariosInternet" onclick="consultar(this, GI('frmPrincipalSeguridadUsuariosInternet'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalSeguridadUsuariosInternet'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoUsuariosInternetPersonas(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoUsuariosInternetPersonas(2);"/>
              <input type="BUTTON" value="   Baja  " id="cmdBajar" name="cmdBajar" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoUsuariosInternetPersonas(3);"/>
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
                  <td width="150px">Nombre</td>
                  <td width="100px">Tipo Usuario</td>
                  <td width="200px">Tel&eacute;fono</td>
                  <td width="300px">E-Mail</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:810px;">
                <table id="tablaRegistrosDatosUsuariosInternet" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosUsuariosInternetData" keys="usuNumUsuario" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
