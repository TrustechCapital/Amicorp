<FORM name="frmDatosNotariosConsulta" id="frmDatosNotariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Notarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>N&uacute;mero Oficial</td>
              <td width="216">
                <input type="text" name="paramNumeroOficial" id="paramNumeroOficial" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="217">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Nombre</td>
              <td colspan="2">
                <input type="text" name="paramNombre" id="paramNombre" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
             <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Localidad</td>
              <td colspan="2">
                <input type="text" name="paramLocalidad" id="paramLocalidad" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosNotarios" fun="loadTableElement" tabla="tablaRegistrosNotarios" onclick="consultar(this, GI('frmDatosNotariosConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmDatosNotariosConsulta'));"/>
                </td>
                </tr>
              </table>   
                
                
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoNotarios(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoNotarios(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoNotarios(3)"/> </td>                   
                  </td>
                </tr>
                </table>  
                
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" colspan="5">
                <table cellpadding="0" border="0" class="texto" cellspacing="1">
                  <tr align="left" class="cabeceras">
                    <td width="23" align="center">&nbsp;</td>
                    <td width="100">N&uacute;mero oficial</td>
                    <td width="300">Nombre</td>
                    <td width="150">Localidad</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:575;">
                  <table id="tablaRegistrosNotarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaNotariosData" keys="notNumNotario" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
