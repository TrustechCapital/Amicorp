<FORM name="frmConsultaTerceros" id="frmConsultaTerceros" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Terceros &nbsp;de Fideicomisos Extintos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="16%" nowrap>&nbsp;</td>
            <td width="20%">N&uacute;m. Fideicomiso
            </td>
            <td width="217">
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="27">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">
              <label name="lblctoCveTipoPer" id="lblctoCveTipoPer"/>
            </td>
            <td width="16%">
              <label name="lblctoCveFormaMan" id="lblctoCveFormaMan"/>&nbsp;
            </td>
            <td>
              <label name="lblctoCveTipoNeg" id="lblctoCveTipoNeg"/>
            </td>
            <td>
              <label name="lblctoCveClasProd" id="lblctoCveClasProd"/>
              </td>
            <td>
              <label name="lblctoCveStContrat" id="lblctoCveStContrat"/>&nbsp;
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="5" align="center" valign="middle">&nbsp;
              <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" ref="historicoDatosTerceros" fun="loadTableElementSpecial" tabla="tablaConsultaTerceros" onclick="consultar(this, GI('frmConsultaTerceros'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmConsultaTerceros'));"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="5">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                <tr class="cabeceras">
                  <td width="124">No. Tercero</td>
                  <td width="345">Nombre</td>
                  <td width="188">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
              <table id="tablaConsultaTerceros" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConsTercerosData">
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
      <td height="100%" align="center">&nbsp;
      </td>
    </tr>
  </table>
</FORM>
