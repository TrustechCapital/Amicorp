<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Reglas de Transaccionalidad</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="90%">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Tipo Negocio</td>
            <td>
              <select name="paramTipoNegocio" id="paramTipoNegocio" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="paramTipoOperacion" param="clavesCombo703"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Fideicomiso</td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso"  size="10" maxlength="20"/>
            </td>
            <td width="25%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Reglas Transaccionalidad</td>
            <td>
              <select name="paramTipoOperacion" id="paramTipoOperacion" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="paramTipoPersona" param="clavesCombo702"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Tipo Persona</td>
            <td>
              <select name="paramTipoPersona" id="paramTipoPersona" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="paramStatus" param="clavesCombo704"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">No. Tipo Persona</td>
            <td>
              <input type="text" name="paramNumTipoPersona" id="paramNumTipoPersona" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="25%">
              &nbsp;
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo31" next="formsLoaded"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="qryActividadesRelevantes" fun="loadTableElement" tabla="tblReg" onclick="consultar(this,frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoActividadesRelevantes(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoActividadesRelevantes(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoActividadesRelevantes(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoActividadesRelevantes(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="200" nowrap>Tipo Negocio</td>                  
                  <td width="80" nowrap>Fiso</td>
                  <td width="200" nowrap>Tipo Operaci�n</td>
                  <td width="200" nowrap>Tipo Persona</td>
                  <td width="80" nowrap>No. Tipo Pers.</td>
                  <td width="80" nowrap>Dep�sitos</td>
                  <td width="80" nowrap>Retiros</td>
                  <td width="80" nowrap>Dep�sitos Eftvo.</td>
                  <td width="150" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1173px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="farTipoNegocio,farIdTipoOperacion,farIdContrato,farNumTipoPersona,farTipoPersona" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b�squeda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
