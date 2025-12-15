<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo"><div id="dvNivel">Titulo</div></td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>
              <input type="text" name="datContrato" id="datContrato" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td colspan="2">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="cargaComboDo">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap><div id="dvNivel1">&nbsp;</div></td>
            <td>
              <select id="datParentId" name="datParentId" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" param="cmbNivel1Param" next="asignaValues2ObjHTML" required/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Clave</td>
            <td>
              <input type="text" name="datClave" id="datClave" size="10" tipo="AlphaNumeric" required message="La Clave es un campo obligatorio"/>
              <input type="text" name="datNivel" id="datNivel" size="1" value="2" style="visibility:hidden"/>
              <input type="text" name="datId" id="datId" size="10" style="visibility:hidden"/>
              <input type="text" name="datLongitudMaxima" id="datLongitudMaxima" size="1" style="visibility:hidden"/>
              <input type="text" name="datLongitudNivel" id="datLongitudNivel" size="1" style="visibility:hidden"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Nombre</td>
            <td>
              <input type="text" name="datDato" id="datDato" size="60" maxlength="100" tipo="AlphaNumeric" required message="El Nombre es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td nowrap>Status</td>
            <td>
              <select id="datEstatus" name="datEstatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="datFecAlta" required message="El Status es un campo obligatorio"/>
              <input type="text" name="datFecAlta" id="datFecAlta" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="datFecUltMod" style="visibility:hidden"/>
              <input type="text" name="datFecUltMod" id="datFecUltMod" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="cargaComplementoDefinicionNivel" style="visibility:hidden"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionDefinicionNivel2();"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaPrincipalCatalogoNivel2(dvNivel.innerHTML);"/>
      </td>
    </tr>
  </table>
</form> 
