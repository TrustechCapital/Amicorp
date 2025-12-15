<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Página de Carga de Archivo Carga Inicial FOSEG</title>
  </head>
  <script language="javascript">
    function asignarValor(valor) {
      document.frmTest.archivo.value = valor.value;
    } 
  </script> 
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css"> 
  <body style="background-color:transparent;">  
    <form id="frmTest" name="frmTest" enctype="multipart/form-data" method="POST" action="<%=request.getContextPath()%>/upload.do">
      <table border="0" cellpadding="1" cellspacing="3" align="center">
        <tr>
          <td class="texto">Archivo:</td>
          <td><input type="FILE" name="flArchivo" id="flArchivo" onchange="asignarValor(this);" /></td>
          <td><input class="boton" type="button" value="Aceptar" onclick="parent.frameSubmit(frmTest);" /></td>
        </tr>
        <tr>
          <td colspan="2"><textarea name="archivo" id="archivo" disabled="disabled" rows="3" cols="31" style="visibility:hidden"></textarea></td>
        </tr>
        <tr>
          <td colspan="3">
            <input type="text" id="Fecha" name="Fecha" value="" style="visibility:hidden" size="5"/>
            <input type="text" id="NombreArchivo" name="NombreArchivo" value="" style="visibility:hidden" size="5"/>
            <input type="text" id="processor" name="processor" value="mx.gob.nafin.fiduciario.business.upload.processors.CargaArchivosPlanosProcessorImpl" style="visibility:hidden" size="5"/>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
