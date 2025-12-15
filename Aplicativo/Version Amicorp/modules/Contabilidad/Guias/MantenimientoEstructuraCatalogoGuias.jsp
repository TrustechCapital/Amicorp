<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Estructura de Coneptos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">No. Concepto</td>
            <td colspan="8">
              <input type="text" name="gunNumGuia" id="gunNumGuia" size="10" tipo="Num" maxlength="10"/>
              <input type="text" name="guiNumGuia" id="guiNumGuia" size="10" tipo="Num" maxlength="10" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td colspan="8">
              <input type="text" name="gunNomGuia" id="gunNomGuia" size="80" tipo="AlphaNumeric" maxlength="100"/>
            </td>
            <td align="center" width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Status</td>
            <td colspan="8">
              <select size="1" name="gunCveStGuiano" id="gunCveStGuiano" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="guiCveAplicaDat"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="11">&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" align="center" width="20%">&nbsp;</td>
            <td nowrap width="10%">No. Sec. Asiento</td>
            <td class="subtitulo" colspan="3">
              <input type="text" name="guiNumSecAsient" id="guiNumSecAsient" size="10" tipo="Num" maxlength="10"/>
              <input type="text" name="guiCveStGuiacon" id="guiCveStGuiacon" size="10" maxlength="10" value="ACTIVO" style="visibility:hidden"/>
            </td>
            <td class="subtitulo">
              <input type="text" name="guiNumAux1" id="guiNumAux1" size="4" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td class="subtitulo">
              <input type="text" name="guiNumAux2" id="guiNumAux2" size="4" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td class="subtitulo">
              <input type="text" name="guiNumAux3" id="guiNumAux3" size="4" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td colspan="2" nowrap>&nbsp;</td>
            <td class="subtitulo" align="center" width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="10%">Cuenta</td>
            <td>
              <input type="text" name="guiNumCtam" id="guiNumCtam" size="4" maxlength="4" tipo="Num" required message="El No. de Cuenta es un campo obligatorio"/>
            </td>
            <td>
              <input type="text" name="guiNumScta" id="guiNumScta" size="4" maxlength="4" tipo="Num" required message="EL No. de Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="guiNumSscta" id="guiNumSscta" size="4" maxlength="4" tipo="Num" required message="El No. de Ssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="guiNumSsscta" id="guiNumSsscta" size="4" maxlength="4" tipo="Num" required message="El No. de Sssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="guiNumSssscta" id="guiNumSssscta" size="4" maxlength="4" tipo="Num" required message="El No. de Ssssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" name="guiNumSsssscta" id="guiNumSsssscta" size="4" maxlength="4" tipo="Num" required message="EL No. de Sssssub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td colspan = 2>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo" align="center" height="20" width="20%">&nbsp;</td>
            <td nowrap width="10%">Tipo de Movimiento</td>
            <td>
              <input type="radio" name="rdCveCarAbo" id="guiCveCarAbo" value2="C" required message="El Tipo de Movimiento es un campo obligatorio" onchange="asignaValueRadio2Master('guiCveCarAbo',this);" class="radio"/>&nbsp;Cargo
            </td>
             <td>
              <input type="radio" name="rdCveCarAbo" id="guiCveCarAbo2" value="A" onchange="asignaValueRadio2Master('guiCveCarAbo',this);" class="radio"/>&nbsp;Abono
            </td>
            <td class="subtitulo" colspan="7">
             &nbsp;
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="10%">Dato</td>
            <td colspan="6">
              <select size="1" name="guiCveAplicaDat" id="guiCveAplicaDat" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbDatoParam" next="asignaValues2ObjHTML2" required message="El Dato es un campo obligatorio"/>
            </td>
            <td colspan = 2>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="10%">Redacci&oacute;n</td>
            <td colspan="6">
              <input type="text" name="guiDescAsiento" id="guiDescAsiento" size="69" maxlength="100" required message="La Redacción es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%" colspan="11">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="11">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionEstructuraGuia();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaMantenimientoCatalogoGuias(modo);" style="visibility:hidden"/>
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
            <td width="20%" align="center" class="subtitulo" colspan="9">Selecci&oacute;n de Cuenta</td>
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
            <td width="20%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
            <td colspan="6">
              <input type="checkbox" class="check" id="paramNumCtamFOSEG" value="-1" onclick="if(this.checked){this.value=7000;paramNumCtamNoFOSEG.value='';}else{this.value='';paramNumCtamNoFOSEG.value=7000;}"/>&nbsp;Cuentas 7000
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
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" ref="conPriCatCue" fun="loadTableElement" tabla="tblRegPriCatCue" onclick="consultarCount(this, frmDatos, false);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="9">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23px" nowrap>&nbsp;</td>
                  <td width="50px">Cuenta</td>
                  <td width="32px">Scta</td>
                  <td width="38px">Sscta</td>
                  <td width="46px">Ssscta</td>
                  <td width="52px">Sssscta</td>
                  <td width="60px">Ssssscta</td>
                  <td width="34px">Aux1</td>
                  <td width="34px">Aux2</td>
                  <td width="34px">Aux3</td>
                  <td width="300px">Nombre</td>
                  <td width="26px">Acr</td>
                  <td width="26px">Deu</td>
                  <td width="52px">Movto</td>
                  <td width="100px">Acum Rubro</td>
                  <td width="58px">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriCatCue" dataInfo="arrTblCatCueDat" keys="cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta,cueNumAux1,cueNumAux2,cueNumAux3" fun="clickTabla3" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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
