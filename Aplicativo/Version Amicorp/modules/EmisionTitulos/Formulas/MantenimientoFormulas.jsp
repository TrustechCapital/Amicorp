<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Mantenimiento a F&oacute;rmulas</td>
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
            <td>
              <input type="text" name="efrmIdFormula" id="efrmIdFormula" tipo="Num" size="10" maxlength="10" required message="El No. de Fórmula es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Tipo de F&oacute;rmula</td>
            <td>
              <select size="1" name="efrmIdClasific" id="efrmIdClasific" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbLoadParam520" next="efrmStFormula" required message="El Tipo de Fórmula es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td height="29" class="xl22" width="13%" style="height:21.75pt;width:123pt">Nombre</td>
            <td nowrap width="10%">
              <input type="text" name="efrmNomFormula" id="efrmNomFormula" size="50" maxlength="100" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Descripci&oacute;n</td>
            <td>
              <textarea name="efrmDescripcion" id="efrmDescripcion" style="width:300px;height:50px" onkeydown="validaLongitud(this,200);"></textarea>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Status</td>
            <td>
              <select size="1" name="efrmStFormula" id="efrmStFormula" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="4" align="center">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionFormula();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Formulas.PrincipalFormulas','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="30%" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
            <td height="100%">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" colspan="4" align="center" class="subtitulo">&nbsp;F&oacute;rmula</td>
          </tr>
          <tr>
            <td height="100%" colspan="4" align="center">&nbsp;
            <textarea name="txtFormula" id="txtFormula" disabled="disabled" style="width:500px;height:50px"></textarea></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Mantenimiento" name="cmdMantenimiento" id="cmdMantenimiento" class="boton" onclick="cargaMantenimientoEstructuraFormula(GI('efrmIdFormula'),GI('efrmIdClasific'),GI('txtFormula'));" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
