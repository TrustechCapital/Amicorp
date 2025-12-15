<!--valor-->
<form name="frmMantenimientoMovimientosCuentas" id="frmMantenimientoMovimientosCuentas">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Movimientos Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr> 
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">
              <input type="text" name="movContrato" id="movContrato" size="10" maxlength="10" tipo="Num" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td height="22" colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">&nbsp;</td>
            <td height="22" colspan="2">&nbsp;
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22" class="subtitulo" colspan=2>Datos del NivelMax<hr></td>
            <td height="22">&nbsp;</td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" width="30%">&nbsp;</td>
            <td height="22">
              <div id="dvNivel1">&nbsp;</div>
            </td>
            <td height="22" colspan="2">
              <select size="1" name="cmbNivel1" id="cmbNivel1" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="movScta" onchange="cargarCombosPrincipal(2);"  param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="22" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td height="25">
              <div id="dvNivel2">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmbNivel2" id="cmbNivel2" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded" onchange="cargarCombosPrincipal(3);"  param="cmbNivelParam" style="visibility:hidden">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td height="25">
              <div id="dvNivel3">&nbsp;</div>
            </td>
            <td height="25" colspan="2">
              <select size="1" name="cmbNivel3" id="cmbNivel3" ref="conRegNiv2" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" next="formsLoaded"  param="cmbNivelParam" style="visibility:hidden"><!--onblur="muestraClaveInversionista(this);"-->
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td height="25" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" width="30%">&nbsp;</td>
            <td nowrap height="25">&nbsp;</td>
            <td height="25" colspan="2">
              <input type="hidden" name="movClaveInv" id="movClaveInv" size="30" maxlength="30" tipo="Num" />
            </td>
            <td height="25" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25" class="subtitulo" colspan=2>Datos del Movimiento<hr></td>
            <td height="25">&nbsp;</td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">Fecha:</td>
            <td height="25" colspan="2">
              <input type="text" name="movFecOper" id="movFecOper" size="10" maxlength="10" tipo="Fecha" value="<%=session.getAttribute("fechaContable").toString()%>" required message="La Fecha es un campo obligatorio"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">Importe:</td>
            <td height="25" colspan="2">
              <input type="text" name="movImporte" id="movImporte" size="10" maxlength="20" tipo="Money" required message="El Importe es un campo obligatorio"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td height="25">Dep&oacute;sito
              <input type="radio" name="rdTipoOperacion" id="movTipoOper" class="radio" value2="D" onclick="asignaValueRadio2Master('movTipoOper',this)" required message="El Tipo de Operación es un campo obligatorio"/>
            </td>
            <td height="25">
              <input type="radio" name="rdTipoOperacion" id="movTipoOper2" class="radio" value="R" onclick="asignaValueRadio2Master('movTipoOper',this)"/>Retiro
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">N&uacute;mero de Movimiento:</td>
            <td height="25" colspan="2">
              <input type="text" name="movSecuencial" id="movSecuencial" size="2" maxlength="2" tipo="Num"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25" class="subtitulo" colspan="2">Contabilidad <hr></td>
            <td height="25">&nbsp;</td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">Contabilizar</td>
            <td height="25" colspan="2">
              <input type="checkbox" name="movContabilizar" id="movContabilizar" class="check" tv="1" fv="0" onclick="chkContabiliza(this);"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">SubCuenta</td>
            <td height="25" colspan="2">
              <select id="movScta" name="movScta" ref="conPriSubCuentas" fun="loadComboElement" keyValue="fsctIdSubCuenta" theValue="fsctIdNomSubCuenta" next="movCtaCheques" param="cmbScta" onchange="cargaCmbCtaCheques(this);"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">Cuenta de Cheques</td>
            <td height="25" colspan="2">
              <select id="movCtaCheques" name="movCtaCheques" ref="cmbCtoInverTrack" fun="loadComboElement" keyValue="cprNumCuenta" theValue="cprNomCuenta" next="formsLoaded" param="cmbCtoInver"/>
            </td>
            <td height="25">&nbsp;</td>
          </tr>
          <tr>
            <td height="25">&nbsp;</td>
            <td nowrap height="25">&nbsp;</td>
            <td height="25" colspan="2">&nbsp;</td>
            <td height="25">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%" align="center">
        <input type="text" name="movFecAlta" id="movFecAlta" size="10" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
        <input type="text" name="movFecUltMod" id="movFecUltMod" size="10" maxlength="10" tipo="Fecha" style="visibility:hidden"/>
        <input type="text" name="movEstatus" id="movEstatus" size="10" maxlength="30" tipo="Letras" value="ACTIVO" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="operacion==OPER_ALTA?cargaPrincipalMovimientosCuentas():retornaAprincipal()"/>
      </td>
    </tr>
  </table>
</form>
