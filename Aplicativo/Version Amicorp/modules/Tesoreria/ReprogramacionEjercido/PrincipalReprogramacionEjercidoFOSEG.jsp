<form name="frmDatosReprogramacionEjercido" id="frmDatosReprogramacionEjercido">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Reprogramaci&oacute;n Presupuestal del Monto Ejercido FOSEG</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="2">Fideicomiso</td>
            <td>
              <input type="text" name="txtFideicomiso" id="txtFideicomiso" size="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td colspan="3">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="auxCalculaSaldoEjercido">&nbsp;</div>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="2">Ejercicio</td>
            <td>
              <input type="text" name="txtEjercicio" id="txtEjercicio" size="4" maxlength="4" tipo="Num" required message="El Ejercicio es un campo obligatorio" onblur="calculaSaldoEjercido('Origen');calculaSaldoEjercido('Destino');"/>
            </td>
            <td>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="8" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="2">Origen de Recursos</td>
            <td colspan="4">
              <select size="1" name="cmbOrigenRecursos" id="cmbOrigenRecursos" onblur="calculaSaldoEjercido('Origen');calculaSaldoEjercido('Destino');">
                <option value="-1">-- Seleccione --</option>
                <option value="1">FEDERAL</option>
                <option value="2">ESTATAL</option>
                <option value="3">RENDIMIENTOS</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="2">&nbsp;
            </td>
            <td colspan="4">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="6" class="subtitulo">Recurso Presupuestal Origen</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td colspan="6">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>Eje</td>
            <td>Programa</td>
            <td>Proyecto</td>
            <td>Acci&oacute;n</td>
            <td>Saldo Ejercido</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="right">
              <input type="text" name="txtEjeOrigen" id="txtEjeOrigen" size="10" maxlength="10" tipo="Num" required message="El Eje Origen es un campo obligatorio" onblur="calculaSaldoEjercido('Origen');"/>
            </td>
            <td>
              <input type="text" name="txtProgramaOrigen" id="txtProgramaOrigen" size="10" maxlength="10" tipo="Num" required message="El Programa Origen es un campo obligatorio" onblur="calculaSaldoEjercido('Origen');"/>
            </td>
            <td>
              <input type="text" name="txtProyectoOrigen" id="txtProyectoOrigen" size="10" maxlength="10" tipo="Num" required message="El Proyecto Origen es un campo obligatorio" onblur="calculaSaldoEjercido('Origen');"/>
            </td>
            <td>
              <input type="text" name="txtAccionOrigen" id="txtAccionOrigen" size="10" maxlength="10" tipo="Num" required message="La Acción Origen es un campo obligatorio" onblur="calculaSaldoEjercido('Origen');"/>
            </td>
            <td>
              <input type="text" name="txtSaldoEjercicioOrigen" id="txtSaldoEjercicioOrigen" size="15" tipo="Money" ref="conSalRepEje" fun="loadTxtElementX" theValue="saldo" param="objSaldoParam" next="validaSaldos"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="2">&nbsp;</td>
            <td colspan="4">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" colspan="6" class="subtitulo">Recurso Presupuestal Destino</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" align="right" colspan="6">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%" align="right">&nbsp;</td>
            <td>Eje</td>
            <td>Programa</td>
            <td>Proyecto</td>
            <td>Acci&oacute;n</td>
            <td>Saldo Ejercido</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="right">
              <input type="text" name="txtEjeDestino" id="txtEjeDestino" size="10" maxlength="10" tipo="Num" required message="El Eje Destino es un campo obligatorio" onblur="calculaSaldoEjercido('Destino');"/>
            </td>
            <td>
              <input type="text" name="txtProgramaDestino" id="txtProgramaDestino" size="10" maxlength="10" tipo="Num" required message="El Programa Destino es un campo obligatorio" onblur="calculaSaldoEjercido('Destino');"/>
            </td>
            <td>
              <input type="text" name="txtProyectoDestino" id="txtProyectoDestino" size="10" maxlength="10" tipo="Num" required message="El Proyecto Destino es un campo obligatorio" onblur="calculaSaldoEjercido('Destino');"/>
            </td>
            <td>
              <input type="text" name="txtAccionDestino" id="txtAccionDestino" size="10" maxlength="10" tipo="Num" required message="La Acción Destino es un campo obligatorio" onblur="calculaSaldoEjercido('Destino');"/>
            </td>
            <td>
              <input type="text" name="txtSaldoEjercicioDestino" id="txtSaldoEjercicioDestino" size="15" tipo="Money" ref="conSalRepEje" fun="loadTxtElementX" theValue="saldo" param="objSaldoParam" next="hideWaitLayer"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td align="right" colspan="6">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2" class="textoNegrita">Importe a Transferir</td>
            <td>
              <input type="text" name="txtImporteTransferir" id="txtImporteTransferir" size="15" tipo="Money" required message="El Importe a Transferir es un campo obligatorio" onblur="validaSaldos();"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle" width="15%">&nbsp;
        <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="ejecutaReprogramacionEjercido();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClick('Tesoreria.ReprogramacionEjercido.PrincipalReprogramacionEjercidoFOSEG','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
