<FORM name="frmDatosPoderesConsulta" id="frmDatosPoderesConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Poderes</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="100%" class="texto">
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>Tipo Apoderado</td>
              <td colspan="2">
                <select id="paramTipoApoderado" name="paramTipoApoderado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="paramNotarioOto" param="clavesCombo96"/>
              </td>
              <td colspan="2">&nbsp;</td>
              <td nowrap>Nom Apoderdado</td>
              <td>
                <input type="text" name="paramNomApoderado" id="paramNomApoderado" size="40" maxlength="70" onblur="this.value=this.value.toUpperCase();"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td>&nbsp;</td>
              <td colspan="2">
                <input type="radio" name="rdOtoRev" id="Otorgamiento" class="radio" onclick="modificaParametrosBusqueda();"/>&nbsp;Otorgamiento
              </td>
              <td colspan="2">&nbsp;</td>
              <td colspan="2" nowrap>
                <input type="radio" name="rdOtoRev" id="Revocacion" class="radio" onclick="modificaParametrosBusqueda();"/>&nbsp;Revocaci&oacute;n
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;
              </td>
              <td colspan="7">
                <hr/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>Escritura</td>
              <td colspan="2">
                <input type="text" name="paramEscrituraOto" id="paramEscrituraOto" size="30" maxlength="30"/>
              </td>
              <td colspan="2">&nbsp;</td>
              <td nowrap>Fecha de Escritura</td>
              <td>
                <input type="text" name="paramFechaEscrituraOto" id="paramFechaEscrituraOto" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>Notario</td>
              <td colspan="2">
                <select size="1" name="paramNotarioOto" id="paramNotarioOto" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="paramAbogadoResponsableOto" param="paramOrderNotario"/>
              </td>
              <td colspan="2">&nbsp;</td>
              <td nowrap>Fecha Solicitud</td>
              <td>
                <input type="text" name="paramFechaSolicitudOto" id="paramFechaSolicitudOto" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>Abogado Responsable</td>
              <td colspan="6">
                <select size="1" name="paramAbogadoResponsableOto" id="paramAbogadoResponsableOto" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="paramStatus"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;
              </td>
              <td colspan="7">
                <hr/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>Otorgante</td>
              <td style="visibility:hidden">
                <input type="radio" name="rdReferencia" id="Referencia3" class="radio" onclick="GI('paramReferencia').value = 3;"/>Protego</td>
              <td nowrap>
                <input type="radio" name="rdReferencia" id="Referencia2" class="radio" onclick="GI('paramReferencia').value = 2;"/>&nbsp;Fiduciario
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>
                <input type="radio" name="rdReferencia" id="Referencia1" class="radio" onclick="GI('paramReferencia').value = 1;"/>&nbsp;Fideicomiso
              </td>
              <td>
                <input type="text" name="paramReferencia" id="paramReferencia" tipo="Num" size="1" maxlength="10" style="visibility:hidden"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>No. Fideicomiso</td>
              <td colspan="2">
                <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td nowrap>Status Poder</td>
              <td>
                <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="9">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="9" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosPoderes" fun="loadTableElement" tabla="tablaRegistrosPoderes" onclick="consultar(this, GI('frmDatosPoderesConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmDatosPoderesConsulta'));"/>
                </td>
                </tr>
              </table>   
                
                
              </td>
            </tr>
            <tr>
              <td colspan="9">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="9" align="center">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoPoderesOtorgamientoRevocacion(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoPoderesOtorgamientoRevocacion(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoPoderesOtorgamientoRevocacion(3)"/> </td>                   
                  </td>
                </tr>
                </table>    
                
              </td>
            </tr>
            <tr>
              <td colspan="9">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="9" align="center">                
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr class="cabeceras">
                    <td nowrap width="23">&nbsp;</td>
                    <td nowrap width="80">Fideicomiso</td>
                    <td nowrap width="300">Nombre del Apoderado</td>
                    <td nowrap width="175">Escritura de Otorgamiento</td>
                    <td nowrap width="200">Notario</td>
                    <td nowrap width="100">Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top;100%">
                  <table id="tablaRegistrosPoderes" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaPoderesData" keys="podIdPoder,podNumPoder" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
