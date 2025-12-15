<FORM name="frmPrincipalCatalogosEjecutivosControlGestion" id="frmPrincipalCatalogosEjecutivosControlGestion" onsubmit="">
  <table width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Ejecutivos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="5%">Banca</td>
            <td>
              <select size="1" name="paramBanca" id="paramBanca" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="paramTipoEjecutivo" param="clavesCombo5"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;
            </td>
            <td width="5%">Tipo</td>
            <td>
              <select size="1" name="paramTipoEjecutivo" id="paramTipoEjecutivo" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo67"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraEjecutivos" fun="loadTableElement" tabla="tablaRegistrosDatosEjecutivos" onclick="consultar(this, GI('frmPrincipalCatalogosEjecutivosControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalCatalogosEjecutivosControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogosEjecutivosControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogosEjecutivosControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogosEjecutivosControlGestion(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="90px">Banca</td>
                  <td width="60px">N&uacute;mero</td>
                  <td width="200px">Nombre</td>
                  <td width="160px">Tipo</td>
                  <td width="80px">Lada1</td>
                  <td width="90px">Tel&eacute;fono1</td>
                  <td width="60px">Ext.1</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:890px;">
                <table id="tablaRegistrosDatosEjecutivos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosEjecutivosData" keys="ejeCveBanca,ejeNumEjecAtenc" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
