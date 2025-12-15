<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Pagina de carga de Archivo Cash Windows</title>
  </head>
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css">
  
  <body style="background-color:transparent;">
   <center> 
    <form name="frmCash" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/upload.do">
      
      <input type="hidden" id="fechaCash" name="fechaCash" value="" />
      <input type="hidden" id="nombreCash" name="nombreCash" value="" />
      <input type="hidden" id="username" name="username" value="<%=session.getAttribute("username")%>" />
      <input type="hidden" id="processor" name="processor" value="mx.gob.nafin.fiduciario.business.upload.processors.CashProcessorImpl" />
      
      
      
      <table border="0" cellpadding="1" cellspacing="3" align="center">
        <tr>  
          <td class="texto">Archivo:</td>
          <td><input type="FILE" name="fileTest" id="fileTest"/></td>
        </tr>
      </table>      
      
      
      <input class="texto" type="hidden" value="Aceptar" onclick="parent.frameSubmit(frmCash);" name="Aceptar"/>
    
    </form>
  </center>
  </body>
</html>
