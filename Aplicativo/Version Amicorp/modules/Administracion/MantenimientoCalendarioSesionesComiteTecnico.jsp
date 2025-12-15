<FORM name="frmDatosCalendarioSesionesMantenimiento" id="frmDatosCalendarioSesionesMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Calendario de Sesiones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="10%">&nbsp;</td>
              <td width="20%">No. Fideicomiso</td>
              <td>
                <input type="text" name="recNumContrato" id="recNumContrato" tipo="Num" size="10" maxlength="10" onblur="verificacionExistenciaRegistro(true);" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td colspan="4">
                <input type="text" name="txtNomFiso" id="txtNomFiso" tipo="AlphaNumeric" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td colspan="6" width="20%">
                <hr/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">Nombre del Comite T&eacute;cnico</td>
              <td colspan="3">
                <input type="text" name="txtNomComite" id="txtNomComite" size="50" maxlength="50"/>
              </td>
              <td>
              </td>
              <td>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td colspan="6" width="20%">
                <hr/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">No. Sesi&oacute;n</td>
              <td>
                <input type="text" name="recNumReunion" id="recNumReunion" size="15" maxlength="15" onblur="verificacionExistenciaRegistro(false);" required message="El No. de Sesión es un campo obligatorio"/>
              </td>
              <td colspan="3">Fecha de Sesi&oacute;n &nbsp;
                <input type="text" name="txtFechaSesion2" id="txtFechaSesion2" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha2(this);" onblur="verificacionExistenciaRegistro(false);" required message="La Fecha de Sesión es un campo obligatorio"/>
              </td>
              <td>
              </td>              
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">Lugar de Sesi&oacute;n</td>
              <td colspan="5">
                <textarea name="recLugarReunion" id="recLugarReunion" style="width:400px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">Temas a Tratar</td>
              <td colspan="5">
                <textarea name="recAgendaReunion" id="recAgendaReunion" style="width:400px;height:80px"></textarea>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">&nbsp;</td>
              <td width="20%" colspan="3">&nbsp;</td>
              <td width="217" colspan="2">&nbsp;</td>
              <td width="27">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="20%">Status</td>
              <td width="20%" colspan="3">
                <select id="recCveStReucom" name="recCveStReucom" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="217" colspan="2">&nbsp;</td>
              <td width="27">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">
          <input type="text" name="recAnoReunion" id="recAnoReunion" size="4" style="visibility:hidden"/>
          <input type="text" name="recMesReunion" id="recMesReunion" size="2" style="visibility:hidden"/>
          <input type="text" name="recDiaReunion" id="recDiaReunion" size="2" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" size="20%" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" size="20%" class="boton_x" onclick="cargaPrincipalCalendarioSesiones();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
