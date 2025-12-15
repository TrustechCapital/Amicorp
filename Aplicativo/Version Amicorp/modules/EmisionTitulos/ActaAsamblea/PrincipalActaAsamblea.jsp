<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Asistentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td width="7%">Programa</td>
            <td>
              <select size="1" name="paramNoPrograma" id="paramNoPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="formsLoaded" onchange="showWaitLayer(); cargaComboDependiente(this,false);"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="7%">Fideicomiso</td>
            <td>
              <select size="1" name="paramNoFiso" id="paramNoFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="hideWaitLayer" param="paramCmb" onchange="showWaitLayer(); cargaComboDependiente(this,false);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="7%">Emisi&oacute;n</td>
            <td>
              <select size="1" name="paramNoEmision" id="paramNoEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="hideWaitLayer" param="paramCmb" onchange="showWaitLayer(); cargaComboDependiente(this,false);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="7%">Asamblea</td>
            <td>
              <select size="1" name="paramNoAsamblea" id="paramNoAsamblea" ref="emision.conETCmbAsaAsiEmiPrgFid" fun="loadComboElement" keyValue="easaIdSecAsamblea" theValue="easaIdSecAsamblea" next="hideWaitLayer" param="paramCmb">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="7%">Participante</td>
            <td>
              <input type="text" name="paramNomParticipante" id="paramNomParticipante" size="50" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;
              <input type="button" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="emision.conETPriParAsa" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoActaAsamblea(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoActaAsamblea(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoActaAsamblea(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoActaAsamblea(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="120" nowrap>Programa</td>
                  <td width="200" nowrap>Fideicomiso</td>
                  <td width="120" nowrap>Emisi&oacute;n</td>
                  <td width="90" nowrap>Sec. Asamblea</td>
                  <td width="200" nowrap>Participante</td>
                  <td width="200" nowrap>Instituci&oacute;n</td>
                  <td width="110" nowrap>T&iacute;tulos</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:1100px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="easiIdPrograma,easiIdFideicomiso,easiIdEmision,easiIdSecAsamblea,easiIdParticipante" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
