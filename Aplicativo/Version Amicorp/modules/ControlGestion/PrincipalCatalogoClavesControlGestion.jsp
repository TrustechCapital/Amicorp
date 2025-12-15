<FORM name="frmPrincipalCatalogoClavesControlGestion" id="frmPrincipalCatalogoClavesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Conceptos del Sistema</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">No. de Concepto
            </td>
            <td>
              <input type="text" name="paramClaveCajaTexto" id="paramClaveCajaTexto" tipo="Num" size="15"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="10%">Nombre
            </td>
            <td>
              <input type="text" name="paramDescCajaTexto" id="paramDescCajaTexto"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;
            </td>
            <td width="10%">Descripci&oacute;n</td>
            <td>
              <select size="1" name="paramClaveCombo" id="paramClaveCombo" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo99"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosClaves" fun="loadTableElement" tabla="tablaRegistrosDatosCatalogoClaves" onclick="consultar(this, GI('frmPrincipalCatalogoClavesControlGestion'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogoClavesControlGestion'));"/>
              <input type="HIDDEN" value="s" id="paramorder" name="paramorder">
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosClavesControlGestion(1)"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosClavesControlGestion(2)"/>
              <input type="BUTTON" value="  Baja   " id="cmdBajar" name="cmdBajar" class="boton" onclick="eliminarRegistro()"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosClavesControlGestion(3)"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;
            </td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="70px">Concepto</td>
                  <td width="70px">Sec.</td>
                  <td width="250px">Descripci&oacute;n</td>
                  <td width="250px">Forma de Empleo</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:790px;">
                <table id="tablaRegistrosDatosCatalogoClaves" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosCatalogoClavesData" keys="cveNumClave,cveNumSecClave" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
