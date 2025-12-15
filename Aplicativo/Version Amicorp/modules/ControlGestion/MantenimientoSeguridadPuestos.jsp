<FORM name="frmMantenimientoSeguridadPuestos" id="frmMantenimientoSeguridadPuestos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Perfiles</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td>Puesto</td>
            <td>
              <input type="text" name="fperIdPerfil" id="fperIdPerfil" tipo="Num" size="10" maxlength="10" required message="El Número de Puesto es un dato obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td>Nombre</td>
            <td>
              <input type="text" name="fperNombrePerfil" id="fperNombrePerfil" tipo="AlphaNumeric" size="50" maxlength="255" required message="El Nombre del Puesto es un dato obligatorio"/>
            </td>
            
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td></td>
            
            <td width="33%" colspan="2">
              <input type="checkbox" name="fperTokenChk" id="fperTokenChk" class="check" tv="1" fv="0">Usa Token
            </td>
            <td>&nbsp;</td>
          </tr>          
          
          <tr>
            <td width="25%">&nbsp;</td>
            <td></td>
            
            <td width="33%" colspan="2">
              <input type="checkbox" name="fperInternoChk" id="fperInternoChk" class="check" tv="1" fv="0" disabled="disabled" checked="true">Perfil Interno
            </td>
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
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadPuestos();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
