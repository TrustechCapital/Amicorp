<%@ page contentType="text/html;charset=ISO-8859-1"%>
<%@ page import="java.io.InputStream,java.util.Properties"%>
<%
session.setMaxInactiveInterval(-1);// duración en segundos de la sesión (-1) = no tiene tiempo limite

//Recupera url login para redireccionar al salir
String  namePartnerApp="partnerApp.properties";
String  submitURL= "";
String siteToken = "";
String requestURL = "";
String cancelURL = "";

/*
        Se debe solicitar la incorporación de la siguiente propiedad en el properties del PartnerApp ubicado en el AppLib del contenedor
        Ejemplo:
        urlLogin= http://wasdes2.nafin.com:7786/Fiduciario/index.jsp (url desarrolo  o produccion)
*/
        InputStream input = ClassLoader.getSystemResourceAsStream(namePartnerApp);

        if(input == null) input = this.getClass().getClassLoader().getResourceAsStream(namePartnerApp);           

        if (input!=null)
	        {
            Properties props = new Properties ( );
            props.load (input);
            submitURL =(String)props.get ("submitURL"); 
            siteToken =(String)props.get ("siteToken"); 
            requestURL =(String)props.get ("requestURL"); 
            cancelURL =(String)props.get ("urlLogin"); 
          }
         else
            {
            
                      
            /*
            submitURL ="http://wasdes2.nafin.com:7783/sso/auth"; 
            siteToken ="v1.2~83F22B73~218DA754775A5ED013D637F5DB76B90E4E8EC43DAE48752DD7EAD8CD6B5C0AFAF29801979D5A5E4D8AEE6F7277093885E24D2825E7C00C1C521826AB3B0D6E837AE9C077BAD1ADFBD984940203A035E3CC2E2FA7334FF5CF99790276EE5E31CEA700281F6195AEE1C1CEBB8896FE6749D6909A72D3384F18CF252426312E9CAE663A9B80B1649EBC90040D6435751E58323EA2698C2286F5823D1B2FAC4C8925D24CE9EE42B5C207F01A3C56771A94C3"; 
            requestURL =""; 
            cancelURL ="http://wasdes2.nafin.com:7786/Fiduciario/"; 
            */
            }


if (request.getParameter("ssousername")!=null&&request.getParameter("password")!=null)
{
    session.setAttribute("username",(String)request.getParameter("ssousername"));
    session.setAttribute("tipoCambio",(String)request.getParameter("tipo"));
    session.setAttribute("password",(String)request.getParameter("password"));
    session.setAttribute("password_pass",(String)request.getParameter("password"));
}

if(request.getParameter("password2")!=null)
{
  String sTipo2=(String)request.getParameter("tipo2");
  session.setAttribute("username",(String)request.getParameter("ssousername2"));
  session.setAttribute("tipoCambio",(String)request.getParameter("tipo2"));
  session.setAttribute("password",(String)request.getParameter("password2"));
  response.sendRedirect("principal.do");
}

  String userName = (String)session.getAttribute("username");
  String password =  (String)session.getAttribute("password");
  String tipoCambio =  (String)session.getAttribute("tipoCambio");
  
if(userName!=null&&!userName.equals(""))
  {
    session.setAttribute("usuario_pass",userName);
    session.setAttribute("password_pass",password);
    
    response.sendRedirect("principal.do");
  }

  
%>
<html>
  <head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=5">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta http-equiv="Page-Exit" content="BlendTrans(Duration=1)" />
    <title>Servicios Fiduciarios</title>
  </head>
  
  <link rel="stylesheet" href="css/fiducia_general.css" type="text/css">
  <!-- JQUERY -->
		<script src="js/jquery/jquery.js" type="text/javascript"></script>
		<script src="js/jquery/draggable/draggable.js" type="text/javascript"></script>
		<script src="js/jquery/draggable/draggable.js" type="text/javascript"></script>
		
		<script src="js/jquery/jalert/alerts.js" type="text/javascript"></script>
		<link href="js/jquery/jalert/alerts.css" rel="stylesheet" type="text/css" media="screen" />



  <body vLink="#052206" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0"  bgcolor="white" background="./imagenes/fondo_fiduciaweb.jpg" style="background-repeat:no-repeat;" onload="">

    <script language="javascript">
      <!--
        var ctxRoot = "<%=request.getContextPath()%>";
        
        $(function() {
          $("#ssousername").focus();
        });
      //-->
      
    </script>
            
    <table id="tablaPrincipal" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" >
      <tr>
        <td rowspan="4">&nbsp;</td>
        <td id="tdHeader" height="40px">
          <!-- Header --><jsp:include page="header.jsp"/>
        </td>
        <td rowspan="4">&nbsp;</td>
      </tr>
      <tr>
        <!--td width="10%">
          <!-- Menu Lateral --><!--jsp:include page="menuLateral.jsp"/-->
        <!--/td-->
        <td width="100%" nowrap align="center">
          <table id="tablaContenido" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" >
            <tr>  
              <td colspan="3" height="3px">
                &nbsp;<!-- Separador -->
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;<!-- Separador --></td>
              <td valign="top" align="center">
                
                <br/><br/><br/>
                
                                
                <form name="logon" method="POST" action="<%=submitURL%>" AutoComplete="off">
                  
                  <INPUT TYPE="hidden" NAME="v" value="v1.4">
                  
                  <input type="hidden" name="site2pstoretoken" value="<%=siteToken%>" /> 
                  <input type="hidden" name="p_submit_url" value="<%=submitURL%>" />
                  <input type="hidden" name="p_request_url" value="<%=requestURL%>" />
                  <INPUT TYPE="hidden" NAME="p_cancel_url" value="<%=cancelURL%>" />
                  <INPUT TYPE="hidden" NAME="p_error_code" value="">
                  <table border="0" cellpadding="5" cellspacing="3" align="center" width="80%">
                    <tr>
                      <td colspan="2" align="center" class="titulo" nowrap>Sistema Fiduciario</td>
                    </tr>
                  </table>
                  
                  <br/><hr/><br/>
                  
                  <table border="0" cellpadding="5" cellspacing="3" align="center">
                    <tr>
                      <td style="font-family:Calibri,Tahoma,Arial;font-size:14px;font-weight:bold;color:#444444;">Usuario:</td>
                      <td>
                        <input type="text" id="ssousername" name="ssousername" maxlength="50"/>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-family:Calibri,Tahoma,Arial;font-size:14px;font-weight:bold;color:#444444;">Contrase&ntilde;a:</td>
                      <td>
                        <input type="password" id="password" name="password" maxlength="12"/>
                        <input type="hidden" id="tipo" name="tipo" maxlength="8" value="1"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right" valign="bottom">
                        <input id = "cmdEntrar" type="SUBMIT" class="boton" onclick="validaUser()" value="Entrar"/>
                      </td>
                    </tr>
                  </table>
                  
                </form>
             
              <div id="cambiaPassword" style="visibility:hidden">
               <form name="logon2" method="POST" action="<%=submitURL%>" AutoComplete="off">
                  <table border="0" cellpadding="5" cellspacing="3" align="center" width="80%">
                    <tr>
                      <td colspan="2" align="center" class="titulo" nowrap>Cambio de Password</td>
                    </tr>
                  </table>
                  <hr/>
                  
                  
                  <table border="0" cellpadding="5" cellspacing="3" align="center">
                    <tr>
                      <td>Contrase&ntilde;a:</td>
                      <td>
                        <input type="password" id="password2" name="password2" value="" maxlength="12"/>
                      </td>
                    </tr>
                    <tr>
                      <td>Confirmacion Contrase&ntilde;a:</td>
                      <td>
                        <input type="password" id="password3" name="password3" value="" maxlength="12"/>
                        <input type="hidden" id="ssousername2" name="ssousername2" value="" maxlength="12"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right" valign="bottom">
                        <input type="button" class="boton" onclick="validaPassword()" value="Confirmar"/>
                        <input type="hidden" id="tipo2" name="tipo2" maxlength="8" value="1"/>
                      </td>
                    </tr>
                  </table>                  
                </form>
                
              </div>  
                
              </td>
              <td width="15%">&nbsp;<!-- Separador --></td>
            </tr>
            <tr>  
              <td colspan="3" height="3px">
                &nbsp; <!-- Separador -->
              </td>
            </tr>            
          </table>
        </td>
      </tr>
      <tr>
        <td height="16px">
          <!-- Footer --><jsp:include page="footer.jsp"/>
        </td>
      </tr>
    </table>
    
    <div id="dvMensajes" style="position: absolute; top: 0; left: 0;"></div>
  </body>
</html>
<script>

  function validaUser(){
  //alert('Las contrasenas no coinciden');
  document.logon.submit();
  }


var login = <%=((session.getAttribute("login")==null)?"'.'":session.getAttribute("login"))%>;
var tcambio = <%=((session.getAttribute("tipoCambio")==null)?"'.'":session.getAttribute("tipoCambio"))%>;
//alert(login)
//alert("tipo cambio"+tcambio)
if(login!='.')
{
  switch(eval(login)){
      case 0:
        alert("Ok");
      break; 
      case 1:
        if(tcambio==1)
          alert("Usuario o Password Incorrecto","Alert FiduciaWeb");
        else if(tcambio==0 && eval(login)==1)
          alert("El Password ya esta en uso");
        else
            alert("Error en Password");
      break;
      case 2:
        alert("Usuario Bloqueado, Consulte con Sistemas");
      break;
      case 3:
          alert("Se requiere que modifique su password");
          document.getElementById("tipo").value = 0;
          document.getElementById("tipo2").value = 0;
          document.getElementById("cambiaPassword").style.visibility="visible";
          document.getElementById("cmdEntrar").disabled = true;
          document.getElementById("ssousername").disabled = true;
          document.getElementById("password").disabled = true;
          document.getElementById("ssousername").value = '<%=session.getAttribute("usuario_pass")%>';
          document.getElementById("password").value = '<%=session.getAttribute("password_pass")%>';
          document.getElementById("ssousername2").value = '<%=session.getAttribute("usuario_pass")%>';
          <%
          if(Integer.parseInt(session.getAttribute("login")!=null?session.getAttribute("login").toString():"0")==3)
          {
            session.removeValue("usuario_pass");
            session.removeValue("password_pass");
          } 
          session.removeValue("login");
          %>
      break;
      case 5:
        alert("El Password No Cumple con el minimo de Numeros");
      break;
      case 6:
        alert("El Password No Cumple con el minimo de Caracteres");
      break;
      case 7:
        alert("El Password No Cumple con el minimo de Minusculas");
      break;
      case 8:
        alert("El Password No Cumple con el minimo de Mayusculas");
      break;
      case 9:
        alert("El Password No Cumple con la Longitud Minima");
      break;
      default:
          alert(login);
      break;
  }
}

function validaPassword()
{
  if(document.getElementById("password2").value==document.getElementById("password3").value)
    document.logon2.submit();
  else
    alert("Las contraseñas no coinciden")
}
</script>