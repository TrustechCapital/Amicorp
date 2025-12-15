<FORM name="frmMantenimientoCatalogosGeneralesEstructuraGeograficaEstados" id="frmMantenimientoCatalogosGeneralesEstructuraGeograficaEstados" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Estructura Geografica Estado</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Pais</td>
            <td>
              <select size="1" name="edoNumPais" id="edoNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="edoCveStEstado" required message="El Pais es un campo obligatorio" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>No. Estado</td>
            <td>
              <input type="text" name="edoNumEstado" id="edoNumEstado" tipo="AlphaNumeric" size="10" maxlength="10" required message="Es necesario asignar un Número para identificar el Estado" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Nombre</td>
            <td>
              <input type="text" name="edoNomEstado" id="edoNomEstado" tipo="AlphaNumeric" size="30" maxlength="50" required message="El Nombre del Estado es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Abreviatura</td>
            <td>
              <input type="text" name="edoAbrvEstado" id="edoAbrvEstado" tipo="AlphaNumeric" size="10" maxlength="4" required message="La Abreviatura del Estado es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Diferencia de Horas</td>
            <td align="left">
              <input type="text" name="edoHrDiferencia" id="edoHrDiferencia" tipo="Num" size="7" maxlength="10"/>
            </td>
            <td align="center" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Minutos</td>
            <td align="left">
              <input type="text" name="edoMinDiferencia" id="edoMinDiferencia" tipo="Num" size="7" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%" nowrap>Status</td>
            <td align="left">
              <select size="1" name="edoCveStEstado" id="edoCveStEstado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosGeneralEstructuraGeograficaEstados();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>

