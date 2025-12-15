<FORM name="frmDatosMantenimientoAgenda" id="frmDatosMantenimientoAgenda" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Agenda de Eventos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Folio</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" name="eageIdFolio" id="eageIdFolio" tipo="Num" size="10" maxlength="10" onblur="ejecutaAsignaFolio();" required message="El Número de Folio es un campo obligatorio"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Tipo</td>
              <td  width="10%" valign="middle">
                <input type="text" name="eageCveTipo" id="eageCveTipo" size="20" maxlength="20" disabled/>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>No. Fideicomiso</td>
              <td valign="middle" width="5%">
                <input type="text" name="eageFideicomiso" id="eageFideicomiso" tipo="Num" size="10" maxlength="10" required message="El Número de Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
              </td>
              <td valign="middle" colspan="5">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Subcuenta</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" name="eageSubcuenta" id="eageSubcuenta" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td  width="10%" valign="middle">
                &nbsp;
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="top" nowrap>Asunto</td>
              <td width="27%" valign="middle" colspan="5">
                <textarea name="eageDesEvento" id="eageDesEvento" onkeydown="validaLongitud(this,350);" required style="width:650px"/></textarea>
              </td>
            </tr>
            <tr>
            <td width="1%" valign="top" nowrap>Descripción</td>
              <td  width="10%" valign="middle" colspan="5">
                <textarea id="eageTextEvento" name="eageTextEvento" onkeydown="validaLongitud(this,350);"  style="width:650px"></textarea>
              </td>
              
            <tr>
            <td width="1%" valign="top" nowrap>Acción Tomada</td>
              <td width="27%" valign="middle" colspan="5">
                <textarea name="eageAccionTomada" id="eageAccionTomada" onkeydown="validaLongitud(this,300);" style="width:650px"></textarea>
              </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
            </tr>  
            
            <!-- fechas -->
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap class="subtitulo" colspan="7">Fecha<hr/></td>
            </tr>
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Fecha Inicial</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" id="eageFecEvento" name="eageFecEvento" maxlength="10" size="10" onclick="consultaFeriados();" tipo="Fecha" required message="La Fecha Inicial es un campo obligatorio"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Fecha Final</td>
              <td  width="10%" valign="middle">
                <input type="text" id="eageFecFinEvento" name="eageFecFinEvento" maxlength="10" size="10" onclick="consultaFeriados();" tipo="Fecha"/>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap class="subtitulo" colspan="7">Eventos<hr/></td>
            </tr>
            <tr valign="middle">
              <!--td width="1%" valign="middle" nowrap>Programable</td>
              <td  width="10%" valign="middle">
                <input type="checkbox" name="eageProgamableChk" id="eageProgamableChk" class="check" tv="1" fv="0"/>
                <!--<input type="checkbox" name="ctoCveArt28Chk" id="ctoCveArt28Chk" class="check" tv="1" fv="0"/>Sujeto Art. 28 LISR->
              </td-->
              <td width="1%" valign="middle" nowrap>Periodicidad</td>
              <td width="27%" valign="middle" colspan="2">
                <select size="1" name="eagePeriodicidad" id="eagePeriodicidad" ref=claves fun=loadComboElement keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo52" next="eageCveStatus" onchange="validaDiaPeriodicidad(this);"/>
              </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Estatus</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageCveStatus" id="eageCveStatus" ref=claves fun=loadComboElement keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo7" next="eageDiaOrdinario"/>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>  
              
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Día</td>
              <td width="27%" valign="middle" colspan="2">
                <input disabled type="text" name="eageDiaHabil" id="eageDiaHabil" tipo="Num" size="10" maxlength="10" onblur="validaDia(this);"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>
                Día hábil inmediato
              </td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageCveFeriado" id="eageCveFeriado">
                  <option value="ANTERIOR">ANTERIOR</option>
                  <option value="SIGUIENTE">SIGUIENTE</option>
                </select>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap class="subtitulo" colspan="7">
                <input type="checkbox" name="eagePeriodoEspecialChk" id="eagePeriodoEspecialChk" class="check" tv="1" fv="0" onclick="periodosEpeciales(this);"/>
                &nbsp;Periodos Especiales<hr/>
              </td>
            </tr>
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Día</td>
              <td width="27%" valign="middle" colspan="2">  
                <select size="1" disabled name="eageDiaOrdinario" id="eageDiaOrdinario" ref=claves fun=loadComboElement keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo630" next="eageNumUsuario2"/>
              
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Día Hábil ó Natural?</td>
              <td  width="10%" valign="middle">
                <select size="1" disabled name="eageCveDiaHabnat" id="eageCveDiaHabnat">
                  <option value="">-- Seleccione --</option>
                  <option value="HABIL">HABIL</option>
                  <option value="NATURAL">NATURAL</option>
                </select>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            <!--..................................................................-->
            
            <tr>
              <td width="10%" colspan="7" valign="middle" class="subtitulo">
                Usuarios
                <hr/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>No. Usuario</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" id="eageNumUsuario" name="eageNumUsuario" maxlength="10" size="10"  tipo="Num" disabled>
              </td>
              
               <td width="1%" valign="middle" nowrap>Nombre de Usuario</td>
              <td width="27%" valign="middle" colspan="2">
               <input type="text" id="eageNombre" name="eageNombre" size="20" disabled>
              </td>
            </tr>
            
            <tr valign="middle">
              <td width="100%" colspan=7 valign="middle" nowrap>Enviar a:
              <a id="linkReporteNew" href="#" target="_new" style="visibility:hidden">Archivo</a>
              </td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Usuario 1</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageNumUsuario2" id="eageNumUsuario2" ref=muestraUsuariosActivos fun=loadComboElement keyValue="perNumUsuario" theValue="perNomUsuario" param="statusUsuActivo" next="eageNumUsuario3"/>
              </td>
              <td width="5%" valign="middle" nowrap>Usuario 2</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageNumUsuario3" id="eageNumUsuario3" ref=muestraUsuariosActivos fun=loadComboElement keyValue="perNumUsuario" theValue="perNomUsuario" param="statusUsuActivo" next="eageNumUsuario4"/>
              </td>
            </tr>
              <td width="1%" valign="middle" nowrap>Usuario 3</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageNumUsuario4" id="eageNumUsuario4" ref=muestraUsuariosActivos fun=loadComboElement keyValue="perNumUsuario" theValue="perNomUsuario" param="statusUsuActivo" next="eageNumUsuario5"/>
              </td>
              <td width="5%" valign="middle" nowrap>Usuario 4</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageNumUsuario5" id="eageNumUsuario5" ref=muestraUsuariosActivos fun=loadComboElement keyValue="perNumUsuario" theValue="perNomUsuario" param="statusUsuActivo" next="loadCatalogo"/>
                
                <input type="hidden" id="eageUsuModificacion" name="eageUsuModificacion" maxlength="10" size="10"  tipo="Num">
                <input type="hidden" id="eageFecModificacion" name="eageFecModificacion" maxlength="10" value="" size="10"  tipo="Num">
                <input type="hidden" id="eagePrograma" name="eagePrograma" maxlength="10" value=0 size="10"  tipo="Num" >
                <input type="hidden" id="eageEmision" name="eageEmision" maxlength="10" value=0 size="10"  tipo="Num" >
                <input type="hidden" id="eageSecEmision" name="eageSecEmision" maxlength="10" value=0 size="10"  tipo="Num">
                <input type="hidden" id="eageFolioPadre" name="eageFolioPadre" maxlength="10" value=0 size="10"  tipo="Num">
                
                
                <input type="hidden" id="eageNumEventos" name="eageNumEventos" maxlength="10" value=0 size="10"  tipo="Num">
              </td>
            </tr>
          </table>
        </td>
      </tr>
      
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalAgenda();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
