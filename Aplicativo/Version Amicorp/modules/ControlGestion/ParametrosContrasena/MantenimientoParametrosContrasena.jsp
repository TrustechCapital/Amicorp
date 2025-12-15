<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Configuraci&oacute;n Passwords</td>
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
              <td nowrap >Id</td>
              <td nowrap>
                <input type="text" name="empNumEmpresa" id="empNumEmpresa" tipo="Num" value="1" disabled size="5" maxlength="5"/>
              </td>
              <td nowrap colspan=6 style="font-weight:bold;">&nbsp;PROTEGO CASA DE BOLSA S.A. de C.V.</td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Bloqueo de Usuarios</td>
              <td nowrap colspan=6>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Fallas</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="10" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>No. D&iacute;as Inactivo</td>
              <td nowrap>
                <input type="text" name="empNomArea" id="empNomArea" size="10" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Validación Password</td>
              <td nowrap colspan=6>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Caracteres</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="10" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>No. Coincidencias</td>
              <td nowrap>
                <input type="text" name="empNomArea" id="empNomArea" size="10" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Letras</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="10" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>No. Numeros</td>
              <td nowrap>
                <input type="text" name="empNomArea" id="empNomArea" size="10" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%" class="subtitulo">Parámetros</td>
              <td nowrap colspan=6>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Conexiones</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="10" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Desconectar en (min. inactivo)</td>
              <td nowrap>
                <input type="text" name="empNomArea" id="empNomArea" size="10" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Renovación password (días)</td>
              <td nowrap colspan =3>
                <input type="text" name="empNomEmpresa" id="empNomEmpresa" size="10" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Password genérico</td>
              <td nowrap>
                <input type="password" name="empNomArea" id="empNomArea" size="15" maxlength="10"/>
                &nbsp;
                <input type="checkbox" name="empNomArea" class="check" id="empNomArea"  /> Ocultar
              </td>
              
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
