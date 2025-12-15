<FORM name="frmAgrupaCuentas" id="frmAgrupaCuentas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Agrupar cuentas al rubro</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Id. Agrupaci&oacute;n</td>
            <td colspan="8">
              <input type="text" name="facoIdAgrupacion" id="facoIdAgrupacion" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td colspan="11">&nbsp;</td>
          </tr>
      
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="10%">Cuenta</td>
            <td>
              <input type="text" name="fcueMayor" id="fcueMayor" size="4" maxlength="4" tipo="Num" required message="El No. de Cuenta es un campo obligatorio"/>
            </td>
            <td>
              <input type="text" name="fcueSubCta" id="fcueSubCta" size="4" maxlength="4" tipo="Num" required message="EL No. de Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="fcueSsCta" id="fcueSsCta" size="4" maxlength="4" tipo="Num" required message="El No. de Ssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="fcueSssCta" id="fcueSssCta" size="4" maxlength="4" tipo="Num" required message="El No. de Sssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="fcueSsssCta" id="fcueSsssCta" size="4" maxlength="4" tipo="Num" required message="El No. de Ssssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="fcueSssssCta" id="fcueSssssCta" size="4" maxlength="4" tipo="Num" required message="EL No. de Sssssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="11">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="11">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEstructuraGuia();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="cargaMantenimiento(modo)" style="visibility:hidden"/><!--onButtonClick('Contabilidad.Agrupaciones.MantenimientoAgrupaciones','');-->
            </td>
          </tr>
          <tr>
            <td colspan="11">
              <hr/>
            </td>
          </tr>
        </table>
        <table width="100%" class="texto" align="center">
          <tr>
            <td width="20%" align="center" class="subtitulo" colspan="9">Consultar Cuenta</td>
          </tr>
          <tr>
            <td width="20%" colspan="9">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>Cuenta</td>
            <td>Scta</td>
            <td>Sscta</td>
            <td>Ssscta</td>
            <td>Sssscta</td>
            <td>Ssssscta</td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td>
              <input type="text" name="paramNumCtam" id="paramNumCtam" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumScta" id="paramNumScta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSscta" id="paramNumSscta" size="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsscta" id="paramNumSsscta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSssscta" id="paramNumSssscta" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssscta" id="paramNumSsssscta" size="4" tipo="Num"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td colspan="6">
              <input type="text" name="paramNomCta" id="paramNomCta" size="69" tipo="AlphaNumeric"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramNumCtamNoFOSEG" id="paramNumCtamNoFOSEG" size="4" maxlength="4" tipo="Num" value="7000" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" ref="ConsultCuent" fun="loadTableElement" tabla="tblRegPriCatCue" onclick="consultarCount(this, frmAgrupaCuentas, false);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="9">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="116" nowrap>Cuenta de Mayor</td>
                  <td width="34" nowrap>Scta</td>
                  <td width="39" nowrap>Sscta</td>
                  <td width="47" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="62" nowrap>Ssssscta</td>
                  <td width="400" nowrap>Nombre</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriCatCue" dataInfo="arrTblCatCueDat" keys="cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta" fun="clickTabla3" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
        <table width="100%" class="texto">
          <tr>
            <td align="center" colspan="11">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
