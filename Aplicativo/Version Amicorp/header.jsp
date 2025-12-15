<%@ page contentType="text/html;charset=ISO-8859-1"%>
<%
/*
   if(session.getAttribute("username")==null)
     {
     session.setAttribute("Error","Su sesión ha caducado, debido a que excedio el tiempo limite de inactividad");
     response.sendRedirect("error.jsp");
     }
     */
%>                          
<TABLE border="0" cellPadding="0" cellSpacing="0"  width="100%">  
  <TR>
    <TD width="20%" background="imagenes/fondoProtego.jpg"> <img src="imagenes/logo_bn.jpg" alt="Protego Casa de Bolsa" border="0"
                                                                 height="88"
                                                                 width="76"/></TD>
    <td width="80%"  align="right" valign="bottom" background="imagenes/fondoProtego.jpg" height="50%" width="50%">
      <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
        <tr> 
          <td  align="right" valign="middle"  height="25">&nbsp; 
            <%if(session.getAttribute("username")!=null){//ssologoff%>
              <a href="ssologoff.jsp" style="color:#FFFFFF">Cerrar Sesion &nbsp;&nbsp;<img src="imagenes/power.png" border="0" alt="Cerrar Sesión SSO" height="14" width="34"></a>
            <%}%>
          </td>
        </tr>
        <tr> 
          <td  align="right" valign="bottom" class="tituloEncabezado" height="50%"> 
            <font style="font-weight: bolder; font-size: 9pt;"><%=session.getAttribute("strFechaContable")!=null?session.getAttribute("strFechaContable"):"&nbsp;"%></font>&nbsp;&nbsp; 
            <%if(session.getAttribute("mesAbiertoLbl") != null) {%>
            <%}%>
          </td>
        </tr>
      </table>
    </td>
  </TR>
</TABLE>
