<form name="frmDatosPresupuestoInicialFOSEG" id="frmDatosPresupuestoInicialFOSEG">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Carga Inicial de Presupuestos&nbsp;por&nbsp;Ejercicio</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap>Fideicomiso</td>
            <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select size="1" name="Fideicomiso" id="Fideicomiso" ref="conNumFidNomFidFOSEG" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="txtFechaContable" required message="El Fideicomiso es un campo obligatorio"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap>A&ntilde;o Presupuestal</td>
            <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="Ano" id="Ano" size="4" maxlength="4" tipo="Num" required message="El Año Presupuestal es un campo obligatorio"/>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="asignaAnoPresupuestal" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="10%" nowrap>&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td nowrap width="10%" class="textoRP" align="center" colspan="2">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="10%" nowrap colspan="10" align="center">
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClick('Tesoreria.PresupuestoInicialFOSEG.PrincipalPresupuestoInicialFOSEG','');"/>
            </td>
          </tr>
          <tr>
            <td width="10%" nowrap>&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td nowrap width="10%" class="textoRP" align="center" colspan="2">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">&nbsp;</td>
            <td width="10%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td width="10%" nowrap>&nbsp;</td>
            <td width="10%" nowrap class="textoRP" align="center">Eje </td>
            <td nowrap width="10%" class="textoRP" align="center" colspan="2">Programa</td>
            <td width="10%" nowrap class="textoRP" align="center">Proyecto
            </td>
            <td width="10%" nowrap class="textoRP" align="center">Acci&oacute;n</td>
            <td width="10%" nowrap class="textoRP" align="center">Importe Estatal</td>
            <td width="10%" nowrap class="textoRP" align="center">Importe Federal</td>
            <td width="10%" nowrap class="textoRP" align="center">Importe Rendimientos</td>
            <td width="10%" nowrap>&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="11%">&nbsp;</td>
            <td align="center" width="11%">
              <input type="text" name="Eje" id="Eje" size="11" tipo="Num" maxlength="10" required message="El Eje es un campo obligatorio" onblur="verificaCuentaFOSEG(this);"/>
            </td>
            <td align="center" width="11%" colspan="2">
              <input type="text" name="Programa" id="Programa" size="11" tipo="Num" maxlength="10" required message="El Programa es un campo obligatorio" onblur="verificaCuentaFOSEG(this);" />
            </td>
            <td align="center" width="11%">
              <input type="text" name="Proyecto" id="Proyecto" size="11" tipo="Num" maxlength="10" required message="El Proyecto es un campo obligatorio" onblur="verificaCuentaFOSEG(this);" />
            </td>
            <td align="center" width="11%">
              <input type="text" name="Accion" id="Accion" size="11" tipo="Num" maxlength="10" required message="La Acción es un campo obligatorio" onblur="verificaCuentaFOSEG(this);" />
            </td>
            <td width="11%">
              <input type="text" name="ImporteEstatal" id="ImporteEstatal" size="11" tipo="Num" maxlength="10" onblur="verificaImporte(this);"/>
            </td>
            <td width="11%">
              <input type="text" name="ImporteFederal" id="ImporteFederal" size="11" tipo="Num" maxlength="10" onblur="verificaImporte(this);"/>
            </td>
            <td width="11%">
              <input type="text" name="ImporteRendimientos" id="ImporteRendimientos" size="11" tipo="Num" maxlength="10" onblur="verificaImporte(this);"/>
            </td>
            <td width="11%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="5">
              <div id="nomCuenta" class="textoNegrita" ref="conNomCueFOSEG" fun="asignaValor2DivCuenta" param="divNombreCuentaParam">&nbsp;</div>
            </td>
            <td width="50%">&nbsp;
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3">
              <input type="radio" name="rdTipo" id="rdTipo" value2="C" class="radio" onclick="asignaValueRadio2Master('rdTipo',this);" required message="El Tipo de Registro es un campo obligatorio"/>
            Registro de Compromiso</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3">
              <input type="radio" name="rdTipo" id="rdTipoR" value="R" class="radio" onclick="asignaValueRadio2Master('rdTipo',this);"/>
            Registro de Retiro</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3">
              <input type="radio" name="rdTipo" id="rdTipoA" value="A" class="radio" onclick="asignaValueRadio2Master('rdTipo',this);"/>
            Registro de Aportaci&oacute;n</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Registro Presupuestal" name="cmdRegistro" class="boton" onclick="validaRegistroPresupuestal();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
