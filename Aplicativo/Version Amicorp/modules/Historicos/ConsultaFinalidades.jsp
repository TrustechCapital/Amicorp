<FORM name="frmConsultaFinalidades" id="frmConsultaFinalidades" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Finalidades de Fideicomisos Extintos</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="16%">&nbsp;</td>
              <td width="16%">N&uacute;m. Fideicomiso</td>
              <td width="20%">
                <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center" valign="middle">&nbsp;
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="historicoDatosFinalidades" fun="loadTableElementSpecial" tabla="tablaConsultaFinalidades" onclick="consultar(this, GI('frmConsultaFinalidades'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmConsultaFinalidades'));"/>
              </td>
            </tr>
            <tr>
              <td width="20%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" colspan="5">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="79">Fideicomiso</td>
                    <td width="89">Finalidad</td>
                    <td width="236">Tipo</td>
                    <td width="61">N&uacute;mero</td>
                    <td width="320">Nombre</td>
                    <td width="151">Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaConsultaFinalidades" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConsFinalidadesData">
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
