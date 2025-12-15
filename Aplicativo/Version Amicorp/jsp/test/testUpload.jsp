<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>File Upload</title>
  </head>
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css">
  
  <body>
    
    <script language="javascript">
      <!--
        function pruebaCharros() {
          alert("parent: " + parent.charros);
        }
      //-->
    </script>
    
    <form id="frmTest" name="frmTest" enctype="multipart/form-data" method="POST" action="<%=request.getContextPath()%>/upload.do">
      
      <input type="hidden" id="pruebaParametro" name="pruebaParametro" value="Valor de Prueba"/>
      
      <table class="tablaDialogo" border="1" cellpadding="0" cellspacing="0" align="center" width="390">
        <tr>  
          <td height="90" align="center" valign="middle">
            <table border="0" cellpadding="3" cellspacing="3" align="center">
              <tr>  
                <td class="texto">Archivo:</td>
                <td><input type="FILE" name="fileTest"/></td>
                <td><input class="boton" type="button" value="Aceptar" onclick="parent.frameSubmit(frmTest);"/></td>
              </tr>
            </table>          
          </td>
        </tr>
      </table>
      
    </form>
  
  </body>
</html>
