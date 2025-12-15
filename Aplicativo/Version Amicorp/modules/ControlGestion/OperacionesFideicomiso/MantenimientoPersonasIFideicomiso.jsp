<FORM name="frmMantenimiento" id="frmMantenimiento">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Cuentas NAFIN</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td nowrap width="30%">Fideicomiso</td>
            <td nowrap>
              <input type="text" name="pinNumContrato" id="pinNumContrato" maxlength="10" size="10"/>
            </td>
            <td width="70%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td nowrap width="30%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td nowrap width="30%">Operaci&oacute;n</td>
            <td>
              <div id="dvDeposito">
                <input type="radio" name="pinTipoOperacion" id="pinTipoOperacion" class="radio" value2="DEPOSITO" required message="El Tipo de Operación es un campo obligatorio" onclick="asignaValueRadio2Master('pinTipoOperacion',this);" onblur="if(this.checked){ocultaObjs('pinFormaLiq');RA(pinFormaLiq,'required');}"/>&nbsp;Dep&oacute;sito
              </div>
            </td>
            <td>
              <div id="dvRetiro">
                <input type="radio" name="pinTipoOperacion" id="pinTipoOperacion1" class="radio" value="RETIRO" onclick="asignaValueRadio2Master('pinTipoOperacion',this);" onblur="if(this.checked){SA(pinFormaLiq,'required','true');}"/>&nbsp;Retiro
              </div>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td nowrap width="30%">Tipo Persona</td>
            <td colspan="2">
              <select size="1" name="pinTipoPers" id="pinTipoPers" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="decideCargaPersona" param="cmbTipoPersonaParam" required message="El Tipo Persona es un campo obligatorio" onchange="this.selectedIndex!=0?cargaPersona(2):''"/>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td nowrap width="30%">Persona</td>
            <td colspan="2">
              <select size="1" name="pinNumPersona" id="pinNumPersona" fun="loadComboElement" keyValue="id" theValue="descripcion" required message="La Persona es un campo obligatorio"/>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td nowrap width="30%">Forma Liquidaci&oacute;n</td>
            <td colspan="2">
              <select size="1" name="pinFormaLiq" id="pinFormaLiq" fun="loadComboElement" keyValue="id" theValue="descripcion" required message="La Forma de Liquidación es un campo obligatorio"/>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" maxlength="10" size="10"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionPersonasIFideicomiso();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalPersonasIFideicomiso();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
