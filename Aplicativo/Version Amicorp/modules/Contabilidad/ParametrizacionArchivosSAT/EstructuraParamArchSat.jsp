  <form name="frmEstructuraParamArchSat" id="frmEstructuraParamArchSat" onsubmit="">
    <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
          <td align="center" height="100%" class="titulo">Estructura de la parametrizacion de los datos</td>
      </tr>
      <tr>
      <td height="100%">&nbsp;</td>
      </tr>
      <tr>
          <td height="100%">
              <table border="0" width="100%" class="texto">
                  <tr>
                    <td width="20%">&nbsp;</td>
                    <td width="20%">Id. Archivo</td>
                    <td width="20%">
                      <input type="text" name="fastIdentificadorArchivo" id="fastIdentificadorArchivo" size="10" maxlength="10" tipo="Num" disabled="disabled" required message="El identificador es un dato obligatorio"/>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>Id. Dato</td>
                    <td>
                        <input type="text" name="fdatIdentificadorDato" id="fdatIdentificadorDato" size="10" maxlength="10" tipo="Num" disabled="disabled" required message="El identificador es un dato obligatorio"/>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td width>&nbsp;</td>
                    <td width>Orden</td>
                    <td><input type="text" name="fdatOrden" id="fdatOrden" size="2" maxlength="2" tipo="Num"/>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td width>&nbsp;</td>
                    <td width>Longitud</td>
                    <td><input type="text" name="fdatLongitud" id="fdatLongitud" size="5" maxlength="5" tipo="Num"/>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>Caracter de Relleno</td>
                    <td colspan="2">
                      <table align="left" width="40%" class="texto">
                          <tr>
                            <td><input type="text" name="fdatCaracterRelleno" id="fdatCaracterRelleno" size="1" maxlength="1" tipo="AlphaNumeric"/></td>
                            <td align="center">Sentido:</td>
                            <td align="right">Izquierdo <input type="RADIO" name="rdSentido" id="fdatRellenoIzDe" value2="I" class="radio" onclick="asignaValueRadio2Master('fdatRellenoIzDe',this)"/> </td>
                            <td align="right">Derecho <input type="RADIO" name="rdSentido" id="fdatRellenoIzDe2" value="D" class="radio" onclick="asignaValueRadio2Master('fdatRellenoIzDe',this)"/></td>
                          </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td colspan="0">El dato ser&aacute; presentado en el archivo?</td>
                    <td>
                      <table align="left" width="100%" class="texto">
                            <tr>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td align="right"> &nbsp;&nbsp;Si <input type="RADIO" name="rdGrabArch" id="fdatGrabaArchivo" value2="1" class="radio" onclick="asignaValueRadio2Master('fdatGrabaArchivo',this)"/> </td>
                              <td align="right">No <input type="RADIO" name="rdGrabArch" id="fdatGrabaArchivo2" class="radio" value="0" onclick="asignaValueRadio2Master('fdatGrabaArchivo',this)"/></td>
                            </tr>
                        </table>
                    </td>
                  </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td colspan="0">El dato contendr&aacute; valor fijo?</td>
                  <td>
                    <table align="left" width="100%" class="texto">
                          <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td align="right"> &nbsp;&nbsp;Si <input type="RADIO" name="radValFij" id="fdatValorFijo" value2="1"  class="radio" onclick="asignaValueRadio2Master('fdatValorFijo',this)"/> </td>
                            <td align="right">No <input type="RADIO" name="radValFij" id="fdatValorFijo2" class="radio" value="0" onclick="asignaValueRadio2Master('fdatValorFijo',this)"/></td>
                          </tr>
                      </table>
                  </td>
                </tr>
                </table>
                <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto">
                <tr>
                  <td width="20%">&nbsp;</td>
                  <td width="20%"class="texto">Referencia</td>
                  <td width="20%">
                    <textarea name="fdatValorReferencia" id="fdatValorReferencia" style="width:600px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
                  </td>
                </tr>
                <tr><td colspan="4">&nbsp;</td></tr>
                <tr>
                  <td align="center" valign="middle" colspan="4">
                    <input type="button" value="Aceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaMantoParArchSat(modo);" style="visibility:hidden"/>
                  </td>
                </tr>
              </table>
          </td>
      </tr>
    </table>
  </form>
