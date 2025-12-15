<!--//-->
<FORM name="frmReportes" id="frmReportes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Reportes Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto">
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="5%">
              <input type="text" name="Fideicomiso" id="Fideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>" disabled class="inputLocked"/>
              <input type="hidden" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():""%>" disabled class="inputLocked" style="visibility:hidden"/>
            </td>
            <td nowrap width="30%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
              <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="cargaDatosNiveles">&nbsp;</div>
            </td>
            </td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="5%">Progreso</td>
            <td nowrap width="30%">
              <input type="text" name="txtProgreso" id="txtProgreso" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>
            </td>
            <td width="1%"><!--NTInvs
              <input type="text" name="txt1" id="txt1" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>--></td>
          </tr>
          <tr valign="middle">
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdMovDepRet" value2="1" class="radio" onclick="muestraObjetos('rdMovDepRet',this);" required message="Es necesario seleccionar una opción"/>
            </td>
            <td nowrap width="30%">
              <div id="dvUltNivel">&nbsp;</div>
            </td>
            <td width="1%"><!--numeroInversionistaActual
              <input type="text" name="txt2" id="txt2" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>--></td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdEdoCta" value="2" ref="emision.verETExiIns" class="radio" onclick="muestraObjetos('rdMovDepRet',this);"/>
            </td>
              <td width="30%">Estado de cuenta</td>
            <td width="1%"><!--NTNiv
              <input type="text" name="txt3" id="txt3" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>--></td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdResXNiv1" value="3" ref="emision.verETExiIns" class="radio" onclick="muestraObjetos('rdMovDepRet',this);"/>
            </td>
            <td width="30%">
              <div id="dvNivel11">&nbsp;</div>
            </td>
            <td width="1%"><!--NumeroNivelesActuales
              <input type="text" name="txt4" id="txt4" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>--></td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdResXNiv2" value="4" ref="emision.verETExiIns" class="radio" onclick="muestraObjetos('rdMovDepRet',this);"/>
            </td>
            <td width="30%">
              <div id="dvNivel21">&nbsp;</div>
            </td>
            <td width="1%"><!--auxNTNivAct
              <input type="text" name="txt5" id="txt4" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>-->
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td align="right" width="5%">
              <input type="radio" name="rdOpcion" id="rdDetXNiv1" value="5" ref="emision.verETExiIns" class="radio" onclick="muestraObjetos('rdMovDepRet',this);"/>
            </td>
            <td width="30%">
              <div id="dvNivel12">&nbsp;</div>
            </td>
            <td width="1%"><!--PE
              <input type="text" name="txt6" id="txt4" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>-->
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="5%">
               </td>
               <td width="30%">&nbsp;</td>
            <td width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="4">
              <hr/>
            </td>
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
              <div id="dvFechaInicial" style="visibility:hidden">&nbsp;</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="paramFecIni" id="paramFecIni" size="10" maxlength="10" style="visibility:hidden" message="La Fecha Inicial es un campo obligatorio"/>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvFechaFinal">&nbsp;</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="paramFecFin" id="paramFecFin" size="10" maxlength="10" required message="La Fecha Final es un campo obligatorio"/>
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
              <div id="dvNivel13" style="visibility:hidden">&nbsp;</div>
            </td>
            <td nowrap width="30%">
              <select size="1" name="cmbNivel1" id="cmbNivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(2);" param="cmbNivelParam" message="El Nivel 1 es un campo obligatorio" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvNivel22" style="visibility:hidden">&nbsp;</div>
            </td>
            <td nowrap width="30%">
              <select size="1" name="cmbNivel2" id="cmbNivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3);" param="cmbNivelParam" message="El Nivel 2 es un campo obligatorio" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td nowrap width="1%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td width="5%">
              <div id="dvNivel3" style="visibility:hidden">&nbsp;</div>
            </td>
            <td nowrap width="30%">
              <select size="1" name="cmbNivel3" id="cmbNivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" param="cmbNivelParam" message="El Nivel 3 es un campo obligatorio" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td nowrap width="1%">
              <!--<input type="BUTTON" value="pruebas" name="pruebas" class="boton" onclick="obtenerNumnNivelesActuales();"/>--> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
        <a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a>
        <input type="hidden" id="refSP" name="refSP" value="repCtasIndividuales"/><!-- HABILITAR CUANDO YA SE VAYA A EJECUTAR LA FUNCIÓN-->
        <input type="hidden" id="refQry1" name="refQry1" value="getDatCuentasIndividuales2"/>
        <input type="hidden" id="refQry" name="refQry" value="getDatCuentasIndividuales"/>
        <input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/CuentasIndividuales/EstadoCuenta.jsp"/>
        <input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
        <input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
        
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="imprimirReporte();"/>
      </td>
    </tr>
  </table>
</FORM>
