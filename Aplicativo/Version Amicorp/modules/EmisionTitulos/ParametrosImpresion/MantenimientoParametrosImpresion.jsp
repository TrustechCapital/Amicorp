<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Par&aacute;metros de Impresi&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="15%" valign="middle" nowrap>Id RC</td>
            <td valign="middle">
               <input type="text" name="idRC" id="idRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaEmisor(this,GI('envpIdPrograma'),GI('envpIdFideicomiso'),GI('envpIdEmision'))"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="15%" valign="middle" nowrap>Programa</td>
            <td valign="middle">
              <select size="1" disabled name="envpIdPrograma" id="envpIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="envpIdFideicomiso" required message="El Programa es un campo obligatorio"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
            <td width="15%" valign="middle" nowrap>Fideicomiso</td>
            <td valign="middle">
              <select size="1" disabled name="envpIdFideicomiso" id="envpIdFideicomiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" param="cmbFideicomiso"  next="envpIdEmision">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Emisi&oacute;n</td>
            <td valign="middle" height="6">
              <select size="1" name="envpIdEmision" id="envpIdEmision"  ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" param="cmbEmision"  next="envpIdTipoAviso"  required message="La Emisión es un campo obligatorio" onchange="determinaIdSecuencial();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Tipo Aviso</td>
            <td valign="middle" height="6">
              <select size="1" name="envpIdTipoAviso" id="envpIdTipoAviso" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" next="envpIdNumPos" param="cmbLoadParam527" required message="El Tipo Aviso es un campo obligatorio" onchange="determinaIdSecuencial();"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Posici&oacute;n en Reporte</td>
            <td valign="middle" height="6">
              <select size="1" name="envpIdNumPos" id="envpIdNumPos" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" next="cmbAutoridad" param="cmbLoadParam533" required message="La Posición en Reporte es un campo obligatorio" onchange="determinaIdSecuencial();"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Secuencial</td>
            <td valign="middle" height="6">
              <input type="text" name="envpIdSecuencial" id="envpIdSecuencial" size="6" maxlength="6" tipo="Num" required message="El Secuencial es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Autoridad</td>
            <td valign="middle" height="6">
              <select size="1" name="cmbAutoridad" id="cmbAutoridad" ref="conETCmbAut" fun="loadComboElement" keyValue="eautIdAutoridad" theValue="eautNomAutoridad" next="envpStAutenvp" param="paramAutoridad" onchange="showWaitLayer(); cargaComboDependiente(this,false);"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Responsable</td>
            <td valign="middle" height="6">
              <select size="1" name="envpNombre" id="envpNombre" ref="conETCmbRes" fun="loadComboElement" keyValue="eareNomResponsable" theValue="eareNomResponsable" next="hideWaitLayer" param="paramCmb" onchange="asignaPuestoResponsable(this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Puesto</td>
            <td valign="middle" height="6">
              <textarea name="envpPuesto" id="envpPuesto" style="width:400px;height:50px" onkeydown="validaLongitud(this,200);" disabled class="inputLocked"></textarea>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Direcci&oacute;n</td>
            <td valign="middle" height="6">
              <textarea name="envpDireccion" id="envpDireccion" style="width:400px;height:50px" onkeydown="validaLongitud(this,250);" disabled class="inputLocked"></textarea>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="15%" nowrap>Status</td>
            <td valign="middle" height="6">
              <select size="1" name="envpStAutenvp" id="envpStAutenvp" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;
      <input type="text" name="envpNomAut" id="envpNomAut" size="50" maxlength="200" style="visibility:hidden"/></td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.ParametrosImpresion.PrincipalParametrosImpresion','')" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
