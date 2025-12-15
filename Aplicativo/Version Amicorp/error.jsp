<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Servicios Fiduciarios</title>
  </head>
  
  <link rel="stylesheet" href="css/fiducia_general.css" type="text/css">

<script language="JavaScript">
function ir() 			{
						javascript: setTimeout("salirSSo();",3000)
							}

function salirSSo() {
							location.href="ssologoff.jsp";
							}
</script>

  <body vLink="#052206" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0" onLoad="ir();">

    <script language="javascript">
      <!--
        var ctxRoot = "<%=request.getContextPath()%>";        
      //-->
    </script>
            
    <table id="tablaPrincipal" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
      <tr>
        <td rowspan="4" >&nbsp;</td>
        <td id="tdHeader" height="63px">
          <!-- Header --><jsp:include page="header.jsp"/>
        </td>
        <td rowspan="4">&nbsp;</td>
      </tr>
      <tr>
        <!--td width="10%">
          <!-- Menu Lateral --><!--jsp:include page="menuLateral.jsp"/-->
        <!--/td-->
        <td width="100%" nowrap align="center">
          <table id="tablaContenido" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
            <tr>  
              <td colspan="3" height="3px">
                &nbsp;<!-- Separador -->
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;<!-- Separador --></td>
              <td valign="top" align="center">
                
                <br/><br/><br/>
                
               				
                    <%
                        if(session.getAttribute("Mensaje")!=null)
                           out.print(session.getAttribute("Mensaje"));
						
                     %>
					 <BR>
					 <%
                        if(session.getAttribute("Error")!=null)
                           out.print(session.getAttribute("Error"));
						
                     %>
					 					 <BR>
					 <%
                        if(session.getAttribute("errorToken")!=null)
                           out.print(session.getAttribute("errorToken"));
						
                     %>
                
              </td>
              <td width="15%">&nbsp;<!-- Separador --></td>
            </tr>
            <tr>  
              <td colspan="3" align="center" class="alerta">ESPERE MIESTRAS FINALIZA SU SESION<br><br><img src="imagenes/reloj_arena.gif" width="31" height="30">&nbsp;
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



