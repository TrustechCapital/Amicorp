<!-- EnviarCorreo.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.io.*, javax.activation.*" %>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    String sCuerpo = "";
    
    //Variables que contendrán los elementos de cada tupla
    String desEvento="";
    String textEvento="";
    String accionTomada=""; 
    
    String fideicomiso = "";
    String usuario = "";
    String fecha = "";
    BigDecimal folio = new BigDecimal(0);
    String status = "";
    
    String correos[] = new String[5];
    
    boolean falleEnCorreo = false;
    int contador = 0;
    int usu = 0;

     try {
         while(contador<consulta.size()) {
            registro = (java.util.Map)consulta.get(contador);
            BigDecimal []numUsuarios = new BigDecimal[5];
            
            folio = (BigDecimal)registro.get("eageIdFolio");
            usuario = (String)registro.get("perNomUsuario");
            fideicomiso = (String)registro.get("eageFideicomiso");
            fecha = (String)registro.get("eageFecEvento");
            status = (String)registro.get("eageCveStatus");
            
            numUsuarios[0] = (BigDecimal)registro.get("eageNumUsuario");
            numUsuarios[1] = (BigDecimal)registro.get("eageNumUsuario2");
            numUsuarios[2] = (BigDecimal)registro.get("eageNumUsuario3");
            numUsuarios[3] = (BigDecimal)registro.get("eageNumUsuario4");
            numUsuarios[4] = (BigDecimal)registro.get("eageNumUsuario5");
            
            desEvento = "F"+fideicomiso.split("-")[0]+"-"+(String)registro.get("eageDesEvento");
            textEvento = (String)registro.get("eageTextEvento");
            accionTomada = (String)registro.get("eageAccionTomada");
            //buscando correos
            
            for(int s = 0;s<numUsuarios.length;s++)
            {
              usu=Integer.parseInt(numUsuarios[s].toString());
              nConsultas.setVtrIntDato1(usu);//
              nConsultas.querySelect(99);
              if(nConsultas.hasData())
                correos[s] = nConsultas.getVtrStrDato1();
              else
                correos[s] = "";
            }
            
            Properties props = new Properties();
            String fromAddress = "";
            String toAddress = "";
            String IPCorreo=BD.getDatosParametros(100);
            String correo=BD.getDatosParametros(101);
            props.put("mail.smtp.host", IPCorreo);
            props.put("mail.smtp.port", "25");
            fromAddress = correos[0];
            System.out.println("ip correo 25 "+IPCorreo);
            System.out.println("from address "+correos[0]);
            
            
            for(int i=0;i<correos.length;i++){
               if(correos[i]!=null&&correos[i]!=""){
                  toAddress = correos[i];
                  sCuerpo= "<div style='font-family: Arial;	font-size: 12px;color: #000000;'>";
                  sCuerpo = sCuerpo +"<b>Fecha Evento:</b> "+fecha+"<br>";
                  sCuerpo = sCuerpo +"<b>Fideicomiso:</b> "+fideicomiso+"<br>";
                  sCuerpo = sCuerpo +"<b>Usuario:</b> "+usuario+"<br>";
                  sCuerpo = sCuerpo +"<b>Folio Agenda:</b> "+folio+"<br>";
                  sCuerpo = sCuerpo +"<b>Estado:</b> "+status+"<br><br>";
                  sCuerpo = sCuerpo +"<b>Asunto:</b> "+desEvento+"<br><br>";
                  sCuerpo = sCuerpo +"<b>Mensaje:</b> "+textEvento+"<br><br>";
                  sCuerpo = sCuerpo +"<b>Acción Tomada:</b> "+accionTomada+"";
                  sCuerpo = sCuerpo +"</div>";
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
          contador++;
         }
         if(contador==0)
            falleEnCorreo = true;
         
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
    <td align="center" style="font-family: Arial;	font-size: 14px;color: #000000;font-weight: bold;"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORREO&nbsp;&nbsp;<%=session.getAttribute("empresa_9")%> </td>
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
