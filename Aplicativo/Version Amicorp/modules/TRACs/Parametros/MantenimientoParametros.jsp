<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Par&aacute;metros</td>
      </tr>
      <tr>
        <td height="100%">
          <input type="hidden" name="patIdSerie" id="patIdSerie" value="10" size="5" maxlength="5" style="position:absolute;"/>
          <input type="hidden" name="patIdCupon" id="patIdCupon" size="0" maxlength="5" style="position:absolute;"/>  
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap>&nbsp;
                            </td>
                            <td nowrap>&nbsp;</td>
                            <td nowrap colspan="4">
                              &nbsp;&nbsp;
                            </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Pizarra</td>
              <td nowrap colspan="3">
                <select size="1" name="patIdPizarra" id="patIdPizarra" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiPizarra" theValue="femiPizarra"  param="cmbFideicomisoTrac" next="patStatusDia"/>
              </td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap colspan="3">
                &nbsp;
              </td>
              
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Hora Inicio</td>
              <td nowrap colspan =3>
                <input type="text" name="patHoraInicio" id="patHoraInicio" size="5" maxlength="5"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Hora Finalizaci�n</td>
              <td nowrap>
                <input type="text" name="patHoraFin" id="patHoraFin" size="5" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Ampliar Horario</td>
              <td nowrap colspan =3>
                <input type="checkbox" name="patAmpliarChk" id="patAmpliarChk" size="10" class="check" tv="1" fv="0">
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Hora de Ampliaci�n</td>
              <td nowrap>
                <input type="text" name="patHoraFina" id="patHoraFina" tipo="Num" size="5" maxlength="5"/>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Certificados por Unidad</td>
              <td nowrap colspan =3>
                <input type="text" name="patNumCertificados" id="patNumCertificados" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Asignaci�n Autom�tica</td>
              <td nowrap colspan =3>
                <input type="checkbox" name="patAsignacionAutomaticaChk" id="patAsignacionAutomaticaChk" tv="1" fv="0" class="check" size="10" maxlength="10"/>
              </td>
            </tr>
            
            
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>M�ximo Creaciones por D�a</td>
              <td nowrap colspan=3>
               <input type="text" name="patMaxCreaciones" id="patMaxCreaciones" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>% Certificados por Casa de Bolsa</td>
              <td nowrap colspan=3>
                <input type="text" name="patMaxCreacionesFin" id="patMaxCreacionesFin" tipo="Num" size="5" maxlength="3"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Comentario</td>
              <td nowrap colspan=3>
                <textarea name="patComentario" id="patComentario" style="width:200px;height:80px"></textarea>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Estatus del D�a</td>
              <td nowrap>
                <select size="1" name="patStatusDia" id="patStatusDia" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" next="loadCatalogo()" param="cmbParam660" required message="El Estatus es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">
                <input type="hidden" name="patStatus" value="ACTIVO" id="patStatus" tipo="Num" size="5" maxlength="2"/>
              </td>
              <td width="10%">&nbsp;</td>
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
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('TRACs.Parametros.PrincipalParametros','');" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
