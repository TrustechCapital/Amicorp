<%@ page contentType="text/html;charset=windows-1252"%>
<%
 
%>
 <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Pagina de carga de Archivo</title>
  </head>
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css">
  
  <body style="background-color:transparent;">
    
    <form name="frmUpload" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/upload.do">
      
      <input type="hidden" id="ruta" name="ruta" style="position:absolute;" value="<%=request.getContextPath()%>"/>
      <input type="hidden" id="username" name="username" value="<%=session.getAttribute("username")%>" style="position:absolute;" />
      <input type="hidden" id="processor" name="processor" value="mx.gob.nafin.fiduciario.business.upload.processors.ImageProcessorImpl" style="position:absolute;"/>
      
      <table border="0" cellpadding="1" cellspacing="3" align="center">
        <tr>  
          <td class="texto">Archivo:</td>
          <td><input type="FILE" name="fileTest" id="fileTest"  style="width:200px;"/></td>
          <td><input type="submit" class="boton" value ="Subir Imagén" /></td>
        </tr>
      </table>      
    
    </form>
  
  </body>
</html>
-->