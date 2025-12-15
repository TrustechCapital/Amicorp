<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Pagina de carga de Archivo TAS</title>
  </head>
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css">
  
  <body style="background-color:transparent;">
    
    <form name="frmGarLiq" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/upload.do">
      
      <input type="hidden" id="fiso" name="fiso" value=""/>
      <input type="hidden" id="tipo" name="tipo" value=""/>
      <input type="hidden" id="fecha" name="fecha" value=""/>
      <input type="hidden" id="separador" name="separador" value=""/>
      
      <input type="hidden" id="username" name="username" value="<%=session.getAttribute("username")%>" />
      <input type="hidden" id="processor" name="processor" value="mx.gob.nafin.fiduciario.business.upload.processors.GarLiqProcessorImpl" />
      
      <table border="0" cellpadding="1" cellspacing="3" align="center">
        <tr>  
          <td class="texto">Archivo:</td>
          <td><input type="FILE" id="fileTest" name="fileTest" style="width:300px;"/></td>
          <td><input class="boton" type="button" value="Aceptar" onclick="parent.frameSubmit(frmGarLiq);"/></td>
        </tr>
      </table>      
    
    </form>
  
  </body>
</html>
