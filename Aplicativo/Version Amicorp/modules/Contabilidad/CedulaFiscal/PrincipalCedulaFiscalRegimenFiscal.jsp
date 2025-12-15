<form name="frmDatosCedulaFiscal" id="frmDatosCedulaFiscal" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">C&eacute;dula Fiscal</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Fideicomiso</td>
            <td>
              <input type="text" size="10" name="paramFideicomiso" id="paramFideicomiso" maxlength="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Obligaciones Fiscales a Cargo de</td>
            <td>
              <select size="1" name="paramObligacionesFiscales" id="paramObligacionesFiscales" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbObligacionesFiscalesParam" next="paramClasificacion"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Clasificaci&oacute;n</td>
            <td>
              <select size="1" name="paramClasificacion" id="paramClasificacion" ref="conTraFis" fun="loadComboElement" keyValue="trfCveTratfisc" theValue="trfClasific" next="paramParticipacion"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Participaci&oacute;n</td>
            <td>
              <select size="1" name="paramParticipacion" id="paramParticipacion" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbParticipacionParam" next="paramObligacion"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="20%" nowrap>Obligaci&oacute;n</td>
            <td>
              <select size="1" name="paramObligacion" id="paramObligacion" ref="conOblFis" fun="loadComboElement" keyValue="obfCveObligfisc" theValue="obfDescripcion" next="formsLoaded"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriCedFis" fun="loadTableElement" tabla="tblRegPriCedFis" onclick="consultar(this, frmDatosCedulaFiscal, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosCedulaFiscal);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoCedulaFiscal(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCedulaFiscal(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoCedulaFiscal(3);"/>
              <input type="button" value="Asignación" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCedulaFiscal(4);" title="Asignación de Obligaciones"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="106" nowrap>No. Fideicomiso</td>
                  <td width="107" nowrap>Obligado Fiscal</td>
                  <td width="89" nowrap>Participaci&oacute;n</td>
                  <td width="88" nowrap>RFC</td>
                  <td width="300" nowrap>Titular</td>
                  <td width="160" nowrap>ISR sobre Rendimientos</td>
                </tr>
              </table>
              <div style="height:200px; overflow:auto; position:relative; vertical-align:top; width:873px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriCedFis" dataInfo="arrTblCedFisDat" keys="crfNumFideicom,trfCveTratfisc" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
