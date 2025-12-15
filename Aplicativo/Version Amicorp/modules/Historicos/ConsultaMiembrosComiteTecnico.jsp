<FORM name="frmConsultaMiembrosComiteTecnico" id="frmConsultaMiembrosComiteTecnico" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Miembros del Comite T&eacute;cnico (Fideicomisos Extintos)</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;
          <input type="BUTTON" id="hdMiembrosComiteTecnico" name="hdMiembrosComiteTecnico" ref="historicoDatosMiembrosComiteTecnico" fun="loadTableElementSpecial" tabla="tablaConsultaMiembrosComiteTecnico" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="16%">&nbsp;</td>
              <td width="16%">&nbsp;</td>
              <td width="16%">N&uacute;m. Fideicomiso</td>
              <td colspan="2">
                <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" size="10" maxlength="10" tipo="Num"/>
              </td>
              <td colspan="3">
              </td>
            </tr>
            <tr>
              <td width="16%" colspan="8">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" class="subtitulo" align="center" colspan="8">MIEMBROS</td>
            </tr>
            <tr>
              <td width="16%" colspan="8">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="262">Nombre del Miembro</td>
                    <td width="93">RFC</td>
                    <td width="308">Nombre de la Instituci&oacute;n</td>
                    <td width="172">Nombre del Puesto</td>
                    <td width="106">Status</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaConsultaMiembrosComiteTecnico" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConsMiembrosComiteTecnicoData">
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
          <input type="BUTTON" value="Regresar" name="cmdCancelar" class="boton" onclick="cargaConsultaComiteTecnico();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
