<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Par&aacute;metros Instituci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Institución</td>
              <td nowrap colspan=4>&nbsp;</td>
              <td nowrap width="15%">Id</td>
              <td nowrap colspan="2">
                <input type="text" name="empNumEmpresa" id="empNumEmpresa" tipo="Num" size="5" maxlength="5"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Nombre Instituci&oacute;n
              </td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="30" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Área</td>
              <td nowrap>
                <input type="text" name="empNomArea" id="empNomArea" size="20" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Dirección</td>
              <td nowrap colspan =3>
                <input type="text" name="empDireccion" id="empDireccion" size="30" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Fecha Cambio</td>
              <td nowrap>
                <input type="text" name="empFecCambio" id="empFecCambio" size="5" maxlength="10"/>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Firma</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomFirma" id="empNomFirma" size="20" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Autoriza</td>
              <td nowrap>
                <input type="text" name="empNomAutoriza" id="empNomAutoriza" size="20" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Aplicación</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap colspan="4">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Estilo</td>
              <td nowrap colspan =3>
                <input type="text" name="empEstilo" id="empEstilo" size="20" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Idioma</td>
              <td nowrap>
                <input type="text" name="empIdioma" id="empIdioma" size="20" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipal();" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
