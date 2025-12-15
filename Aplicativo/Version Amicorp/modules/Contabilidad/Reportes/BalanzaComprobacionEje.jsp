<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<!--input type="hidden" id="paramAno" name="paramAno" value="0"/>
<input type="hidden" id="paramMes" name="paramMes" value="0"/-->
<input type="hidden" id="urlReporte" name="urlReporte" value="<%=request.getContextPath()%>/imprimirReporte.do?"/>
<input type="hidden" id="refQry" name="refQry" value="getBalComEje"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/BalanzaComprobacionEje.jsp"/>
<!--input type="hidden" id="template" name="template" value="/xml/Reportes/Contabilidad/BalanceGeneral.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Balance General"/>
<input type="hidden" id="paramRepInfoTituloReporte" name="paramRepInfoTituloReporte" value="Balance General de mes del anio"/>
<input type="hidden" id="paramRepInfoNombreFiso" name="paramRepInfoNombreFiso" value=""/>
<input type="hidden" id="paramRepInfoNotaFooter" name="paramRepInfoNotaFooter" value="EL PRESENTE BALANCE GENERAL, SE FORMULO CON APEGO A LAS SANAS PRACTICAS BANCARIAS Y A LAS NORMAS LEGALES Y ADMINISTRATIVAS APLICABLES, ENCONTRANDOSE REFLEJADAS Y REGISTRADAS DE MANERA CONSISTENTE, LAS OPERACIONES EFECTUADAS HASTA LA FECHA EN LAS CUENTAS CORRESPONDIENTES DEL CATALOGO VIGENTE." /-->
