<FORM name="frmDatosFideicomisariosConsulta" id="frmDatosFideicomisariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Fideicomisarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="7%" nowrap>Fideicomiso</td>
              <td>
                <input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="10" maxlength="10" onblur="verificacionActivo();"/>
              </td>
                <td><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="7%" nowrap>No. Fideicomisario</td>
              <td>
                <input type="text" name="paramFideicomisario" id="paramFideicomisario" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="7%" nowrap>Nombre</td>
              <td colspan="2">
                <input type="text" name="paramNombre" id="paramNombre" size="50" maxlength="50" onblur="this.value=this.value.toUpperCase()"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="7%" nowrap>Status</td>
              <td colspan="2">
                <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="cmbStatus" param="clavesCombo31"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">                
                  <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosFideicomisariosAdministracion" fun="loadTableElement" tabla="tablaRegistrosFideicomisarios" onclick="consultar(this, GI('frmDatosFideicomisariosConsulta'), false);GI('dvHonorarios').style.visibility = 'hidden';">
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar(frmDatosFideicomisariosConsulta);"/>
                </td>
                </tr>
            </table> 
                
                
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoFideicomisarios(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoFideicomisarios(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoFideicomisarios(3)"/> </td>                   
					<td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Prop Real" id="cmdPropReal" name="cmdPropReal" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoFideicomisarios(4)"/> </td>                   				   				   
                  </td>
                </tr>
            </table>
                
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="5">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center" nowrap>&nbsp;</td>
                    <td width="100px" nowrap>No. Fideicomiso</td>
                    <td width="80px" nowrap>No.</td>
                    <td width="300px" nowrap>Fideicomisario</td>
                    <td width="220px" nowrap>Representante</td>
                    <td width="90px" nowrap>Status</td>
                    <td width="100px" nowrap>Nivel Riesgo</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:910px;">
                  <table id="tablaRegistrosFideicomisarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaFideicomisariosData" keys="benNumContrato,benBeneficiario,honPjeFragComis" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de b�squeda">
                  </table>
                </div>
              </td>
            </tr>
            
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              
                <table class="texto" cellspacing="0" cellpadding="2" id="dvHonorarios" style="visibility:hidden;" width="50%">
                    <tr>
                      <td colspan="2" class="subtitulo">
                        Honorarios
                        <hr/>
                      </td>
                    </tr>
                    <tr>
                      <td nowrap >Porcentaje de Fragmentaci�n</td>
                      <td>
                        <input type="text" name="txtPjeFragmentacion" id="txtPjeFragmentacion" size="10" maxlength="8" tipo="Money"/>
                      </td>
                    </tr>
                    <tr>
                      <td nowrap>Status</td>
                      <td>
                        <select size="1" name="cmbStatus" id="cmbStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
                      </td>
                    </tr>
                    <tr>
                      <td nowrap>
                        <input type="BUTTON" value="Limpiar" id="cmdHBorrar" name="cmdHBorrar" class="boton_x" onclick="ejecutaFunParapaho('BORRAR');">
                      </td>
                      <td>
                        <input type="BUTTON" value="Actualizar" id="cmdHActualizar" name="cmdHActualizar" class="boton" onclick="ejecutaFunParapaho('ACTUALIZAR');">
                      </td>
                    </tr>
                  
                </table>
              
              </td>
            </tr>
            
          </table>
        </td>
      </tr>
  </table>
</FORM>
