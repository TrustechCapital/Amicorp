<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Asambleas</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto">
            <tr valign="middle">
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Programa</td>
              <td width="20%" valign="middle" colspan="5">
                <select size="1" name="easaIdPrograma" id="easaIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="easaConvocatoria" onchange="showWaitLayer(); cargaComboDependiente(this,false);" required message="El Programa es un campo obligatorio"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fideicomiso</td>
              <td width="20%" valign="middle" colspan="5">
                <select size="1" name="easaIdFideicomiso" id="easaIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="hideWaitLayer" param="paramCmb" onchange="showWaitLayer(); cargaComboDependiente(this,false);" required message="El Fideicomiso es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Emisi&oacute;n</td>
              <td width="20%" valign="middle" colspan="5">
                <select size="1" name="easaIdEmision" id="easaIdEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="hideWaitLayer" param="paramCmb" onchange="asignaSecuencial(this);" required message="La Emisión es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>Sec. Asamblea</td>
              <td valign="middle" height="6" width="20%" colspan="5">
                <input type="text" name="easaIdSecAsamblea" id="easaIdSecAsamblea" size="10" maxlength="10" tipo="Num" required message="El Secuencial es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="20%" colspan="2">&nbsp;</td>
              <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>Fecha de Asamblea</td>
              <td valign="middle" height="6" width="20%" colspan="2">
                <input type="text" name="easaFecAsamblea" id="easaFecAsamblea" size="10" maxlength="10" tipo="Fecha"/>
              </td>
              <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="10%" nowrap>T&iacute;tulos de Circulaci&oacute;n</td>
              <td valign="middle" height="6" width="10%" nowrap>
                <input type="text" name="easaTitCirculacion" id="easaTitCirculacion" tipo="Money" size="19" maxlength="19" reqPrecValue prec="16.2"/>
              </td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="8%" nowrap>Hora de Asamblea</td>
              <td valign="middle" height="6" width="20%" nowrap colspan="2">
                <input type="text" name="easaHoraAsamblea" id="easaHoraAsamblea" size="10" maxlength="10"/>
              </td>
              <td width="8%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>T&iacute;tulos Representados</td>
              <td width="10%" valign="middle" nowrap>
                <input type="text" name="easaTitRepresentados" id="easaTitRepresentados" tipo="Money" size="19" maxlength="19" reqPrecValue prec="16.2"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" colspan="2">&nbsp;</td>
              <td width="8%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Lugar de Asamblea</td>
              <td width="20%" valign="middle" colspan="5">
                <input type="text" name="easaLugarAsamblea" id="easaLugarAsamblea" size="60" maxlength="150"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Quorum</td>
              <td valign="middle" height="6" width="5%">
                <input type="radio" name="rdQuorum" id="easaQuorum" class="radio" value2="1" onclick="asignaValueRadio2Master('easaQuorum',this)"/>Si
              </td>
              <td width="8%" valign="middle" nowrap>
                <input type="radio" name="rdQuorum" id="easaQuorumNo" class="radio" value="0" onclick="asignaValueRadio2Master('easaQuorum',this)"/>No
              </td>
              <td width="8%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="8%" valign="middle" nowrap>No. Convocatoria</td>
              <td valign="middle" height="6" width="5%" colspan="5">
                <select size="1" name="easaConvocatoria" id="easaConvocatoria" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" next="easaStAsamblea" param="cmbLoadParam532"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Status</td>
              <td valign="middle" height="6" width="5%" colspan="5">
                <select size="1" name="easaStAsamblea" id="easaStAsamblea" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="5%">&nbsp;</td>
              <td width="8%" valign="middle" nowrap>&nbsp;</td>
              <td width="8%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Acta</td>
              <td valign="middle" height="6" width="5%" colspan="5">
                <textarea name="easaActa" id="easaActa" style="width:400px;height:80px" onkeydown="validaLongitud(this,550);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Asamblea</td>
              <td valign="middle" height="6" width="5%" colspan="5">
                <textarea name="easaAsamblea" id="easaAsamblea" style="width:400px;height:80px" onkeydown="validaLongitud(this,550);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap height="14">&nbsp;</td>
              <td width="10%" valign="middle" nowrap height="14">Resoluci&oacute;n</td>
              <td valign="middle" height="14" width="5%" colspan="5">
                <textarea name="easaResolucion" id="easaResolucion" style="width:400px;height:80px" onkeydown="validaLongitud(this,550);"></textarea>
              </td>
              <td width="15%" valign="middle" nowrap height="14">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Asamblea.PrincipalAsamblea','')" style="visibility:hidden"/>
        </td>
      </tr>
  </table>
</FORM>
