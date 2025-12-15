<FORM name="frmPrincipalEncuestaOpcionesControlGestion" id="frmPrincipalEncuestaOpcionesControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Principal Opciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="9%">No. Opci&oacute;n</td>
            <td>
              <input type="text" name="paramNoOpcion" id="paramNoOpcion" tipo="Num" size="10" maxlength="5"/>
            </td>
            <td colspan="3" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="9%">Descripci&oacute;n</td>
            <td>
              <input type="text" name="paramDescOpcion" id="paramDescOpcion" tipo="AlphaNumeric" size="40" maxlength="100"/>
            </td>
            <td colspan="3" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosOpciones" fun="loadTableElement" tabla="tablaRegistrosDatosOpciones" onclick="consultar(this, GI('frmPrincipalEncuestaOpcionesControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalEncuestaOpcionesControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoEncuenstaOpcionesControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoEncuenstaOpcionesControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoEncuenstaOpcionesControlGestion(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">No. Pregunta</td>
                  <td width="250px">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:410px;">
                <table id="tablaRegistrosDatosOpciones" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosOpcionesData" keys="oecNumOpcion" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
