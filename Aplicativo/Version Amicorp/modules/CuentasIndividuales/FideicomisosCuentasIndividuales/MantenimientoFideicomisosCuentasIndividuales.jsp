<form name="frmMantenimientoFideicomisosCuentasIndividuales" id="frmMantenimientoFideicomisosCuentasIndividuales">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Fideicomisos con Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>
              Fideicomiso
            </td>
            <td colspan="3" width="10%">
              <input type="text" name="ctoNumContrato" id="ctoNumContrato" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="verificaExistenciaRegistro();"/>
            </td>
            <td>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td colspan="4">
              <input type="checkbox" name="ctasIndividualesChk" id="ctasIndividualesChk" class="check" tv="1" fv="0"/>Maneja Cuentas Individuales
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Descripci&oacute;n</td>
            <td colspan="4">
              <textarea name="descripcion" id="descripcion" style="width:400px;height:80px" required message="La Descripción es un campo obligatorio" onkeydown="validaLongitud(this,300);"></textarea>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Porcentaje de Participación</td>
            <td colspan="3">
              <input type="text" name="pctoParticip" id="pctoParticip" size="17" maxlength="17" tipo="Money" prec="14.2" />
            </td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Tasa ISR</td>
            <td colspan="3">
              <input type="text" name="pafTasaIsr" id="pafTasaIsr" size="17" maxlength="17" tipo="Money" prec="14.2" reqPrecValue required message="La Tasa ISR es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Status</td>
            <td colspan="3">
              <select id="estatus" name="estatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalFideicomisosCuentasIndividuales();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
