<FORM name="frmDetalleExtincion" id="frmDetalleExtincion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Detalle de Extinci&oacute;n</td>
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
            <td width="10%">N&uacute;m. Fideicomiso</td>
            <td width="16%" nowrap>
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="20%">&nbsp;
            </td>
            <td width="217">&nbsp;</td>
            <td width="217">&nbsp;
            </td>
            <td width="27">&nbsp;</td>
            <td width="27">&nbsp;</td>
            <td width="27">&nbsp;</td>
            <td width="27">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td width="10%">
              <label name="lblctoCveTipoPer" id="lblctoCveTipoPer"/>
            </td>
            <td width="16%">
              <label name="lblctoCveFormaMan" id="lblctoCveFormaMan"/>&nbsp;
            </td>
            <td>
              <label name="lblctoCveTipoNeg" id="lblctoCveTipoNeg"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <label name="lblctoCveClasProd" id="lblctoCveClasProd"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <label name="lblctoCveStContrat" id="lblctoCveStContrat"/>&nbsp;
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="11" align="center" valign="middle">&nbsp;
              <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" ref="historicoDatosDetalleExtincion" fun="loadTableElement" tabla="tablaDetalleExtincion" onclick="consultar(this, GI('frmDetalleExtincion'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmDetalleExtincion'));"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="11" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="11">
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1000;">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr class="cabeceras">
                    <td width="23" align="center" nowrap>&nbsp;</td>
                    <td width="77" nowrap>Fideicomiso</td>
                    <td width="171" nowrap>Motivo</td>
                    <td width="493" nowrap>Comentario</td>
                    <td width="112" nowrap>Fecha de Extinci&oacute;n</td>
                    <td width="139" nowrap>Usuario que Extingui&oacute;</td>
                    <td width="145" nowrap>Sustituci&oacute;n Fiduciaria</td>
                    <td width="135" nowrap>Fecha de Sustituci&oacute;n</td>
                  </tr>
                </table>              
                <table id="tablaDetalleExtincion" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDetalleExtincionData" keys="ctrContrato" fun="clickTabla" radioWidth="23">
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
        <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoDetalleExtincion();"/>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">&nbsp;
      </td>
    </tr>
  </table>
</FORM>
