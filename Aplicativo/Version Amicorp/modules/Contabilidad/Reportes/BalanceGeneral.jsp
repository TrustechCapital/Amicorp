<!--BalanceGeneral.jsp-->
<!--20081002 Se coloco como requerido el campo de fecha-->
<%@ page contentType="text/html;charset=windows-1252 "%>


<br/>
<input type="hidden" id="paramAno" name="paramAno" tipo="Numero"  maxlength="10" size="10"/>
<input type="hidden" id="paramMes" name="paramMes" tipo="Numero"   maxlength="10" size="10"/>
<input type="hidden" id="paramDia" name="paramDia" tipo="Numero"   maxlength="10" size="10"/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="urlReporte" name="urlReporte" value="<%=request.getContextPath()%>/jsp/fiduciav5/balanceGeneral.jsp?"/>
<!--input type="hidden" id="refQry" name="refQry" value="getBalanceGral"/>
<input type="hidden" id="template" name="template" value="/xml/Reportes/Contabilidad/BalanceGeneral.xsl"/>
<input type="hidden" id="nombreReporte" name="nombreReporte" value="Balance General"/>
<input type="hidden" id="paramRepInfoTituloReporte" name="paramRepInfoTituloReporte" value="Balance General de mes del anio"/>
<input type="hidden" id="paramRepInfoNombreFiso" name="paramRepInfoNombreFiso" value=""/>
<input type="hidden" id="paramRepInfoNotaFooter" name="paramRepInfoNotaFooter" value="EL PRESENTE BALANCE GENERAL, SE FORMULO CON APEGO A LAS SANAS PRACTICAS BANCARIAS Y A LAS NORMAS LEGALES Y ADMINISTRATIVAS APLICABLES, ENCONTRANDOSE REFLEJADAS Y REGISTRADAS DE MANERA CONSISTENTE, LAS OPERACIONES EFECTUADAS HASTA LA FECHA EN LAS CUENTAS CORRESPONDIENTES DEL CATALOGO VIGENTE." /-->

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" required tipo="Numero" maxlength="10" size="10" onblur="obtenerMonedaFiso(this);">
    </td>
  </tr>   
   <tr>
    <td>Fecha:</td>
    <td>
      <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr>  
  <tr>
    <td>Empresa:</td>
    <td>
      <select size="1" name="paramEmpresa" id="paramEmpresa" ref="cmbParamEmpresaAll" fun="loadComboElement" keyValue="empNomEmpresa" theValue="empNomEmpresa" next="formsLoaded"/>
    </td>
  </tr>  
  <tr>
    <td>Firma:</td>
    <td>
      <select size="1" name="paramEjecutivoFirma" id="paramEjecutivoFirma" ref="muestraEjecutivos" fun="loadComboElement" keyValue="ejeEjecutivoPuesto" theValue="ejeNomEjecutivo" param="cmbEjecutivos" next="formsLoaded"/>
    </td>
  </tr>
</table>

<br/></br>

<hr/>