<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Servicios Fiduciarios</title>
  </head>
  
  <link rel="stylesheet" href="css/fiducia_general.css" type="text/css">
  <link rel="stylesheet" href="css/dhtmlXMenu.css" type="text/css">
  <link rel="stylesheet" href="css/dhtmlXMenu_xp.css" type="text/css">
  <link rel="stylesheet" href="js/calendar/calendar-blue2.css" type="text/css">

  <body vLink="#052206" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0" onload="loadMenu();">

    <script language="javascript">
      <!--
        var aMenuBar = null;
        var ctxRoot = "<%=request.getContextPath()%>";        
        var OLbubbleImageDir = ctxRoot + "/js/overlibmws/";
        
        function doTest() {
          displayFrame("dvMensajes", "frameUpload", ctxRoot + "/jsp/test/testUpload.jsp", 200, 200, 100, 400);
        }
        
        function frameSubmit(forma) {
          GI("frameUpload").onreadystatechange = charros;
          forma.submit();
        }
        
        function charros() { 
          GI("frameUpload").onreadystatechange = null;
          removeFrame("frameUpload");
        }
      //-->
    </script>
    
    <script type="text/javascript" src="js/cross_browser_support.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/generic_functions.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/formValidator.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/keyHandler.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws.js"></script>    
    <script type="text/javascript" src="js/overlibmws/overlibmws_bubble.js"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws_filter.js"></script>
    <script type="text/javascript" src="js/calendar/calendar.js"></script>
    <script type="text/javascript" src="js/calendar/lang/calendar-ES.js"></script>   
    <script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
    <script type="text/javascript" src="js/JSON.js"></script>
    <script type="text/javascript" src="js/catalogos.js"></script>
    <script type="text/javascript" src="js/menu//dhtmlXProtobar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXMenuBar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXCommon.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    <script type="text/javascript" src="js/funciones_cliente.js"></script>
        
    <table id="tablaPrincipal" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
      <tr>
        <td rowspan="4">&nbsp;</td>
        <td id="tdHeader" height="63px">
          <!-- Header --><jsp:include page="header.jsp"/>
        </td>
        <td rowspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td height="18px"> 
          <!-- Menu Principal --><jsp:include page="menu.jsp"/>
        </td>
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
                <!-- Contenido -->
                <a herf="#" onclick="doTest();">Prueba</a>
                <div id="dvContenido"></div>
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