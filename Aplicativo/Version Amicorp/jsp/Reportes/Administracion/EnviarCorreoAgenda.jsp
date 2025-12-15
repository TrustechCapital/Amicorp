<!-- EnviarCorreo.jsp   ____ -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.io.*, javax.activation.*" %>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="nConsultas2" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="nConsultas3" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="nConsultas4" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="nConsultas5" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String desEvento="";
    String textEvento="";
    String accionTomada=""; 
    
    String correo1="";
    String correo2="";
    String correo3="";
    String correo4="";
    String correo5="";
    
    boolean falleEnCorreo = false;

    BigDecimal numUsuario = new BigDecimal(0);
    BigDecimal numUsuario2 = new BigDecimal(0);
    BigDecimal numUsuario3 = new BigDecimal(0);
    BigDecimal numUsuario4 = new BigDecimal(0);
    BigDecimal numUsuario5 = new BigDecimal(0);
     try {
         if(consulta.size() > 0) {
            registro = (java.util.Map)consulta.get(0);
            numUsuario = (BigDecimal)registro.get("eageNumUsuario");
            numUsuario2 = (BigDecimal)registro.get("eageNumUsuario2");
            numUsuario3 = (BigDecimal)registro.get("eageNumUsuario3");
            numUsuario4 = (BigDecimal)registro.get("eageNumUsuario4");
            numUsuario5 = (BigDecimal)registro.get("eageNumUsuario5");
            desEvento = (String)registro.get("eageDesEvento");
            textEvento = (String)registro.get("eageTextEvento");
            accionTomada = (String)registro.get("eageAccionTomada");
            //buscando correos
            int usu1=Integer.parseInt(numUsuario.toString());
            nConsultas.setVtrIntDato1(usu1);//
            nConsultas.querySelect(99);
            if(nConsultas.hasData())
            {
               correo1 = nConsultas.getVtrStrDato1();
            }
            int usu2=Integer.parseInt(numUsuario2.toString());
            nConsultas2.setVtrIntDato1(usu2);
            nConsultas.querySelect(100);
            if(nConsultas2.hasData())
            {
               correo2 = nConsultas2.getVtrStrDato1();
            }
            int usu3=Integer.parseInt(numUsuario3.toString());
            nConsultas3.setVtrIntDato1(usu3);
            nConsultas3.querySelect(101);
            if(nConsultas3.hasData())
            {
               correo3 = nConsultas3.getVtrStrDato1();
            }
            int usu4=Integer.parseInt(numUsuario4.toString());
            nConsultas4.setVtrIntDato1(usu4);
            nConsultas4.querySelect(102);
            if(nConsultas4.hasData())
            {
               correo4 = nConsultas4.getVtrStrDato1();
            }
            int usu5=Integer.parseInt(numUsuario5.toString());
            nConsultas5.setVtrIntDato1(usu5);
            nConsultas5.querySelect(103);
            if(nConsultas5.hasData())
            {
               correo5 = nConsultas5.getVtrStrDato1();
            }
            Properties props = new Properties();
            String fromAddress = "";
            String toAddress = "";
            String IPCorreo=BD.getDatosParametros(100);
            String correo=BD.getDatosParametros(101);
            props.put("mail.smtp.host", IPCorreo);
            fromAddress = correo1;
            System.out.println("ip correo"+IPCorreo);
            System.out.println("from address"+correo1);
            toAddress = correo1+((correo2==null)?"":","+correo2)+((correo3==null)?"":","+correo3)+((correo4==null)?"":","+correo4)+((correo5==null)?"":","+correo5);
            
            toAddress = toAddress.replaceAll(",,",",").replaceAll(" ","");
            
            
            
            String correos[]=null;
            correos=toAddress.split(",");
            for(int i=0;i<correos.length;i++){
               if(correos[i]!=null&&correos[i]!=""&&correos[i]!=" "){
                  toAddress = correos[i];
                  String sCuerpo= "ASUNTO:\n"+desEvento+"\n\n\nMENSAJE: \n"+textEvento+"\n"+accionTomada;
                  Session s = Session.getInstance(props,null);
                  Message message = new MimeMessage(s);	
                  InternetAddress from = new InternetAddress(fromAddress);
                  InternetAddress to = new InternetAddress(toAddress);
                  message.setFrom(from);	
                  message.addRecipient(Message.RecipientType.TO, to);
                  message.setSubject(desEvento);
                  message.setHeader("X-Mailer","sendhtml");
                  message.setSentDate(new Date());
                  DataHandler data = new DataHandler(sCuerpo,"text/html");
                  message.setDataHandler(data);
                  Transport.send(message);
                }
            }
         }else {
            falleEnCorreo = true;
         }
    }catch(Exception e){
        System.out.println("ERROR al tratar de enviar el correo "+e.getMessage().toString());
        falleEnCorreo = true;
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
    <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORREO&nbsp;&nbsp;PROTEGO </td>
  <tr>
  <td><hr size="1" noshade></td>
  </tr>
  </tr>
  <%
     if(!falleEnCorreo){
  %>
  <tr>
      <td align="center"  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">El email ha sido enviado satisfactoriamente</td>
  </tr>
  <%
  }else{
  %>
    <tr>
      <td align="center"  style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">Hubo un error al tratar de enviar el correo</td>
    </tr>
  <%}%>
      <td align="center">
        <P>&nbsp;</P>
      <P><input type="button" name="Cerrar" value="CERRAR" onClick="window.close();" style="background: #006699; border: 1px solid #000066; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #FFFFFF; font-weight: normal;"/></P>
    </td>
  </tr>
  </table>
  </body>
</html>
