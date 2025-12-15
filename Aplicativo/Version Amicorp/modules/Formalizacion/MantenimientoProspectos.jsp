<FORM name="frmDatosMantenimientoProspectos" id="frmDatosMantenimientoProspectos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
      <td rowspan="6" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Prospectos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="-3" border="0" class="texto">
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">No. Prospecto</td>
            <td width="50%">
              <input type="text" name="prsNumProspecto" id="prsNumProspecto" tipo="Num" size="10" maxlength="10" required message="El N�mero de Prospecto es un campo obligatorio" onblur="verificaExistaProspecto();"/>
            </td>
            <td nowrap width="20px">&nbsp;</td>
            <td nowrap width="13%"></td> 
            <td width="17%">
               <input type="text" name="prsEjecAsig" id="prsEjecAsig" tipo="Num" size="10" required message="El Ejecutivo responsable es un campo obligatorio" value="0" style="visibility:hidden;"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Nombre o Raz&oacute;n Social</td>
            <td valign="middle" width="50%">
              <input type="text" name="prsNomProspecto" id="prsNomProspecto" size="50" maxlength="50" required message="El Nombre del Prospecto es un campo obligatorio"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%">RFC</td>
            <td width="17%">
              <input type="text" name="prsRfc" id="prsRfc" tipo="AlphaNumeric" size="15" maxlength="15"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Tipo de Persona</td>
            <td width="50%"><select size="1" name="antTipoNegSat" id="antTipoNegSat" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="prsCorreo2" param="clavesCombo23" required message="El Tipo de Persona es un campo obligatorio"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%" valign ="top">Giro/Actividad</td>
            <td width="17%">
              <table width="17%"><tr><td>
              <select size="1" name="prsCorreo2" id="prsCorreo2" ref="claveActividad" fun="loadComboElement" keyValue="actNumRama" theValue="actNomRama" next="prsNomNacion" required message="El Sec. de Atenci�n es un campo obligatorio" onchange="cargaComboSubRamas(this,false);"/>              
              </td>
              <tr></tr>
              <td>
              <select size="1" name="prsCveActividad" id="prsCveActividad" ref="consultaActividades" fun="loadComboElement" keyValue="actNomRama" theValue="actNomRama" next="formsLoaded" param="numRama" required message="El Sec. de Atenci�n es un campo obligatorio"/>              
              </td>
              </tr>
              </table>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Nacionalidad</td>
            <td width="50%"><select size="1" name="prsNomNacion" id="prsNomNacion" ref="claveNacionalidad" fun="loadComboElement" keyValue="nacNomNacional" theValue="nacNomNacional" next="prsCveMigra" required message="La Nacionalidad es un campo obligatorio" onchange="validaNacionalidad('NACION')"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%">Calidad Migratoria</td>
            <td width="17%">
              <select size="1" name="prsCveMigra" id="prsCveMigra" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="prsNomPais" param="clavesCombo16" required message="La Calidad Migratoria es un campo obligatorio" onchange="validaNacionalidad('MIGRA')"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">&nbsp;</td>
            <td nowrap width="50%">&nbsp;</td>
            <td width="20px">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td class="subtitulo" width="19%">Domicilio</td>
            <td class="subtitulo" width="50%">&nbsp;</td>
            <td width="20px">&nbsp;</td>
            <td colspan="2" class="subtitulo">Datos de Contacto</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">&nbsp;</td>
            <td nowrap width="50%">&nbsp;</td>
            <td width="20px">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Calle y N&uacute;mero</td>
            <td width="50%">
              <input type="text" name="prsNomCalle" id="prsNomCalle" size="50" maxlength="50"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td nowrap width="19%">Nombre</td>
            <td width="50%">
              <input type="text" name="prsNomContacto" id="prsNomContacto" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Colonia</td>
            <td width="50%">
              <input type="text" name="prsNomColonia" id="prsNomColonia" size="50" maxlength="50"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td nowrap width="19%">Tel&eacute;fono 1</td>
            <td width="50%">
              <input type="text" name="prsTelCasa" id="prsTelCasa" size="50" maxlength="50"/>
              
            </td>
            
            
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Poblaci&oacute;n</td>
            <td width="50%">
              <input type="text" name="prsNomPoblacion" id="prsNomPoblacion" size="50" maxlength="50"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%">Tel&eacute;fono 2</td>
            <td width="17%">
            <input type="text" name="prsTelOficina" id="prsTelOficina" size="50" maxlength="50"/>
              
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Municipio o Delegaci&oacute;n</td>
            <td width="50%">
              <input type="text" name="prsNomDelegacion" id="prsNomDelegacion" size="50" maxlength="50"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%">Celular</td>
            <td width="17%">
              <input type="text" name="prsTelContacto" id="prsTelContacto" size="50" maxlength="50"/>
            </td>
            
             
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Pa&iacute;s</td>
            <td width="50%"><select size="1" name="prsNomPais" id="prsNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="loadCatalogo" onchange="cargaParamComboEstado(this,false);"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td width="13%">Fax</td>
            <td width="17%">            
              <input type="text" name="prsTelFax" id="prsTelFax" size="50" maxlength="50"/>
            </td>
            
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Estado</td>
            <td width="50%"><select size="1" name="prsNomEstado" id="prsNomEstado" ref="claveEstado" fun="loadComboElement" keyValue="edoNomEstado" theValue="edoNomEstado" next="formsLoaded" param="parametroComboEstado">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="20px">&nbsp;</td>
            
            <td width="13%">Correo</td>
            <td width="17%">
              <input type="text" name="prsFaxContacto" id="prsFaxContacto" size="50" maxlength="50"/>
            </td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
           <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td width="13%">C&oacute;digo Postal</td>
            <td nowrap width="17%">
              <input type="text" name="prsCodigoPostal" idname="prsCodigoPostal" tipo="Num" size="10" maxlength="10"/>
            </td>            
            <td nowrap width="10%">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="17%">
            &nbsp;
              <!--input type="text" name="prsCorreo2" id="prsCorreo2" size="50" maxlength="50"/-->
            </td>
            <td width="20px">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap class="subtitulo" width="19%">&nbsp;</td>
            <td nowrap class="subtitulo" width="50%">&nbsp;</td>
            <td nowrap class="subtitulo" width="20px">&nbsp;</td>
            <td nowrap class="subtitulo" width="13%">&nbsp;</td>
            <td nowrap class="subtitulo" width="17%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>          
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">&nbsp;</td>
            <td width="50%">&nbsp;</td>
            <td class="subtitulo" width="20px">&nbsp;</td>
            <td nowrap width="13%">&nbsp;</td>
            <td nowrap width="17%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>          
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="20px">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap class="subtitulo">Persona que Recomienda</td>
            <td nowrap class="subtitulo">&nbsp;</td>
            <td nowrap class="subtitulo" width="20px">&nbsp;</td>
            <td nowrap class="subtitulo">&nbsp;</td>
            <td nowrap class="subtitulo">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="20px">&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="17%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Nombre</td>
            <td width="50%">
              <input type="text" name="prsNomEjecutivo" id="prsNomEjecutivo" size="50" maxlength="50"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td nowrap width="13%">Tel&eacute;fono</td>
            <td width="17%">
              <input type="text" name="prsTelEjecutivo" id="prsTelEjecutivo" size="20" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Fecha Inicio Negociaci&oacute;n</td>
            <td width="50%">
              <input type="text" name="prsFecProspecto" id="prsFecProspecto" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td width="20px">&nbsp;</td>
            <td nowrap width="13%">Status</td>
            <td width="17%">
              <input type="text" name="prsCveStatus" id="prsCveStatus" size="10" maxlength="25" value="ACTIVO" disabled class="inputLocked"/>
            </td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="19%">Fideicomiso</td>
            <td width="50%">
              <input type="text" name="prsNumContrato" id="prsNumContrato" tipo="Num" size="10" maxlength="10" disabled/>
            </td>
            <td width="20px">&nbsp;</td>
            <td nowrap width="13%">Fecha de Constituci&oacute;n</td>
            <td nowrap width="17%">
              <input type="text" name="prsFecConstit" id="prsFecConstit" tipo="Fecha" size="10" maxlength="10" disabled/>
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
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectos();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
