<FORM name="frmMantenimientoUsuariosInternetPersonas" id="frmMantenimientoUsuariosInternetPersonas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios Internet</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table id="tabs" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td class="tab_blanco_azul"><img src="imagenes/spacer.gif" width="37" height="1"/></td>
            <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoUsuariosInternetPersonas(2)');">Datos Personales/Usuarios</td>
            <td class="tab_azul_claro"><img src="imagenes/spacer.gif" width="37" height="1"/></td>
            <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoAsignacionFideicomisos()');">Asignacion Fideicomisos</td>
            <td class="tab_claro_blanco"><img src="imagenes/spacer.gif" width="35" height="1"/></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td>Estructura</td>
            <td colspan="6">
              <input type="text" name="usuTipoUsuario" id="usuTipoUsuario" tipo="AlphaNumeric" size="50" maxlength="50" value="INTERNET"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center" class="subtitulo">Datos Personal</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="3">
              <input type="text" name="perNumUsuario" id="perNumUsuario" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Nombre</td>
            <td colspan="3">
              <input type="text" name="perNomUsuario" id="perNomUsuario" tipo="AlphaNumeric" size="40" maxlength="50" required message="El Nombre de Usuario es un dato obligatorio" onblur="convertirMayusculas(this)"/>
            </td>
            <td>&nbsp;</td>
            <td>Tel&eacute;fono Oficina</td>
            <td>
              <input type="text" name="perTelefono" id="perTelefono" tipo="AlphaNumeric" size="40" maxlength="40" required message="La clave del Usuario es obligatoria"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Cargo</td>
            <td colspan="3">
              <input type="text" name="perExpLaboral" id="perExpLaboral" tipo="AlphaNumeric" size="40" maxlength="255" required message="La clave del Usuario es obligatoria" onblur="convertirMayusculas(this)"/>
            </td>
            <td>&nbsp;</td>
            <td>E-Mail</td>
            <td>
              <input type="text" name="perNivelEstudios" id="perNivelEstudios" tipo="Email" size="40" maxlength="50" required message="El E-Mail es un dato obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>RFC</td>
            <td colspan="3">
              <input type="text" name="perRfc" id="perRfc" tipo="AlphaNumeric" size="20" maxlength="20" required message="La clave del Usuario es obligatoria" onblur="convertirMayusculas(this)"/>
            </td>
            <td>&nbsp;</td>
            <td>N&uacute;mero del Certificado Digital</td>
            <td>
              <input type="text" name="perUbicacion" id="perUbicacion" tipo="AlphaNumeric" size="30" maxlength="30" required message="La clave del Usuario es obligatoria"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Direcci&oacute;n Particular</td>
            <td colspan="3">
              <input type="text" name="perDireccion" id="perDireccion" tipo="AlphaNumeric" size="40" maxlength="110" required message="La clave del Usuario es obligatoria" onblur="convertirMayusculas(this)"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center" class="subtitulo">Datos Usuario</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>N&uacute;mero de Usuario</td>
            <td colspan="3">
              <input type="text" name="usuNumUsuario" id="usuNumUsuario" tipo="Num" size="15" maxlength="10" required message="El Número de Usuario es un dato obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>Status de Seguridad</td>
            <td>
              <select size="1" name="usuCveStUsuario" id="usuCveStUsuario" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="usuNumPuesto" param="clavesCombo31" required message="El Status es un dato obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Usuario ID</td>
            <td colspan="3">
              <input type="text" name="usuNomUsuario" id="usuNomUsuario" tipo="AlphaNumeric" size="40" maxlength="50" required message="La clave del Usuario es obligatoria"/>
            </td>
            <td>&nbsp;</td>
            <td>Fecha de Ultimo Acceso</td>
            <td>
              <input type="text" name="usuFechaUltAcceso" id="usuFechaUltAcceso" tipo="Fecha" size="15" maxlength="10"  required message="La Fecha de Ultimo Acceso es obligatoria"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Perfil Cliente</td>
            <td colspan="3">
              <select size="1" name="usuNumPuesto" id="usuNumPuesto" ref="clavePerfilExteno" fun="loadComboElement" keyValue="fperIdPerfil" theValue="fperNombrePerfil" onblur="AsignaNombrePerfil(this)" next="loadCatalogo" param="paramPerfil" required message="El Tipo de Usuario es un dato obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <input type="checkbox" name="usuTokenChk" id="usuTokenChk" class="check" tv="1" fv="0" />Utiliza Token
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Importe Max. Autorizado</td>
            <td colspan="3">
              <input type="text" name="usuMontoAutorizado" id="usuMontoAutorizado" tipo="Money" size="20" maxlength="17"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp; <input type="text" name="usuNomPuesto" id="usuNomPuesto" size="20" maxlength="50" style="visibility:hidden"> </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="3">
              <input type="text" name="usuPassword" id="usuPassword"  size="20" value="1" maxlength="17" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/>
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalSeguridadUsuariosInternet();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>