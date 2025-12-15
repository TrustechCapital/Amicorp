<FORM name="frmDatosContactosFideicomisosConsulta" id="frmDatosContactosFideicomisosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Contactos&nbsp;de Fideicomisos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table align="center" class="texto" width="100%">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td nowrap width="15%">Fideicomiso</td>
              <td>
                <input type="text" name="paramNumFiso" id="paramNumFiso" tipo="Num" size="10" maxlength="10" onblur="mostrarDatosInformativos(1);"/>
              </td>
              <td nowrap>Cto. Eje</td>
              <td>
                <input type="text" name="txtCtoEje" id="txtCtoEje" tipo="Num" size="10"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td nowrap width="15%">Nombre</td>
              <td colspan="3">
                <input type="text" name="txtNombre" id="txtNombre" tipo="AlphaNumeric" size="70"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td nowrap width="15%">Tipo de Persona</td>
              <td>
                <input type="text" name="txtTipoPersona" id="txtTipoPersona" tipo="AlphaNumeric" size="10"/>
              </td>
              <td nowrap>&nbsp;</td>
              <td>
                <input type="text" name="txtNoCliente" id="txtNoCliente" tipo="Num" size="10" style="visibility:hidden"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="6">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="6" align="center">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosContactosFideicomisos" fun="loadTableElement" tabla="tablaRegistrosContactosFideicomisos" onclick="consultar(this, GI('frmDatosContactosFideicomisosConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmDatosContactosFideicomisosConsulta'));"/>
                </td>
                </tr>
            </table> 
                
                
              </td>
            </tr>
            <tr>
              <td colspan="6" align="center">
                <input type="text" name="paramorder" id="paramorder" size="1" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td colspan="6" align="center">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoContactosFideicomisos(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoContactosFideicomisos(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoContactosFideicomisos(3)"/> </td>                   
                  </td>
                </tr>
            </table>
               
              </td>
            </tr>
            <tr>
              <td colspan="6">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="6">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr class="cabeceras">
                    <td width="23px" nowrap>&nbsp;</td>
                    <td width="90px" nowrap>Fideicomiso</td>
                    <td width="250px" nowrap>Nombre</td>
                    <td width="250px" nowrap>Dependencia</td>
                    <td width="150px" nowrap>Cargo</td>
                    <td width="90px" nowrap>Status</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:890px">
                  <table id="tablaRegistrosContactosFideicomisos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaContactosFideicomisosData" keys="conNumSecContac,conNumContrato" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
