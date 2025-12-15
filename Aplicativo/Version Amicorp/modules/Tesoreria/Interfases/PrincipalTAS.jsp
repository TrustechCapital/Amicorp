<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmTas" id="frmTas" method="post">

      <input type="hidden" id="paramInterfaceID" name="paramInterfaceID" value="1" />
      <input type="hidden" id="paramFechaAnt" name="paramFechaAnt" value="" />
      <input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="1" />
      <input type="hidden" id="paramUsuario" name="paramUsuario" value="300" />
      
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Interface TAS</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td align="right" nowrap>Fecha:</td>
              <td align="center">
                <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" required>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <hr/>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <iframe id="frameUpload" align="middle" style="z-index:1;" src="<%=request.getContextPath()%>/modules/Tesoreria/Interfaces/TasUpload.do" frameborder="0" scrolling="no" width="600" height="50"></iframe>
                <div id="dvInterface" class="texto"></div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
    </form>
  </table>
  
  <div id="dvFileUpload" style="position: absolute; top: 0; left: 0;"></div>
</TD>
