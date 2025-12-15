<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Pagina de carga de Archivo Valuacion</title>
  </head>
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fiducia_general.css" type="text/css">
  
  <body style="background-color:transparent;">
   <center> 
    <form name="frmConciliacion" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/upload.do">
      
      <input type="hidden" id="fechaConciliacion" name="fechaConciliacion" value=""/>
      <input type="hidden" id="nombreConciliacion" name="nombreConciliacion" value=""/>
      <input type="hidden" id="idBanco" name="idBanco" value=""/>
      <input type="hidden" id="idInterfase" name="idInterfase" value=""/>
      <input type="hidden" id="username" name="username" value="<%=session.getAttribute("username")%>" />
      <input type="hidden" id="processor" name="processor" value="mx.gob.nafin.fiduciario.business.upload.processors.ConciliacionDiaria" />
                  
      <table border="0" cellpadding="1" cellspacing="1" align="center" width=300>
        <tr>  
          <td class="texto" align="left" style="width:100px">Archivo:</td>
          <td>
            <input type="FILE" name="fileTest" id="fileTest" onchange="parent.document.frmDatosInterfase.txtNomArch.value=((((this.value).split('\\'))[(this.value.split('\\').length)-1]).split('.'))[0];"/>
          </td>
        </tr>
      </table>      
      
      <input class="texto" type="hidden" value="Aceptar" onclick="parent.frameSubmit(frmConciliacion);" name="Aceptar"/>
    
    </form>
  </center>
  </body>
</html>
