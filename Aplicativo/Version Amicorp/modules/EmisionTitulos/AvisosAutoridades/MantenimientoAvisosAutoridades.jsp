<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Avisos a Autoridades</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Id RC</td>
            <td valign="middle" width="8%" colspan="2">  
                <input type="text" name="idRC" id="idRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaEmisor(this,GI('eaavIdPrograma'),GI('eaavIdFideicomiso'),GI('eaavIdEmision'))"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Programa</td>
            <td valign="middle" width="8%" colspan="2">
              <select size="1" disabled name="eaavIdPrograma" id="eaavIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="eaavIdFideicomiso"  param="cmbPrograma" required message="El Programa es un campo obligatorio">
               <option value="0">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Fideicomiso</td>
            <td valign="middle" width="8%" colspan="2">
              <select size="1" disabled name="eaavIdFideicomiso" id="eaavIdFideicomiso"  ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="eaavIdEmision" param="cmbFideicomiso" >
                <option value="0">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Emisi&oacute;n</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="eaavIdEmision" id="eaavIdEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="eaavIdAutoridad" param="cmbEmision"  required message="La Emisión es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Autoridad</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="eaavIdAutoridad" id="eaavIdAutoridad" ref="conETCmbAut" fun="loadComboElement" keyValue="eautIdAutoridad" theValue="eautNomAutoridad" next="eaavIdResponsable" param="paramAutoridad" required message="La Autoridad es un campo obligatorio" onchange="cargaComboDependiente(this,false);"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Responsable</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="eaavIdResponsable" id="eaavIdResponsable" ref="conETCmbRes" fun="loadComboElement" keyValue="eareIdResponsable" theValue="eareNomResponsable" next="asignaValues2ObjHTML" required message="El Responsable es un campo obligatorio"> <!-- param="paramCmb" -->
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <!--tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>D&iacute;as Antes</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="text" name="eaavIdDiasAntes" id="eaavIdDiasAntes" size="3" maxlength="3" tipo="Num" required message="Días Antes es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr-->
          <!--tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Aviso</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="eaavIdTipoAviso" id="eaavIdTipoAviso" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" next="asignaValues2ObjHTML" param="cmbLoadParam527" required message="El Tipo Aviso es un campo obligatorio"/>
              </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr-->
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              <input type="checkbox" name="eaavNuevoPeriodoChk" id="eaavNuevoPeriodoChk" class="check" tv="1" fv="0"/>&nbsp;Nuevo Periodo
            </td>
            <td valign="middle" height="6" width="2%">&nbsp;
            </td>
            <td valign="middle" height="6" width="12%" nowrap>
              <input type="checkbox" name="eaavPublicaChk" id="eaavPublicaChk" class="check" tv="1" fv="0"/>&nbsp;&iquest;P&uacute;blica?
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              <input type="checkbox" name="eaavDiasHabilesChk" id="eaavDiasHabilesChk" class="check" tv="1" fv="0"/>&nbsp;D&iacute;as H&aacute;biles</td>
            <td valign="middle" height="6" width="8%" colspan="2">&nbsp;
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap><!--Status--></td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <!--select size="1" name="eaavStAutaviso" id="eaavStAutaviso" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/-->
                <input type="text" name="eaavStAutaviso" id="eaavStAutaviso" tipo="Texto" size="10" maxlength="5" value="ACTIVO" style="visibility:hidden;"/>
                <input type="text" name="eaavIdTipoAviso" id="eaavIdTipoAviso" value="AMORTIZACION" style="position:absolute;visibility:hidden;"/>
                <input type="text" name="eaavIdDiasAntes" id="eaavIdDiasAntes" value="0" style="position:absolute;visibility:hidden;"/>
                
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.AvisosAutoridades.PrincipalAvisosAutoridades','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
