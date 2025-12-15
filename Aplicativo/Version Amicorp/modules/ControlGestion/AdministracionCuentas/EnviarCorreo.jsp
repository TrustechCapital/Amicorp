<!-- EnviarCorreo.jsp -->
<%@ page contentType="text/html;charset=windows-1252" import="mx.gob.nafin.fiduciario.web.util.SendMail"%>
<%
  	String from = "(ERICK ALEJANDRO OMAÑA MINGËR) eominguer@hotmail.com";
		String to = "edu.aya@hotmail.com";
    String cc = "eominguer@gmail.com";
		String subject = "Cuenta rechazada";
		String message = "La cuenta rechazada es la numero ?";
    String smtpHost = "130.0.24.41";
    SendMail sendMail = new SendMail(from, to, cc, subject, message, smtpHost);
		sendMail.send();

%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Enviar Correo</title>
  </head>
  <body>
    <script language="javascript">
      document.location = "<%=request.getContextPath()%>/EnviarCorreo.jsp";
    </script>
  </body>
</html>
