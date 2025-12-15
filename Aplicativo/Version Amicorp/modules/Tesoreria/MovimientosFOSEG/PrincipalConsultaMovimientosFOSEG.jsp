<form name="frmDatosMovimientosFOSEG" id="frmDatosMovimientosFOSEG" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Movimientos&nbsp;de Fideicomisos FOSEG</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Fideicomiso</td>
            <td colspan="7">
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Presupuesto</td>
            <td>
              <input type="text" name="paramNumEjercicio" id="paramNumEjercicio" size="10" tipo="Num"/>
            </td>
            <td colspan="2">
              <input type="text" name="paramNumEje" id="paramNumEje" size="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumPrograma" id="paramNumPrograma" size="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumProyecto" id="paramNumProyecto" size="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumAccion" id="paramNumAccion" size="10" tipo="Num"/>
            </td>
            <td>
              <select size="1" name="paramNumOrigen" id="paramNumOrigen">
                <option value="-1">-- Seleccione --</option>
                <option value="1">FEDERAL</option>
                <option value="2">ESTATAL</option>
                <option value="3">RENDIMIENTOS</option>
              </select>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td class="textoRP" valign="top">&nbsp;</td>
            <td align="center" class="textoRP" valign="top">Ejercicio</td>
            <td align="center" colspan="2" class="textoRP" valign="top">Eje</td>
            <td align="center" class="textoRP" valign="top">Programa</td>
            <td align="center" class="textoRP" valign="top">Proyecto</td>
            <td align="center" class="textoRP" valign="top">Acci&oacute;n</td>
            <td align="center" class="textoRP" valign="top">Origen de los Recursos</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Fecha Mov.</td>
            <td class="subtitulo">
              <input type="text" name="paramFechaDel" id="paramFechaDel" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td class="subtitulo">al</td>
            <td class="subtitulo">
              <input type="text" name="paramFechaAl" id="paramFechaAl" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="10" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="10">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriMovFOSEG" fun="loadTableElementSpecial" tabla="tblRegPriMovFOSEG" onclick="consultar(this, frmDatosMovimientosFOSEG, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosMovimientosFOSEG);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="10">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="10">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr class="cabeceras">
                  <td width="71" nowrap>Fecha</td>
                  <td width="80" nowrap>Fideicomiso</td>
                  <td width="61" nowrap>Ejercicio</td>
                  <td width="31" nowrap>Eje</td>
                  <td width="69" nowrap>Programa</td>
                  <td width="63" nowrap>Proyecto</td>
                  <td width="47" nowrap>Acci&oacute;n</td>
                  <td width="58" nowrap>Folio</td>
                  <td width="192" nowrap>Acuerdo</td>
                  <td width="242" nowrap>Concepto</td>
                  <td width="188" nowrap>Tipo Operaci&oacute;n</td>
                  <td width="100" nowrap>Importe</td>
                  <td width="90" nowrap>Origen</td>
                  <td width="84" nowrap>Compromiso</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriMovFOSEG" dataInfo="arrTblMovFODEGDat" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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
      <td height="100%" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
