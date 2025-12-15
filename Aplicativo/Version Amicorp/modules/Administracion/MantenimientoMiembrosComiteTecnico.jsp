<FORM name="frmDatosMiembrosComiteTecnicoMantenimiento" id="frmDatosMiembrosComiteTecnicoMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Miembros del Comite T&eacute;cnico</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="16%">&nbsp;</td>
              <td width="16%">N&uacute;m. Fideicomiso</td>
              <td width="10%">
                <input type="text" name="comNumContrato" id="comNumContrato" tipo="Num" size="10" maxlength="10" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td nowrap>
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Comit&eacute; T&eacute;cnico</td>
              <td colspan="2">
                <input type="text" name="txtNomComite" id="txtNomComite" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;
              </td>
              <td colspan="3">
                <hr/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">N&uacute;mero</td>
              <td colspan="2">
                <input type="text" name="comNumMiembro" id="comNumMiembro" tipo="Num" size="10" maxlength="10" required message="El Número del Miembro es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Nombre</td>
              <td colspan="2">
                <input type="text" name="comNomMiembro" id="comNomMiembro" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Referencia</td>
              <td colspan="2">
                <input type="text" name="comReferencia" id="comReferencia" size="50" maxlength="80"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Fecha de Designaci&oacute;n</td>
              <td colspan="2">
                <input type="text" name="txtFechaDesignacion" id="txtFechaDesignacion" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFechaMiembros(this);"/>
                <input type="text" name="comDiaDesig" id="comDiaDesig" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="comMesDesig" id="comMesDesig" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="comAnoDesig" id="comAnoDesig" tipo="Num" size="4" style="visibility:hidden"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">RFC Miembro</td>
              <td colspan="2">
                <input type="text" name="comRfc" id="comRfc" tipo="AlphaNumeric" size="15" maxlength="15"/>
              </td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Instituci&oacute;n</td>
              <td colspan="2">
                <input type="text" name="comNomInstituc" id="comNomInstituc" size="60" maxlength="100"/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Puesto</td>
              <td colspan="2">
                <input type="text" name="comNomPuesto" id="comNomPuesto" size="60" maxlength="100"/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Importe Retiros</td>
              <td colspan="2">
                <input type="text" name="comImpAutRetiro" id="comImpAutRetiro" size="17" maxlength="17" tipo="Money" prec="14.2" reqPrecValue/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Participaci&oacute;n</td>
              <td colspan="2">
                <input type="text" name="comCveParticip" id="comCveParticip" size="25" maxlength="25"/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Firma</td>
              <td colspan="2">
                <input type="text" name="comCveFirma" id="comCveFirma" size="25" maxlength="25"/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr>
              <td width="16%">&nbsp;</td>
              <td width="16%">Status</td>
              <td colspan="2">
                <select id="comCveStMiembro" name="comCveStMiembro" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogoMiembros" param="clavesComboMiembros31" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="29%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfoMiembrosComiteTecnico();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalMiembrosComiteTecnico();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
