<%@ page contentType="text/html;charset=windows-1252"%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="refQry" name="refQry" value="getConversionCuenta"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramtakeParameters" name="paramtakeParameters" value="false"/>
<!--<input type="hidden" id="urlReporte" name="urlReporte" value="<%=request.getContextPath()%>/jsp/fiduciav5/Repòrtes/Contabilidad/ConversionCuentas.jsp?"/>-->
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/ConversionCuentas.jsp"/>

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>&nbsp;</td>
    <td align="center" class="titulo">&nbsp;</td>
  </tr>     
  <tr>
    <td>
    </td>  
    <td>
        <table width="100%" class="texto">
         <tr>
    <td>&nbsp;</td>
    <td align="center">Cuentas Internas</td>
  </tr> 
  <tr>
    <td>
    </td>  
    <td>
        <table width="100%" class="texto">
          <tr>
            <td>Cuenta</td>
            <td>Scta</td>
            <td>Sscta</td>
            <td>Ssscta</td>
            <td>Sssscta</td>
            <td>Ssssscta</td>
          </tr>
          <tr>
            <td>
              <input type="text" name="paramNumCtam" id="paramNumCtam" size="4" maxlength="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumScta" id="paramNumScta" size="4" maxlength="2" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSscta" id="paramNumSscta" size="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSsscta" id="paramNumSsscta" size="4" maxlength="2" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSssscta" id="paramNumSssscta" size="4" maxlength="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssscta" id="paramNumSsssscta" size="4" maxlength="4" tipo="Numero"/>
            </td>
          </tr>
      </table>    
  </tr>
   <td align="center"></td>
  <tr>
  </tr>
  <tr>
    <td>&nbsp;</td>
    
    <td align="center">Cuentas Institucionales</td>
  </tr> 
  <tr>
    <td>
    </td>  
    <td>
        <table width="100%" class="texto">
          <tr>
            <td>Cuenta</td>
            <td>Scta</td>
            <td>Sscta</td>
            <td>Ssscta</td>
            <td>Sssscta</td>
            <td>Ssssscta</td>
          </tr>
          <tr>
            <td>
              <input type="text" name="paramNumCtamOrd" id="paramNumCtamOrd" size="4" maxlength="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSctaOrd" id="paramNumSctaOrd" size="4" maxlength="2" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSsctaOrd" id="paramNumSsctaOrd" size="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSssctaOrd" id="paramNumSssctaOrd" size="4" maxlength="2" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssctaOrd" id="paramNumSsssctaOrd" size="4" maxlength="4" tipo="Numero"/>
            </td>
            <td>
              <input type="text" name="paramNumSssssctaOrd" id="paramNumSssssctaOrd" size="4" maxlength="4" tipo="Numero"/>
            </td>
          </tr>
      </table>    
  </tr>
</table>
<br/></br>
<hr/>