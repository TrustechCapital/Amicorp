<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Monedas</title>
  </head>
  <body>
    
    <script language="javascript">
      var ctxRoot = "<%=request.getContextPath()%>";
    </script>
    
    <script type="text/javascript" src="../../js/generic_functions.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="../../js/catalogos.js"></script>
    <script type="text/javascript" src="../../js/JSON.js"></script>

    <script language="javascript">
      <!--
    
      var catPaises = new Catalogo("mx.com.inscitech.fiducia.domain.Paises");
      
      //-->
    </script>
  
    <table width="50%" align="center">
      <tr>
        <td colspan="3" align="left" nowrap>Consultar Pais</td>
      </tr>
      <tr>
        <td colspan="3">
          <hr/>
        </td>
      </tr>
      <tr>
        <td nowrap>Numero de Pais:</td>
        <td/>
        <td colspan="2">
          <input type="text" id="paiNumPais" name="paiNumPais" size="30" onblur="catPaises.buscaCatalogoPK();"/>
        </td>
      </tr>
      <tr>
        <td nowrap>Nombre:</td>
        <td/>
        <td colspan="2">
          <input type="text" id="paiNomPais" name="paiNomPais" size="50"/>
        </td>
      </tr>
      <tr>
        <td nowrap>Nombre Corto:</td>
        <td/>
        <td colspan="2">
          <input type="text" id="paiAbrPais" name="paiAbrPais" size="30"/>
        </td>
      </tr>
      <tr>
        <td nowrap>Clave de Pais:</td>
        <td/>
        <td colspan="2">
          <input type="text" id="paiCveStPais" name="paiCveStPais" size="30"/>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <hr/>
        </td>
      </tr>
      <tr>
        <td colspan="3" align="center">
          <input type="button" value="Guardar" id="btnGuardar" onclick="catPaises.modificaCatalogo();"/>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" value="Agregar" id="btnGuardarNvo" onclick="catPaises.altaCatalogo();"/>
        </td>
      </tr>
    </table>
  
  </body>
</html>
