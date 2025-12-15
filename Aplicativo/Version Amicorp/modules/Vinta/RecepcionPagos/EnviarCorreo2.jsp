<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.io.*, javax.activation.*"%>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="BD" class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    String sCuerpo = "";
    
    //Variables que contendrán los elementos de cada tupla
    String subject = "Alerta de operación con clasificación ";
    
    String emailFrom = "Nemo@company.mail";
    String emailTo = "Nemo@company.mail";
    
    boolean falleEnCorreo = false;
    int contador = 0;
    int usu = 0;

     try {
         while(contador < consulta.size()) {
            registro = (java.util.Map)consulta.get(contador);
            
            subject = subject + (String)registro.get("vclasificacion");;
            
            Properties props = new Properties();
            String fromAddress = "";
            String toAddress = "";
            String IPCorreo = BD.getDatosParametros(100);
            String correo = BD.getDatosParametros(101);
              props.put("mail.smtp.host", "localhost");
              props.put("mail.smtp.auth", "true");
              props.put("mail.smtp.port", "25");
              props.put("mail.smtp.starttls.enable", "true");
            
      Session session2 = Session.getDefaultInstance(props,
              new javax.mail.Authenticator() {
                      protected PasswordAuthentication getPasswordAuthentication() {
                              //return new PasswordAuthentication("eominguer@nemito.mail","77063Horus");
                              return new PasswordAuthentication("Nemo@company.mail","77063Horus");
                      }
              });
            
            fromAddress = emailFrom;
            toAddress = emailTo;
            System.out.println("ip correo 25 " + "localhost");
            System.out.println("from address " + emailFrom);
            
            sCuerpo= "<div style='font-family: Arial; font-size: 12px;color: #000000;'>";
            
            sCuerpo = sCuerpo +"Detalle de la operación:<br>";
            sCuerpo = sCuerpo +"<b>Folio:</b> " + (BigDecimal)registro.get("idPago") + "<br>";
            sCuerpo = sCuerpo +"<b>Clasificación:</b> " + (String)registro.get("vclasificacion") + "<br>";
            sCuerpo = sCuerpo +"<b>Crédito:</b> " + (String)registro.get("anumeroCredito") + "<br>";
            sCuerpo = sCuerpo +"<b>Forma de Liquidación:</b> " + (String)registro.get("vformaPago") + "<br>";
            sCuerpo = sCuerpo +"<b>Tipo de Operación:</b> " + (String)registro.get("vtipoPago") + "<br>";
            sCuerpo = sCuerpo +"<b>Importe:</b> " + (String)registro.get("imonto") + "<br>";
            
            sCuerpo = sCuerpo +"</div>";
//            Message message = new MimeMessage(s);	
         Message message = new MimeMessage(session2);
            InternetAddress from = new InternetAddress(fromAddress);
            InternetAddress to = new InternetAddress(toAddress);
            message.setFrom(from);	
            message.addRecipient(Message.RecipientType.TO, to);
            message.setSubject(subject);
            message.setHeader("X-Mailer","sendhtml");
            message.setSentDate(new Date());
            DataHandler data = new DataHandler(sCuerpo,"text/html");
            message.setDataHandler(data);
            Transport.send(message);
            
            contador++;
         }
         
         if(contador == 0)
            falleEnCorreo = true;
         
    } catch(Exception e){
        System.out.println("ERROR al tratar de enviar el correo " + e.getMessage().toString());
        falleEnCorreo = true;
    }
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"></meta>
    <title>Enviar Correo</title>
    <link rel="stylesheet" href="css/fiducia_general.css" type="text/css"/>
    <link rel="stylesheet" href="css/dhtmlXMenu.css" type="text/css"/>
    <link rel="stylesheet" href="css/dhtmlXMenu_xp.css" type="text/css"/>
    <link rel="stylesheet" href="css/nafin.css" type="text/css"/>
    <link rel="stylesheet" href="fiduciav5/nafin.css" type="text/css"/>
  </head>
  <body bgcolor="#ffffff" leftmargin="0" text="#000000" topmargin="0" marginwidth="0" marginheight="0" width="10" height="10" toolbar="no" resizable="yes">
    <table width="50%" height="50%" align="center" bordercolor="#000000" bgcolor="#EAEADF" border="2">
      <tr valign="top">
        <td height="50" align="center">
          <br></br>
          <table border="0" height="110" width="440">
            <tr>
              <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;">
                <img src="&lt;%=request.getContextPath()%>/imagenes/logo_bn.jpg"></img>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORREO&nbsp;&nbsp;<%=session.getAttribute("empresa_9")%>
              </td>
            </tr><tr>
              <td>
                <hr size="1" noshade="noshade"></hr>
              </td>
            </tr>
          </table>
        </td>
      </tr>
       
      <%
        if(!falleEnCorreo){
      %>
      <tr>
        <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
          El email ha sido enviado satisfactoriamente
        </td>
      </tr>
       
      <!--<tr>
      <td><%=sCuerpo%></td>
  </tr>-->
       
      <%
        } else {
      %> 
        <tr>
          <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
            Hubo un error al tratar de enviar el correo.
          </td>
        </tr>
       
      <% } %>
      <tr>
        <td align="center">
          <p>
            <input type="button" name="Cerrar" value="CERRAR" onclick="window.close();" style="background: url('imagenes/boton_new.png'); font-family: Arial, Helvetica, sans-serif; border: 0px;font-size: 11px;width:112px;height:24px;color: #FFFFFF;font-weight: bold;cursor:hand;"/>
          </p>
          <p>&nbsp;</p>
        </td>
      </tr>
    </table>
  </body>
</html>