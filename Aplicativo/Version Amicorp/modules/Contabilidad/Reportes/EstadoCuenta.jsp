<%@ page contentType="text/html;charset=windows-1252"%>
<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="paramOrder" name="paramOrder" value="s" />
<input type="hidden" id="paramCtaCheques" name="paramCtaCheques" tipo="Numero" maxlength="10" size="10"/>
<!--input type="hidden" id="urlReporte" name="urlR eporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/-->
<input type="hidden" id="refSP" name="refSP" value="spEdoCta"/>
<input type="hidden" id="refQry" name="refQry" value="qryEdoCta"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/EstadoCuenta.jsp"/>
<table border="0" cellpadding="1" class="texto" cellspacing="5" width="60%" align="center">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" tipo="Numero" maxlength="10" size="10" onchange="valorFide(this.value)">
    </td>
  </tr>  
  <tr>
    <td>Fecha Inicial:</td>
    <td>
      <input type="text" id="paramFechaInicial" name="paramFechaInicial" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>
  <tr>
    <td>Fecha Final:</td>
    <td>
      <input type="text" id="paramFechaFinal" name="paramFechaFinal" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>
  <tr>
    <td>
        <table class="texto" align="center">
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona" value2="0" class="radio" onclick="valorTipo(0)"/>
              </td>
              <td>
                Fideicomiso
             </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona2" value2="1" class="radio" onclick="valorTipo(1)"/>
            </td>
            <td>
                Fideicomitente
            </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona3" value2="2" class="radio" onclick="valorTipo(2)"/>
            </td>
             <td>
                Fideicomisario
            </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona4" value2="3" class="radio" onclick="valorTipo(3)"/>
            </td>
             <td>
                Tercero
            </td>
          </tr>
       </table>
    </td>
    <td align="center" valign="middle">
      <select size="1" style="position:absolute;visibility:hidden;" name="cmbCtaCheques" id="cmbCtaCheques" ref="muestraCtaCheques" keyValue="fcbaClabeCba" theValue="fcbaTitular" fun="loadComboElement" param="cmbCtaChequesParam" onChange="cargaCuenta(this.value)"/>
    </td>
  </tr>
</table>

<br/></br>

<hr/>