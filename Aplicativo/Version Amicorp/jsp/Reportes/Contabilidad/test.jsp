<%@ page contentType="application/vnd.ms-excel"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body>
<%-- Set the content type header with the JSP directive --%>
                                                                                                                   
<%-- Set the content disposition header --%>
<% response.setHeader("Content-Disposition", "attachment; filename=\"mult-table.xls\""); %>
                                                                                                                   
<table>
<% for(int i = 1; i <= 12; i++){ %>
  <tr>
    <% for(int j = 1; j <= 12; j++){ %>
      <td>
        <%= i * j %>
      </td>
    <% } %>
  </tr>
<% } %>
</table>
 
  
  </body>
</html>
