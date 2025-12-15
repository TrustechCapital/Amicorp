<FORM name="frmMantenimientoSeguridadUsuariosControlGestion" id="frmMantenimientoSeguridadUsuariosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="151">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="6%" nowrap>Nombre</td>
            <td width="5%">
              <select size="1" name="usuNumUsuario" id="usuNumUsuario" ref="muestraDatosPersonalOrdenado" fun="loadComboElement" keyValue="perNumUsuario" theValue="perNomUsuario" next="usuTipoUsuario" onchange="verificaExistenciaRegistro();"/>              
              
            </td>
            <td>
              <input type="hidden" name="usuToken" id="usuToken"/>
            </td>
            <td>&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="6%" nowrap>Usuario OID</td>
            <td colspan="3">
              <input type="text" name="usuNomUsuario" id="usuNomUsuario" size="50" maxlength="50" required message="El Usuario BD es un campo obligatorio" />              
              
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="6%" nowrap>Tipo Usuario</td>
            <td colspan="3">
              <select size="1" name="usuTipoUsuario" id="usuTipoUsuario" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave"  param="clavesCombo30" next="usuNumPuesto"/>
              
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="6%" nowrap>Perfil Cliente</td>
            <td colspan="3">
              <select size="1" name="usuNumPuesto" id="usuNumPuesto" ref="clavePuesto" fun="loadComboElement" keyValue="pueNumPuesto" theValue="pueNomPuesto" next="usuCveStUsuario" onchange="obtieneNomPuesto(this);"/>              
              <input type="text" name="usuNomPuesto" id="usuNomPuesto" size="10" maxlength="50" style="visibility:hidden"/>        
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="6%" nowrap>Status</td>
            <td colspan="3">
              <select size="1" name="usuCveStUsuario" id="usuCveStUsuario" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" onblur="asignaToken();"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
            
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">      
        
        <input type="text" name="usuPassword" id="usuPassword" size="8" maxlength="8" value="prueba" style="visibility:hidden"/>              
        <input type="text" name="usuAnoAltaReg" id="usuAnoAltaReg" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>" style="visibility:hidden"/>
        <input type="text" name="usuMesAltaReg" id="usuMesAltaReg" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>" style="visibility:hidden"/>
        <input type="text" name="usuDiaAltaReg" id="usuDiaAltaReg" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[0]%>" style="visibility:hidden"/>
        <input type="text" name="usuAnoUltMod" id="usuAnoUltMod" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[2]%>" style="visibility:hidden"/>
        <input type="text" name="usuMesUltMod" id="usuMesUltMod" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[1]%>" style="visibility:hidden"/>
        <input type="text" name="usuDiaUltMod" id="usuDiaUltMod" size="8" maxlength="8" value="<%=session.getAttribute("fechaContable").toString().split("/")[0]%>" style="visibility:hidden"/>
        <input type="text" name="usuNumNivel1" id="usuNumNivel1" size="8" maxlength="8" value="1000" style="visibility:hidden"/>
        <input type="text" name="usuNumNivel2" id="usuNumNivel2" size="8" maxlength="8" value="10" style="visibility:hidden"/>
        <input type="text" name="usuNumNivel3" id="usuNumNivel3" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuNumNivel4" id="usuNumNivel4" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuNumNivel5" id="usuNumNivel5" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuCentroLogro" id="usuCentroLogro" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuCentroCosto" id="usuCentroCosto" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuPtceGpot" id="usuPtceGpot" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuFechaUltAcceso" id="usuFechaUltAcceso"  maxlength="8" value="" style="visibility:hidden"/>
        <input type="text" name="usuFechaPassword" id="usuFechaPassword" maxlength="8" value="" style="visibility:hidden"/>
        <input type="text" name="usuEstatusSeguridad" id="usuEstatusSeguridad" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuMontoAutorizado" id="usuMontoAutorizado" size="8" maxlength="8" value="0" style="visibility:hidden"/>
        <input type="text" name="usuPerfilInterno" id="usuPerfilInterno" size="8" maxlength="8" value="perfil" style="visibility:hidden"/>
  

      </td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadUsuariosControlGestion();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
