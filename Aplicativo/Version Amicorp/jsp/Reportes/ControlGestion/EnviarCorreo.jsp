<!-- EnviarCorreo.jsp -->
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.io.*, javax.activation.*" %>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    BigDecimal iFideicomiso = new BigDecimal(0);    
    BigDecimal iNumUsuario = new BigDecimal(0);    
    BigDecimal iCveCuenta = new BigDecimal(0);    
    BigDecimal iFolio = new BigDecimal(0);    
    String sCorreo="";
    String sNomUsuario="";
    String sCuenta="";    
    String sMotRechazo="";
    
    if(consulta.size()>0)
    {
      registro = (java.util.Map)consulta.get(0);
      iFideicomiso=(BigDecimal)registro.get("ateNumContrato");
      iNumUsuario=(BigDecimal)registro.get("usuNumUsuario");
      sCorreo=(String)registro.get("perNivelEstudios");
      sNomUsuario=(String)registro.get("perNomUsuario");
      sCuenta=(String)registro.get("cdpNumCuenta");
      iCveCuenta=(BigDecimal)registro.get("cdpCveCuendep");
      iFolio=(BigDecimal)registro.get("pfdFolio");
      sMotRechazo=(String)registro.get("pfdDescripcion");
      
      Properties props = new Properties();
      String fromAddress = "";
      String toAddress = "";
      
      String IPCorreo=BD.getDatosParametros(100);
      String correo=BD.getDatosParametros(101);
      props.put("mail.smtp.host", IPCorreo);
      fromAddress = correo;
     
      toAddress = sCorreo;
      
      String sCuerpo= sNomUsuario + " le comunicamos que el número de cuenta enviado con anterioridad "+
      sCuenta + " con número de Folio " + String.valueOf(iFolio) +
      " contiene errores y no pudo ser dado de alta."+
      " El Motivo de Rechazo es el siguiente: "+sMotRechazo +
      " Por su atención gracias.";
      Session s = Session.getInstance(props,null);
      Message message = new MimeMessage(s);	
      InternetAddress from = new InternetAddress(fromAddress);
      InternetAddress to = new InternetAddress(toAddress);
      message.setFrom(from);	
      message.addRecipient(Message.RecipientType.TO, to);
      message.setSubject("NAFIN, Aviso de Rechazo de Cuenta");
      message.setHeader("X-Mailer","sendhtml");
      message.setSentDate(new Date());
      DataHandler data = new DataHandler(sCuerpo,"text/html");
      message.setDataHandler(data);
      Transport.send(message);
  }  
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Enviar Correo</title>
    <link rel="stylesheet" href="css/fiducia_general.css" type="text/css"/>
   <link rel="stylesheet" href="css/dhtmlXMenu.css" type="text/css"/>
   <link rel="stylesheet" href="css/dhtmlXMenu_xp.css" type="text/css"/>
    <link rel="stylesheet" href="css/nafin.css" type="text/css"/>
    <link rel="stylesheet" href="fiduciav5/nafin.css" type="text/css"/>
  </head>
  <body bgColor=#ffffff leftMargin=0 text=#000000 topMargin=0 marginwidth="0" marginheight="0" width="10" height="10" toolbar="no" resizable="yes">
  <table width="50%" height="50%"  align="center" bordercolor="#000000" bgcolor="#EAEADF" border="2">
  <tr valign="top">
  <td height="50" align="center"><br>
  <table border="0" height="110" width="440" >
  <tr>
    <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;"> PROTEGO, s.n.c. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"></td>
  <tr>
  <td><hr size="1" noshade></td>
  </tr>
  </tr>
  <tr>
      <td align="center"  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">El email ha sido enviado satisfactoriamente</td>
  </tr>
      <td align="center">
        <P>&nbsp;</P>
      <P><input type="button" name="Cerrar" value="CERRAR" onClick="window.close();" style="background: #006699; border: 1px solid #000066; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #FFFFFF; font-weight: normal;"/></P>
    </td>
  </tr>
  </table>
  </body>
</html>