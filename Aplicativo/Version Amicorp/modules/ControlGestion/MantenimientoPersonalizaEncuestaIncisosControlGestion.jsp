<FORM name="frmMantenimientoPersonalizaEncuestaIncisosControlGestion" id="frmMantenimientoPersonalizaEncuestaIncisosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento de Incisos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap width="5%">No. Pregunta</td>
            <td>
              <input type="text" name="ienNumPregunta" id="ienNumPregunta" tipo="Num" size="5" maxlength="5" required message="El No. Pregunta es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap width="5%">No. Inciso</td>
            <td>
              <input type="text" name="ienNumInciso" id="ienNumInciso" tipo="AlphaNumeric" size="1" maxlength="1" required message="El Inciso es un campo obligatorio" onblur="verificaExistenciaRegistroIncisos();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td nowrap width="5%">Descripci&oacute;n</td>
            <td>
              <textarea name="ienDescrInciso" id="ienDescrInciso" style="width:400px;height:80px" onkeydown="validaLongitud(this,250);" required message="La Descripcion es un dato obligatorio"></textarea>
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
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfoIncisos();" style="visibility:hidden"/> &nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalPersonalizaEncuenstaIncisosControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
