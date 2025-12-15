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
              <td width="1%" valign="middle" nowrap>Programa</td>
              <td width="27%" valign="middle" colspan="2">
                  <select size="1" name="eagePrograma" id="eagePrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="eageFideicomiso" onchange="cargaComboSiguiente2(this);" style="width:120;"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td  width="10%" valign="middle">
                &nbsp;
               </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
             <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Fideicomiso</td>
              <td width="27%" valign="middle" colspan="2">
                  <select size="1" name="eageFideicomiso" id="eageFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" param="cmbFideicomisoParam" next="eageEmision" onchange="cargaComboSiguiente2(this);" style="width:120;"/>
               </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td  width="10%" valign="middle">
                 &nbsp;
               </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Emision</td>
              <td width="27%" valign="middle" colspan="2">
                  <select size="1" name="eageEmision" id="eageEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie"  param="cmbEmisionParam" next="eageCveStatus" style="width:120;"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td  width="10%" valign="middle">
                 &nbsp;
               </td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Subcuenta</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" name="eageSubcuenta" id="eageSubcuenta" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Fecha</td>
              <td  width="10%" valign="middle">
                <input type="text" id="eageFecEvento" name="eageFecEvento" maxlength="10" size="10" onclick="consultaFeriados();" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
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
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Programable</td>
              <td  width="10%" valign="middle">
                <input type="checkbox" name="eageProgamableChk" id="eageProgamableChk" class="check" tv="1" fv="0"/>
                <!--<input type="checkbox" name="ctoCveArt28Chk" id="ctoCveArt28Chk" class="check" tv="1" fv="0"/>Sujeto Art. 28 LISR-->
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>Estatus</td>
              <td  width="10%" valign="middle">
                <select size="1" name="eageCveStatus" id="eageCveStatus" ref=claves fun=loadComboElement keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo7" next="eagePeriodicidad"/>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>  
              
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>Periodicidad</td>
              <td width="27%" valign="middle" colspan="2">
                <select size="1" name="eagePeriodicidad" id="eagePeriodicidad" ref=claves fun=loadComboElement keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo52" next="eageNumUsuario2" required/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>No. Eventos</td>
              <td  width="10%" valign="middle">
                <input type="text" id="eageNumEventos" name="eageNumEventos" maxlength="10" size="10"  tipo="Num" required>
              </td>
              <td width="7%" valign="middle">&nbsp;</td>
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
            
            <!--..................................................................-->
            
            <tr>
              <td width="10%" colspan="7" valign="middle">
                <hr/>
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
