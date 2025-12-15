<%@ page contentType="text/html;charset=windows-1252"%>

<br/>

<table border="0" cellpadding="1" class="texto" cellspacing="5" width="100%">
  <tr>
    <td>Tipo</td>
    <td>
      <select id="paramPeriodicidad" name="paramPeriodicidad" required>
        <option value="1">Generico</option>
        <option value="2">Especifico</option>
      </select>
    </td>
  </tr>  
  <tr>
    <td>Folio</td>
    <td>
      <input type="text" id="paramFolio" name="paramFolio" tipo="Numero"/>
    </td>
  </tr>  
  <tr>
    <td>Fecha</td>
    <td>
      <input type="text" id="paramFecha" name="paramFecha"/>
    </td>
  </tr>    
  <tr>
    <td>Estatus</td>
    <td>
      <input type="text" id="paramEstatus" name="paramEstatus"/>
    </td>
  </tr>      
</table>

<br/></br>

<hr/>

<input type="hidden" id="paramFoseg" name="paramFoseg" value="1"/>