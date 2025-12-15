<FORM name="frmCondonacionHonorarios" id="frmCondonacionHonorarios" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Condonaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="40%">&nbsp;</td>
              <td width="10%">No. Fideicomiso</td>
              <td>
                <input type="text" name="paramNumCto" id="paramNumCto" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%" colspan="4" align="center">
                <input name="paramCveCalifHono" id="paramCveCalifHono" tipo="AlphaNumeric" size="10" value="PENDIENTE" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="15%" align="center" colspan="4">&nbsp;
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="muestraDatosComposicionCartera" fun="loadTableElement" tabla="tablaRegistrosCondonacionHonorarios" onclick="validacionesPorContrato();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmCondonacionHonorarios'));"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
                <input type="BUTTON" value=" Condonar " name="cmdCondonar" size="20%" class="boton" onclick="cargaPrincipalCondonacionHonorarios2();"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle" class="subtitulo">COMPOSICION DE CARTERA POR FIDEICOMISO</td>
            </tr>
            <tr align="center">
              <td colspan="4">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center">&nbsp;</td>
                    <td width="120px">Persona Fid.</td>
                    <td width="50px">No.</td>
                    <td width="215px">Honorarios</td>
                    <td width="150px">Fecha C&aacute;lculo</td>
                    <td width="130px">Secuencia</td>
                    <td width="90px">Orig. Honor</td>
                    <td width="95px">Rem. Honor.</td>
                    <td width="85px">Calif. Hono.</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:995px;">
                  <table id="tablaRegistrosCondonacionHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaCondonacionoHonorariosData" keys="decCveTipoHono,decNumPersFid,decCvePersFid,decNumContrato,decFecCalcHono,decNumSecuencial" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
