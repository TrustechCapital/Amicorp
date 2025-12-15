<%
  //String userName = (String)session.getAttribute("username");
  String fideicomisoCtasInd = request.getParameter("fideicomisoCtasInd");
  if(fideicomisoCtasInd != null)
    session.setAttribute("fideicomisoCtasInd",fideicomisoCtasInd);
%>
<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Selecci&oacute;n Fideicomiso de Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="20%" nowrap>Fideicomiso</td>
            <td colspan="5">
              <select id="cmbContrato" name="cmbContrato" ref="conFidCueInd" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="asignaValorComboFideicomiso" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():""%>" name="txtFideicomisoCtasInd" id="txtFideicomisoCtasInd" size="5" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" onclick="asignaFideicomisoCuentasIndividuales(cmbContrato);"/>
        <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatos);"/>
      </td>
    </tr>
  </table>
</FORM>
