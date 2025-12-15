<FORM name="frmPrincipalSeguridadModulos" id="frmPrincipalSeguridadModulos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Funciones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" nowrap>
          <table align="center" class="texto">
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">&nbsp;</td>
              <td nowrap>
                 <!--onblur="determinarConsulta();"/-->
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">Nombre Funci&oacute;n</td>
              <td nowrap>
                <input type="text" name="paramNomFuncion" id="paramNomFuncion" size="30" maxlength="100"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <!--tr>
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">M&oacute;dulo</td>
              <td>
                <select size="1" name="paramModulo" id="paramModulo" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo43" onchange="cargaParamComboSubMenu(this,GI('paramSubMenu'),false);"/>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td nowrap width="10%">Sub Men&uacute;</td>
              <td>
                <select size="1" name="paramSubMenu" id="paramSubMenu" ref="claveSubMenu" fun="loadComboElement" keyValue="ffunIdFuncion" theValue="ffunNomMenu" next="formsLoaded" param="parametroComboSubMenu" onchange="cambiaRefAceptar();">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td>&nbsp;</td>
            </tr-->
            <tr>
              <td colspan="4" align="center">
                <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;
                <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraFunciones" fun="loadTableElement" tabla="tablaRegistrosModulos" onclick="consultar(this, GI('frmPrincipalSeguridadModulos'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalSeguridadModulos'));"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center">
                <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoSeguridadModulos(1);"/>
                <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoSeguridadModulos(2);"/>
                <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
                <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoSeguridadModulos(3);"/>
                <input type="BUTTON" value="Refrescar Menú" name="cmdRefrescarMenu" class="boton" onclick="refrescarMenu();"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr align="center" >
              <td colspan="4">
                <table class="texto" cellpadding="0" cellspacing="0" border="0">
                  <tr class="cabeceras">
                    <td width="23" nowrap>&nbsp;</td>
                    <td width="186" nowrap>Men&uacute;</td>
                    <td width="169" nowrap>Funci&oacute;n</td>
                    <td width="85" nowrap>Clave</td>
                    <!--td width="300px" nowrap>Ruta</td-->
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:463px">
                  <table id="tablaRegistrosModulos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaModulosData" keys="ffunIdFuncion" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
