<FORM name="frmPrincipalAutorizacionesControlGestion" id="frmPrincipalAutorizacionesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">
        <P>Principal Autorizaciones</P>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="6%" nowrap>Nombre</td>
            <td>
              <select size="1" name="paramOperacion" id="paramOperacion" ref="claveOperaciones" fun="loadComboElement" keyValue="opeNumOperacion" theValue="opeNomOperacion" next="formsLoaded"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="6%" nowrap>No. Usuario</td>
            <td>
              <input type="text" name="paramNumUsuario" id="paramNumUsuario" tipo="Num" size="15" maxlength="10"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosAutorizaciones" fun="loadTableElement" tabla="tablaRegistrosDatosAutorizaciones" onclick="consultar(this, GI('frmPrincipalAutorizacionesControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalAutorizacionesControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoAutorizacionesControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoAutorizacionesControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoAutorizacionesControlGestion(3);"/>
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
                  <td width="300px">Operaciones</td>
                  <td width="150px">N&uacute;mero Autorizacion</td>
                  <td width="90px">Importe</td>
                  <td width="90px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:690px;">
                <table id="tablaRegistrosDatosAutorizaciones" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosAutorizacionesData" keys="autNumOperacion,autAutorizacion,autNumUsuario" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr/>
  </table>
</FORM>
