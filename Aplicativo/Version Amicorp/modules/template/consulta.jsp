<%@ page contentType="text/html;charset=windows-1252"%>
<h3>Pagina de template</h3>
<hr>
<form id="frmConsulta" name="frmConsulta" onsubmit="">
  <table border="0" cellpadding="10" cellspacing="0">
    <tr>
      <td>Campo de Texto:</td>
      <td>
        <input type="text" id="paramTexto" name="paramTexto" tipo="Letras">
      </td>      
    </tr>
    <tr>
      <td>Campo de Numeros:</td>
      <td>
        <input type="text" id="paramNumero" name="paramNumero" tipo="Numeros">
      </td>      
    </tr>    
    <tr>
      <td>Combo Normal:</td>
      <td>
        <select id="paramCombo" name="paramCombo" ref="1" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="paramCombo2" defaultValue="0" param="comboParam">
          <option value="-1">-- Seleccione --</option>
        </select>
      </td>      
    </tr>        
    <tr>
      <td>Combo Normal2:</td>
      <td>
        <select id="paramCombo2" name="paramCombo2" ref="1" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="formsLoaded">
          <option value="-1">-- Seleccione --</option>
        </select>
      </td>      
    </tr>            
    <tr>
      <td>Radios:</td>
      <td>
        <input type="radio" id="rdoSi" name="rdoPrueba" class="radio" value="S" onclick="GI('paramSiNo').value = this.value;">Si
        <input type="radio" id="rdoNo" name="rdoPrueba" class="radio" value="N" onclick="GI('paramSiNo').value = this.value;">No
        <input type="hidden" id="paramSiNo" name="paramSiNo">
      </td>      
    </tr>        
    <tr>
      <td>Checks:</td>
      <td>
        <input type="checkbox" id="paramCheck" name="paramCheck" value="Acepto" class="check">Acepto
      </td>      
    </tr>            
    <tr>
      <td align="center">
        <input type="button" id="btnAceptar" name="btnAceptar" value="Aceptar" class="boton" ref="1" fun="loadTableElement" tabla="tablaDatosConsulta" onclick="consultar(this, GI('frmConsulta'), false);">
      </td>
      <td align="center">
        <input type="button" id="btnLimpiar" name="btnLimpiar" value="Limpiar" class="boton" onclick="RF(GI('frmConsulta'));">
      </td>      
    </tr>    
  </table>
</form>

<hr>

<table id="tablaDatosConsulta" border="0" cellpadding="0" cellspacing="0" dataInfo="tablaPaisesData" keys="paiNumPais,paiNomPais" fun="clickTabla"></table>

<hr>

<table height="18" border="0" cellpadding="0" cellspacing="10">
  <tr>
    <td align="center" class="boton" width="50">Alta</td>
    <td align="center" class="boton" width="50">Baja</td>          
    <td align="center" class="boton" width="80">Modificar</td>      
    <td align="center" class="boton" width="80">Consultar</td>
  </tr>    
</table>