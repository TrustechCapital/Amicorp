<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Asistentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Programa</td>
            <td width="20%" valign="middle">
              <select size="1" name="easiIdPrograma" id="easiIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="easiNomInstitucion" onchange="showWaitLayer(); cargaComboDependiente(this,false);" required message="El Programa es un campo obligatorio"/>
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Fideicomiso</td>
            <td width="20%" valign="middle">
              <select size="1" name="easiIdFideicomiso" id="easiIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="hideWaitLayer" param="paramCmb" onchange="showWaitLayer(); cargaComboDependiente(this,false);" required message="El Fideicomiso es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Emisi&oacute;n</td>
            <td width="20%" valign="middle">
              <select size="1" name="easiIdEmision" id="easiIdEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="hideWaitLayer" param="paramCmb" onchange="showWaitLayer(); cargaComboDependiente(this,false);" required message="La Emisión es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Sec. Asamblea</td>
            <td valign="middle" height="6" width="20%">
              <select size="1" name="easiIdSecAsamblea" id="easiIdSecAsamblea" ref="emision.conETCmbAsaAsiEmiPrgFid" fun="loadComboElement" keyValue="easaIdSecAsamblea" theValue="easaIdSecAsamblea" next="hideWaitLayer" param="paramCmb" onchange="asignaSecuencial(this);" required message="El Sec. Asamblea es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Sec. Participante</td>
            <td valign="middle" height="6" width="20%">
              <input type="text" name="easiIdParticipante" id="easiIdParticipante" size="10" maxlength="10" tipo="Num" required message="El Sec. Participante es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="20%">
              <!-- VALOR DE LOS TITULOS QUE REPRESENTA LA EMISION SELECCIONADA -->
              <input type="text" name="titulosReprEmision" id="titulosReprEmision" size="19" maxlength="19" tipo="Money" reqPrecValue prec="16.2"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Instituci&oacute;n</td>
            <td valign="middle" height="6" width="20%">
              <select size="1" name="easiNomInstitucion" id="easiNomInstitucion" ref="conETCmb2Cla" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="easiStAsisasam" param="cmbLoadParam26y27" required message="La Institución es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Representante</td>
            <td valign="middle" height="6" width="20%">
              <input type="text" name="easiNomParticipante" id="easiNomParticipante" size="50" maxlength="50" required message="El Representante es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>T&iacute;tulos que Representa</td>
            <td valign="middle" height="6" width="20%">
              <input type="text" name="easiTitulosRepresenta" id="easiTitulosRepresenta" size="19" maxlength="19" tipo="Money" reqPrecValue prec="16.2" onblur="verTitRepresenta();" required message="Títulos que Representa es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Status:</td>
            <td valign="middle" height="6" width="20%">
              <select size="1" name="easiStAsisasam" id="easiStAsisasam" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
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
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.ActaAsamblea.PrincipalActaAsamblea','')" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
