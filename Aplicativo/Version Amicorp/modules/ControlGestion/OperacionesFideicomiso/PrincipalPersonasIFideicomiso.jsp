<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Personas Internet</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">Fideicomiso</td>
            <td nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num"/>
            </td>
            <td colspan="5" width="70%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="consultaX">&nbsp;</div>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center">
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton" onclick="onButtonClickPestania('ControlGestion.OperacionesFideicomiso.PrincipalOperacionesFideicomiso','');"/>
            </td>
          </tr>
          <tr>
            <td colspan="9" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="9">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="100" nowrap>Tipo Persona</td>
                  <td width="150" nowrap>Persona</td>
                  <td width="300" nowrap>Forma Liquidaci&oacute;n</td>
                  <td width="100" nowrap>Tipo Operaci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPerInt" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPerIntDat" keys="pinNumContrato,pinTipoPers,pinNumPersona,pinFormaLiq,pinTipoOperacion" fun="clickTabla" radioWidth="23">
                </table>
              </div>
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
        <input type="BUTTON" value="  Agregar " name="cmdAgregar" class="boton" onclick="cargaMantenimientoPersonasIFideicomiso(1)"/>
        <input type="BUTTON" value="Modificar " name="cmdModificar" class="boton" onclick="cargaMantenimientoPersonasIFideicomiso(2)"/>
        <input type="BUTTON" value="Desasignar" name="cmdDesasignar" class="boton" onclick="cargaMantenimientoPersonasIFideicomiso(3);"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
