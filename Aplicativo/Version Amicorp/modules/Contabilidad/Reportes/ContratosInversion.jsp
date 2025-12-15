<!--ContratosInversion.jsp-->
<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="refSP" name="refSP" value="repRepContratosInv"/>
<input type="hidden" id="refQry" name="refQry" value="getRepContratosInv"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/ContratosInversion.jsp"/>
<input type="hidden" id="paramOrder" name="paramOrder" value="s"/>
<input type="hidden" id="paramCtoInversion" name="paramCtoInversion" value=""/>
<input type="hidden" id="paramSinContrato" name="paramSinContrato" value="0"/>
<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="conNumFidNomFid" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="paramSubcuenta" message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbPosporPer(this);"/>
    </td>
  </tr>  
  <tr>
    <td>Fecha:</td>
    <td>
      <input type="text" id="paramFechaUnica" name="paramFechaUnica" tipo="Fecha" maxlength="10" size="10"/>
    </td>
  </tr> 
  <tr>   
    <td>Subcuenta</td>
    <td>
      <select id="paramSubcuenta" name="paramSubcuenta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" param="cmbScta" next="paramCtoInver" onchange="cargaCmbPosporPer(this);"/>
    </td>
  </tr>
    <td>Contrato de Inversión:</td>
    <td>
      <select id="paramCtoInver" name="paramCtoInver" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="formsLoaded" param="cmbCtoInver"/>
                                 
    </td>
    <td>
      Ignorar contrato<input type="checkbox" name="chkTodosContratos"  id="chkTodosContratos" value="0" onclick="if(GI('paramSinContrato').value==0){GI('paramCtoInver').disabled=true;GI('paramCtoInver').selectedIndex=0;GI('paramSinContrato').value=1;}else{GI('paramCtoInver').disabled=false;GI('paramSinContrato').value=0;}"/>    
    </td>
</table>

<br/></br>

<hr/>
