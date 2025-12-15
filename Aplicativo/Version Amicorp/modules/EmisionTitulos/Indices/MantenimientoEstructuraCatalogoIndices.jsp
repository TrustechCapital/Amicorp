<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Estructura &Iacute;ndices</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="21%">&nbsp;</td>
            <td width="13%">No. Indice</td>
            <td width="62%">
              <input type="text" name="ecinIdIndice" id="ecinIdIndice" size="10" tipo="Num" maxlength="10"/>
              <input type="text" name="eindIdIndice" id="eindIdIndice" size="10" tipo="Num" maxlength="10" message="No. de Guía" style="visibility:hidden"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td width="13%">Descripci&oacute;n</td>
            <td width="62%">
              <input type="text" name="ecinDescripcion" id="ecinDescripcion" size="50" maxlength="50" required message="La Descripcion es un campo obligatorio"/>
            </td>
            <td align="center" width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%" colspan="4">
            <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">Estructura &Iacute;ndices</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" width="21%">&nbsp;</td>
            <td nowrap width="13%">Secuencial</td>
            <td width="62%">
              <input type="text" name="eindIdSubindice" id="eindIdSubindice" size="10" tipo="Num" required maxlength="10" message="El Secuencial es un campo obligatorio"/>
            </td>
            <td align="center" width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">Descripci&oacute;n</td>
            <td width="62%">
              <input type="text" name="eindDescripcion" id="eindDescripcion" size="50" maxlength="50" required message="La Descripción es un campo obligatorio"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">Forma de Empleo</td>
            <td width="62%">
              <input type="text" name="eindFormaEmp" id="eindFormaEmp" size="50" maxlength="150"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">Parametro 1</td>
            <td width="62%">
              <input type="text" name="eindParam1" id="eindParam1" size="50" maxlength="50"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">
              <P>Descripci&oacute;n</P>
            </td>
            <td width="62%">
              <input type="text" name="eindDesParam1" id="eindDesParam1" size="50" maxlength="50"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">Parametro 2</td>
            <td width="62%">
              <input type="text" name="eindParam2" id="eindParam2" size="50" maxlength="50"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">
              <P>Descripci&oacute;n</P>
            </td>
            <td width="62%">
              <input type="text" name="eindDesParam2" id="eindDesParam2" size="50" maxlength="50"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="21%">&nbsp;</td>
            <td nowrap width="13%">Status</td>
            <td width="3%">
              <select size="1" name="eindStIndices" id="eindStIndices" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML2" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="2%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEstructura();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaMantenimientoCatalogoIndices(modo);" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
