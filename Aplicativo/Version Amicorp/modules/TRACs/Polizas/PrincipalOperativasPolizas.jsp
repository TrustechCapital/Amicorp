<!-- PrincipalOperativasPolizas.jsp -->
<!--
#01 2008-SEP-21 : Se agrego la funcion cargaCmbPolizas(); en el tag onblur
#02 2008-OCT-02 : Se agrego el tag tipo="Money" en los campos de tipo numerico
-->
<form name="frmDatosPolizas" id="frmDatosPolizas" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">P&oacute;liza Contable</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="10%">&nbsp;</td>
            
            <td nowrap width="15%">Nombre Poliza</td>
            <td colspan="2">
              <!-- #01 -->
              <input type="text" name="txtNombre" id="txtNombre" size="30" maxlength="60" onblur="cmbPolizaParam.Nombre = this.value;cargaCmbPolizas();"/>
            </td>
            <td align="center">
                      Fideicomiso&nbsp;&nbsp;<select size="1" name="fiso" id="fiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="formsLoaded"  onchange="cmbPolizaParam.Fideicomiso = this.value;cargaCmbPolizas();"/>
            </td>
            <td align="center"> &nbsp; </td>
            <td>
              <input type="button" value="Consultar Pólizas " name="cmdConsultar" class="boton" onclick="cargaCmbPolizas();" onS/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">P&oacute;liza</td>
            <td colspan="3" width="50%">
              <select size="1" name="cmbPoliza" id="cmbPoliza" ref="qryPolizaTrack" fun="loadComboElement" keyValue="opeNumOperacion" theValue="opeNomOperacion" param="cmbPolizaParam" next="hideWaitLayer" onchange="cargaVariablesPoliza(this);" required message="La Póliza es un campo obligatorio"/>
                <option value="-1">-- Seleccione --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
              </select>
            </td>
            <td nowrap width="13%">Folio</td>
            <td>
              <input type="text" name="txtFolio" id="txtFolio" size="10" maxlength="10" class="inputLocked" disabled/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Fecha Valor</td>
            <td>
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" maxlength="10" tipo="Fecha" fun=" loadTxtElementX" required message="La Fecha Valor es un campo obligatorio" onblur="verificaFecha(this);"/>
            </td>
            <td>Fecha Movto.</td>
            <td>
              <input type="text" name="txtFechaMovto" id="txtFechaMovto" size="10" maxlength="10" tipo="Fecha" value="<%=session.getAttribute("fechaContable").toString()%>" disabled class="inputLocked"/>
            </td>
            <td nowrap width="13%">Hora Aplicaci&oacute;n</td>
            <td>
              <input type="text" name="txtHoraAplicacion" id="txtHoraAplicacion" size="5" maxlength="5" class="inputLocked" disabled/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td width="13%" colspan="4">
              <input type="text" name="txtNumTransaccion" id="txtNumTransaccion" size="10" ref="conPriEstopera" fun="loadTxtElementX" theValue="eopNumTransac" param="txtNumTransaccionParam" next="cargaNumGuia" style="visibility:hidden"/>
              <input type="text" name="txtNumGuia" id="txtNumGuia" size="10" ref="conPriTra" fun="loadTxtElementX" theValue="trsNumGuiaCont" param="txtNumGuiaParam" next="cargaDatoTran" style="visibility:hidden"/>
              <input type="text" name="txtOrderX" id="txtOrderX" size="2" ref="conDatTra" fun="asignaDatoTran" param="txtDatoTranParam" value="5" style="visibility:hidden"/>
              <input type="text" name="txtModulo" id="txtModulo" size="2" value="2" style="visibility:hidden"/>
              <input type="text" size="2" name="txtMesAbierto" id="txtMesAbierto" value="0" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;
            </td>
            <td>
              <input type="text" name="txtDesc1" id="txtDesc1" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor1" id="txtValor1" fun="loadComboElement" param="objComboParam" onchange="cargaCombosDependientes(this);" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;
            </td>
            <td>
              <input type="text" name="txtDesc2" id="txtDesc2" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor2" id="txtValor2" fun="loadComboElement" param="objComboParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc4" id="txtDesc4" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor4" id="txtValor4" fun="loadComboElement" param="objComboParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;
            </td>
            <td>&nbsp;</td>
            <td colspan="4">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;
            </td>
            <td>
              <input type="text" name="txtDesc3" id="txtDesc3" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor3" id="txtValor3" fun="loadComboElement" param="objComboParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc5" id="txtDesc5" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor5" id="txtValor5" fun="loadComboElement" param="objComboParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc6" id="txtDesc6" size="25" maxlength="20" style="visibility:hidden"/>
            </td>
            <td colspan="4">
              <select size="1" name="txtValor6" id="txtValor6" fun="loadComboElement" param="objComboParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc7" id="txtDesc7" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor7" id="txtValor7" size="10" maxlength="19" tipo="Money" required style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc14" id="txtDesc14" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor14" id="txtValor14" size="10" maxlength="19" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc8" id="txtDesc8" size="25" style="visibility:hidden"/>
            </td>
            <td style="visibility:hidden">
              <input type="text" name="txtValor8" id="txtValor8" size="10" maxlength="19" 
tipo="Money" required />
            </td>
            <td align="right">
              <input type="text" name="txtDesc15" id="txtDesc15" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor15" id="txtValor15" size="10" maxlength="33" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc9" id="txtDesc9" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor9" id="txtValor9" size="10" maxlength="33" required tipo="Money" style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc16" id="txtDesc16" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor16" id="txtValor16" size="10" maxlength="19" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc10" id="txtDesc10" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor10" id="txtValor10" size="10" maxlength="33" required tipo="Money" style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc17" id="txtDesc17" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor17" id="txtValor17" size="10" maxlength="19" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc11" id="txtDesc11" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor11" id="txtValor11" size="10" maxlength="19" required tipo="Money" style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc18" id="txtDesc18" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor18" id="txtValor18" size="10" maxlength="19" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc12" id="txtDesc12" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor12" id="txtValor12" size="10" maxlength="19" required tipo="Money" style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc19" id="txtDesc19" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor19" id="txtValor19" size="10" maxlength="19" required style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="text" name="txtDesc13" id="txtDesc13" size="25" style="visibility:hidden"/>
            </td>
            <td>
              <input type="text" name="txtValor13" id="txtValor13" size="10" maxlength="19" required tipo="Money" style="visibility:hidden"/>
            </td>
            <td align="right">
              <input type="text" name="txtDesc20" id="txtDesc20" size="25" style="visibility:hidden"/>
            </td>
            <td colspan="2">
              <input type="text" name="txtValor20" id="txtValor20" size="10" maxlength="19" required style="visibility:hidden"/>
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
      <td height="100%" align="center">
        <input type="button" value="Aceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionPolizas();"/>
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('TRACs.Polizas.PrincipalOperativasPolizas','');"/>
      </td>
    </tr>
  </table>
</form>
