<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento  Emisores</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Id. Emisor</td>
            <td width="20%" valign="middle">
              <input type="text" name="esorIdEmsisor" id="esorIdEmsisor" size="10" maxlength="10"   />
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Nombre Emisor</td>
            <td width="20%" valign="middle">
              <input type="text" name="esorNombre" id="esorNombre" size="50" maxlength="150"   />
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
             <tr valign="middle">
            <td width="25%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
            <td width="10%" valign="middle" nowrap>Tipo de Emisor</td>
            <td width="20%" valign="middle">
              <select size="1" name="esorTipoEmisor" id="esorTipoEmisor" ref="conTipoEmisor" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion"  param="cmbTipoEmisorParam" next="esorStFEmifisos" required message="La Institucion es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="20%" valign="middle" nowrap>&nbsp;</td>
          </tr>
       
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Caracteristicas</td>
            <td valign="middle" height="6" width="20%">
              <input type="text" name="esorComentario1" id="esorComentario1" size="100" maxlength="2500"   />
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Comentarios</td>
            <td valign="middle" height="6" width="20%">
              <input type="text" name="esorComentario" id="esorComentario" size="100" maxlength="500"   />
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="25%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="10%" nowrap>Status:</td>
            <td valign="middle" height="6" width="20%">
              <select size="1" name="esorStFEmifisos" id="esorStFEmifisos" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Emisores.PrincipalEmisores','')" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
