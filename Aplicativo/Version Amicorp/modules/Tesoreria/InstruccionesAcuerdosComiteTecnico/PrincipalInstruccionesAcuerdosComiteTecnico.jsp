<form name="frmDatosInstruccionesAcuerdos" id="frmDatosInstruccionesAcuerdos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Instrucciones de Acuerdos Comite T&eacute;cnico</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>Fideicomiso</td>
            <td>
              <select size="1" name="cmbFideicomiso" id="cmbFideicomiso" ref="conNumFidNomFidXAcuCom" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="formsLoaded" required message="El Fideicomiso es un campo obligatorio" onchange="cargaComboAcuerdos(this);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>No. Acuerdo</td>
            <td>
              <select size="1" name="cmbNoAcuerdo" id="cmbNoAcuerdo" ref="conAcuIdNomAcu" fun="loadComboElement" keyValue="acuId" theValue="datosAcuerdo" next="formsLoaded" param="cmbAcuerdosParam" required message="El No. Acuerdo es un campo obligatorio" onchange="asignaMontoAutorizadoDisponible(this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>Monto Autorizado</td>
            <td>
              <input type="text" name="txtMontoAutorizado" id="txtMontoAutorizado" size="15" required message="El Importe es un campo obligatorio" tipo="Money" prec="20.2" reqPrecValue onblur="verificaImporte(this);" maxlength="23" value="0" disabled class="inputLocked"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>
              <P>Monto Disponible</P>
            </td>
            <td>
              <input type="text" name="txtMontoDisponible" id="txtMontoDisponible" size="15" tipo="Money" prec="20.2" reqPrecValue onblur="verificaImporte(this);" maxlength="23" value="0" disabled class="inputLocked"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>Importe</td>
            <td>
              <input type="text" name="txtImporte" id="txtImporte" size="15" required message="El Importe es un campo obligatorio" tipo="Money" prec="20.2" reqPrecValue onblur="verificaImporte(this);" maxlength="23"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>Contrase&ntilde;a</td>
            <td>
              <input type="password" name="txtContrasena" id="txtContrasena" maxlength="10" size="10" ref="conPwd" fun="verificaContrasena" required message="La Contraseña es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="16%" nowrap>Tipo de Instrucci&oacute;n</td>
            <td>&nbsp;
              </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="25%">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="left">
              <input type="radio" name="rdTipoInstruccion" id="rdTipoInstruccion" class="radio" value2="1" required message="El Tipo de Instrucción es un campo obligatorio" onclick="asignaValueRadio2Master('rdTipoInstruccion',this);"/>&nbsp;Reembolso &nbsp;
              <input type="radio" name="rdTipoInstruccion" id="rdTipoInstruccion2" class="radio" value="2" onclick="asignaValueRadio2Master('rdTipoInstruccion',this);"/>&nbsp;Retiro
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaInstruccionAcuerdo();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="limpiar(frmDatosInstruccionesAcuerdos);"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
