<FORM name="frmReportes" id="frmReportes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Reportes de Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto">
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="5%">&nbsp;
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="5%">&nbsp;</td>
            <td nowrap width="30%">
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdCtaspStatus" value2="1" class="radio" onclick="muestraObjetos('rdCtaspStatus',this);" required message="Es necesario seleccionar una opción"/>
            </td>
            <td nowrap width="30%">
              <div id="dvUltNivel">Cuentas por Estatus</div>
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdCtaspBanco" value="2" class="radio" onclick="muestraObjetos('rdCtaspStatus',this);"/>
            </td>
              <td width="30%">Cuentas por Banco</td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdCtaspFideicomiso" value="3" class="radio" onclick="muestraObjetos('rdCtaspStatus',this);"/>
            </td>
            <td width="30%">
              <div id="dvNivel11">Cuentas por Fideicomiso</div>
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdFideicomisospCta" value="4" class="radio" onclick="muestraObjetos('rdCtaspStatus',this);"/>
            </td>
            <td width="30%">
              <div id="dvNivel21">Fideicomisos por Cuenta</div>
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">&nbsp;
            </td>
            <td width="30%">&nbsp;
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvFideicomiso" style="visibility:hidden">Fideicomiso:</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10" onblur="verificaExistenciaRegistro();" required message="El Fideicomiso es un campo obligatorio" style="visibility:hidden"/>
            </td>
           <td width="45%">
           <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" style="visibility:hidden">&nbsp;</div>
           </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvCuenta"  style="visibility:hidden">Número de Cuenta:</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="paramCuenta" id="paramCuenta" size="18" maxlength="18" style="visibility:hidden"   required message="La Cuenta es un campo obligatorio"/>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
            <td nowrap width="30%">&nbsp;</td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvStatus" style="visibility:hidden">Status:</div>
            </td>
            <td nowrap width="30%">
              <select size="1" name="cmbStatus" id="cmbStatus" message="El Status es un campo obligatorio" style="visibility:hidden">
              <option value="-1">-- Seleccione --</option>
              <option value="ACEPTADA">ACEPTADA</option>
              <option value="CAPTURADA">CAPTURADA</option>
              <option value="CANCELADA">CANCELADA</option>
              <option value="NO ASIGNADA">NO ASIGNADA</option>
              <option value="PENDIENTE">PENDIENTE</option>
              <option value="RECHAZADA">RECHAZADA</option>
              </select>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvBanco" style="visibility:hidden">Banco:</div>
            </td>
            <td nowrap width="30%">
              <select size="1" name="cmbBanco" id="cmbBanco" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded"  param="clavesCombo27" message="El Banco es un campo obligatorio" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
        <a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a>
        <input type="hidden" id="refSP" name="refSP" value="repCtasClabe"/>
        <input type="hidden" id="refQry" name="refQry" value="getDatCuentasClabe"/>
        <input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/ControlGestion/Cuentas.jsp"/>
        <input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
        
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="imprimirReporte();"/>
      </td>
    </tr>
  </table>
</FORM>
