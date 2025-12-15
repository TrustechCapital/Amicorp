<FORM name="frmPrincipalParametrosSeguridad" id="frmPrincipalParametrosSeguridad" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios Internos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">          
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de Fallas</td>
            <td>
              <input type="text" name="numFallas" id="numFallas" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>        
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de Caracteres</td>
            <td>
              <input type="text" name="numCaracteres" id="numCaracteres" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de Letras</td>
            <td>
              <input type="text" name="numLetras" id="numLetras" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
           <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de Numeros</td>
            <td>
              <input type="text" name="numNumeros" id="numNumeros" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de Historial</td>
            <td>
              <input type="text" name="numHistorial" id="numHistorial" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de dias de cambio</td>
            <td>
              <input type="text" name="numDiasCambio" id="numDiasCambio" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de dias de inactividad</td>
            <td>
              <input type="text" name="numDiasInactivo" id="numDiasInactivo" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Numero de dias de conecciones</td>
            <td>
              <input type="text" name="numConecciones" id="numConecciones" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Minimo de Coneccion</td>
            <td>
              <input type="text" name="numMinConeccion" id="numMinConeccion" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="28%">&nbsp;</td>
            <td nowrap width="8%">Password default</td>
            <td>
              <input type="text" name="PasswordDef" id="PasswordDef" tipo="AlphaNumeric" size="25" maxlength="25"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
          <tr>
            <td colspan="4">
            </td>
          <tr>
              <td colspan="4" align="center">
                <input type="text" name="paramorderName" id="paramorderName" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" onclick="funRegistraDatos();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalParametrosSeguridad'));"/>
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
</FORM>

