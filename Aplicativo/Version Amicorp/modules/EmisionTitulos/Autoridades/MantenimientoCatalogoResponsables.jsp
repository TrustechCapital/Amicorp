<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Mantenimiento a Cat&aacute;logo de Responsables</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">No. Autoridad</td>
            <td>
              <input type="text" name="eautIdAutoridad" id="eautIdAutoridad" size="10" tipo="Num" maxlength="10"/>
              <input type="text" name="eareIdAutoridad" id="eareIdAutoridad" size="10" tipo="Num" maxlength="10" style="visibility:hidden"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Nombre Autoridad</td>
            <td>
              <input type="text" name="eautNomAutoridad" id="eautNomAutoridad" size="50" maxlength="100"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
            <hr/></td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">No. Responsable</td>
            <td>
              <input type="text" name="eareIdResponsable" id="eareIdResponsable" size="10" tipo="Num" maxlength="10" required message="El No. del Responsable es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Nombre Responsable</td>
            <td>
              <input type="text" name="eareNomResponsable" id="eareNomResponsable" size="50" maxlength="100" required message="El Nombre del Responsable es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Puesto del Responsable</td>
            <td>
              <input type="text" name="eareNomPuestRespo" id="eareNomPuestRespo" size="50" maxlength="100" required message="El Puesto del Responsable es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Tel&eacute;fono</td>
            <td>
              <input type="text" name="eareNumTelefono" id="eareNumTelefono" size="15" maxlength="30" required message="El Teléfono es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Fax</td>
            <td>
              <input type="text" name="eareNumFax" id="eareNumFax" size="15" maxlength="30"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Correo</td>
            <td>
              <input type="text" name="eareCveCorreo" id="eareCveCorreo" size="30" maxlength="60" tipo="Email"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="20%">Status</td>
            <td>
              <select size="1" name="eareStAutrespon" id="eareStAutrespon" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML2" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionResponsable();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaMantenimientoCatalogoAutoridades(modo);" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</form>
