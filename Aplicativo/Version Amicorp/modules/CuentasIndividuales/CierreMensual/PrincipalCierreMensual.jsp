<FORM name="frmPrincipalCierreMensual" id="frmPrincipalCierreMensual">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cierres Mensuales Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;
      </td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>" disabled class="inputLocked"/>
            </td>
            <td nowrap colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam"  next="tipoRadio">&nbsp;</div><!--param="divNombreFideicomisoParam"-->
            </td>
            <td width="20%">
               <div id="tipoRadio" class="textoNegrita" ref ="muestraDatosParamFisosPart" fun="cargaRadios();"  next="div3">&nbsp;</div>
            </td>
            <td width="20%">
               <div id="div3" class="textoNegrita" ref ="refer" fun="reedireccionar();">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="30%" align="right">
              <input type="radio" name="rdOpcion" id="participacion" class="radio" value2="1" onclick="asignaValueRadio2Master('participacion',this)" required message="La Opción es un campo obligatorio"/>
            </td>
            <td nowrap>
              <div id="radio1" class='style15'>Participaci&oacute;n</div>
            </td>
            <td nowrap>
              <input type="radio" name="rdOpcion" id="capitalizacion" class="radio" value="2" onclick="asignaValueRadio2Master('participacion',this)"/>Capitalización
            </td>
            <td nowrap>
              <input type="radio" name="rdOpcion" id="descapitalizacion" class="radio" value="3" onclick="asignaValueRadio2Master('participacion',this)"/>Descapitalización
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="5">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="30%">
             <!-- <input type="text" name="txtPropRelativ" id="txtPropRelativ" size="8" maxlength="8"/>pr-->
            </td>
            <td nowrap>Progreso:</td>
            <td nowrap>
              <input type="text" name="txtProgreso" id="txtProgreso" size="10" maxlength="10" tipo="Num" disabled class="inputLocked"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">&nbsp;</td>
          </tr>  
          <tr>
            <td width="30%">
              <!--<input type="text" name="txtPropReal" id="txtPropReal" size="8" maxlength="8"/>pt-->
            </td>
            <td nowrap></td>
            <td nowrap>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">
              <!--<input type="text" name="txtNumInv" id="txtNumInv" size="8" maxlength="8"/>numInver-->
            </td>
          </tr>          
          <tr>
            <td width="30%">
              <!--<input type="text" name="txtPrc" id="txtPrc" size="8" maxlength="8"/>p+pR-->
              </td>
            <td nowrap>Mes</td>
            <td nowrap>
              <input type="text" name="txtMes" id="txtMes" size="2" maxlength="2" tipo="Num" required message="El mes es un campo obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">
              <!--<input type="text" name="txtInvsAct" id="txtInvsAct" size="8" maxlength="8"/>numInverAct-->
            </td>
          </tr>
          <tr>
            <td width="30%">
              <!--<input type="text" name="txtP" id="txtP" size="8" maxlength="8"/>p-->
            </td>
            <td nowrap>A&ntilde;o</td>
            <td nowrap>
              <input type="text" name="txtAno" id="txtAno" size="4" maxlength="4" tipo="Num" required message="El año es un campo obligatorio"/>
            </td>
            <td nowrap>&nbsp;</td>
            <td width="20%">
              <P>&nbsp;
              </P>
              </td>
          </tr>
          <input type="hidden" name="txtFecha" id="txtFecha" size="10"/>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>    
    <tr>
      <td align="center">
        <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" onclick="botonAceptar();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="RF(GI('frmPrincipalCierreMensual'));"/>
        <!--<input type="BUTTON" value="Pruebas" name="cmdLimpiar" size="20%" class="boton" onclick="obtenerNumInversActuales();"/>-->
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
        <tr>
      <td width="60%" height="100%" align="center">
        <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
        <a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a>
        <input type="hidden" id="refSP" name="refSP" value="repCtasIndividuales"/><!-- HABILITAR CUANDO YA SE VAYA A EJECUTAR LA FUNCIÓN-->
        <input type="hidden" id="refQry" name="refQry" value="getDatCuentasIndividuales"/>
        <input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/CuentasIndividuales/EstadoCuenta.jsp"/>
        <input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
        <input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
        
      </td>
    </tr>
  </table>
</FORM>
