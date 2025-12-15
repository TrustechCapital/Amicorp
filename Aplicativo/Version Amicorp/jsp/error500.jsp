<%@ page isErrorPage="true"%>
<%exception.printStackTrace();%>
<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmReportes" id="frmReportes" onsubmit="">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">
          Ocurrio un error interno al procesar su solicitud.
          <br/>
          Por favor consulte al administrador del sistema.
          <br/><br/>
          <%=mx.gob.nafin.fiduciario.common.services.ConfigurationService.getInstance().getProperty("mailAdministrador")%>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr><td>
        <table border="0">
          <tr>
            <td><b>Clase:</b></td>
            <td><font color="red"><b><%=exception.getClass()%></b></font></td>
          </tr>
          <tr>
            <td><b>Mensaje:</b></td>
            <td><font color="red"><b><%=exception.toString()%></b></font></td>
          </tr>
          <tr>
            <td><b>Ubicacion:</b></td>
            <td><font color="red"><b><%=exception.getLocalizedMessage()%></b></font></td>
          </tr>
        </table>
      </td></tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton"/>
          <!--input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton" onclick="();"/!-->
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td>
          <div style="visibility:hidden;">
<%
  java.io.ByteArrayOutputStream outstrm = new java.io.ByteArrayOutputStream();
  java.io.PrintWriter writer = new java.io.PrintWriter(outstrm);

  exception.printStackTrace(writer);
  writer.flush();
%>
            <%=outstrm.toString()%>    
          </div>
        </td>
      </tr>
    </form>
        
  </table>
</TD>
