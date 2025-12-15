<FORM name="frmDatosComiteTecnicoMantenimiento" id="frmDatosComiteTecnicoMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Comite T&eacute;cnico</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>N&uacute;m. Fideicomiso</td>
              <td width="1%">
                <input type="text" name="conNumContrato" id="conNumContrato" tipo="Num" size="10" maxlength="10" onblur="verificaExisteRegistro(this);" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td colspan="2">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Nombre Comite</td>
              <td width="25%" colspan="2">
                <input type="text" name="conNomComite" id="conNomComite" size="50" maxlength="50" required message="El Nombre del Comité es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Integraci&oacute;n</td>
              <td width="25%" colspan="2">
                <textarea name="conIntComite" id="conIntComite" style="width:400px;height:80px" onkeydown="validaLongitud(this,300);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Facultades</td>
              <td width="25%" colspan="2">
                <textarea name="conFinalidComite" id="conFinalidComite" style="width:400px;height:80px"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Comentario</td>
              <td width="25%" colspan="2">
                <textarea name="conComComite" id="conComComite" style="width:400px;height:80px" onkeydown="validaLongitud(this,300);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Fecha Constituci&oacute;n</td>
              <td width="25%" colspan="2">
                <input type="text" name="txtFechaConstitucion" id="txtFechaConstitucion" tipo="Fecha" size="10" onchange="descomponeFecha(this);" required message="La Fecha de Constitución es un campo obligatorio"/>
                <input type="text" name="conDiaConst" id="conDiaConst" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="conMesConst" id="conMesConst" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="conAnoConst" id="conAnoConst" tipo="Num" size="4" style="visibility:hidden"/>
              </td>
              <td width="10%">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="20%" nowrap>Status</td>
              <td width="25%" colspan="2">
                <select id="conCveStComite" name="conCveStComite" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
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
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfoComiteTecnico();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalComiteTecnico();" style="visibility:hidden"/>
          <input type="BUTTON" value="Miembros" name="cmdMiembros" class="boton" onclick="cargaPrincipalMiembrosComiteTecnico();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
