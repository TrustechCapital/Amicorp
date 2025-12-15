<FORM name="frmPagoHonorariosConsulta" id="frmPagoHonorariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Cobro de Honorarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="40%">&nbsp;</td>
              <td width="8%">No. Fideicomiso</td>
              <td colspan="4">
                <input type="text" name="paramNumCto" id="paramNumCto" tipo="Num" size="10"/>
              </td>
              <td width="8%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%" colspan="7">
                <input type="text" name="paramCveCalifHono" id="paramCveCalifHono" size="10" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="15%" align="center" colspan="7">&nbsp;
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="muestraDatosComposicionCartera" fun="loadTableElement" tabla="tablaRegistrosPagoHonorarios" onclick="validacionesPorContrato();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="cargaPrincipalPagoHonorarios()"/>
              </td>
            </tr>
            <tr>
              <td colspan="7" align="center" valign="middle">
                <input type="text" name="paramorder" id="paramorder" size="1" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td colspan="7" align="center" valign="middle">
                <input type="BUTTON" value=" Pagar " name="cmdPagar" size="20%" class="boton" onclick="cargaPrincipalPagoHonorariosConsulta2();"/>
              </td>
            </tr>
            <tr>
              <td colspan="7" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="7" align="center" valign="middle" class="subtitulo">COMPOSICION DE CARTERA POR FIDEICOMISO</td>
            </tr>
            <tr align="center">
              <td colspan="7">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center">&nbsp;</td>
                    <td width="120px">Persona Fid.</td>
                    <td width="50px">No.</td>
                    <td width="215px">Honorarios</td>
                    <td width="150px">Fecha C&aacute;lculo</td>
                    <td width="100px">Secuencia</td>
                    <td width="90px">Orig. Honor</td>
                    <td width="95px">Rem. Honor.</td>
                    <td width="115px">Calif. Hono.</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:995px;">
                  <table id="tablaRegistrosPagoHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaPagoHonorariosData" keys="decCveTipoHono,decNumPersFid,decCvePersFid,decNumContrato,decFecCalcHono,decNumSecuencial" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
            <tr>
              <td valign="middle" width="40%">&nbsp;</td>
              <td valign="middle" colspan="3" width="55%">&nbsp;</td>
              <td valign="middle" width="20%" align="right">&nbsp;</td>
              <td valign="middle">
                <div id="txtTotCartera" class="textoNegrita"/>
              </td>
              <td valign="middle" width="8%">&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" width="40%">&nbsp;</td>
              <td valign="middle" colspan="3" width="55%">&nbsp;</td>
              <td valign="middle" width="30%" align="right">&nbsp;</td>
              <td valign="middle">&nbsp;</td>
              <td valign="middle" width="8%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
