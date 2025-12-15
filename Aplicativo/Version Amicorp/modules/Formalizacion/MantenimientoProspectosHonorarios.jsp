<FORM name="frmDatosMantenimientoHonorarios" id="frmDatosMantenimientoHonorarios" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Honorarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Proyecto</td>
            <td>
              <input type="text" name="ahoAnteproyecto" id="ahoAnteproyecto" tipo="Num" size="10" maxlength="10" required message="El Proyecto es un campo obligatorio" onblur="consultarExistenciaHonorarios(this);"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Nombre del Negocio</td>
            <td colspan="6">
              <input type="text" name="txtNomProyecto" id="txtNomProyecto" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;
            </td>
            <td colspan="7">
              <hr/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Aceptaci&oacute;n</td>
            <td>
              <input type="text" name="ahoImpAceptacion" id="ahoImpAceptacion" tipo="Money" size="17" maxlength="17" required message="El Importe de Aceptación es un campo obligatorio" prec="10.6" reqPrecValue/>
            </td>
            <td colspan="5">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;
              </td>
            <td nowrap>
              <input type="checkbox" name="ahoCveImpFijoChk" id="ahoCveImpFijoChk" class="check" tv="1" fv="0" onclick="desactivarChecksRestantes(this);"/>&nbsp;Importe Fijo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td nowrap>
              <input type="checkbox" name="ahoCvePjePactadChk" id="ahoCvePjePactadChk" class="check" tv="1" fv="0" onclick="desactivarChecksRestantes(this);"/>&nbsp;% Pactado
            </td>
            <td colspan="3" nowrap>
              <input type="checkbox" name="ahoCveTablaCalcChk" id="ahoCveTablaCalcChk" class="check" tv="1" fv="0" onclick="desactivarChecksRestantes(this);"/>&nbsp;Tabla de C&aacute;lculo
            </td>
            <td colspan="2" nowrap>
              <input type="checkbox" name="ahoCveExentoChk" id="ahoCveExentoChk" class="check" tv="1" fv="0" onclick="desactivarChecksRestantes(this);"/>Sin C&aacute;lculo</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Dia de Corte</td>
            <td>
              <input type="text" name="ahoNumDiaCorte" id="ahoNumDiaCorte" tipo="Num" size="2" maxlength="2"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>A Quien se Cobra</td>
            <td>
              <select size="1" name="ahoCveQuienCobr" id="ahoCveQuienCobr" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ahoCvePeriodic" param="clavesCombo10"/>
            </td>
            <td>Peridicidad</td>
            <td colspan="4">
              <select size="1" name="ahoCvePeriodic" id="ahoCvePeriodic" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ahoNumMoneda" param="clavesCombo9"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Importe Fijo</td>
            <td>
              <input type="text" name="ahoImpFijo" id="ahoImpFijo" tipo="Money" size="17" maxlength="17" prec="14.2" reqPrecValue/>
            </td>
            <td>Moneda</td>
            <td colspan="4">
              <select size="1" name="ahoNumMoneda" id="ahoNumMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="ahoCveFormaCobr"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td>Forma de cobro</td>
            <td colspan="6">
              <select size="1" name="ahoCveFormaCobr" id="ahoCveFormaCobr" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo6"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">
        <input type="text" name="ahoCveEstado" id="ahoCveEstado" tipo="AlphaNumeric" size="10" maxlength="10" value="ACTIVO" style="visibility:hidden"/>
      </td>
    </tr>
    <tr align="center">
      <td height="100%"/>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosHonorarios();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
