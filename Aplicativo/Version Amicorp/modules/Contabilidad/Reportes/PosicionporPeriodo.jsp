<%@ page contentType="text/html;charset=windows-1252 "%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="refSP" name="refSP" value="repPosicionporPeriodo"/>
<input type="hidden" id="refQry" name="refQry" value="getPosicionporPeriodo"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/PosicionporPeriodo.jsp"/>


<table border="0" cellpadding="1" class="texto" cellspacing="5" width="700px">
  <tr>
    <td >Fideicomiso:</td>
    <td colspan=3>
      <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="conNumFidNomFid" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="paramSubcuenta" message="El Fideicomiso es un campo obligatorio" onchange="cargaCmbPosporPer(this);"/>
    </td>
  </tr>  
  <tr>
    <td>Subcuenta:</td>
    <td>
      <select id="paramSubcuenta" name="paramSubcuenta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" next="paramCtoInver" param="cmbScta" onchange="cargaCmbPosporPer(this);"/>
                                  
    </td>
    <td>Contrato de Inversión:</td>
    <td>
      <select id="paramCtoInver" name="paramCtoInver" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprNomIntermed" next="formsLoaded" param="cmbCtoInver"/>
                                 
    </td>
  </tr>  
  <tr>
    <td class="subtitulo" colspan=4>
      Emisión
    </td>
  </tr>  
  <tr>
    <td>Pizarra:</td>
    <td>
      <input type="text" id="paramPizarra" name="paramPizarra"  maxlength="10" size="10">
    </td>
    <td>Serie:</td>
    <td>
      <input type="text" id="paramSerie" name="paramSerie" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td colspan=2>&nbsp;</td>
    <td>Cupón:</td>
    <td>
      <input type="text" id="paramCupon" name="paramCupon" tipo="Numero" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td class="subtitulo" colspan=4>
      Periodo
    </td>
  </tr>
  <tr>
    <td>Fecha Del:</td>
    <td>
      <input type="text" id="paramFechaIni" name="paramFechaIni" tipo="Fecha" required message="La Fecha Inicial es un campo obligatorio" maxlength="10" size="10"/>
    </td>
    <td>Fecha Al:</td>
    <td>
      <input type="text" id="paramFechaFin" name="paramFechaFin" tipo="Fecha" required message="La Fecha Final es un campo obligatorio" maxlength="10" size="10"/>
    </td>
  </tr>    

</table>

<br/></br>

<hr/>