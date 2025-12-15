<!--valor-->
<FORM name="frmPrincipalMovimientosCuentas" id="frmPrincipalMovimientosCuentas">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Movimientos Cuentas Individuales</td> 
    </tr>
    <tr>
      <td height="21">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="Fideicomiso" id="Fideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
            </td>
            <td colspan="3" width="40%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="cargaDatosNiveles">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel1">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmbNivel1" id="cmbNivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(2);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel2">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmbNivel2" id="cmbNivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3);" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
              <div id="dvNivel3">&nbsp;</div>
            </td>
            <td colspan="3">
              <select size="1" name="cmbNivel3" id="cmbNivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td align="center" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td nowrap>Fechas de Movimientos</td>
            <td align="right">
              <input type="text" name="FechaDel" id="FechaDel" size="10" maxlength="10" tipo="Fecha" value="<%=session.getAttribute("fechaContable").toString()%>" required message="Este es un parámetro de búsqueda obligatorio"/>
            </td>
            <td align="center">al</td>
            <td>
              <input type="text" name="FechaAl" id="FechaAl" size="10" maxlength="10" tipo="Fecha" value="<%=session.getAttribute("fechaContable").toString()%>" required message="Este es un parámetro de búsqueda obligatorio"/>
            </td>
            <td align="center" width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="25%">&nbsp;</td>
            <td>
            </td>
            <td colspan="2">
              <input type="checkbox" name="chkDeposito" id="chkDeposito" class="check"/> Dep&oacute;sito
            </td>
            <td>
              <input type="checkbox" name="chkRetiro" id="chkRetiro" class="check"/>&nbsp;Retiro
            </td>
            <td align="center" width="35%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="30%" colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%" colspan="6" align="center">
              <input type="button" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" onclick="principalAceptar();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton"  onclick="cargaPrincipalMovimientosCuentas();"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="6">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoMovimientosCuentas(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoMovimientosCuentas(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoMovimientosCuentas(3)"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;
              <!--input type="TEXT" name="paramorder" id="paramorder" size="2" value="s" ref="conPriCatDefEst" fun="loadTableElement" tabla="tablaRegistrosMovIndividuales" onclick="consultar(this,frmDatos,false);"/-->
            </td>
          </tr>
          <tr>
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td align="center" nowrap width="23">&nbsp;</td>
                  <td nowrap width="65">Fecha</td>
                  <td nowrap width="345">
                    <div id="dvUltNivel">&nbsp;</div>
                  </td>
                  <td nowrap width="70">N&uacute;mero</td>
                  <td nowrap width="100">Operaci&oacute;n</td>
                  <td nowrap width="100">Importe</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:89%">
                <table id="tablaRegistrosMovIndividuales" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosMovCuentasData" keys="movContrato,movClaveInv,movSecuencial,movFecOper,movTipoOper,movImporte" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
