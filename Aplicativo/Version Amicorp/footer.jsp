<%@ page contentType="text/html;charset=ISO-8859-1"%>


<%
try {
%>
<table id="tablaFooter" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" background="imagenes/fondoProtego.jpg" style="background-repeat:repeat-x">
  <tr>
    <TD align="left" valign="middle" class="pie" ><b><%=session.getAttribute("userInfo")!=null?((mx.gob.nafin.fiduciario.common.beans.UserInfoBean)session.getAttribute("userInfo")).getNombre():"&nbsp;"%></b></td>
    <TD  align="right" valign="middle" class="pie">Sistema Fiduciario Amicorp 2020.09.30&nbsp;</td>
  </tr>
</table>
<%
}
catch(Exception Ex)
{
//System.out.println("footer.jsp Error ->"+Ex);

session.removeAttribute("userInfo");
session.removeAttribute("username");
session.invalidate();
response.sendRedirect("error.jsp");

}
%>