<FORM name="frmInternetAvisos" id="frmInternetAvisos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Avisos Internet</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%">
          <tr>
            <td class="subtitulo" align="center">Aviso Actual</td>
          </tr>
          <tr>
            <td align="center">
              <textarea name="paramValor2" id="paramValor2" style="width: 500px; height: 200px;" required message="Es obligatorio colocar el aviso" onblur="this.value=this.value.toUpperCase()"></textarea>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <input type="text" name="paramClave" id="paramClave" value="201" tipo="Num" size="5" maxlength="3" style="visibility:hidden"/>
        <input type="text" name="paramDescripcion" id="paramDescripcion" value="AVISO" tipo="AlphaNumeric" size="8" maxlength="100" style="visibility:hidden"/>
        <input type="text" name="paramValor" id="paramValor" value="1" tipo="Num" size="3" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="      Alta       " name="cmdAlta" class="boton" onclick="altaAviso();"/>
        <input type="BUTTON" value="   Modificar   " name="cmdModificar" class="boton" onclick="modificaAviso();"/>
        <input type="BUTTON" value="     Baja     " name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
