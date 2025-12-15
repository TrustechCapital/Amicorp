<FORM name="frmFacturacionConsulta" id="frmFacturacionConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Facturaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td>Fecha</td>
              <td>
                <input type="text" name="paramFecha" id="paramFecha" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td class="subtitulo">&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="30%">&nbsp;</td>
              <td width="15%">No. Fideicomiso</td>
              <td width="15%">
                <input type="text" name="paramNumFiso" id="paramNumFiso" tipo="Num" size="10" maxlength="10" onblur="validacionesPorContrato();"/>
              </td>
              <td>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Folio</td>
              <td width="15%" colspan="2">
                <input type="text" name="txtSerie" id="txtSerie" tipo="AlphaNumeric" size="3" maxlength="3" onblur="armaFolio();"/>-
                <input type="text" name="txtNoFactura" id="txtNoFactura" tipo="Num" size="11" maxlength="11" onblur="armaFolio();"/>
                <input type="text" name="paramFolio" id="paramFolio" tipo="AlphaNumeric" size="15" maxlength="15" style="visibility:hidden"/>
              </td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">&nbsp;</td>
              <td width="15%" class="textoRP" valign="top" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;Serie &nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;No. Factura</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td width="30%">&nbsp;</td>
              <td width="15%">Status</td>
              <td width="15%">
                <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="consultaFechaContable" param="clavesCombo165"/>
              </td>
              <td>&nbsp;</td>
              <td width="25%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center" colspan="5">
                <input type="text" name="txtDiaContable" id="txtDiaContable" tipo="Num" size="2" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="txtMesContable" id="txtMesContable" tipo="Num" size="2" maxlength="2" required message="El Mes es un campo obligatorio" style="visibility:hidden"/>
                <input type="text" name="txtAnoContable" id="txtAnoContable" tipo="Num" size="4" maxlength="4" required message="El Año es un campo obligatorio" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle" colspan="5">&nbsp;
                <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosFacturacion" fun="loadTableElement" tabla="tablaRegistrosFacturacionHonorarios" onclick="consultar(this, GI('frmFacturacionConsulta'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="CmdLimpiar" class="boton" onclick="cargaPrincipalFacturacion();"/>
              </td>
            </tr>
            <tr align="center">
              <td colspan="5">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="5">
                <input type="BUTTON" value="  Modificar  " id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoConfiguracionFacturacion();"/>
              </td>
            </tr>
            <tr align="center">
              <td colspan="5">&nbsp; 
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center" nowrap>&nbsp;</td>
                    <td width="70px" nowrap>Folio</td>
                    <td width="80px" nowrap>Fideicomiso</td>
                    <td width="100px" nowrap>Importe sin IVA</td>
                    <td width="80px" nowrap>IVA</td>
                    <td width="80px" nowrap>Total</td>
                    <td width="60px" nowrap>Del</td>
                    <td width="60px" nowrap>Al</td>
                    <td width="80px" nowrap>Fecha</td>
                    <td width="80px" nowrap>Folio Nuevo</td>
                    <td width="130px" nowrap>Observaciones</td>
                    <td width="80px" nowrap>Fecha Actualiza</td>
                    <td width="70" nowrap>Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1030;">
                  <table id="tablaRegistrosFacturacionHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaFacturacionHonorariosData" keys="facNumContrato,facSecFactura,facNumFactura,facFolioOpera,facStFactura" fun="clickTabla" radioWidth="23" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
