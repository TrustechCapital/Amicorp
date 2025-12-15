<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Cuentas NAFIN</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">Fideicomiso</td>
            <td nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" ref="conPriCueNafFid" fun="loadTableElement" tabla="tblRegCueNafFid"/>
            </td>
            <td colspan="5" width="70%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="consulta">&nbsp;</div>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="onButtonClickPestania('ControlGestion.OperacionesFideicomiso.PrincipalOperacionesFideicomiso','');"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="9">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="100" nowrap>Fideicomiso</td>
                  <td width="300" nowrap>Banco / Cuenta</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:423px">
                <table id="tblRegCueNafFid" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegCueNafFid" keys="ctnNumContrato,ctnCuenta" fun="clickTabla" radioWidth="23">
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
        <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCuentasFideicomiso(1)"/>
        <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCuentasFideicomiso(2)"/>
        <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCuentasFideicomiso(3);"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
