<%@ page contentType="text/html;charset=windows-1252"%>
<br/>
<br/>
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
      <div id="lblpaiNumPais"></div>
      <input type="text" id="paiNumPais1" name="paiNumPais1" size="30" onblur="buscaPais();"/>
    </td>
  </tr>
  <tr>
    <td nowrap>Nombre:</td>
    <td/>
    <td colspan="2">
      <input type="text" id="paiNomPais" name="paiNomPais" size="50" lkd/>
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

<br><br>

<!-- Ejemplo tabs -->

<select id="ejCombo" name="ejCombo">
  <option value="-1">-- Seleccione --</option>
</select>

<br><br>

<!-- Ejemplo consultas -->

<form name="frmTest" id="frmTest" action="">
  <input type="input" id="paramClavePais" name="paramClavePais" value="1">
  <br>
  <input type="button" value="Consultar" onclick="consultar();">
</form>

<br><br>

<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td class="tab_blanco_azul">&nbsp;</td>
    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'funcionClientes');">Clientes</td>
    <td class="tab_azul_claro">&nbsp;</td>
    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'funcionPaises');">Paises</td>
    <td class="tab_claro_claro_der">&nbsp;</td>
    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'funcionFideicomisos');">Fideicomisos</td>
    <td class="tab_claro_claro_der">&nbsp;</td>
    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'funcionCatalogos');">Catalogos</td>
    <td class="tab_claro_claro_der">&nbsp;</td>    
    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'funcionMonedas');">Monedas</td>
    <td class="tab_claro_blanco">&nbsp;</td>
  </tr>
</table>

<br><br>

<table cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td class="tab_blanco_azul">&nbsp;</td>
    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'funcionClientes');">Clientes</td>
    <td class="tab_azul_claro">&nbsp;</td>
    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'funcionPaises');">Paises</td>
    <td class="tab_claro_blanco">&nbsp;</td>
  </tr>
</table>


<br><br>

Ejemplo Calendario <input type="text" id="txtCal" name="txtCal"/>

<br><br>

<table id="tablaDatosPais" border="0" cellpadding="0" cellspacing="0"></table>