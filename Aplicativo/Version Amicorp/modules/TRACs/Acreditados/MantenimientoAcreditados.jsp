<FORM name="frmDatosMantenimiento" id="frmDatosMantenimiento" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Acreditados</td>
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
                <select size="1" name="actIdIntermediario" id="actIdIntermediario" ref="cmbCasasBolsa" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave"  param="clavesCombo26" next="actStatus"/>
              </td>
              <td nowrap width="15%">Id. Acreditado</td>
              <td nowrap colspan="3">
                <input type="text" name="actIdAcreditado" id="actIdAcreditado" tipo="Num" size="5" maxlength="10" required message="El Número Oficial es un campo obligatorio"/>
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
              <td nowrap width="15%">Nombre</td>
              <td nowrap colspan="3">
                <input type="text" name="actNombreAcreditado" id="actNombreAcreditado" tipo="AlphaNumeric" size="30" maxlength="15" required message="El RFC es un campo obligatorio"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Puesto</td>
              <td nowrap colspan="3">
                <input type="text" name="actPuesto" id="actPuesto" tipo="AlphaNumeric" size="20" maxlength="30"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Firma</td>
              <td nowrap colspan="3">
                <iframe id="frameUpload" align="center" style="z-index:1;" src="<%=request.getContextPath()%>/modules/TRACs/Acreditados/ImageUpload.do" frameborder="0" scrolling="no" width="350" height="50" AllowTransparency></iframe>
                
              
                <!--<input type="FILE" name="actFirmaAcreditado" id="actFirmaAcreditado"/>
                <input type="button" value="Mostrar " name="cmdMostrar" class="boton" onclick="AltaOModificaInfo();" >-->
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>
                &nbsp;
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Email</td>
              <td nowrap colspan="3">
                <input type="text" name="actEmail" id="actEmail" tipo="AlphaNumeric" size="20" maxlength="15" />
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Tel&eacute;fono 1</td>
              <td nowrap>
                <input type="text" name="actNumTelefono1" id="actNumTelefono1" tipo="Num" size="20" maxlength="15" required message="El Teléfono es un campo obligatorio"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap colspan="3">
                &nbsp;
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">Tel&eacute;fono 2*</td>
              <td nowrap>
                <input type="text" name="actNumTelefono2" id="actNumTelefono2" tipo="Num" size="20" maxlength="15"/>
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">&nbsp;</td>
              <td nowrap colspan="3">
                &nbsp;
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td nowrap>
                &nbsp;
              </td>
              <td nowrap width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Comentario</td>
              <td nowrap colspan=3>
                <textarea name="actComentario" id="actComentario" style="width:200px;height:80px"></textarea>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Status</td>
              <td nowrap>
                <select size="1" name="actStatus" id="actStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
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
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('TRACs.Acreditados.PrincipalAcreditados','');" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
