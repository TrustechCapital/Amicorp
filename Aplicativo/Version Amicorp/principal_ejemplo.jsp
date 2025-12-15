<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Servicios Fiduciarios</title>
  </head>
  
  <link rel="stylesheet" href="css/fiducia_general.css" type="text/css"/>
  <link rel="stylesheet" href="css/dhtmlXMenu.css" type="text/css"/>
  <link rel="stylesheet" href="css/dhtmlXMenu_xp.css" type="text/css"/>
  
  <style>
    #xpstyle{
      background-color:#ece9d8;
      padding: 1;
    }
  </style>
  
  <body vLink="#052206" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
    
    <script language="javascript">
        var aMenuBar = null;
        var ctxRoot = "<%=request.getContextPath()%>";
        var OLbubbleImageDir = ctxRoot + "/js/overlibmws/";
    </script>
    
    <script type="text/javascript" src="js/generic_functions.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/formValidator.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/keyHandler.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws.js"></script>    
    <script type="text/javascript" src="js/overlibmws/overlibmws_bubble.js"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws_filter.js"></script>
    <script type="text/javascript" src="js/calendar/calendar.js"></script>
    <script type="text/javascript" src="js/JSON.js"></script>
    
    <script type="text/javascript" src="js/catalogos.js"></script>
    <script type="text/javascript" src="js/menu//dhtmlXProtobar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXMenuBar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXCommon.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    
    <script language="javascript">
      //var claseCatalogo = new Catalogo("mx.com.inscitech.fiducia.domain.Estados");
      //loadDynamicJS(ctxRoot + "/jsp/test/est.js");
      
      function cargaCliente() {
          showWaitLayer();
          var urlCliente = "jsp/test/cliente.do";
          makeAjaxRequest(urlCliente, "HTML", despliegaPAntalla, null);
        }
       function cargaPrincipalFideicomisos() {
          showWaitLayer();
          var urlCliente = "jsp/Administracion/PrincipalFideicomisos.do";
          makeAjaxRequest(urlCliente, "HTML", despliegaPAntalla, null);
          hideWaitLayer();
        }
        function cargaEstados() {
          showWaitLayer();
          var urlCliente = "jsp/test/est.do";
          makeAjaxRequest(urlCliente, "HTML", despliegaPAntalla, null);
        }
        function despliegaPAntalla(obj, result) {
          GI("dvContenido").innerHTML = result;
          loadDynamicJS(ctxRoot + "/jsp/Administracion/PrincipalFideicomisos.js");
        }
        
        var FV_DEFAULT_MESSAGE = "Mensaje de default";
        var FV_DEFAULT_SINGLE_MESSAGE = "Campo Requerido";
        var FV_INVALID_FORMAT_MESSAGE = "Formato no valido";
        var FV_MSG_INVALID_FORM = "Por favor verifique los datos";
        var fv = new FormValidator();
        fv.setup({
          formName      : "formaDatos",
          tipoAlert     : 1,
          alertFunction : BaloonAlert,
          sendObjToAlert: true
        });
        var fv2 = new FormValidator();
        fv2.setup({
          formName      : "frmDatosFideicomisosConsulta",
          tipoAlert     : 1,
          alertFunction : BaloonAlert,
          sendObjToAlert: true
        }); 
    </script>
    
    <table id="tablaPrincipal" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
      <tr>
        <td colspan="2" height="83px">
          <!-- Header --><jsp:include page="header.jsp"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="18px"> 
          <!-- Menu Principal --><jsp:include page="menu.jsp"/>
        </td>
      </tr>
      <tr>
        <td width="176px">
          <!-- Menu Lateral --><jsp:include page="menuLateral.jsp"/>
        </td>
        <td nowrap>
          <table id="tablaContenido" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
            <tr>  
              <td colspan="3" height="3px">
                &nbsp;<!-- Separador -->
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;<!-- Separador --></td>
<!-------------------------------------------------------------------------------------- -->
<!-------------------------------------------------------------------------------------- -->
           
              <td valign="top" align="center">
                <a href="javascript:cargaCliente();">Cliente</a>
                <br/><br/>
                <a href="javascript:cargaPrincipalFideicomisos();">Principal Fideicomisos</a>
                <br/><br/>
                <a href="javascript:cargaEstados();">Estados</a>
                <!-- Contenido -->
                <div id="dvContenido"></div>
              </td>
<!-------------------------------------------------------------------------------------- -->
<!-------------------------------------------------------------------------------------- -->

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
        <td colspan="2" height="16px">
          <!-- Footer --><jsp:include page="footer.jsp"/>
        </td>
      </tr>
    </table>
    
    <div id="dvMensajes" style="position: absolute; top: 0; left: 0;"></div>
  </body>
</html>