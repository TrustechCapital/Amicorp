<FORM name="frmPrincipalInterfaseSICA" id="frmPrincipalInterfaseSICA" onsubmit="">
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
            <tr valign="middle" align="center">
              <td width="20%">&nbsp;Fecha a Conciliar
              <input type="text" name="txtFechaConciliar" id="txtFechaConciliar" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFechaConciliar(this);" required message="La Fecha a Conciliar es un campo obligatorio"/></td>
            </tr>
            <tr>
              <td width="20%" align="center" valign="middle">&nbsp;
              </td>
            </tr>
            <tr>
              <td width="20%">
                <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                  <tr align="left" class="cabeceras">
                    <td width="23" align="center" nowrap>&nbsp;</td>
                    <td width="67" nowrap>Cuenta</td>
                    <td width="47" nowrap>S1</td>
                    <td width="54" nowrap>S2</td>
                    <td width="53" nowrap>S3</td>
                    <td width="107" nowrap>Saldo Inicial</td>
                    <td width="109" nowrap>Cargos</td>
                    <td width="106" nowrap>Abonos</td>
                    <td width="105" nowrap>Ente</td>
                    <td width="175" nowrap>Saldo Final</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                  <table id="tablaInterfasesSICA" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaInterfasesSICAData" radioWidth="23">
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
          <input type="BUTTON" id="hdInterfasesSICA" name="hdInterfasesSICA" ref="muestraDatosAcumulaSaldosSICA" fun="loadTableElementSpecial" tabla="tablaInterfasesSICA" style="visibility:hidden"/>
          <input type="BUTTON" value="   Validar   " name="cmdValidar" class="boton" onclick="botonValidarTransferir(true);"/>
          <input type="BUTTON" value=" Transferir  " name="cmdTransferir" class="boton" onclick="botonValidarTransferir(false);"/>
          <input type="BUTTON" value="Mantenimiento" name="cmdMantenimiento" class="boton" onclick="botonMantenimiento();"/>
        </td>
      </tr>
  </table>
</FORM>
