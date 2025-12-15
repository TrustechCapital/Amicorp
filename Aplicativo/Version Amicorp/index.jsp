<%@ page contentType="text/html;charset=ISO-8859-1"%>
<% 
 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "Thu, 29 Oct 2000 17:04:19 GMT");

		response.sendRedirect("principal.do"); // cada aplicaci?n debe indicar esta parte
%>

