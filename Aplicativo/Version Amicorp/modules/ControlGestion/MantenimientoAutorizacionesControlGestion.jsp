<FORM name="frmMantenimientoAutorizacionesControlGestion" id="frmMantenimientoAutorizacionesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">
        <P>Mantenimiento Autorizaciones</P>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td class="subtitulo" width="25%">&nbsp;</td>
            <td class="subtitulo" colspan="2">Usuarios</td>
            <td class="subtitulo" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Nombre</td>
            <td>
              <select size="1" name="autNumUsuario" id="autNumUsuario" ref="clavePersonal" fun="loadComboElement" keyValue="perNumUsuario" theValue="perNomUsuario" next="autNumOperacion" onchange="mostrarNumUsuario();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>No. Usuario</td>
            <td>
              <input type="text" name="txtNumUsuario" id="txtNumUsuario" tipo="Num" size="10" maxlength="10" required message="El Número de Usuario es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;
            </td>
            <td colspan="2">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" width="25%">&nbsp;</td>
            <td class="subtitulo" colspan="2">Autorizaciones</td>
            <td class="subtitulo" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Operaciones</td>
            <td>
              <select size="1" name="autNumOperacion" id="autNumOperacion" ref="claveOperaciones" fun="loadComboElement" keyValue="opeNumOperacion" theValue="opeNomOperacion" next="autCveStAutoriz" required message="El Número de Autorización es un dato obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>N&uacute;mero Autorizaci&oacute;n</td>
            <td>
              <input type="text" name="autAutorizacion" id="autAutorizacion" tipo="Num" size="10" maxlength="10" required message="El Número de Autorización es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Importe</td>
            <td>
              <input type="text" name="autImpAutoriza" id="autImpAutoriza" tipo="Num" size="15" maxlength="16" required message="El Importe es un dato obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Vigencia Inicio</td>
            <td>
              <input type="text" name="txtFechaInicio" id="txtFechaInicio" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Inicio es un dato obligatorio" onchange="descomponeFecha(this,GI('autDiaIniAut'),GI('autMesIniAut'),GI('autAnoIniAut'));"/>
              <input type="text" name="autDiaIniAut" id="autDiaIniAut" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="autMesIniAut" id="autMesIniAut" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
              <input type="text" name="autAnoIniAut" id="autAnoIniAut" tipo="Num" size="4" maxlength="4" style="visibility:hidden"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Fin</td>
            <td>
              <input type="text" name="txtFechaFin" id="txtFechaFin" tipo="Fecha" size="10" maxlength="10" required message="La Fecha de Fin es un dato obligatorio" onchange="descomponeFecha(this,GI('autDiaFinAut'),GI('autMesFinAut'),GI('autAnoFinAut'));"/>
              <input type="text" name="autDiaFinAut" id="autDiaFinAut" tipo="Num" size="2" maxlength="4" style="visibility:hidden"/>
              <input type="text" name="autMesFinAut" id="autMesFinAut" tipo="Num" size="2" maxlength="4" style="visibility:hidden"/>
              <input type="text" name="autAnoFinAut" id="autAnoFinAut" tipo="Num" size="4" maxlength="4" style="visibility:hidden"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%" nowrap>Status</td>
            <td>
              <select size="1" name="autCveStAutoriz" id="autCveStAutoriz" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/> &nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalAutorizacionesControlGestion();"/>
      </td>
    </tr>
  </table>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr/>
  </table>
</FORM>
