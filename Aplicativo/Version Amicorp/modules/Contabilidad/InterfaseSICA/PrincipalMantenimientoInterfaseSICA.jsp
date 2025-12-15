<FORM name="frmPrincipalMantenimientoInterfaseSICA" id="frmPrincipalMantenimientoInterfaseSICA" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Conciliaci&oacute;n Contable (SICA)</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>No. de Cuenta</td>
              <td>
                <input type="text" name="paramNumCuenta" id="paramNumCuenta" tipo="Num" size="5" maxlength="4"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">&nbsp;</td>
              <td align="left" valign="middle">
                <P>&nbsp;</P>
              </td>
              <td align="left" valign="middle">A&ntilde;o</td>
              <td valign="middle">
                <input type="text" name="paramAno" id="paramAno" tipo="Num" size="5" maxlength="4"/>
              </td>
              <td valign="middle">&nbsp;</td>
              <td valign="middle">&nbsp;
              </td>
            </tr>
            <tr>
              <td valign="middle">&nbsp;</td>
              <td valign="middle">&nbsp;</td>
              <td valign="middle">Mes</td>
              <td align="left" valign="middle">
                <input type="text" name="paramMes" id="paramMes" tipo="Num" size="3" maxlength="2"/>
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
              <td align="left" valign="middle">&nbsp;</td>
              <td align="left" valign="middle">&nbsp;
              </td>
            </tr>
            <tr>
              <td width="20%" align="center" valign="middle" colspan="6">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" align="center" valign="middle" colspan="6">
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="  Aceptar  " class="boton" ref="muestraSaldoConcilia" fun="loadTableElement" tabla="tablaSaldoConcilia" onclick="consultar(this, GI('frmPrincipalMantenimientoInterfaseSICA'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="  Limpiar  " name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalMantenimientoInterfaseSICA'));"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </td>
            </tr>
            <tr>
              <td width="20%" align="center" valign="middle" colspan="6">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="20%" colspan="6">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="23" align="center" nowrap>&nbsp;</td>
                    <td width="67" nowrap>Cuenta</td>
                    <td width="47" nowrap>S1</td>
                    <td width="54" nowrap>S2</td>
                    <td width="53" nowrap>S3</td>
                    <td width="107" nowrap>Tipo Ente</td>
                    <td width="109" nowrap>Ente</td>
                    <td width="106" nowrap>A&ntilde;o</td>
                    <td width="105" nowrap>Mes</td>
                    <td width="175" nowrap>Saldo Inicial</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaSaldoConcilia" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaSaldoConciliaData" keys="sicNumCtam,sicNumScta,sicNumSscta,sicNumSsscta,sicNumSssscta,sicNumSsssscta,sicTipoEnte,sicEnte,sicAno,sicMes" fun="clickTabla" radioWidth="23">
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
          <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton"/>
          <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton"/>
          <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton"/>
          <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton"/>
          <input type="BUTTON" value=" Cancelar" name="cmdCancelar" class="boton" onclick="botonPrincipalCancelar();"/>
        </td>
      </tr>
  </table>
</FORM>
