<%@ page contentType="text/html;charset=windows-1252 "%>

<br/>
<input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
<input type="hidden" id="refSP" name="refSP" value="repAuxiliarporCuenta"/>
<input type="hidden" id="refQry" name="refQry" value="getAuxiliarporCuenta"/>
<input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
<input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/Contabilidad/AuxiliarporCuenta.jsp"/>


<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Fideicomiso:</td>
    <td>
      <input type="text" id="paramFiso" name="paramFiso" required tipo="Numero" required message="El Fideicomiso es un campo obligatorio" maxlength="10" size="10">
    </td>
  </tr>  
  <tr>
    <td>Fecha Del:</td>
    <td>
      <input type="text" id="paramFechaDel" name="paramFechaDel" tipo="Fecha" required message="La Fecha Inicial es un campo obligatorio" maxlength="10" size="10"/>
    </td>
  </tr>  
  <tr>
    <td>Fecha Al:</td>
    <td>
      <input type="text" id="paramFechaAl" name="paramFechaAl" tipo="Fecha" required message="La Fecha Final es un campo obligatorio" maxlength="10" size="10"/>
    </td>
  </tr>    
 
  <tr>
    <td>
    </td>  
    <td>
        <table width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Cuenta</td>
            <td>Scta</td>
            <td>Sscta</td>
            <td>Ssscta</td>
            <td>Sssscta</td>
            <td>Aux2</td>
            <td>Aux3</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <input type="text" name="paramNumCtam" id="paramNumCtam" size="4" required message="La Cuenta es un campo obligatorio" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumScta" id="paramNumScta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSscta" id="paramNumSscta" size="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsscta" id="paramNumSsscta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssscta" id="paramNumSssscta" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumAux2" id="paramNumAux2" size="8" maxlength="8" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumAux3" id="paramNumAux3" size="8" maxlength="8" tipo="Num"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
        </td> 
      </table>    
  </tr>
</table>

<br/></br>

<hr/>