<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Calificaci&oacute;n de Emisiones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
        <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Emisi&oacute;n</td>
            <td valign="middle" height="6">
              <select size="1" name="ecalIdEmision" id="ecalIdEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="ecalIdPrograma"  required message="La Emisión es un campo obligatorio" onchange="cargaComboDependiente(this,false);determinaIdCalificacion(GI('ecalIdPrograma'),GI('ecalIdFideicomiso'),this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="15%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="13%" valign="middle" nowrap>Programa</td>
            <td valign="middle">
              <select size="1" disabled name="ecalIdPrograma" id="ecalIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="ecalIdFideicomiso" required message="El Programa es un campo obligatorio" onchange="showWaitLayer();"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="15%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="13%" valign="middle" nowrap>Fideicomiso</td>
            <td valign="middle">
              <select size="1" disabled  name="ecalIdFideicomiso" id="ecalIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="cmbCalificadora" onchange="showWaitLayer();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>No. de Calificaci&oacute;n</td>
            <td valign="middle" height="6">
              <input type="text" name="ecalIdCalificacion" id="ecalIdCalificacion" size="19" maxlength="19" tipo="Money" prec="16.2" reqPrecValue required message="El Id de Calificación es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Calificadora</td>
            <td valign="middle" height="6">
              <select size="1" name="cmbCalificadora" id="cmbCalificadora" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" next="ecalStEmicalif" param="cmbLoadParam523" required message="La Calificadora es un campo obligatorio" onchange="cargaComboCalificacion(this,GI('ecalCalificacion'),false);"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Calificaci&oacute;n</td>
            <td valign="middle" height="6">
              <select size="1" name="ecalCalificacion" id="ecalCalificacion" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" next="formsLoaded" param="paramCmb" required message="La Calificación es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Calificaci&oacute;n M&iacute;nima</td>
            <td valign="middle" height="6">
              <select size="1" name="ecalCalificacionMin" id="ecalCalificacionMin" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" next="formsLoaded" param="paramCmb">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Comentario</td>
            <td valign="middle" height="6">
              <textarea name="ecalComentario" id="ecalComentario" style="width:400px;height:80px" onkeydown="validaLongitud(this,300);"></textarea>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="13%" nowrap>Status</td>
            <td valign="middle" height="6">
              <select size="1" name="ecalStEmicalif" id="ecalStEmicalif" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">
        <input type="text" name="ecalCalificadora" id="ecalCalificadora" size="10" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Calificaciones.PrincipalCalificaciones','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
