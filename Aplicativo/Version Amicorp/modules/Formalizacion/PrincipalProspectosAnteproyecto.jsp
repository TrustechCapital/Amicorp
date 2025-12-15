<FORM name="frmProspectosAnteproyectoConsulta" id="frmProspectosAnteproyectoConsulta" onsubmit="">
<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Proyecto</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto" align="center">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Proyecto</td>
            <td>
              <input type="text" name="paramAnteproyecto" id="paramAnteproyecto" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNombre" id="paramNombre" size="50" maxlength="100"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Abogado</td>
            <td>
              <select size="1" name="paramAbogado" id="paramAbogado" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="paramStatus"/>
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbEjecutivo" param="clavesCombo161"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="100%" colspan="4" align="center" valign="middle">
            <table width="224" cellpadding="0" cellspacing="0">
              <tr>
              <td width="112"  align="center" valign="middle">
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosAnteproyecto" fun="loadTableElement" tabla="tablaProspectosAnteproyecto" onclick="consultar(this, GI('frmProspectosAnteproyectoConsulta'), false); ocultaMuestraFiso('hidden');">
                </td>
                <td width="112" align="center" valign="middle">
                <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';"  onclick="RF(GI('frmProspectosAnteproyectoConsulta'));"/>              
              </td>
              </tr>
            </table>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
            <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoProspectosAnteproyectoGenerales(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoProspectosAnteproyectoGenerales(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoProspectosAnteproyectoGenerales(3)"/> </td>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Asignar Fideicomiso" id="cmdAsignar" name="cmdAsignar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="asignarFideicomisoExisPersona();"/> </td>                  
				   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Constituir" id="cmdConstituir" name="cmdConstituir" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="constituirFideicomiso();"/> </td>                  				   
                  </td>
                </tr>
            </table>              
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="70" nowrap>No.</td>
                  <td width="300" nowrap>Proyecto</td>
                  <td width="150" nowrap>Tipo de Negocio</td>
                  <td width="150" nowrap>Clasificaci&oacute;n</td>
                  <td width="150" nowrap>Producto</td>
                  <td width="80" nowrap>No. Fiso</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:923px;">
                <table id="tablaProspectosAnteproyecto" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaProspectosAnteproyectoData" keys="antNumProspecto,antNumProducto,antNumContrato,prsCveStatus,prsFecConstit" fun="clickTabla" radioWidth="35" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
                        <table id="tablaFiso" style="visibility:hidden;" class="texto" border=0 cellspacing="0" cellpadding="0" width="50%">
                              <tr>
                              <td>&nbsp;</td>
                              <td colspan=4 class="subtitulo">No. Fideicomiso<hr/></td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td width="20%">&nbsp;</td>
                              <td>
                                &nbsp;
                              </td>
                              <td>&nbsp;</td>
                              <td width="10%">
                                <input type="BUTTON" id="cmdFiso" name="cmdFiso" value="Generar Fiso" class="boton"  onclick="determinaFideicomiso();">
                              </td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>Fideicomiso</td>
                              <td>
                                <input type="text" disabled name="txtNoFideicomiso" id="txtNoFideicomiso" tipo="Num" size="10" onblur="verificaNoExistaFideicomiso();"/>
                              </td>
                              <td colspan=3>&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan=6>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>
                                <input type="BUTTON" id="cmdAceptaFiso" name="cmdAceptaFiso" value="Aceptar" class="boton"  onclick="botonFideicomiso('ACEPTAR');">
                              </td>
                              <td>
                                <input type="BUTTON" id="cmdCancelaFiso" name="cmdCancelaFiso" value="Cancelar" class="boton_x"  onclick="botonFideicomiso('CANCELAR');">
                              </td>
                              <td>&nbsp;</td>
                            </tr>
                        </table>
            </td>
          </tr>
		  <!--SECCION PARA CONSTITUIR FIDEICOMISO-->
          <tr>
            <td colspan="4" align="center">
                        <table id="tablaConstitucion" style="visibility:hidden;" class="texto" border=0 cellspacing="0" cellpadding="0" width="50%">
                            <tr>
                              <td>&nbsp;</td>
                              <td>Ejecutivo</td>
                              <td>
                                <select size="1" name="cmbEjecutivo" id="cmbEjecutivo" ref="claveAdministrador" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="formsLoaded"/>
                              </td>
                              <td colspan=3>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>Fecha Constitucion</td>
                              <td>
                                <input type="text" name="txtFechaConstitucion" id="txtFechaConstitucion"  size="10"/>
                              </td>
                              <td colspan=3>&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan=6>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>
                                <input type="BUTTON" id="cmdAceptaFiso" name="cmdAceptaFiso" value="Aceptar" class="boton"  onclick="botonFideicomisoConstitucion('ACEPTAR');">
                              </td>
                              <td>
                                <input type="BUTTON" id="cmdCancelaFiso" name="cmdCancelaFiso" value="Cancelar" class="boton_x"  onclick="botonFideicomisoConstitucion('CANCELAR');">
                              </td>
                              <td>&nbsp;</td>
                            </tr>
                        </table>
            </td>
          </tr>		  
        </table>
      </td>
    </tr>
</table>
</FORM>