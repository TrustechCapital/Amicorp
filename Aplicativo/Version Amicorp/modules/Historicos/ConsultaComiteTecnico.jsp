<FORM name="frmConsultaComiteTecnico" id="frmConsultaComiteTecnico" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Comite T&eacute;cnico &nbsp;de Fideicomisos Extintos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            <td width="16%" nowrap>N&uacute;m. Fideicomiso
            <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/></td>
            <td width="20%">&nbsp;
            </td>
            <td width="217">&nbsp;
            </td>
            <td width="27">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%" colspan="6">&nbsp;
            <label name="lblctoCveFormaMan" id="lblctoCveFormaMan"/>
            <label name="lblctoCveTipoNeg" id="lblctoCveTipoNeg"/>
            <label name="lblctoCveClasProd" id="lblctoCveClasProd"/>
            <label name="lblctoCveStContrat" id="lblctoCveStContrat"/>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="6" align="center" valign="middle">
              <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="historicoDatosComiteTecnico" fun="loadTableElement" tabla="tablaConsultaComiteTecnico" onclick="consultar(this, GI('frmConsultaComiteTecnico'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmConsultaComiteTecnico'));"/>
            </td>
          </tr>
            <tr>
              <td colspan="8" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="8" align="center" class="subtitulo">COMITE</td>
            </tr>
            <tr>
              <td width="20%" colspan="8">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="23" align="center" nowrap>&nbsp;</td>
                    <td width="92" nowrap>Fideicomiso</td>
                    <td width="139" nowrap>Comite</td>
                    <td width="138" nowrap>Facultades del Comite</td>
                    <td width="308" nowrap>Comentario del Comite</td>
                    <td width="109" nowrap>A&ntilde;o Constituci&oacute;n</td>
                    <td width="110" nowrap>Mes Constituci&oacute;n</td>
                    <td width="107" nowrap>D&iacute;a Constituci&oacute;n</td>
                    <td width="135" nowrap>Status</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaConsultaComiteTecnico" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConsComiteTecnicoData" keys="conNumContrato" fun="clickTabla" radioWidth="23">
                  </table>
              </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Miembros" name="cmdMiembros" class="boton" onclick="cargaConsultaMiembrosComiteTecnico();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
