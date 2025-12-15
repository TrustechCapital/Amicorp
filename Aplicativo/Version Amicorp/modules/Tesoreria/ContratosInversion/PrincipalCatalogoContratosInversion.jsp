<FORM name="frmDatosContratosInversion" id="frmDatosContratosInversion">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto; ">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Contratos de Inversi&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>No. Fideicomiso</td>
            <td>
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Intermediario</td>
            <td>
              <select size="1" name="paramNumIntermediario" id="paramNumIntermediario" ref="conNumIntNomInt" fun="loadComboElement" keyValue="intEntidadFin" theValue="intIntermediario" next="paramStatus"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Contrato de Inversi&oacute;n</td>
            <td>
              <input type="text" name="paramContratoInversion" id="paramContratoInversion" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="15%" nowrap>Status</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;
              <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriConInv" fun="loadTableElement" tabla="tblRegPriConInv" onclick="consultar(this,frmDatosContratosInversion,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosContratosInversion);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">
              <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoContratosInversion(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoContratosInversion(2)"/>
              <input type="BUTTON" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoContratosInversion(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoContratosInversion(4)"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="82" nowrap>Fideicomiso</td>
                  <td width="123" nowrap>Contrato Inversion</td>
                  <td width="206" nowrap>Subcuenta</td>
                  <td width="206" nowrap>Intermedirario</td>
                  <td width="200" nowrap>CLABE</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriConInv" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblConInvDat" keys="cprSubContrato,cprContratoInter,cprNumContrato,cprEntidadFin" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
