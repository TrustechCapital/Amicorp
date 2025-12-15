<FORM name="frmDatosCalendarioSesionesConsulta" id="frmDatosCalendarioSesionesConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Calendario de Sesiones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto">
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>No. Fideicomiso</td>
              <td width="8%">
                <input type="text" name="paramNumFiso" id="paramNumFiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
              </td>
              <td width="40%">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>No. Sesi&oacute;n</td>
              <td width="8%" colspan="2">
                <input type="text" name="paramNoSesion" id="paramNoSesion" size="15" maxlength="15"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>Lugar de Reuni&oacute;n</td>
              <td width="8%" colspan="2">
                <input type="text" name="paramLugarReun" id="paramLugarReun" size="25" maxlength="25" onblur="convertirMayusculas(this)"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>Agenda de Reuni&oacute;n</td>
              <td width="8%" colspan="2">
                <input type="text" name="paramAgendaReun" id="paramAgendaReun" size="30" maxlength="30" onblur="convertirMayusculas(this)"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>            
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>Fecha de Sesi&oacute;n</td>
              <td width="8%" colspan="2">
                <input type="text" name="txtFechaSesion1" id="txtFechaSesion1" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha1(this);"/>
                <input type="text" name="paramDiaSesion" id="paramDiaSesion" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="paramMesSesion" id="paramMesSesion" tipo="Num" size="2" style="visibility:hidden"/>
                <input type="text" name="paramAnoSesion" id="paramAnoSesion" tipo="Num" size="4" style="visibility:hidden"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%" nowrap>Status</td>
              <td width="8%" colspan="2">
                <select id="paramStatus" name="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosCalendarioSesiones" fun="loadTableElement" tabla="tablaRegistrosCalendarioSesiones" onclick="consultar(this, GI('frmDatosCalendarioSesionesConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar(frmDatosCalendarioSesionesConsulta);"/>
                </td>
                </tr>
            </table>
                
                
              </td>
            </tr>
            <tr>
              <td width="20%" colspan="5">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoCalendarioSesiones(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoCalendarioSesiones(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoCalendarioSesiones(3)"/> </td>                   
                  </td>
                </tr>
            </table>                
              </td>
            </tr>
            <tr>
              <td width="20%" colspan="5">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="5">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr class="cabeceras">
                    <td width="23px">&nbsp;</td>
                    <td width="90px">Fideicomiso</td>
                    <td width="80px">Sesi&oacute;n</td>
                    <td width="80px">A&ntilde;o Sesi&oacute;n</td>
                    <td width="80px">Mes Sesi&oacute;n</td>
                    <td width="80px">D&iacute;a Sesi&oacute;n</td>
                    <td width="250px">Lugar Sesi&oacute;n</td>
                    <td width="90px">Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:810px;">
                  <table id="tablaRegistrosCalendarioSesiones" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaCalendarioSesionesData" keys="recNumContrato,recNumReunion,recAnoReunion,recMesReunion,recDiaReunion" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
              </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
