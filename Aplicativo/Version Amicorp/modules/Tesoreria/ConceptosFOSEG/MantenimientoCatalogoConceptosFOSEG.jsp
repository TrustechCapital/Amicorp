<form name="frmMantenimientoCatalogoConceptosFOSEG" id="frmMantenimientoCatalogoConceptosFOSEG">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Conceptos FOSEG</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="16%">Eje</td>
            <td>
              <input type="text" name="cueNumScta" id="cueNumScta" size="10" maxlength="10" tipo="Num" required message="El Eje es un campo obligatorio"/>
              <input type="text" name="cueNumCtam" id="cueNumCtam" size="3" maxlength="10" tipo="Num" value="7000" style="visibility:hidden"/>
              <input type="text" name="cueNumSsssscta" id="cueNumSsssscta" size="1" maxlength="10" tipo="Num" value="0" style="visibility:hidden"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="16%">Programa</td>
            <td>
              <input type="text" name="cueNumSscta" id="cueNumSscta" size="10" maxlength="10" tipo="Num" required message="El Programa es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="16%">Proyecto</td>
            <td>
              <input type="text" name="cueNumSsscta" id="cueNumSsscta" size="10" maxlength="10" tipo="Num" required message="El Proyecto es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="16%">Acci&oacute;n</td>
            <td>
              <input type="text" name="cueNumSssscta" id="cueNumSssscta" size="10" maxlength="10" tipo="Num" required message="La Acción es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan="2" width="16%">Nombre</td>
            <td>
              <input type="text" name="cueNomCta" id="cueNomCta" size="50" maxlength="250" tipo="AlphaNumeric" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionCatalogoConceptosFOSEG();"/>
        <input type="button" value="Cancelar" name="cmdCanlcelar" id="cmdCanlcelar" class="boton_x" onclick="onButtonClick('Tesoreria.ConceptosFOSEG.PrincipalCatalogoConceptosFOSEG','');"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
