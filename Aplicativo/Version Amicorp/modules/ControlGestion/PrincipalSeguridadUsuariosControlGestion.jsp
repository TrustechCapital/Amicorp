<FORM name="frmPrincipalSeguridadUsuariosControlGestion" id="frmPrincipalSeguridadUsuariosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios Internos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Nombre</td>
            <td>
              <select size="1" name="paramNoUsuario" id="paramNoUsuario" ref="muestraDatosPersonalOrdenado" fun="loadComboElement" keyValue="perNumUsuario" theValue="perNomUsuario" next="paramPerfilCliente" />
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Usuario OID</td>
            <td>
              <input type="text" name="paramNomUsuario" id="paramNomUsuario" tipo="AlphaNumeric" size="50" maxlength="50" onblur="convertirMayusculas(this)"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>          
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Perfil</td>
            <td>
              <select size="1" name="paramPerfilCliente" id="paramPerfilCliente" ref="clavePuesto" fun="loadComboElement" keyValue="pueNumPuesto" theValue="pueNomPuesto"  next="paramStatus" />
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
            </td>
          <tr>
              <td colspan="4" align="center">
                <input type="text" name="paramorderName" id="paramorderName" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosUsuarios" fun="loadTableElement" tabla="tablaRegistrosDatosUsuarios" onclick="consultar(this, GI('frmPrincipalSeguridadUsuariosControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalSeguridadUsuariosControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoSeguridadUsuariosControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoSeguridadUsuariosControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBajar" name="cmdBajar" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoSeguridadUsuariosControlGestion(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="25px">&nbsp;</td>
                  <td width="50px">No.</td>
                  <td width="200px">Nombre</td>    
                  <td width="100px">OID</td>                  
                  <td width="200px">Perfil Cliente</td>
                  <td width="80px">Status</td>
                </tr>
              </table>
              <div style="height:280px; overflow:auto; position:relative; vertical-align:top; width:655px;">
                <table id="tablaRegistrosDatosUsuarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosUsuariosData" keys="usuNumUsuario" fun="clickTabla" radioWidth="25" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
