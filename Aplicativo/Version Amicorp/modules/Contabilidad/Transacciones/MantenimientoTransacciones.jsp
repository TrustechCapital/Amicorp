<form name="frmMantenimientoTransacciones" id="frmMantenimientoTransacciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Transacciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>No. Transacci&oacute;n</td>
            <td>
              <input type="text" name="trsNumTransac" id="trsNumTransac" size="10" maxlength="10" tipo="Num" required message="El número de la transacción es un campo obligatorio"/>
              <input type="text" name="trsNumModulo" id="trsNumModulo" size="2" maxlength="10" value="2" style="visibility:hidden"/>
            </td>
            <td colspan="2" nowrap>&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Nombre</td>
            <td colspan="4">
              <input type="text" name="trsNomTransac" id="trsNomTransac" size="70" maxlength="70" tipo="AlphaNumeric" required message="El nombre de la transacción es un campo obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td colspan="5" nowrap>
              <hr/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Gu&iacute;a Contable</td>
            <td>
              <input type="text" name="trsNumGuiaCont" id="trsNumGuiaCont" size="10" maxlength="10" tipo="Num" onblur="existeGuia(this);" required message="El número de guía contable es un campo obligatorio"/>
              <input type="text" name="paramGuia" id="paramGuia" maxlength="2" size="2" style="visibility:hidden"/>
            </td>
            <td colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Concepto SIF</td>
            <td>
              <input type="text" name="trsNumConcepto" id="trsNumConcepto" size="4" maxlength="4" tipo="Num" style="visibility:hidden"/>
            </td>
            <td colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap colspan="5">&nbsp;
            <select size="0" name="cmbMinimoDatoGuia" id="cmbMinimoDatoGuia" fun="loadComboElement" keyValue="dtrKeyAplDato" theValue="dtrCveAplDato" style="visibility:hidden"/></td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td nowrap>Status</td>
            <td>
              <select size="1" name="trsCveStTransac" id="trsCveStTransac" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="cveTransacciones" required message="El status es un campo obligatorio"/>
            </td>
            <td colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="5">&nbsp;Clave de Tipo de Transacciones</td>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td rowspan="1" colspan="3" align="center">
              <select size="11" name="cveTransacciones" id="cveTransacciones" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbTransaccionesParam" next="asignaPK2ObjHTML"/>
            </td>
            <td align="center" nowrap rowspan="1">
              <P align="center">
                <input type="button" value="Agregar" name="cmdAgregar" id="cmdAgregar" onclick="agregarClave(GI('cveTransacciones'),GI('cmbDatoTran'));" style="visibility:hidden"/>
              </P>
              <P>
                <input type="button" value="Quitar " name="cmdQuitar" id="cmdQuitar" onclick="quitarClave(GI('cmbDatoTran'));" style="visibility:hidden"/>
              </P>
            </td>
            <td rowspan="1" align="center">
              <select size="11" name="cmbDatoTran" id="cmbDatoTran" fun="loadComboElement" keyValue="dtrKeyAplDato" theValue="dtrCveAplDato"/>
            </td>
            <td rowspan="1" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
            <td align="center" class="subtitulo" colspan="5">&nbsp;</td>
            <td align="left" class="subtitulo" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="7">
              <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriDatTra" fun="loadTableElementSpecial" tabla="tblRegPriDatTra" onclick="ejecutaOperacionTransaccion();" style="visibility:hidden"/>
              <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Transacciones.PrincipalTransacciones','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" class="subtitulo" colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="subtitulo" colspan="7">&nbsp;Estructura de Asientos de la Gu&iacute;a</td>
          </tr>
          <tr>
            <td align="left" class="subtitulo" colspan="7">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="34px" nowrap>Sec.</td>
                  <td width="119px" nowrap>Nombre Cuenta</td>
                  <td width="54px" nowrap>Cuenta</td>
                  <td width="33px" nowrap>Scta</td>
                  <td width="39px" nowrap>Sscta</td>
                  <td width="47px" nowrap>Ssscta</td>
                  <td width="55px" nowrap>Sssscta</td>
                  <td width="63px" nowrap>Ssssscta</td>
                  <td width="57px" nowrap>Auxiliar1</td>
                  <td width="57px" nowrap>Auxiliar2</td>
                  <td width="57px" nowrap>Auxiliar3</td>
                  <td width="91px" nowrap>Aplica Dato</td>
                  <td width="28px" nowrap>C/A</td>
                  <td width="130px" nowrap>Descripci&oacute;n</td>
                  <td width="100px" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriDatTra" dataInfo="arrTblDatTra" keys="dtrNumModulo,dtrNumTransac">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
