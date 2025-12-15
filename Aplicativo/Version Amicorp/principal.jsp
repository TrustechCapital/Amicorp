<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=5">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Servicios Fiduciarios</title>
  </head>
  
  <link rel="stylesheet" href="css/fiducia_operacion.css" type="text/css" />
  
  <link rel="stylesheet" href="css/fiducia_general.css" type="text/css" />
  <link rel="stylesheet" href="css/dhtmlXMenu.css" type="text/css" />
  <link rel="stylesheet" href="css/dhtmlXMenu_xp.css" type="text/css" />
  <link rel="stylesheet" href="js/calendar/calendario.css" type="text/css" />
  <link id="skinhelper-Normal" type="text/css" rel="stylesheet" href="js/calendarExtended/css/jscal2.css" />  
  <link id="skinhelper-Minis" type="text/css" rel="" href="js/calendarExtended/css/jscal2Minis.css" />
  <link type="text/css" rel="stylesheet" href="js/calendarExtended/css/border-radius.css" />
  <link type="text/css" rel="stylesheet" href="js/calendarExtended/css/extras.css" />
  <link id="skinhelper-compact" type="text/css" rel="stylesheet" href="js/calendarExtended/css/reduce-spacing.css" />
  <script src="js/jquery/jquery.js" type="text/javascript"></script>

  <body vLink="#052206" onload="loadMenu();" background="./imagenes/fondo_fiduciaweb_principal.png">
    
    <script type="text/javascript" src="js/JSON.js"></script>
    <script language="javascript">
      <!--
        var aMenuBar = null;
        var OLbubbleImageDir = ctxRoot + "/js/overlibmws/";
        var userInfo = <%=net.sf.json.JSONObject.fromObject(session.getAttribute("userInfo"))%>;
        
        var ctxRoot = "<%=request.getContextPath()%>";   
        var getRefURL = ctxRoot + "/getRef.do";
        var ctxUser = '<%=session.getAttribute("userid")%>';
        var ctxFeccont = ' <%=session.getAttribute("fechaContable") %>';
        var ctxNomUser = userInfo.nombre;
        //alert(JSON.stringify(userInfo));
      //-->
    </script>
    
    <script>
            //para cargar actividades economicas hijas proyecto Cambiar cuando se encuentre el JS adecuado
            
            var objComboParamAlt;
            
            function cambiaComboPr(item)
            {
            
              if(item.selectedIndex>0 && item.selectedIndex<=item.options.length){     
                  
                 var combohijo=GI('antNomActividad'); 
                 SA(eval(combohijo), "param","objComboParamAlt");
                  objComboParamAlt = JSON.parse("{\"numRama\":"+item.value+"}");  
                  RA(combohijo,"next");
                  loadElement(combohijo);  
              }
            
            }
    </script>
    
    
    <script type="text/javascript" src="js/operacion.js" charset="iso-8859-1"></script>

    
    <script type="text/javascript" src="js/cross_browser_support.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/generic_functions.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/formValidator.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/keyHandler.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws.js"></script>    
    <script type="text/javascript" src="js/overlibmws/overlibmws_bubble.js"></script>
    <script type="text/javascript" src="js/overlibmws/overlibmws_filter.js"></script>
    
    <script type="text/javascript" src="js/calendarExtended/jscal2.js"></script>
    <script type="text/javascript" src="js/calendarExtended/lang/es.js"></script>
    
    <script type="text/javascript" src="js/calendar/calendar.js"></script>
    <script type="text/javascript" src="js/calendar/lang/calendar-ES.js"></script>   
    <script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
    
    <script type="text/javascript" src="js/catalogos.js"></script>
    <script type="text/javascript" src="js/menu//dhtmlXProtobar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXMenuBar.js"></script>
    <script type="text/javascript" src="js/menu/dhtmlXCommon.js"></script>
    <script type="text/javascript" src="js/menu.jsp"></script>
    <script type="text/javascript" src="js/funciones_cliente.js"></script>
    <script type="text/javascript" src="js/handling_objects_functions.js"></script>
    
    <!-- feeder eventos -->
    <script type="text/javascript" src="modules/Administracion/Agenda/feederEventos/feederEventos.js"></script>
    <link rel="stylesheet" href="modules/Administracion/Agenda/feederEventos/feederEventos.css" type="text/css">
    <!-- -->
    
    <!-- toplink -->
		<script src="js/toplink.js" type="text/javascript"></script>
		  
    <table id="tablaPrincipal" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" style="background-color:transparent;">
      <tr>
        <td rowspan="4">&nbsp;</td>
        <td id="tdHeader" height="40px">
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
        <td width="100%" nowrap align="center" class="fondoPrincipal">
          
          <table id="tablaContenido" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
            <tr>  
              <td colspan="3" height="3px">
                &nbsp;<!-- Separador -->
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;<!-- Separador --></td>
              <td valign="top" align="center">
              
               <!--input type="BUTTON" value="Administración " class="boton" onclick="onButtonClick('Administracion.Administracion.PrincipalAdministracion');"/>
               <input type="BUTTON" value="Contabilidad " class="boton" onclick="onButtonClick('Contabilidad.Contabilidad.PrincipalContabilidad');"/>
               <input type="BUTTON" value="Interfases " class="boton" onclick="onButtonClick('Interfases.Interfases.PrincipalInterfases');"/>
               <input type="BUTTON" value="Operacion " class="boton" onclick="onButtonClick('Operacion.Operacion.PrincipalOperacion');"/-->
               
               
                <!-- Contenido -->
                <div id="dvContenido">
                  <%if(session.getAttribute("userid")!= null) {%>
                    <h1 class="titulo">BIENVENIDO
                    <br>
                    <br>
                    <%
                    ////System.out.println("userInfo:"+(String)session.getAttribute("userInfo"));
                    ////System.out.println("username:"+(String)session.getAttribute("username"));
                    String nombre=((mx.gob.nafin.fiduciario.common.beans.UserInfoBean)session.getAttribute("userInfo")).getNombre();
                    String log_in = (String)session.getAttribute("login");
                    
                    //session.getAttribute("empresa_0") -- EMP_NUM_EMPRESA
                    //session.getAttribute("empresa_1") -- EMP_NOM_EMPRESA
                    //session.getAttribute("empresa_2") -- EMP_NOM_AREA
                    //session.getAttribute("empresa_3") -- EMP_DIRECCION
                    //session.getAttribute("empresa_4") -- EMP_NOM_AUTORIZA
                    //session.getAttribute("empresa_5") -- EMP_NOM_FIRMA
                    //session.getAttribute("empresa_6") -- EMP_IDIOMA
                    //session.getAttribute("empresa_7") -- EMP_ESTILO
                    //session.getAttribute("empresa_8") -- EMP_FEC_CAMBIO
                    //session.getAttribute("empresa_9") -- EMP_LLAVE_EMPRESA
                    
                    if((log_in==null||!log_in.equals("0"))||(nombre==null||nombre.equals("")))
                    {
                                session.removeValue("username");
                                session.removeValue("password");
                                session.removeValue("userInfo");
                                
                                session.removeValue("fechaContable");     
                                session.removeValue("strFechaContable");
                                session.removeValue("userid");
                                session.removeValue("puestoId");
                                session.removeValue("puesto");
                                session.removeValue("mesAbiertoLbl");
                                session.removeValue("mesAbierto");
                                
                              
                                response.sendRedirect("login.jsp");
                    }
                    %>
                    <%=nombre%></h1>
                  <%}else{%>
                  <h1 class="titulo">&nbsp;</h1>
                  <%}%>
                  
                  
                  <!-- feeder eventos --><div id="dvFeeder"></div>
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
    <a id="linkReporteNew" href="#" target="_new" style="visibility:hidden;position: absolute; top: 0; left: 0;" >Archivo</a>
  </body>
</html>

<script>

// accesos de hoy
  function accesosHoy()
  {
    //alert("entro")
    enviaCorreo();
    /*
    var url = ctxRoot +"/getRef.do?json={\"id\":\"consultaUltimosAcceso\"}";
    makeAjaxRequest(url,"HTML",resAccesosHoy,null);
    */
  }
  function resAccesosHoy(obj,result)
  {
    var res = JSON.parse(result);
    var accesos = eval(res[0].cuantos);
    if(accesos < 2)
    //alert(accesos)
      countEventosProx();
  }
  
// eventos pendientes
  function countEventosProx()
  {
    var url = ctxRoot + "/getRef.do?json={\"id\":\"consultaProximosEventos\"}";
    makeAjaxRequest(url,"HTML",resCountEventosProx,null);
  }
  function resCountEventosProx(obj,result)
  {
    var res = JSON.parse(result); 
    var pendientes = eval(res[0].cuantos);
   /// alert(pendientes)
    if(pendientes > 0)
      actualizaAcceso();
  }
  //envia correo
  function enviaCorreo(){
     var idLink = "linkReporteNew"; 
     var parametrosUrl = new Object;
     parametrosUrl.sendToJSP="true";
   // alert("llego aki")     
     parametrosUrl.urlReporte="/modules/Administracion/Agenda/EnviarCorreo.jsp"
     parametrosUrl.id="mandaCorreoPLD";
     var url = ctxRoot + "/imprimirReporte.do?json=" + JSON.stringify(parametrosUrl);
     idLink.href=url;
     window.open(url,GI("linkReporteNew").value,"width=450,height=205,scrollbars=NO");        
     //idLink.click();
     document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
  //actualiza ultimo acceso
  function actualizaAcceso()
  {
    var url = ctxRoot+"/doRef.do?json={\"id\":\"actualizaUltimosAcceso\"}";
    makeAjaxRequest(url,"HTML",resActualizaAcceso,null)
  }
  function resActualizaAcceso(obj,result)
  {
    enviaCorreo();
  }
  
  accesosHoy();
</script>