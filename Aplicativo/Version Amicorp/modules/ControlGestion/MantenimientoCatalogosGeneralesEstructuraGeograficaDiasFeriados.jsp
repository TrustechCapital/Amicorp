<FORM name="frmMantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados" id="frmMantenimientoCatalogosGeneralesEstructuraGeograficaDiasFeriados" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento D&iacute;as Feriados</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Pa&iacute;s</td>
            <td>
              <select size="1" name="ferNumPais" id="ferNumPais" ref="clavePais" fun="loadComboElement" keyValue="paiNumPais" theValue="paiNomPais" next="ferCveStFeriado" required message="El Pais es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Dia</td>
            <td>              
              <input type="text" name="ferFecDia" id="ferFecDia" tipo="Num" size="2" /> 
            
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Mes</td>
            <td>              
              <input type="text" name="ferFecMes" id="ferFecMes" tipo="Num" size="2" />              
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Año en que concluye</td>
            <td>              
              <input type="text" name="ferFecAno" id="ferFecAno" tipo="Num" size="4" />Proyectar?
              <input type="checkbox" style="visibility:hidden" name="checProyeccion" id="checProyeccion" class="check"/>
              <input type="checkbox" name="checRecorre" id="checRecorre" class="check"/>
              <input type="text" name="AnioFinProyeccion" id="AnioFinProyeccion" tipo="Num" size="4" style="visibility:hidden"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Descripci&oacute;n</td>
            <td>
              <input type="text" name="ferDescDiaFer" id="ferDescDiaFer" tipo="AlphaNumeric" size="40" required message="La Descripción es un campo obligatorio"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Status</td>
            <td>
              <select size="1" name="ferCveStFeriado" id="ferCveStFeriado" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
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
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalCatalogosGeneralesEstructuraGeograficaDiasFeriados();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
