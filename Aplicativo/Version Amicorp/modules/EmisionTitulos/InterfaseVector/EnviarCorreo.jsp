<!-- EnviarCorreo.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.io.*, javax.activation.*" %>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>

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
<%
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    String sCuerpo = "";
    String sAsunto = "";
    String sMensaje = "<br>";
    
    //Variables que contendrán los elementos de cada tupla
    String nomArchivo="";
    String fechaPrecio="";
    String cveIndice=""; 
    String precioAnterior = "";
    String precioActual = "";
    BigDecimal folio = new BigDecimal(0);
    String status = "";
    
    
    String scorreos = request.getParameter("correos");
    scorreos = scorreos.replaceAll("'","");
    
    scorreos = scorreos.replaceAll("<","\"<");
    scorreos = scorreos.replaceAll(">",">\"");
    String correos[] = scorreos.split(":");
    
    boolean fallaEnCorreo = false;
    int contador = 0;
    int usu = 0;

     try
     {
         if(consulta.size()>0) // asunto
         {
            registro = (java.util.Map)consulta.get(0);
            
             
            nomArchivo = (String)registro.get("feevIdNomArchivo");
            fechaPrecio = (String)registro.get("feevFechaPrecio");            
            
            sAsunto = "Diferencia en Vector de Precios  "+nomArchivo;
         }
         
          while(contador<consulta.size()) // Arma mensaje
          {
               registro = (java.util.Map)consulta.get(contador);
               
               cveIndice = (String)registro.get("feevIdCveIndice");
               precioAnterior = (String)registro.get("feevPrecioAnterior");
               precioActual = (String)registro.get("feevPrecioActual");
               
               sMensaje =  sMensaje+("<u>"+cveIndice+"</u>"+" ->  Precio Capturado: <b>"+precioAnterior+"</b>  &nbsp;&nbsp;&nbsp;   Precio Vector: <b>"+precioActual+"</b><BR>");
               
               contador++;
         }
            
            Properties props = new Properties();
            String fromAddress = "";
            String toAddress = "";
            String IPCorreo=BD.getDatosParametros(100);
            String port = "25";
            String correo=BD.getDatosParametros(101);
            props.put("mail.smtp.host", IPCorreo);
            props.put("mail.smtp.port", port);
            fromAddress = correos[0];
            
            for(int i=0;i<correos.length;i++)
            {
                  toAddress = correos[i];
                  sCuerpo= "<div style='font-family: Calibri,Arial;	font-size: 14px;color: #000000;'>";
                  sCuerpo = sCuerpo +"<b>Fecha Precio:</b> "+fechaPrecio+"<br>";
                  sCuerpo = sCuerpo +"<b>Asunto:</b> "+sAsunto+"<br><br>";
                  sCuerpo = sCuerpo +"<b>Mensaje:</b> <br>"+sMensaje+"<br><br>";
                  sCuerpo = sCuerpo +"</div>";
                  Session s = Session.getInstance(props,null);
                  Message message = new MimeMessage(s);	
                  InternetAddress from = new InternetAddress(fromAddress);
                  InternetAddress to = new InternetAddress(toAddress);
                  message.setFrom(from);	
                  message.addRecipient(Message.RecipientType.TO, to);
                  message.setSubject(sAsunto);
                  message.setHeader("X-Mailer","sendhtml");
                  message.setSentDate(new Date());
                  DataHandler data = new DataHandler(sCuerpo,"text/html");
                  message.setDataHandler(data);
                  Transport.send(message);
            }
            //out.print(sCuerpo);
         if(contador==0)
            fallaEnCorreo = true;
         
    }catch(Exception e){
        System.out.println("ERROR al tratar de enviar el correo "+e.getMessage().toString());
        fallaEnCorreo = true;
    }
%>
  <table width="50%" height="50%"  align="center" bordercolor="#000000" bgcolor="#EAEADF" border="2">
  <tr valign="top">
  <td height="50" align="center"><br>
  <table border="0" height="110" width="440" >
  <tr>
    <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;"><img height="80px" src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORREO&nbsp;&nbsp;<%=session.getAttribute("empresa_9")%> </td>
  <tr>
  <td><hr size="1" noshade></td>
  </tr>
  </tr>
  <%
     if(!fallaEnCorreo){
  %>
  <tr>
      <td align="center"  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">El email ha sido enviado satisfactoriamente</td>
  </tr>
  <!--<tr>
      <td><%=sCuerpo%></td>
  </tr>-->
  <%
  }else{
  %>
    <tr>
      <td align="center"  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">Hubo un error al tratar de enviar el correo</td>
    </tr>
  <%}%>
      <td align="center">
        
      <P><input type="button" name="Cerrar" value="CERRAR" onClick="window.close();" style="background: url('imagenes/boton_new.png'); font-family: Arial, Helvetica, sans-serif; border: 0px;font-size: 11px;width:112px;height:24px;color: #FFFFFF;font-weight: bold;cursor:hand;"/></P>
      <P>&nbsp;</P>
    </td>
  </tr>
  </table>
  </body>
</html>
