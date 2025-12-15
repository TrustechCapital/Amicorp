<FORM name="frmAgrupaAgrupacion" id="frmAgrupaAgrupacion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
          <td align="center" height="100%" class="titulo">Agrupar un Rubro</td>
      </tr>
      <tr>
          <td height="100%">&nbsp;</td>
      </tr>
      <tr>
          <td height="100%">
              <table width="100%" class="texto">
                  <tr>
                      <td width="20%">&nbsp;</td>
                      <td width="10%">Id. Agrupaci&oacute;n</td>
                      <td colspan="8">
                        <input type="text" name="facoIdAgrupacion" id="facoIdAgrupacion" size="10" tipo="Num" maxlength="10"/>
                      </td>
                      <td width="10%">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20%">&nbsp;</td>
                    <td width="10%">Nombre</td>
                    <td colspan="8">
                      <input type="text" name="froaAgrupaHija" id="froaAgrupaHija" size="10" tipo="Num" maxlength="10"/>
                    </td>
                    <td align="center" width="10%">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20%" height="18">&nbsp;</td>
                    <td width="10%" height="18"></td>
                    <td colspan="8" height="18">&nbsp;
                    </td>
                    <td width="10%" height="18">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20%" height="18">&nbsp;</td>
                    <td width="10%" height="18"> Operaci&oacute;n</td>
                    <td colspan="8" height="18">&nbsp;
                    </td>
                    <td width="10%" height="18">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="4">
                          <table align="center" class="texto">
                              <tr>
                                  <td>Suma ( + )</td>
                                  <td>
                                    <input type="radio" name="rdOperacion" id="froaTipoOperacion" value2="#" class="radio" onclick="asignaValueRadio2Master('froaTipoOperacion',this)"/>
                                  </td>
                                  <td>Resta ( - )</td>
                                  <td>
                                    <input type="radio" name="rdOperacion" id="froaTipoOperacion2" value="-" class="radio" onclick="asignaValueRadio2Master('froaTipoOperacion',this)"/>
                                  </td>
                            </tr>
                            <tr>
                                  <td>Multiplicaci&oacute;n( X )</td>
                                  <td>
                                    <input type="radio" name="rdOperacion" id="froaTipoOperacion3" value="*" class="radio" onclick="asignaValueRadio2Master('froaTipoOperacion',this)"/>
                                  </td>
                                  <td>Divisi&oacute;n ( / )</td>
                                  <td>
                                    <input type="radio" name="rdOperacion" id="froaTipoOperacion4" value="/" class="radio" onclick="asignaValueRadio2Master('froaTipoOperacion',this)"/>
                                  </td>
                          </tr>
                      </table>
                    </td>
                </tr>
                <tr>
                    <td width="20%" height="18">&nbsp;</td>
                    <td width="10%" height="18">&nbsp;</td>
                    <td colspan="8" height="18">&nbsp;
                    </td>
                    <td width="10%" height="18">&nbsp;</td>
                </tr>
                <tr>
                    <td width="100%" colspan="11" align="center">
                        <input type="button" value="Aceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaMantenimiento(modo);" style="visibility:hidden"/>
                    </td>
                </tr>
            </table>
        </td>
    </table>
</FORM>
