<%@ page contentType="text/html;charset=windows-1252"%>
<br/>
<!-- <input type="hidden" id="paramUsuario" name="p aramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>-->
<!--input type="hidden" id="urlReporte" name="urlR eporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/-->
<input type="hidden" id="refQry" name="refQry" value="consultaCarteraTRACs" style="position:absolute;"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true" style="position:absolute;"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false" style="position:absolute;"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/modules/TRACs/Reportes/Reportes/ReporteCartera.jsp" style="position:absolute;"/>
<input type="text" name="paramnumUsuario" id="paramnumUsuario" size="30"  maxlength="30" value='<%=session.getAttribute("userid")%>' style="width:150px;visibility:hidden;position:absolute;" />
<input type="text" name="paramnumOpcion" id="paramnumOpcion" size="30"  maxlength="30" value='0' style="width:150px;visibility:hidden;position:absolute;"/>

<input type="text" name="paramDia" id="paramDia" size="30"  maxlength="30" value='0' style="width:150px;visibility:hidden;position:absolute;"/>
<input type="text" name="paramMes" id="paramMes" size="30"  maxlength="30" value='0' style="width:150px;visibility:hidden;position:absolute;"/>
<input type="text" name="paramAno" id="paramAno" size="30"  maxlength="30" value='0' style="width:150px;visibility:hidden;position:absolute;"/>
            
<table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo" width="30%">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" nowrap width="3%">Fideicomiso</td>
            <td align="left" nowrap width="44%">
            <select size="1" name="paramfiso" id="paramfiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="formsLoaded" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="19%">&nbsp;</td>
            <td align="right" width="13%">Fecha
            </td>
            <td align="left" width="44%">
              <input type="text" name="paramfecha" id="paramfecha" size="10" ref="conFecCon" onblur="loadElement(GI('paramfiso´'));" fun="loadTxtElementX" theValue="fecha" next="paramfiso" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
		  
        </table>

<br/></br>

<hr/>