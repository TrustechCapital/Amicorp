<FORM name="frmMantenimientoCatalogosIndicesOficialesControlGestion" id="frmMantenimientoCatalogosIndicesOficialesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Indices Oficiales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td align="left" width="6%" nowrap>Indice</td>
            <td>
              <select size="1" name="indCveIndice" id="indCveIndice" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="indCveStIndice" param="clavesCombo14" required message="El Indice es un dato obligatorio" onchange="verificaExistenciaRegistro();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td align="left" width="6%" nowrap>Dia/Mes/A&ntilde;o</td>
            <td>
              <input type="text" name="txtDiaMesAnoIndice" id="txtDiaMesAnoIndice" tipo="Fecha" size="15" required message="La Fecha Indice es un dato obligatorio" onchange="descomponeFecha(this,GI('indDiaIndice'),GI('indMesIndice'),GI('indAnoIndice'));"/>
              <input type="text" name="indDiaIndice" id="indDiaIndice" tipo="Num" size="2" style="visibility:hidden"/>
              <input type="text" name="indMesIndice" id="indMesIndice" tipo="Num" size="2" style="visibility:hidden"/>
              <input type="text" name="indAnoIndice" id="indAnoIndice" tipo="Num" size="4" style="visibility:hidden"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td align="left" width="6%" nowrap>Valor</td>
            <td>
              <input type="text" name="indValorIndice" id="indValorIndice" tipo="Money" size="17" maxlength="17" prec="8.8" reqPrecValue required message="El Valor es un dato obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td align="left" width="6%" nowrap>Status</td>
            <td>
              <select size="1" name="indCveStIndice" id="indCveStIndice" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un dato obligatorio"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogoIndicesOficialesControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
