<form name="frmMantenimientoMatrizCuentas" id="frmMantenimientoMatrizCuentas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Matriz de Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%">Cuenta Traducir
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamCtaClien" id="ctamCtaClien" tipo="Num" required message="La Cta es un campo obligatorio"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSctaClien" id="ctamSctaClien" tipo="Num" required message="La Sta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSsctaClien" id="ctamSsctaClien" tipo="Num" required message="La Sscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSssctaClien" id="ctamSssctaClien" tipo="Num" required message="La Ssscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSsssctaClien" id="ctamSsssctaClien" tipo="Num" required message="La Sssscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSssssctaClien" id="ctamSssssctaClien" tipo="Num" required message="La Ssssscta es un campo obligatorio" value="0"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%" nowrap>Tipo de Negocio</td>
            <td colspan="5">
              <select size="1" name="ctamTipoNegocio" id="ctamTipoNegocio" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbTipoNegocioParam" next="ctamClasifProd" defaultValue="0"/>
            </td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="10%" nowrap>Clasificaci&oacute;n Producto</td>
            <td colspan="5">
              <select size="1" name="ctamClasifProd" id="ctamClasifProd" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbClasProductoParam" next="ctamCveStCtamat" defaultValue="0"/>
            </td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap>Traducci&oacute;n Cuenta</td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamCtaOrden" id="ctamCtaOrden" tipo="Num" required message="La Cta es un campo obligatorio"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSctaOrden" id="ctamSctaOrden" tipo="Num" required message="La Sta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSsctaOrden" id="ctamSsctaOrden" tipo="Num" required message="La Sscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSssctaOrden" id="ctamSssctaOrden" tipo="Num" required message="La Ssscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSsssctaOrden" id="ctamSsssctaOrden" tipo="Num" required message="La Sssscta es un campo obligatorio" value="0"/>
            </td>
            <td>
              <input type="text" size="4" maxlength="10" name="ctamSssssctaOrden" id="ctamSssssctaOrden" tipo="Num" required message="La Ssssscta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Status</td>
            <td colspan="3">
              <select size="1" name="ctamCveStCtamat" id="ctamCveStCtamat" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaValores2ObjHTML" required message="El status es un campo obligatorio"/>
            </td>
            <td nowrap colspan="2">
              <input type="checkbox" name="ctamDetalleChk" id="ctamDetalleChk" tv="1" fv="0" class="check"/>&nbsp;Detallada
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="9">
              <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionMatrizCuentas();" style="visibility:hidden"/>
              <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Matriz.PrincipalMatrizCuentas','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="9">
              <table width="100%" class="texto" align="center">
                <tr>
                  <td width="20%" align="center" class="subtitulo" colspan="9">Selecci&oacute;n de Cuenta Traducir</td>
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
                    <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" ref="conPriCatCue" fun="loadTableElement" tabla="tblRegPriCatCue" onclick="consultarCount(this, frmMantenimientoMatrizCuentas, false);" style="visibility:hidden"/>
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
                      <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriCatCue" dataInfo="arrTblCatCueDat" keys="cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta" fun="clickTabla3" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
