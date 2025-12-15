<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Fideicomisos por Programa</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table align="center" class="texto" width="100%">
            <tr valign="middle">
              <td nowrap width="18%">&nbsp;</td>
              <td nowrap width="8%">Programa</td>
              <td>
                <select size="1" name="efidIdPrograma" id="efidIdPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="efidIdFideicomiso" required message="El Programa es un campo obligatorio"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td nowrap width="18%">&nbsp;</td>
              <td nowrap width="8%">Fideicomiso</td>
              <td>
                <select size="1" name="efidIdFideicomiso" id="efidIdFideicomiso" ref="conNumFidNomFidET" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="efidStProgfid" required message="El Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="18%">&nbsp;</td>
              <td nowrap width="8%">Comentario</td>
              <td>
                <textarea name="efidComentario" id="efidComentario" style="width:400px;height:50px" onkeydown="validaLongitud(this,300);"></textarea>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap width="18%">&nbsp;</td>
              <td nowrap width="8%">Status</td>
              <td>
                <select size="1" name="efidStProgfid" id="efidStProgfid" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.FideicomisosPrograma.PrincipalFideicomisosPrograma','')" style="visibility:hidden"/>
        </td>
      </tr>
  </table>
</FORM>
