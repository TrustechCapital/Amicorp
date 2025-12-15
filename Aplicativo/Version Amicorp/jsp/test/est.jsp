<%@ page contentType="text/html;charset=windows-1252"%>
<br/>
<br/>
<table width="50%" border="0" align="center">
  <tr>
    <td colspan="3" align="left" nowrap>Consultar Estados</td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  <tr>
    <td nowrap>Numero de Pais:</td>
    <td>
      <input type="text" id="txtNumeroPaisBuscar" name="txtNumeroPaisBuscar" size="30"/>
    </td>
    <td>
      <input type="button" value="Buscar" onclick="doBuscar();" name="cmdBuscar"/>
    </td>
  </tr>
  <tr>
    <td nowrap>Numero de Estado:</td>
    <td>
      <input type="text" id="txtNumeroEstadoBuscar" name="txtNumeroEstadoBuscar" size="30"/>
    </td>
    <td colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  <tr>
    <td nowrap>Numero&nbsp;Pais :</td>
    <td>
      <input type="text" id="txtNombrePais" name="txtNumeroPais" size="50"/>
    </td>
    <td colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap>Numero Estado:</td>
    <td>
      <input type="text" id="txtNombrePais" name="txtNumeroEstado" size="50"/>
    </td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap>Nombre Estado:</td>
    <td>
      <input type="text" id="txtAbrPais" name="txtNombreEstado" size="30"/>
    </td>
    <td colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap>Abreviatura Estado:</td>
    <td>
      <input type="text" id="txtCvePais" name="txtabreviaturaEstado" size="30"/>
    </td>
    <td colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center">
      <input type="button" value="Modificar" id="btnGuardar" onclick="doGuardar();" name="cmdModificar"/>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="Agregar" id="btnGuardarNvo" onclick="doGuardarNvo();" ame="cmdAgregar"/>
    </td>
  </tr>
</table>
