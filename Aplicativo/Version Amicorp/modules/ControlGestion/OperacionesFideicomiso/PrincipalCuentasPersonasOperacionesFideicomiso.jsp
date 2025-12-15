<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Operaciones Por Fideicomiso</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td width="15%">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td nowrap colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="consultaCuentasAsignadas">&nbsp;</div>
            </td>
            <td>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" style="visibility:hidden"/>
              <input type="text" name="txtAux" id="txtAux" size="2" tipo="Num" maxlength="2" ref="conPriCueFid" fun="loadTableElement" tabla="tblRegCueFid" style="visibility:hidden"/>
              <input type="text" name="txtAux2" id="txtAux2" size="2" tipo="Num" maxlength="2" ref="conPriCueAsiFid" fun="loadTableElement" tabla="tblRegCueAsiFid" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">
              <table id="tabs" cellpadding="0" cellspacing="0" border="0" align="left">
                <tr>
                  <td class="tab_blanco_claro">
                    <img src="imagenes/spacer.gif" width="37" height="1"/>
                  </td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this,'onButtonClickPestania(\'ControlGestion.OperacionesFideicomiso.PrincipalOperacionesFideicomiso\',\'\')');">Conceptos de Dep. y Ret</td>
                  <td class="tab_claro_azul">
                    <img src="imagenes/spacer.gif" width="37" height="1"/>
                  </td>
                  <td class="tab_relleno_azul" onclick="cambiaTab(this,'cargaPrincipalCuentasPersonasOperacionesFideicomiso()');">Cuentas y Personas (Liquidaciones)</td>
                  <td class="tab_azul_blanco">
                    <img src="imagenes/spacer.gif" width="35" height="1"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" class="subtitulo" align="center">Cuentas </td>
          </tr>
          <tr>
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Cve</td>
                  <td width="150" nowrap>Banco</td>
                  <td width="150" nowrap>Cuenta</td>
                  <td width="300" nowrap>Titular</td>
                  <td width="150" nowrap>RFC</td>
                  <td width="100" nowrap>Status
                  </td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegCueFid" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegCueDat" keys="clave" fun="clickTabla3" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" align="center" colspan="6">&nbsp;&nbsp;&nbsp;
            <input type="button" value="Agregar" name="cmdAgregar" id="cmdAgregar" onclick="agregarCuenta();"/>
            <input type="button" value=" Quitar " name="cmdQuitar" id="cmdQuitar" onclick="quitarCuenta();"/>
            </td>
          </tr>
          <tr>
            <td class="subtitulo" align="right" colspan="6">&nbsp;&nbsp;
            <input type="text" name="paramCuenta" id="paramCuenta" size="18" tipo="Num" maxlength="18"/>&nbsp;&nbsp;&nbsp;
            <input type="button" value="Buscar" name="cmdBuscar" id="cmdBuscar" class="boton" ref="conBusCueAsiFid" fun="loadTableElement" tabla="tblRegCueFid" onclick="if(paramCuenta.value!='')consultar(this,frmDatos,false);else alert('Teclee un Número de Cuenta');"/></td>
          </tr>
          <tr>
            <td colspan="6" class="subtitulo" align="center">Cuentas Asignadas</td>
          </tr>
          <tr>
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Cve</td>
                  <td width="150" nowrap>Banco</td>
                  <td width="150" nowrap>Cuenta</td>
                  <td width="300" nowrap>Titular</td>
                  <td width="150" nowrap>RFC</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegCueAsiFid" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegCueDat" keys="clave" fun="clickTabla4" radioWidth="23">
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
        <input type="button" value="Cuentas X Fisos" name="cmdCuentasFisos" id="cmdCuentasFisos" class="boton" ref="conPriConFid" fun="loadTableElement" tabla="tblRegConFid" onclick="if(fvOperacionesFideicomiso.checkForm())cargaPrincipalCuentasFideicomiso();"/>
        <input type="button" value="Personas I" name="cmdPersonasI" id="cmdPersonasI" class="boton" ref="conPriConAsiFid" fun="loadTableElement" tabla="tblRegConAsiFid" onclick="if(fvOperacionesFideicomiso.checkForm())cargaPrincipalPersonasIFideicomiso();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
