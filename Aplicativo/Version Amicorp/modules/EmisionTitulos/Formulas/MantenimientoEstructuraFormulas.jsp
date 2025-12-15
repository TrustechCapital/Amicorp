<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Estructura&nbsp;de&nbsp;la F&oacute;rmula</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">No.&nbsp;de F&oacute;rmula</td>
            <td colspan="2">
              <input type="text" name="efrdIdFormula" id="efrdIdFormula" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Tipo de F&oacute;rmula</td>
            <td colspan="2">
              <select size="1" name="efrdIdClasific" id="efrdIdClasific" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbLoadParam520" next="cmbTerminos"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" colspan="5" align="center" class="subtitulo">&nbsp;F&oacute;rmula</td>
          </tr>
          <tr>
            <td height="100%" colspan="5" align="center">&nbsp;
            <textarea name="txtFormula" id="txtFormula" style="width:500px;height:50px"></textarea></td>
          </tr>
          <tr>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="5" class="subtitulo">Par&aacute;metros</td>
          </tr>
          <tr>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">T&eacute;rminos</td>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">Operadores</td>
            <td height="100%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center">&nbsp;</td>
            <td height="100%" align="center">
              <select size="11" name="cmbTerminos" id="cmbTerminos" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam521" next="cmbOperadores" onclick="selTerminoOperador(this);"/>
            </td>
            <td height="100%" align="center">
              <P>
                <input type="BUTTON" value="Agregar" id="cmdAgregar" name="cmdAgregar" class="boton" onclick="agregarDatosFormula(GI('cmbTerminos'),GI('cmbOperadores'));"/>
              </P>
              <P>
                <input type="BUTTON" value="Quitar " id="cmdQuitar" name="cmdQuitar" class="boton" onclick="quitarDatosFormula(GI('txtFormula').value);"/>
              </P>
            </td>
            <td height="100%" align="center">
              <select size="11" name="cmbOperadores" id="cmbOperadores" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam522" next="asignaValues2ObjHTML2" onclick="selTerminoOperador(this);"/>
            </td>
            <td height="100%" align="center">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="nuevaFormula(GI('txtFormula').value);"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaMantenimientoFormulas(modo);"/>
      </td>
    </tr>
  </table>
</form>
