<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Acreditaciones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
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
              <td nowrap width="15%">Casa de Bolsa</td>
              <td nowrap colspan="3">
                <select size="1" name="acrIdIntermediario" id="acrIdIntermediario" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave"  param="clavesCombo26" next="acrStatus"/>
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
              <td nowrap width="15%">Riesgo</td>
              <td nowrap colspan="3">
                <input type="checkbox" name="acrRiesg0Chk" id="acrRiesg0Chk" class="check" tv="1" fv="0"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Docto. Riesgo</td>
              <td nowrap colspan="3">
                <input type="FILE" name="acrDoctoRiesgo" id="acrDoctoRiesgo"/>
                <input type="button" value="Mostrar " name="cmdMostrar" class="boton" onclick="" >
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
              
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Fecha Aceptaci&oacute;n</td>
              <td nowrap colspan=3>
                <input type="text" id="acrFecAceptacion" name="acrFecAceptacion" maxlength="10" size="10" tipo="Fecha" required message="La Fecha de Aceptación es un campo obligatorio"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Cta. Indeval</td>
              <td nowrap>
                <input type="text" id="acrCtaIndevalInt" name="acrCtaIndevalInt" maxlength="10" size="10"  required message="La cuenta Indeval es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Máximo Creaciones por Día</td>
              <td nowrap colspan=3>
                <input type="text" id="acrNumCreaciones" name="acrNumCreaciones" maxlength="10" size="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Cta. Indeval *</td>
              <td nowrap>
                <input type="text" id="acrCtaIndevalInt1" name="acrCtaIndevalInt1" maxlength="10" size="10" />
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Comentario</td>
              <td nowrap colspan=3>
                <textarea name="acrComentario" id="acrComentario" style="width:200px;height:80px"></textarea>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Estatus</td>
              <td nowrap>
                <select size="1" name="acrStatus" id="acrStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo()" param="clavesCombo31" required message="El Estatus es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="7">&nbsp;</td>
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
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" ><!--style="visibility:hidden"/>-->
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('TRACs.Acreditaciones.PrincipalAcreditaciones','');" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
