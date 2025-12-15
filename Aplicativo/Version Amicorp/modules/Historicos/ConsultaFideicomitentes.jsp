<FORM name="frmConsultaFideicomitentes" id="frmConsultaFideicomitentes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Fideicomitentes &nbsp;de Fideicomisos Extintos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="103">&nbsp;</td>
              <td width="103">&nbsp;</td>
              <td width="103">&nbsp;</td>
              <td width="103">N&uacute;m. Fideicomiso</td>
              <td width="216">
                <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="217">&nbsp;
              </td>
              <td width="27">&nbsp;</td>
              <td width="27">&nbsp;</td>
            </tr>
            <tr>
              <td width="103">&nbsp;</td>
              <td width="103">&nbsp;</td>
              <td width="103">&nbsp;</td>
              <td width="103">&nbsp;</td>
              <td width="216">&nbsp;</td>
              <td width="217">&nbsp;
              </td>
              <td width="27">&nbsp;</td>
              <td width="27">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="8" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="8" align="center" valign="middle">&nbsp;
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="historicoDatosFideicomitentes" fun="loadTableElementSpecial" tabla="tablaConsultaFideicomitentes" onclick="consultar(this, GI('frmConsultaFideicomitentes'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmConsultaFideicomitentes'));"/>
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="8" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="8">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="107">N&uacute;mero</td>
                    <td width="603">Fideicomitente</td>
                    <td width="221">Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaConsultaFideicomitentes" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConsFideicomitentesData">
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
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
