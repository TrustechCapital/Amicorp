<%@ page contentType="text/html;charset=ISO-8859-1"%>
<% 
  String username = (String)session.getAttribute("username");
  String logoutURL = "login.do";
  
  try {		 

    session.invalidate();
		
    request.setAttribute("Mensaje", "Su sesion ha finalizado exitosamente!");
    
    response.sendRedirect(logoutURL);
    //response.sendRedirect("principal.do");
  } catch(Exception e) {
              %>
    <center>Error al Finalizar la sesion de la aplicaci&oacute;n
      <br/>Por favor cierra todas las ventanas del explorador.
    </center>
              <% 
    return;
  }
%>
<center>
  Tu no cuentas con una sesi&oacute;n en la aplicaci&oacute;n
  <br/>
  <!--a href=&quot;papp.jsp&quot;&gt;Login&lt;/a-->
  <A HREF="login.jsp">Inicio</A>
<center/>
