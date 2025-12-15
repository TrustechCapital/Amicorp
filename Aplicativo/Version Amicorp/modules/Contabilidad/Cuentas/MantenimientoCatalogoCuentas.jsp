<FORM name="frmMantenimientoCatalogoCuentas" id="frmMantenimientoCatalogoCuentas" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento&nbsp;a&nbsp;Cat&aacute;logo&nbsp;de Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td class="subtitulo" height="30">&nbsp;</td>
            <td class="subtitulo" colspan="6" height="30">Cuenta</td>
            <td class="subtitulo" height="30">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Cuenta Mayor</td>
            <td colspan="3">
              <input type="text" name="cueNumCtam" id="cueNumCtam" size="10" tipo="Num" maxlength="4" required message="El número de la Cuenta de Mayor es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Sub-Cuenta</td>
            <td colspan="3">
              <input type="text" name="cueNumScta" id="cueNumScta" size="10" tipo="Num" maxlength="4" required message="El número de la Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Sub-Sub-Cuenta</td>
            <td colspan="3">
              <input type="text" name="cueNumSscta" id="cueNumSscta" size="10" tipo="Num" maxlength="4" required message="El número de la Sub-Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Sub-Sub-Sub-Cuenta</td>
            <td colspan="3">
              <input type="text" name="cueNumSsscta" id="cueNumSsscta" size="10" tipo="Num" maxlength="4" required message="El número de la Sub-Sub-Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Sub-Sub-Sub-Sub-Cuenta</td>
            <td colspan="3">
              <input type="text" name="cueNumSssscta" id="cueNumSssscta" size="10" tipo="Num" maxlength="4"  required message="El número de la Sub-Sub-Sub-Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">Sub-Sub-Sub-Sub-Sub-Cuenta</td>
            <td colspan="3">
              <input type="text" name="cueNumSsssscta" id="cueNumSsssscta" size="10" tipo="Num" maxlength="4" required message="El número de la Sub-Sub-Sub-Sub-Sub-Cuenta es un campo obligatorio" value="0"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="6">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">Auxiliares</td>
            <td class="subtitulo" colspan="5"></td>
            <td class="subtitulo">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Auxiliar1</td>
            <td colspan="4">
              <select size="1" name="cueNumAux1" id="cueNumAux1" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbAuxsParam" next="cueNumAux2" onblur="validaAuxiliares(this);"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Auxiliar2</td>
            <td colspan="4">
              <select size="1" name="cueNumAux2" id="cueNumAux2" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbAuxsParam" next="cueNumAux3" onblur="validaAuxiliares(this);"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>Auxiliar3</td>
            <td colspan="4">
              <select size="1" name="cueNumAux3" id="cueNumAux3" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbAuxsParam" next="cueCveAcumRubro" onblur="validaAuxiliares(this);"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="6">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Nombre Cuenta</td>
            <td colspan="5">
              <input type="text" size="67" name="cueNomCta" id="cueNomCta" tipo="AlphaNumeric" maxlength="250"  required message="El nombre de la Cuenta es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Clave Acumulaci&oacute;n</td>
            <td colspan="5">
              <select size="1" name="cueCveAcumRubro" id="cueCveAcumRubro" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbAcumRubroParam" next="cueCveStCuenta" required  message="La Clave de Acumulación es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="6">
              <hr/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="subtitulo">&nbsp;</td>
            <td class="subtitulo">Naturaleza</td>
            <td>&nbsp;</td>
            <td colspan="3" class="subtitulo">Tipo de Movimiento</td>
            <td class="subtitulo">Archivo SAT</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
              <input type="radio" name="rdNaturaleza" id="cueCveDeudora" onclick="asignaValueRadio(this,cueCveAcreedora);" required message="La Naturaleza de la Cuenta es un campo obligatorio" class="radio"/>&nbsp;Deudora
            </td>
            <td>
              <input type="radio" name="rdNaturaleza" id="cueCveAcreedora" required onclick="asignaValueRadio(this,cueCveDeudora);" class="radio"/>&nbsp;Acreedora
            </td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="cueCveMovtoCta" value2="CARGO" onchange="asignaValueRadio2Master('cueCveMovtoCta',this);" required message="El Tipo de Movimiento es un campo obligatorio" class="radio"/>&nbsp;Cargo
            </td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="cueCveMovtoCta2" value="ABONO" onchange="asignaValueRadio2Master('cueCveMovtoCta',this);" class="radio"/>&nbsp;Abono
            </td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="cueCveMovtoCta3" value="AMBOS" onchange="asignaValueRadio2Master('cueCveMovtoCta',this);" class="radio"/>&nbsp;Ambos
            </td>
            <td>
              <input type="radio" name="rdArchivoSAT" id="cueTipoPersona" value="" value2="FIDEICOMITENTE" onchange="asignaValueRadio2Master('cueTipoPersona',this);" class="radio"/>&nbsp;Fideicomitente
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <input type="radio" name="rdArchivoSAT" id="cueTipoPersona2" value="FIDEICOMISARIO" onchange="asignaValueRadio2Master('cueTipoPersona',this);" class="radio"/>&nbsp;Fideicomisario
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Status</td>
            <td>
              <select size="1" name="cueCveStCuenta" id="cueCveStCuenta" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="asignaPK2ObjHTML"  required message="El Status es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <input type="checkbox" name="cueSat" id="cueSat" onchange="asignaValue2Check(this);" class="check"/>&nbsp;SAT
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="100%" align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionCuentas();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Cuentas.PrincipalCatalogoCuentas','')" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
